
PROGRAM _INIT
	 
	hmiStatus.NameSteuerung	:= 5; //= HB3000
	
END_PROGRAM



PROGRAM _CYCLIC
	
	
	//Nicht verfügbare Ausstattungsoptionen ausschalten
	hmiParameter.Ausstattung.Abluftklappe := FALSE;
	hmiParameter.Ausstattung.AbluftklImFrischlbetrImmerOffen := FALSE;
	hmiParameter.Ausstattung.Abluftventilator := FALSE;
	hmiParameter.Ausstattung.AlleBoxenklSchliessenWennAus := FALSE;
	hmiParameter.Ausstattung.Box2 := FALSE;
	hmiParameter.Ausstattung.Box3 := FALSE;
	hmiParameter.Ausstattung.Box4 := FALSE;
	hmiParameter.Ausstattung.Box5 := FALSE;
	hmiParameter.Ausstattung.Box6 := FALSE;
	hmiParameter.Ausstattung.Bypassklappe := FALSE;
	hmiParameter.Ausstattung.Energiemessung := FALSE;
	hmiParameter.Ausstattung.Entfeuchter := FALSE;
	hmiParameter.Ausstattung.HeizregisterDrehzahlvorgabe := FALSE;
	hmiParameter.Ausstattung.Notstromaggregat := FALSE;
	hmiParameter.Ausstattung.Umschaltklappe2 := FALSE;
	hmiParameter.Ausstattung.WarmluftofenTempVorgabe := FALSE;
	
	IF hmiParameter.Ausstattung.SensorFrischluft AND hmiParameter.Ausstattung.SensorDachluft THEN
		hmiParameter.Ausstattung.SensorDachluft := FALSE;
	END_IF
	IF hmiParameter.Ausstattung.Warmluftofen AND hmiParameter.Ausstattung.Heizregister THEN
		hmiParameter.Ausstattung.Heizregister := FALSE;
	END_IF
	IF hmiParameter.Ausstattung.SensorTrockenluft AND hmiParameter.Ausstattung.SensorAbluft THEN
		hmiParameter.Ausstattung.SensorAbluft := FALSE;
	END_IF
	IF hmiParameter.Ausstattung.EntfeuchterFremd AND hmiParameter.Ausstattung.Brandschutzklappe THEN
		hmiParameter.Ausstattung.Brandschutzklappe := FALSE;
	END_IF
	
	
	//Zeitticks generieren
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	
	//=====================================================================================================================================================================================
	//IO-Zuweisung HB3000
	//=====================================================================================================================================================================================
	

	//Kein Testbetrieb
	IF (gAktModus <> IOTEST) THEN
		
		
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************************************
		brModul01;
		
		
		//MODUL 02 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		di24VDCinternIstOk				:= cmModul02.di01; 
		di230VACIstOk					:= cmModul02.di02; 
		diTasteTrocknungPausieren		:= cmModul02.di03; 
		diScheitholzofenInBetrieb		:= cmModul02.di04; 

		cmModul02.do01					:= doTrocknungInBetrieb;
		cmModul02.do02					:= doWarmluftofenEin OR doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := cmModul02.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := aoDrehzahlvorgVentilator1, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		cmModul02.ao01				:= REAL_TO_INT(LCRLimScal_0.y);

		
		//MODUL 03 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diWarmluftofenInBetrieb			:= cmModul03.di01; 
		diVentilator1InBetrieb			:= cmModul03.di02; 
		diVentilator2InBetrieb			:= cmModul03.di03; 
		//Reserve						:= cmModul03.di04; 

		cmModul03.do01					:= doEntfFremdFreigabe OR doBrandschutzklappeAuf;
		cmModul03.do02					:= doVentilator1Ein;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_1(enable := TRUE, x := cmModul03.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := aoDrehzahlvorgVentilator2, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		cmModul03.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 04 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Reserve						:= cmModul04.di01; 
		//Reserve						:= cmModul04.di02; 
		//Reserve						:= cmModul04.di03; 
		//Reserve						:= cmModul04.di04; 

		cmModul04.do01					:= doVentilator2Ein;
		cmModul04.do02					:= doTrocknungStoerung;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_2(enable := TRUE, x := cmModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft & Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		aiAbluftTemperatur			:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		cmModul04.ao01 := 0; //Reserve

		
		//MODUL 05 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul05.ai02, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul05.ai03, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Trockenluft & Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		aiAbluftFeuchte				:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;

		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//HB3000 Sensor Dachluft = Sensor Frischluft
		//HB3000 Sensor Abluft = Sensor Trockenluft
		diStatusDachluftFeuchteMax := diStatusFrischluftFeuchteMax;
		diStatusDachluftFeuchteMin := diStatusFrischluftFeuchteMin;
		diStatusDachluftTempMax := diStatusFrischluftTempMax;
		diStatusDachluftTempMin := diStatusFrischluftTempMin;
		diStatusAbluftFeuchteMax := diStatusTrockenluftFeuchteMax;
		diStatusAbluftFeuchteMin := diStatusTrockenluftFeuchteMin;
		diStatusAbluftTempMax := diStatusTrockenluftTempMax;
		diStatusAbluftTempMin := diStatusTrockenluftTempMin;
		
		
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
		
		//Modul 03 Frischluft rel. Feuchte ***************************************************************************
		IF (cmModul03.StatusInput01.1 = FALSE AND cmModul03.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftFeuchteMin := TRUE;
		ELSE
			diStatusFrischluftFeuchteMin := FALSE;
		END_IF
		IF (cmModul03.StatusInput01.1 = TRUE AND cmModul03.StatusInput01.0 = FALSE) THEN
			diStatusFrischluftFeuchteMax := TRUE;
		ELSE
			diStatusFrischluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur **************************************************************************
		IF (cmModul04.StatusInput01.1 = FALSE AND cmModul04.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul04.StatusInput01.1 = TRUE AND cmModul04.StatusInput01.0 = FALSE) THEN
			diStatusTrockenluftTempMax	:= TRUE;
		ELSE
			diStatusTrockenluftTempMax	:= FALSE;
		END_IF
					
		//Modul 05 Trockenluft rel. Feuchte ****************************************************************************
		IF (aiModul05.StatusInput01.1 = FALSE AND aiModul05.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.1 = TRUE AND aiModul05.StatusInput01.0 = FALSE) THEN
			diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 05 Kanaldruck ***************************************************************************
		IF (aiModul05.StatusInput01.3 = FALSE AND aiModul05.StatusInput01.2 = TRUE) THEN
			diStatusDifferenzdruckMin := TRUE;
		ELSE
			diStatusDifferenzdruckMin := FALSE;
		END_IF
		IF (aiModul05.StatusInput01.3 = TRUE AND aiModul05.StatusInput01.2 = FALSE) THEN
			diStatusDifferenzdruckMax := TRUE;
		ELSE
			diStatusDifferenzdruckMax := FALSE;
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
		IF (aiModul05.StatusInput01.5 = FALSE AND aiModul05.StatusInput01.4 = TRUE) THEN
			diStatusLuftgeschwMin	:= TRUE;
		ELSE
			diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = FALSE ) THEN
			diStatusLuftgeschwMax	:= TRUE;
		ELSE
			diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = TRUE) OR aiModul05.ai03 >= 32767) THEN
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
		
		
		//MODUL 02 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.di24VDCinternIstOk				:= cmModul02.di01; 
		hmiIoTest.DigitalIn.di230VACIstOk					:= cmModul02.di02; 
		hmiIoTest.DigitalIn.diTasteTrocknungPausieren		:= cmModul02.di03; 
		hmiIoTest.DigitalIn.diScheitholzofenInBetrieb		:= cmModul02.di04; 

		cmModul02.do01					:= hmiIoTest.DigitalOut.doTrocknungInBetrieb;
		cmModul02.do02					:= hmiIoTest.DigitalOut.doWarmluftofenEin OR hmiIoTest.DigitalOut.doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := cmModul02.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftTemperatur	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		hmiIoTest.AnalogIn.aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		cmModul02.ao01				:= REAL_TO_INT(LCRLimScal_0.y);

		
		//MODUL 03 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diWarmluftofenInBetrieb			:= cmModul03.di01; 
		hmiIoTest.DigitalIn.diVentilator1InBetrieb			:= cmModul03.di02; 
		hmiIoTest.DigitalIn.diVentilator2InBetrieb			:= cmModul03.di03; 
		//Reserve											:= cmModul03.di04; 

		cmModul03.do01					:= hmiIoTest.DigitalOut.doEntfFremdFreigabe OR hmiIoTest.DigitalOut.doBrandschutzklappeAuf;
		cmModul03.do02					:= hmiIoTest.DigitalOut.doVentilator1Ein;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_1(enable := TRUE, x := cmModul03.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		hmiIoTest.AnalogIn.aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2, x1 := CONST_VENT_DRZ_MIN, y1 := 0, x2 := CONST_VENT_DRZ_MAX, y2 := 32767);
		cmModul03.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 04 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Reserve			:= cmModul04.di01; 
		//Reserve			:= cmModul04.di02; 
		//Reserve			:= cmModul04.di03; 
		//Reserve			:= cmModul04.di04; 

		cmModul04.do01					:= hmiIoTest.DigitalOut.doVentilator2Ein;
		cmModul04.do02					:= hmiIoTest.DigitalOut.doTrocknungStoerung;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_2(enable := TRUE, x := cmModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft & Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		hmiIoTest.AnalogIn.aiAbluftTemperatur			:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		cmModul04.ao01 := 0; //Reserve

		
		//MODUL 05 - AI4622 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul05.ai02, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul05.ai03, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Trockenluft & Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		hmiIoTest.AnalogIn.aiAbluftFeuchte			:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		hmiIoTest.AnalogIn.aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		hmiIoTest.AnalogIn.aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;

		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//HB3000 Sensor Dachluft = Sensor Frischluft
		//HB3000 Sensor Abluft = Sensor Trockenluft
		hmiIoTest.StatusIn.diStatusDachluftFeuchteMax := hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax;
		hmiIoTest.StatusIn.diStatusDachluftFeuchteMin := hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin;
		hmiIoTest.StatusIn.diStatusDachluftTempMax := hmiIoTest.StatusIn.diStatusFrischluftTempMax;
		hmiIoTest.StatusIn.diStatusDachluftTempMin := hmiIoTest.StatusIn.diStatusFrischluftTempMin;
		hmiIoTest.StatusIn.diStatusAbluftFeuchteMax := hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax;
		hmiIoTest.StatusIn.diStatusAbluftFeuchteMin := hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin;
		hmiIoTest.StatusIn.diStatusAbluftTempMax := hmiIoTest.StatusIn.diStatusTrockenluftTempMax;
		hmiIoTest.StatusIn.diStatusAbluftTempMin := hmiIoTest.StatusIn.diStatusTrockenluftTempMin;
		
		
		//Modul 02 Frischluft Temperatur ****************************************************************************
		IF (cmModul02.StatusInput01.1 = FALSE AND cmModul02.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (cmModul02.StatusInput01.1 = TRUE AND cmModul02.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 03 Frischluft rel. Feuchte ***************************************************************************
		IF (cmModul03.StatusInput01.1 = FALSE AND cmModul03.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin := FALSE;
		END_IF
		IF (cmModul03.StatusInput01.1 = TRUE AND cmModul03.StatusInput01.0 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Trockenluft Temperatur **************************************************************************
		IF (cmModul04.StatusInput01.1 = FALSE AND cmModul04.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul04.StatusInput01.1 = TRUE AND cmModul04.StatusInput01.0 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	:= FALSE;
		END_IF
					
		//Modul 05 Trockenluft rel. Feuchte ****************************************************************************
		IF (aiModul05.StatusInput01.1 = FALSE AND aiModul05.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.1 = TRUE AND aiModul05.StatusInput01.0 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 05 Kanaldruck ***************************************************************************
		IF (aiModul05.StatusInput01.3 = FALSE AND aiModul05.StatusInput01.2 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin := FALSE;
		END_IF
		IF (aiModul05.StatusInput01.3 = TRUE AND aiModul05.StatusInput01.2 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMax := FALSE;
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
		IF (aiModul05.StatusInput01.5 = FALSE AND aiModul05.StatusInput01.4 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((aiModul05.StatusInput01.5 = TRUE AND aiModul05.StatusInput01.4 = TRUE) OR aiModul05.ai03 >= 32767) THEN
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
	
	fbLascoFehl_0.FehlerIn	:= (loc_Erforderl_Mod1 AND NOT brModul01.ModulOk) OR (loc_Erforderl_Mod2 AND NOT cmModul02.ModulOk) OR 
	(loc_Erforderl_Mod3 AND NOT cmModul03.ModulOk) OR (loc_Erforderl_Mod4 AND NOT cmModul04.ModulOk) OR (loc_Erforderl_Mod5 AND NOT aiModul05.ModulOk);
	fbLascoFehl_0.VerzZeit	:= Betriebsparameter.Allgemein.VerzoegerungWarnungen;
	fbLascoFehl_0.Mode		:= 2;
	fbLascoFehl_0.Quit		:= hmiButtons.QuitFehler;
	fbLascoFehl_0.Tick		:= sekTick;
	fbLascoFehl_0();
	
	alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] := fbLascoFehl_0.FehlerOut;
	
	
END_PROGRAM
