
PROGRAM _INIT
	 
	hmiStatus.NameSteuerung	:= 0; //= LaTronic CControl 4.07
	
END_PROGRAM



PROGRAM _CYCLIC
	
	//Bei Konfiguration 4.07 -> Text auf Login-Seite anpassen, Option Entfeuchter ausschalten
	hmiParameter.Ausstattung.Entfeuchter := FALSE;
	hmiParameter.Ausstattung.Bypassklappe := FALSE;
	hmiParameter.Ausstattung.Box5 := FALSE;
	hmiParameter.Ausstattung.Box6 := FALSE;
	
	IF hmiParameter.Ausstattung.Abluftklappe THEN
		hmiParameter.Ausstattung.Abluftventilator := FALSE;
	ELSIF hmiParameter.Ausstattung.Abluftventilator THEN
		hmiParameter.Ausstattung.Abluftklappe := FALSE;
	END_IF
		
	
	//Zeitticks generieren
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	//=========================================================================================================================================================
	//IO-Zuweisung LaTronic CControl 4.07
	//=========================================================================================================================================================
	
	//Kein Testbetrieb
	IF (gAktModus <> IOTEST) THEN
		
		
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************************************
		brModul01;
	
		//MODUL 02 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diVentilator1InBetrieb	:= cmModul02.di01; 
		di24VDCinternIstOk		:= cmModul02.di02;
		//Reserve				:= cmModul02.di03;
		//Reserve				:= cmModul02.di04; 

		cmModul02.do01			:= doVentilator1Ein; 
		cmModul02.do02			:= doTrocknungInBetrieb;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := cmModul02.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 1
		LCRLimScal_0(x := aoDrehzahlvorgVentilator1, x1 := Betriebsparameter.Ventilator1.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator1.DrehzahlMax, y2 := 32767);
		cmModul02.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 03 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox1Offen				:= cmModul03.di01; 
		diBox1Geschl			:= cmModul03.di02;
		diBox2Offen				:= cmModul03.di03;
		diBox2Geschl			:= cmModul03.di04; 

		cmModul03.do01			:= doFreigabeBox1;
		cmModul03.do02			:= doFreigabeBox2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_1(enable := TRUE, x := cmModul03.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		
		//Temperaturvorgabe Warmluftofen
		LCRLimScal_0(x := aoTemperaturvorgWarmluftofen, x1 := 0, y1 := 0, 
		x2 := 100, y2 := 32767);
		cmModul03.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
	
		
		//MODUL 04 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diVentilator2InBetrieb			:= cmModul04.di01; 
		diDrehzahlbegrVentilator1		:= cmModul04.di02;
		diDrehzahlbegrVentilator2		:= cmModul04.di03;
		//Reserve						:= cmModul04.di04; 

		cmModul04.do01					:= doTrocknungStoerung;
		cmModul04.do02					:= doVentilator2Ein;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_2(enable := TRUE, x := cmModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 2
		LCRLimScal_0(x := aoDrehzahlvorgVentilator2, x1 := Betriebsparameter.Ventilator2.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator2.DrehzahlMax, y2 := 32767);
		cmModul04.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		

		
		//MODUL 05 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diWarmluftofenInBetrieb		:= cmModul05.di01; 
		diScheitholzofenInBetrieb	:= cmModul05.di02; 
		diHeizregisterFrostschutz	:= cmModul05.di03; 
		//Reserve					:= cmModul05.di04; 

		cmModul05.do01				:= doWarmluftofenEin;
		cmModul05.do02				:= doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_3(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_0(x := aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox3Offen				:= cmModul06.di01; 
		diBox3Geschl			:= cmModul06.di02; 
		diBox4Offen				:= cmModul06.di03; 
		diBox4Geschl			:= cmModul06.di04; 

		cmModul06.do01			:= doFreigabeBox3;
		cmModul06.do02			:= doFreigabeBox4;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_4(enable := TRUE, x := cmModul06.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Analogausgang
		cmModul06.ao01				:= 0;	//Reserve
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox5Offen				:= cmModul07.di01; 
		diBox5Geschl			:= cmModul07.di02; 
		diBox6Offen				:= cmModul07.di03; 
		diBox6Geschl			:= cmModul07.di04; 

		cmModul07.do01			:= doFreigabeBox5;
		cmModul07.do02			:= doFreigabeBox6;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_5(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Analogausgang
		cmModul07.ao01				:= 0;	//Reserve
		
		
		
		//MODUL 08 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diAbluftventInBetrieb	:= cmModul08.di01; 
		//Reserve				:= cmModul08.di02; 
		//Reserve				:= cmModul08.di03; 
		//Reserve				:= cmModul08.di04; 

		cmModul08.do01			:= doBrandschutzklappeAuf;
		cmModul08.do02			:= doAbluftventilatorEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_6(enable := TRUE, x := cmModul08.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
		aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Abluftventilator
		LCRLimScal_0(x := aoDrehzahlvorgAbluftventilator, x1 := Betriebsparameter.Abluftventilator.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Abluftventilator.DrehzahlMax, y2 := 32767);
		cmModul08.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 09 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diAbluftklappeOffen		:= cmModul09.di01; 
		diAbluftklappeGeschl	:= cmModul09.di02; 
		//Reserve				:= cmModul09.di03; 
		//Reserve				:= cmModul09.di04; 

		cmModul09.do01			:= doAbluftklappeFreigabe;
		cmModul09.do02			:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_7(enable := TRUE, x := cmModul09.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
		aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Analogausgang
		cmModul09.ao01				:= 0;	//Reserve
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diUmschaltklappe1Offen		:= cmModul10.di01; 
		diUmschaltklappe1Geschl		:= cmModul10.di02; 
		diUmschaltklappe2Offen		:= cmModul10.di03; 
		diUmschaltklappe2Geschl		:= cmModul10.di04; 

		cmModul10.do01				:= doUmluftklappe1Freigabe;
		cmModul10.do02				:= doUmluftklappe2Freigabe;	

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Analogausgang
		cmModul10.ao01				:= 0;	//Reserve
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diNotstromaggregatInBetrieb		:= cmModul11.di01; 
		//Reserve						:= cmModul11.di02; 
		//Reserve						:= cmModul11.di03; 
		//Reserve						:= cmModul11.di04; 

		cmModul11.do01					:= doNotstromaggregatEin;
		cmModul11.do02					:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Differenzdruck
		LCRLimScal_0(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul11.ao01				:= 0;	//Reserve
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//Modul 02 Frischluft Temperatur ****************************************************************************
		IF (cmModul02.StatusInput01.1 = FALSE AND cmModul02.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftTempMin	:= TRUE;
		ELSE
			diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (cmModul02.StatusInput01.1 = TRUE AND cmModul02.StatusInput01.0 = FALSE ) THEN
			diStatusFrischluftTempMax	 := TRUE;
		ELSE
			diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 03 Frischluft rel. Feuchte ****************************************************************************
		IF (cmModul03.StatusInput01.1 = FALSE AND cmModul03.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftFeuchteMin	:= TRUE;
		ELSE
			diStatusFrischluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul03.StatusInput01.1 = TRUE AND cmModul03.StatusInput01.0 = FALSE ) THEN
			diStatusFrischluftFeuchteMax	 := TRUE;
		ELSE
			diStatusFrischluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur ****************************************************************************
		IF (cmModul04.StatusInput01.1 = FALSE AND cmModul04.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul04.StatusInput01.1 = TRUE AND cmModul04.StatusInput01.0 = FALSE ) THEN
			diStatusTrockenluftTempMax	 := TRUE;
		ELSE
			diStatusTrockenluftTempMax	 := FALSE;
		END_IF
		
		//Modul 05 Trockenluft rel. Feuchte ****************************************************************************
		IF (cmModul05.StatusInput01.1 = FALSE AND cmModul05.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = FALSE ) THEN
			diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 06 Abluft Temperatur ****************************************************************************
		IF (cmModul06.StatusInput01.1 = FALSE AND cmModul06.StatusInput01.0 = TRUE) THEN
			diStatusAbluftTempMin	:= TRUE;
		ELSE
			diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul06.StatusInput01.1 = TRUE AND cmModul06.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftTempMax	 := TRUE;
		ELSE
			diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 07 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftFeuchteMax	 := TRUE;
		ELSE
			diStatusAbluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 08 Dachluft Temperatur ****************************************************************************
		IF (cmModul08.StatusInput01.1 = FALSE AND cmModul08.StatusInput01.0 = TRUE) THEN
			diStatusDachluftTempMin	:= TRUE;
		ELSE
			diStatusDachluftTempMin	:= FALSE;
		END_IF
		IF (cmModul08.StatusInput01.1 = TRUE AND cmModul08.StatusInput01.0 = FALSE ) THEN
			diStatusDachluftTempMax	 := TRUE;
		ELSE
			diStatusDachluftTempMax	 := FALSE;
		END_IF
		
		//Modul 09 Dachluft rel. Feuchte ****************************************************************************
		IF (cmModul09.StatusInput01.1 = FALSE AND cmModul09.StatusInput01.0 = TRUE) THEN
			diStatusDachluftFeuchteMin	:= TRUE;
		ELSE
			diStatusDachluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul09.StatusInput01.1 = TRUE AND cmModul09.StatusInput01.0 = FALSE ) THEN
			diStatusDachluftFeuchteMax	 := TRUE;
		ELSE
			diStatusDachluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 10 Luftgeschwindigkeit ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			diStatusLuftgeschwMin	:= TRUE;
		ELSE
			diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			diStatusLuftgeschwMax	:= TRUE;
		ELSE
			diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = TRUE) OR cmModul10.ai01 >= 32767) THEN
			diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF 
		
		//Modul 11 Differenzdruck ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			diStatusDifferenzdruckMax	 := TRUE;
		ELSE
			diStatusDifferenzdruckMax	 := FALSE;
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
	
	
		//MODUL 02 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diVentilator1InBetrieb	:= cmModul02.di01; 
		hmiIoTest.DigitalIn.di24VDCinternIstOk		:= cmModul02.di02;
		//Reserve									:= cmModul02.di03;
		//Reserve									:= cmModul02.di04; 

		cmModul02.do01			:= hmiIoTest.DigitalOut.doVentilator1Ein; 
		cmModul02.do02			:= hmiIoTest.DigitalOut.doTrocknungInBetrieb;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := cmModul02.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF

		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 1
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1, x1 := Betriebsparameter.Ventilator1.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator1.DrehzahlMax, y2 := 32767);
		cmModul02.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
	
		
		//MODUL 03 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox1Offen				:= cmModul03.di01; 
		hmiIoTest.DigitalIn.diBox1Geschl			:= cmModul03.di02;
		hmiIoTest.DigitalIn.diBox2Offen				:= cmModul03.di03;
		hmiIoTest.DigitalIn.diBox2Geschl			:= cmModul03.di04; 

		cmModul03.do01			:= hmiIoTest.DigitalOut.doFreigabeBox1;
		cmModul03.do02			:= hmiIoTest.DigitalOut.doFreigabeBox2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_1(enable := TRUE, x := cmModul03.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		
		//Temperaturvorgabe Warmluftofen
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen, x1 := 0, y1 := 0, 
		x2 := 100, y2 := 32767);
		cmModul03.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
	
		
		//MODUL 04 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diVentilator2InBetrieb			:= cmModul04.di01; 
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1		:= cmModul04.di02;
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator2		:= cmModul04.di03;
		//Reserve											:= cmModul04.di04; 

		cmModul04.do01					:= hmiIoTest.DigitalOut.doTrocknungStoerung;
		cmModul04.do02					:= hmiIoTest.DigitalOut.doVentilator2Ein;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_2(enable := TRUE, x := cmModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 2
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2, x1 := Betriebsparameter.Ventilator2.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator2.DrehzahlMax, y2 := 32767);
		cmModul04.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		

		
		//MODUL 05 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diWarmluftofenInBetrieb		:= cmModul05.di01; 
		hmiIoTest.DigitalIn.diScheitholzofenInBetrieb	:= cmModul05.di02; 
		hmiIoTest.DigitalIn.diHeizregisterFrostschutz	:= cmModul05.di03; 
		//Reserve										:= cmModul05.di04; 

		cmModul05.do01				:= hmiIoTest.DigitalOut.doWarmluftofenEin;
		cmModul05.do02				:= hmiIoTest.DigitalOut.doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_3(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox3Offen				:= cmModul06.di01; 
		hmiIoTest.DigitalIn.diBox3Geschl			:= cmModul06.di02; 
		hmiIoTest.DigitalIn.diBox4Offen				:= cmModul06.di03; 
		hmiIoTest.DigitalIn.diBox4Geschl			:= cmModul06.di04; 

		cmModul06.do01			:= hmiIoTest.DigitalOut.doFreigabeBox3;
		cmModul06.do02			:= hmiIoTest.DigitalOut.doFreigabeBox4;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_4(enable := TRUE, x := cmModul06.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		hmiIoTest.AnalogIn.aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Analogausgang
		cmModul06.ao01				:= 0;	//Reserve
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox5Offen				:= cmModul07.di01; 
		hmiIoTest.DigitalIn.diBox5Geschl			:= cmModul07.di02; 
		hmiIoTest.DigitalIn.diBox6Offen				:= cmModul07.di03; 
		hmiIoTest.DigitalIn.diBox6Geschl			:= cmModul07.di04; 

		cmModul07.do01			:= hmiIoTest.DigitalOut.doFreigabeBox5;
		cmModul07.do02			:= hmiIoTest.DigitalOut.doFreigabeBox6;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_5(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Analogausgang
		cmModul07.ao01				:= 0;	//Reserve
		
		
		
		//MODUL 08 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diAbluftventInBetrieb	:= cmModul08.di01; 
		//Reserve									:= cmModul08.di02; 
		//Reserve									:= cmModul08.di03; 
		//Reserve									:= cmModul08.di04; 

		cmModul08.do01			:= hmiIoTest.DigitalOut.doBrandschutzklappeAuf;
		cmModul08.do02			:= hmiIoTest.DigitalOut.doAbluftventilatorEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_6(enable := TRUE, x := cmModul08.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
		hmiIoTest.AnalogIn.aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Abluftventilator
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator, x1 := Betriebsparameter.Abluftventilator.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Abluftventilator.DrehzahlMax, y2 := 32767);
		cmModul08.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 09 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diAbluftklappeOffen		:= cmModul09.di01; 
		hmiIoTest.DigitalIn.diAbluftklappeGeschl	:= cmModul09.di02; 
		//Reserve									:= cmModul09.di03; 
		//Reserve									:= cmModul09.di04; 

		cmModul09.do01			:= hmiIoTest.DigitalOut.doAbluftklappeFreigabe;
		cmModul09.do02			:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_7(enable := TRUE, x := cmModul09.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Analogausgang
		cmModul09.ao01				:= 0;	//Reserve
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diUmschaltklappe1Offen		:= cmModul10.di01; 
		hmiIoTest.DigitalIn.diUmschaltklappe1Geschl		:= cmModul10.di02; 
		hmiIoTest.DigitalIn.diUmschaltklappe2Offen		:= cmModul10.di03; 
		hmiIoTest.DigitalIn.diUmschaltklappe2Geschl		:= cmModul10.di04; 

		cmModul10.do01				:= hmiIoTest.DigitalOut.doUmluftklappe1Freigabe;
		cmModul10.do02				:= hmiIoTest.DigitalOut.doUmluftklappe2Freigabe;	

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		hmiIoTest.AnalogIn.aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Analogausgang
		cmModul10.ao01				:= 0;	//Reserve
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diNotstromaggregatInBetrieb		:= cmModul11.di01; 
		//Reserve											:= cmModul11.di02; 
		//Reserve											:= cmModul11.di03; 
		//Reserve											:= cmModul11.di04; 

		cmModul11.do01					:= hmiIoTest.DigitalOut.doNotstromaggregatEin;
		cmModul11.do02					:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Differenzdruck
		LCRLimScal_0(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		hmiIoTest.AnalogIn.aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul11.ao01				:= 0;	//Reserve
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
	
		//Modul 02 Frischluft Temperatur ****************************************************************************
		IF (cmModul02.StatusInput01.1 = FALSE AND cmModul02.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= TRUE;
		ELSE
			diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (cmModul02.StatusInput01.1 = TRUE AND cmModul02.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 03 Frischluft rel. Feuchte ****************************************************************************
		IF (cmModul03.StatusInput01.1 = FALSE AND cmModul03.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul03.StatusInput01.1 = TRUE AND cmModul03.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur ****************************************************************************
		IF (cmModul04.StatusInput01.1 = FALSE AND cmModul04.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul04.StatusInput01.1 = TRUE AND cmModul04.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	 := FALSE;
		END_IF
		
		//Modul 05 Trockenluft rel. Feuchte ****************************************************************************
		IF (cmModul05.StatusInput01.1 = FALSE AND cmModul05.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 06 Abluft Temperatur ****************************************************************************
		IF (cmModul06.StatusInput01.1 = FALSE AND cmModul06.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul06.StatusInput01.1 = TRUE AND cmModul06.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 07 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 08 Dachluft Temperatur ****************************************************************************
		IF (cmModul08.StatusInput01.1 = FALSE AND cmModul08.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDachluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftTempMin	:= FALSE;
		END_IF
		IF (cmModul08.StatusInput01.1 = TRUE AND cmModul08.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusDachluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftTempMax	 := FALSE;
		END_IF
		
		//Modul 09 Dachluft rel. Feuchte ****************************************************************************
		IF (cmModul09.StatusInput01.1 = FALSE AND cmModul09.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul09.StatusInput01.1 = TRUE AND cmModul09.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 10 Luftgeschwindigkeit ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = TRUE) OR cmModul10.ai01 >= 32767) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF 
		
		//Modul 11 Differenzdruck ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax	 := FALSE;
		END_IF

	
	END_IF
	
	
	//============================================================================================================================================================================
	//Modulüberwachungen
	//============================================================================================================================================================================
	
	loc_Erforderl_Mod1	:= TRUE;
	loc_Erforderl_Mod2	:= TRUE;
	loc_Erforderl_Mod3	:= Aktoren.VentUndKlappen.Boxenklappe1Vorhanden OR Aktoren.VentUndKlappen.Boxenklappe2Vorhanden OR
		Betriebsparameter.Ausstattung.SensorFrischluft OR Betriebsparameter.Ausstattung.WarmluftofenTempVorgabe;
	loc_Erforderl_Mod4	:= TRUE;
	loc_Erforderl_Mod5	:= Betriebsparameter.Ausstattung.Warmluftofen OR Betriebsparameter.Ausstattung.Scheitholzofen OR Betriebsparameter.Ausstattung.Heizregister OR
		Betriebsparameter.Ausstattung.SensorTrockenluft;
	loc_Erforderl_Mod6	:= Aktoren.VentUndKlappen.Boxenklappe3Vorhanden OR Aktoren.VentUndKlappen.Boxenklappe4Vorhanden OR Betriebsparameter.Ausstattung.SensorAbluft;
	loc_Erforderl_Mod7	:= Betriebsparameter.Ausstattung.SensorAbluft;
	loc_Erforderl_Mod8	:= Betriebsparameter.Ausstattung.Abluftventilator OR Betriebsparameter.Ausstattung.Brandschutzklappe OR Betriebsparameter.Ausstattung.SensorDachluft;
	loc_Erforderl_Mod9	:= Betriebsparameter.Ausstattung.Abluftklappe OR Betriebsparameter.Ausstattung.SensorDachluft;
	loc_Erforderl_Mod10	:= Betriebsparameter.Ausstattung.Umschaltklappe1 OR Betriebsparameter.Ausstattung.Umschaltklappe2 OR 
		Betriebsparameter.Ausstattung.SensorLuftgeschwindigkeit;
	loc_Erforderl_Mod11	:= Betriebsparameter.Ausstattung.Notstromaggregat OR Betriebsparameter.Ausstattung.SensorKanaldruck;
	loc_Erforderl_Mod12	:= Betriebsparameter.Ausstattung.Energiemessung;

	
	fbLascoFehl_0.FehlerIn	:= (loc_Erforderl_Mod1 AND NOT brModul01.ModulOk) OR (loc_Erforderl_Mod2 AND NOT cmModul02.ModulOk) OR 
	(loc_Erforderl_Mod3 AND NOT cmModul03.ModulOk) OR (loc_Erforderl_Mod4 AND NOT cmModul04.ModulOk) OR (loc_Erforderl_Mod5 AND NOT cmModul05.ModulOk) OR
	(loc_Erforderl_Mod6 AND NOT cmModul06.ModulOk) OR (loc_Erforderl_Mod7 AND NOT cmModul07.ModulOk) OR (loc_Erforderl_Mod8 AND NOT cmModul08.ModulOk) OR
	(loc_Erforderl_Mod9 AND NOT cmModul09.ModulOk) OR (loc_Erforderl_Mod10 AND NOT cmModul10.ModulOk) OR (loc_Erforderl_Mod11 AND NOT cmModul11.ModulOk) OR
	(loc_Erforderl_Mod12 AND NOT gEnergiemessungModulOk);
	fbLascoFehl_0.Mode		:= 2;
	fbLascoFehl_0.Quit		:= hmiButtons.QuitFehler;
	fbLascoFehl_0.Tick		:= sekTick;
	fbLascoFehl_0();
	
	alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] := fbLascoFehl_0.FehlerOut;
	
	

END_PROGRAM





PROGRAM _EXIT
	
	 
END_PROGRAM

