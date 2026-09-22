
PROGRAM _INIT
	 
	hmiStatus.NameSteuerung	:= 4; //= HB4000
	
END_PROGRAM



PROGRAM _CYCLIC
	
	
	//Nicht verfügbare Ausstattungsoptionen ausschalten
	hmiParameter.Ausstattung.Abluftventilator := FALSE;
	hmiParameter.Ausstattung.Box3 := FALSE;
	hmiParameter.Ausstattung.Box4 := FALSE;
	hmiParameter.Ausstattung.Box5 := FALSE;
	hmiParameter.Ausstattung.Box6 := FALSE;
	hmiParameter.Ausstattung.HeizregisterDrehzahlvorgabe := FALSE;
	hmiParameter.Ausstattung.Entfeuchter := FALSE;
	hmiParameter.Ausstattung.Bypassklappe := FALSE;
	hmiParameter.Ausstattung.Notstromaggregat := FALSE;
	hmiParameter.Ausstattung.Umschaltklappe2 := FALSE;
	hmiParameter.Ausstattung.WarmluftofenTempVorgabe := FALSE;
	hmiParameter.Ausstattung.MehrereBoxenBelueftbar := FALSE;
	hmiParameter.Ausstattung.AlleBoxenklSchliessenWennAus := FALSE;
	
	IF hmiParameter.Ausstattung.SensorFrischluft AND hmiParameter.Ausstattung.SensorDachluft THEN
		hmiParameter.Ausstattung.SensorDachluft := FALSE;
	END_IF
	IF hmiParameter.Ausstattung.Warmluftofen AND hmiParameter.Ausstattung.Heizregister THEN
		hmiParameter.Ausstattung.Heizregister := FALSE;
	END_IF
	
	//Zeitticks generieren
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	
	//=========================================================================================================================================================
	//IO-Zuweisung HB4000
	//=========================================================================================================================================================
	
	

	//Kein Testbetrieb
	IF (gAktModus <> IOTEST) THEN
		
		
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************************************
		brModul01;
	
		//MODUL 02 - DI9371 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		di24VDCinternIstOk					:= diModul02.di01; 
		di230VACIstOk						:= diModul02.di02;
		diTasteTrocknungPausieren			:= diModul02.di03;
		diEntfeuchterFremdInBetrieb			:= diModul02.di04;
		diEntfeuchterFremdStoerung			:= diModul02.di05;
		diWarmluftofenInBetrieb				:= diModul02.di06;
		diScheitholzofenInBetrieb			:= diModul02.di07;
		diVentilator1InBetrieb				:= diModul02.di08;
		diVentilator2InBetrieb				:= diModul02.di09;
		diDrehzahlbegrVentilator1			:= diModul02.di10;
		diDrehzahlbegrVentilator2			:= diModul02.di11;
		//Reserve							:= diModul02.di12;
		
		
		//MODUL 03 - DO9322 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		doModul03.do01			:= doTrocknungInBetrieb;
		doModul03.do02			:= doTrocknungStoerung;
		doModul03.do03			:= doVentilator1Ein;
		doModul03.do04			:= doVentilator2Ein;
		doModul03.do05			:= doEntfFremdFreigabe;
		doModul03.do06			:= doUmluftklappe1Freigabe;
		doModul03.do07			:= doWarmluftofenEin OR doHeizregisterEin; 
		doModul03.do08			:= doFreigabeBox1;
		doModul03.do09			:= doBrandschutzklappeAuf;
		doModul03.do10			:= doLuftentfeuchterStrombegrEin;
		doModul03.do11			:= doAbluftklappeFreigabe;
		doModul03.do12			:= FALSE; //Reserve

		
		//MODUL 04 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;

	
		//MODUL 05 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul05.ai02, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul05.ai03, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul05.ai04, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		
		
		//MODUL 06 - AI2622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************

		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := aoDrehzahlvorgVentilator1, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		aoModul06.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := aoDrehzahlvorgVentilator2, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		aoModul06.ao02				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 07 - CS1030 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//GSM-Modul (nicht mehr in Verwendung)
		csModul07;
		
	
		//Modul 08 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.

		
		
		//Modul 09 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//HB4000 Sensor Dachluft = Sensor Frischluft
		diStatusDachluftFeuchteMax := diStatusFrischluftFeuchteMax;
		diStatusDachluftFeuchteMin := diStatusFrischluftFeuchteMin;
		diStatusDachluftTempMax := diStatusFrischluftTempMax;
		diStatusDachluftTempMin := diStatusFrischluftTempMin;
		
		//Modul 04 Frischluft Temperatur ****************************************************************************
		IF (aiModul04.StatusInput01.1 = FALSE AND aiModul04.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftTempMin	:= TRUE;
		ELSE
			diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.1 = TRUE AND aiModul04.StatusInput01.0 = FALSE ) THEN
			diStatusFrischluftTempMax	 := TRUE;
		ELSE
			diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 04 Frischluft rel. Feuchte ***************************************************************************
		IF (aiModul04.StatusInput01.3 = FALSE AND aiModul04.StatusInput01.2 = TRUE) THEN
			diStatusFrischluftFeuchteMin := TRUE;
		ELSE
			diStatusFrischluftFeuchteMin := FALSE;
		END_IF
		IF (aiModul04.StatusInput01.3 = TRUE AND aiModul04.StatusInput01.2 = FALSE) THEN
			diStatusFrischluftFeuchteMax := TRUE;
		ELSE
			diStatusFrischluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur **************************************************************************
		IF (aiModul04.StatusInput01.5 = FALSE AND aiModul04.StatusInput01.4 = TRUE) THEN
			diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.5 = TRUE AND aiModul04.StatusInput01.4 = FALSE) THEN
			diStatusTrockenluftTempMax	:= TRUE;
		ELSE
			diStatusTrockenluftTempMax	:= FALSE;
		END_IF
		
		//Modul 04 Trockenluft rel. Feuchte **************************************************************************
		IF (aiModul04.StatusInput01.7 = FALSE AND aiModul04.StatusInput01.6 = TRUE) THEN
			diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.7 = TRUE AND aiModul04.StatusInput01.6 = FALSE) THEN
			diStatusTrockenluftFeuchteMax	:= TRUE;
		ELSE
			diStatusTrockenluftFeuchteMax	:= FALSE;
		END_IF
			
		//Modul 05 Abluft Temperatur ****************************************************************************
		IF (aiModul05.StatusInput01.1 = FALSE AND aiModul05.StatusInput01.0 = TRUE) THEN
			diStatusAbluftTempMin	:= TRUE;
		ELSE
			diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.1 = TRUE AND aiModul05.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftTempMax	 := TRUE;
		ELSE
			diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 05 Abluft rel. Feuchte ***************************************************************************
		IF (aiModul05.StatusInput01.3 = FALSE AND aiModul05.StatusInput01.2 = TRUE) THEN
			diStatusAbluftFeuchteMin := TRUE;
		ELSE
			diStatusAbluftFeuchteMin := FALSE;
		END_IF
		IF (aiModul05.StatusInput01.3 = TRUE AND aiModul05.StatusInput01.2 = FALSE) THEN
			diStatusAbluftFeuchteMax := TRUE;
		ELSE
			diStatusAbluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Kanaldruck **************************************************************************
		IF (aiModul05.StatusInput01.5 = FALSE AND aiModul05.StatusInput01.4 = TRUE) THEN
			diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = FALSE) THEN
			diStatusDifferenzdruckMax	:= TRUE;
		ELSE
			diStatusDifferenzdruckMax	:= FALSE;
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
		IF (aiModul05.StatusInput01.7 = FALSE AND aiModul05.StatusInput01.6 = TRUE) THEN
			diStatusLuftgeschwMin	:= TRUE;
		ELSE
			diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.7 = TRUE AND aiModul05.StatusInput01.6 = FALSE ) THEN
			diStatusLuftgeschwMax	:= TRUE;
		ELSE
			diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((aiModul05.StatusInput01.7 = TRUE AND aiModul05.StatusInput01.6 = TRUE) OR aiModul05.ai04 >= 32767) THEN
			diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF 
				
		
		//Ausgänge Testbetrieb rücksetzen, wenn IO-Test nicht aktiv
		hmiIoTest.DigitalOut.doAbluftklappeFreigabe		:= FALSE;
		hmiIoTest.DigitalOut.doAbluftventilatorEin		:= FALSE;
		hmiIoTest.DigitalOut.doBrandschutzklappeAuf		:= FALSE;
		hmiIoTest.DigitalOut.doBypassklappeOeffnen		:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox1				:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox2				:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox3				:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox4				:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox5				:= FALSE;
		hmiIoTest.DigitalOut.doFreigabeBox6				:= FALSE;
		hmiIoTest.DigitalOut.doHeizregisterEin			:= FALSE;
		hmiIoTest.DigitalOut.doKompressorEinModul1		:= FALSE;
		hmiIoTest.DigitalOut.doKompressorEinModul2		:= FALSE;
		hmiIoTest.DigitalOut.doMagnetventilEinModul1	:= FALSE;
		hmiIoTest.DigitalOut.doMagnetventilEinModul2	:= FALSE;
		hmiIoTest.DigitalOut.doNotstromaggregatEin		:= FALSE;
		hmiIoTest.DigitalOut.doOelsumpfheizungEinModul1	:= FALSE;
		hmiIoTest.DigitalOut.doOelsumpfheizungEinModul2	:= FALSE;
		hmiIoTest.DigitalOut.doTrocknungInBetrieb		:= FALSE;
		hmiIoTest.DigitalOut.doTrocknungStoerung		:= FALSE;
		hmiIoTest.DigitalOut.doUmluftklappe1Freigabe	:= FALSE;
		hmiIoTest.DigitalOut.doUmluftklappe2Freigabe	:= FALSE;
		hmiIoTest.DigitalOut.doVentilator1Ein			:= FALSE;
		hmiIoTest.DigitalOut.doVentilator2Ein			:= FALSE;
		hmiIoTest.DigitalOut.doWarmluftofenEin			:= FALSE;
		hmiIoTest.DigitalOut.doEntfFremdFreigabe		:= FALSE;

		hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator	:= 0.0;
		hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1	:= 0.0;
		hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2	:= 0.0;
		hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1		:= 0.0;
		hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2		:= 0.0;
		hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister		:= 0.0;
		hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen	:= 0.0;
		

		
		//==============================================================================================================================================================================================================
		//Testbetrieb 
		//==============================================================================================================================================================================================================
	ELSE
		
			
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************************************
		brModul01;
	
		//MODUL 02 - DI9371 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.di24VDCinternIstOk				:= diModul02.di01; 
		hmiIoTest.DigitalIn.di230VACIstOk					:= diModul02.di02;
		hmiIoTest.DigitalIn.diTasteTrocknungPausieren		:= diModul02.di03;
		hmiIoTest.DigitalIn.diEntfeuchterFremdInBetrieb		:= diModul02.di04;
		hmiIoTest.DigitalIn.diEntfeuchterFremdStoerung		:= diModul02.di05;
		hmiIoTest.DigitalIn.diWarmluftofenInBetrieb			:= diModul02.di06;
		hmiIoTest.DigitalIn.diScheitholzofenInBetrieb		:= diModul02.di07;
		hmiIoTest.DigitalIn.diVentilator1InBetrieb			:= diModul02.di08;
		hmiIoTest.DigitalIn.diVentilator2InBetrieb			:= diModul02.di09;
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1		:= diModul02.di10;
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator2		:= diModul02.di11;
		//Reserve											:= diModul02.di12;
		
		
		//MODUL 03 - DO9322 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		doModul03.do01		:= hmiIoTest.DigitalOut.doTrocknungInBetrieb;
		doModul03.do02		:= hmiIoTest.DigitalOut.doTrocknungStoerung;
		doModul03.do03		:= hmiIoTest.DigitalOut.doVentilator1Ein;
		doModul03.do04		:= hmiIoTest.DigitalOut.doVentilator2Ein;
		doModul03.do05		:= hmiIoTest.DigitalOut.doEntfFremdFreigabe;
		doModul03.do06		:= hmiIoTest.DigitalOut.doUmluftklappe1Freigabe;
		doModul03.do07		:= hmiIoTest.DigitalOut.doWarmluftofenEin OR hmiIoTest.DigitalOut.doHeizregisterEin; 
		doModul03.do08		:= hmiIoTest.DigitalOut.doFreigabeBox1;
		doModul03.do09		:= hmiIoTest.DigitalOut.doBrandschutzklappeAuf;
		doModul03.do10		:= hmiIoTest.DigitalOut.doLuftentfeuchterStrombegrEin;
		doModul03.do11		:= hmiIoTest.DigitalOut.doAbluftklappeFreigabe;
		doModul03.do12		:= FALSE; //Reserve

		
		//MODUL 04 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		hmiIoTest.AnalogIn.aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		hmiIoTest.AnalogIn.aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		
		
		
		//MODUL 05 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul05.ai02, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul05.ai03, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul05.ai04, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		hmiIoTest.AnalogIn.aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		hmiIoTest.AnalogIn.aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		hmiIoTest.AnalogIn.aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		
		
		//MODUL 06 - AI2622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************

		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1, x1 := Betriebsparameter.Ventilator1.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator1.DrehzahlMax, y2 := 32767);
		aoModul06.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2, x1 := Betriebsparameter.Ventilator2.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator2.DrehzahlMax, y2 := 32767);
		aoModul06.ao02				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
				
		//MODUL 07 - CS1030 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//GSM-Modul (nicht mehr in Verwendung)
		csModul07;
		
	
		//Modul 08 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.

		
		
		//Modul 09 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.
		
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//HB4000 Sensor Dachluft = Sensor Frischluft
		hmiIoTest.StatusIn.diStatusDachluftFeuchteMax := hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax;
		hmiIoTest.StatusIn.diStatusDachluftFeuchteMin := hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin;
		hmiIoTest.StatusIn.diStatusDachluftTempMax := hmiIoTest.StatusIn.diStatusFrischluftTempMax;
		hmiIoTest.StatusIn.diStatusDachluftTempMin := hmiIoTest.StatusIn.diStatusFrischluftTempMin;
		
		//Modul 04 Frischluft Temperatur ****************************************************************************
		IF (aiModul04.StatusInput01.1 = FALSE AND aiModul04.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.1 = TRUE AND aiModul04.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 04 Frischluft rel. Feuchte ***************************************************************************
		IF (aiModul04.StatusInput01.3 = FALSE AND aiModul04.StatusInput01.2 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin := FALSE;
		END_IF
		IF (aiModul04.StatusInput01.3 = TRUE AND aiModul04.StatusInput01.2 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur **************************************************************************
		IF (aiModul04.StatusInput01.5 = FALSE AND aiModul04.StatusInput01.4 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.5 = TRUE AND aiModul04.StatusInput01.4 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	:= FALSE;
		END_IF
		
		//Modul 04 Trockenluft rel. Feuchte **************************************************************************
		IF (aiModul04.StatusInput01.7 = FALSE AND aiModul04.StatusInput01.6 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.7 = TRUE AND aiModul04.StatusInput01.6 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	:= FALSE;
		END_IF
			
		//Modul 05 Abluft Temperatur ****************************************************************************
		IF (aiModul05.StatusInput01.1 = FALSE AND aiModul05.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.1 = TRUE AND aiModul05.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 05 Abluft rel. Feuchte ***************************************************************************
		IF (aiModul05.StatusInput01.3 = FALSE AND aiModul05.StatusInput01.2 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin := FALSE;
		END_IF
		IF (aiModul05.StatusInput01.3 = TRUE AND aiModul05.StatusInput01.2 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Kanaldruck **************************************************************************
		IF (aiModul05.StatusInput01.5 = FALSE AND aiModul05.StatusInput01.4 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax	:= FALSE;
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
		IF (aiModul05.StatusInput01.7 = FALSE AND aiModul05.StatusInput01.6 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.7 = TRUE AND aiModul05.StatusInput01.6 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((aiModul05.StatusInput01.7 = TRUE AND aiModul05.StatusInput01.6 = TRUE) OR aiModul05.ai04 >= 32767) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF
		
		
	END_IF
	
	
	//============================================================================================================================================================================
	//Modulüberwachungen
	//============================================================================================================================================================================
	
	loc_Erforderl_Mod1	:= TRUE;
	loc_Erforderl_Mod2	:= TRUE;
	loc_Erforderl_Mod3	:= TRUE;
	loc_Erforderl_Mod4	:= TRUE;
	loc_Erforderl_Mod5	:= TRUE;
	loc_Erforderl_Mod6	:= TRUE;
	loc_Erforderl_Mod7	:= FALSE;
	loc_Erforderl_Mod8	:= Betriebsparameter.Ausstattung.Energiemessung;
	loc_Erforderl_Mod9	:= Betriebsparameter.Ausstattung.Energiemessung;
	
	fbLascoFehl_0.FehlerIn	:= (loc_Erforderl_Mod1 AND NOT brModul01.ModulOk) OR (loc_Erforderl_Mod2 AND NOT diModul02.ModulOk) OR 
	(loc_Erforderl_Mod3 AND NOT doModul03.ModulOk) OR (loc_Erforderl_Mod4 AND NOT aiModul04.ModulOk) OR (loc_Erforderl_Mod5 AND NOT aiModul05.ModulOk) OR
	(loc_Erforderl_Mod6 AND NOT aoModul06.ModulOk) (*OR (loc_Erforderl_Mod7 AND NOT csModul07.ModulOk*) OR (loc_Erforderl_Mod8 AND NOT gEnergiemessungModulOk) OR
	(loc_Erforderl_Mod9 AND NOT gEnergiemessungModulOk);
	fbLascoFehl_0.VerzZeit	:= Betriebsparameter.Allgemein.VerzoegerungWarnungen;
	fbLascoFehl_0.Mode		:= 2;
	fbLascoFehl_0.Quit		:= hmiButtons.QuitFehler;
	fbLascoFehl_0.Tick		:= sekTick;
	fbLascoFehl_0();
	
	alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] := fbLascoFehl_0.FehlerOut;
	
	
END_PROGRAM
