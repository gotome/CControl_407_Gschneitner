
PROGRAM _INIT
	 
	hmiStatus.NameSteuerung	:= 1; //= LaTronic CControl 4.07 Plus
	
END_PROGRAM



PROGRAM _CYCLIC
	
	
	//Bei Konfiguration 4.07 Plus -> Text auf Login-Seite anpassen, Option Entfeuchter einschalten

	hmiParameter.Ausstattung.Entfeuchter := TRUE;
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
	//IO-Zuweisung LaTronic CControl 4.07 Plus
	//=========================================================================================================================================================

	
	//Kein Testbetrieb
	IF (gAktModus <> IOTEST) THEN
		
		
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************************************
		brModul01;
	
		//MODUL 02 - DIF371 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diNiederdruckOkModul1				:= diModul02.di01; 
		diHochdruckOkModul1					:= diModul02.di02;
		diKopftempKompressorModul1			:= diModul02.di03;
		diOeldruckKompressorModul1			:= diModul02.di04;
		diVollschutzKompressorModul1		:= diModul02.di05;
		diBetriebsmldgKompressorModul1		:= diModul02.di06;
		//Reserve							:= diModul02.di07;
		//Reserve							:= diModul02.di08;
		//Reserve							:= diModul02.di09;
		diBypassklappeOffen					:= diModul02.di10;
		diBypassklappeGeschl				:= diModul02.di11;
		diLeistungsvorgKompressorExtMod1	:= diModul02.di12;
		di24VDCinternIstOk					:= diModul02.di13;
		//Reserve							:= diModul02.di14;
		//Reserve							:= diModul02.di15;
		//Reserve							:= diModul02.di16;
		
		
		//MODUL 03 - DO8322 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		doModul03.do01			:= doTrocknungInBetrieb;
		doModul03.do02			:= doTrocknungStoerung;
		doModul03.do03			:= doKompressorEinModul1;
		doModul03.do04			:= doMagnetventilEinModul1;
		doModul03.do05			:= doOelsumpfheizungEinModul1;
		doModul03.do06			:= doBypassklappeOeffnen;
		doModul03.do07			:= FALSE; //Reserve
		doModul03.do08			:= FALSE; //Reserve

		
		//MODUL 04 - AI8321 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul04.ai05, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul04.ai06, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul04.ai07, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul04.ai08, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
		END_IF
		
		//Niederdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		aiNiederdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul1;
		
		//Hochdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		aiHochdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetHochdruckModul1;
		
		//Eintritt Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittTempMessberMax);
		aiEintrittTemperatur	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetEintrittTemp;
		
		//Eintritt rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);
		aiEintrittFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetEintrittFeuchte;
		
		//Austritt Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittTempMessberMax);
		aiAustrittTemperatur	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAustrittTemp;
		
		//Austritt rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);
		aiAustrittFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAustrittFeuchte;
		
		//Niederdruck Modul 2
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		aiNiederdruckModul2	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul2;
		
		//Hochdruck Modul 2
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		aiHochdruckModul2		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetHochdruckModul2;

		
		//MODUL 05 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diNiederdruckOkModul2			:= cmModul05.di01; 
		diHochdruckOkModul2				:= cmModul05.di02; 
		diBetriebsmldgKompressorModul2	:= cmModul05.di03; 
		//Reserve						:= cmModul05.di04; 

		cmModul05.do01					:= doKompressorEinModul2;
		cmModul05.do02					:= doMagnetventilEinModul2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Drehzahlvorgabe FU Kompressor Modul 1
		LCRLimScal_0(x := aoDrehzahlvorgKompressorModul1, x1 := 0.0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor1.DrehzahlMax, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diVollschutzKompressorModul2	:= cmModul06.di01;
		diOeldruckKompressorModul2		:= cmModul06.di02;
		diKopftempKompressorModul2		:= cmModul06.di03;
		//Reserve											:= cmModul06.di04;
		
		cmModul06.do01			:= doOelsumpfheizungEinModul2;
		cmModul06.do02			:= FALSE; //Reserve
		
		//Analogeingang
		//Reserve				:= cmModul06.ai01;
		
		//Drehzahlvorgabe FU Kompressor Modul 2
		LCRLimScal_0(x := aoDrehzahlvorgKompressorModul2, x1 := 0.0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor2.DrehzahlMax, y2 := 32767);
		cmModul06.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diVentilator1InBetrieb		:= cmModul07.di01; 
		diNotstromaggregatInBetrieb	:= cmModul07.di02; 
		//Reserve					:= cmModul07.di03; 
		//Reserve					:= cmModul07.di04; 

		cmModul07.do01				:= doVentilator1Ein;
		cmModul07.do02				:= doNotstromaggregatEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := aoDrehzahlvorgVentilator1, x1 := Betriebsparameter.Ventilator1.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator1.DrehzahlMax, y2 := 32767);
		cmModul07.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 08 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox1Offen		:= cmModul08.di01; 
		diBox1Geschl	:= cmModul08.di02; 
		diBox2Offen		:= cmModul08.di03; 
		diBox2Geschl	:= cmModul08.di04; 

		cmModul08.do01			:= doFreigabeBox1;
		cmModul08.do02			:= doFreigabeBox2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_10(enable := TRUE, x := cmModul08.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_10.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		
		//Temperaturvorgabe Warmluftofen
		LCRLimScal_0(x := aoTemperaturvorgWarmluftofen, x1 := 0, y1 := 0, 
		x2 := 100, y2 := 32767);
		cmModul08.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 09 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diVentilator2InBetrieb		:= cmModul09.di01; 
		diDrehzahlbegrVentilator1	:= cmModul09.di02; 
		diDrehzahlbegrVentilator2	:= cmModul09.di03; 
		//Reserve					:= cmModul09.di04; 

		cmModul09.do01				:= doVentilator2Ein; 
		cmModul09.do02				:= FALSE; //Reserve	

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_11(enable := TRUE, x := cmModul09.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_11.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := aoDrehzahlvorgVentilator2, x1 := Betriebsparameter.Ventilator2.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator2.DrehzahlMax, y2 := 32767);
		cmModul09.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diWarmluftofenInBetrieb			:= cmModul10.di01; 
		diScheitholzofenInBetrieb		:= cmModul10.di02; 
		//Reserve						:= cmModul10.di03; 
		//Reserve						:= cmModul10.di04; 

		cmModul10.do01					:= doWarmluftofenEin;
		cmModul10.do02					:= doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_12(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_12.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_0(x := aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul10.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox3Offen			:= cmModul11.di01; 
		diBox3Geschl		:= cmModul11.di02; 
		diBox4Offen			:= cmModul11.di03; 
		diBox4Geschl		:= cmModul11.di04; 

		cmModul11.do01		:= doFreigabeBox3;
		cmModul11.do02		:= doFreigabeBox4;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_13(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_13.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Analogausgang
		cmModul11.ao01				:= 0; //Reserve
		
		
		//MODUL 12 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diBox5Offen			:= cmModul12.di01; 
		diBox5Geschl		:= cmModul12.di02; 
		diBox6Offen			:= cmModul12.di03; 
		diBox6Geschl		:= cmModul12.di04; 

		cmModul12.do01		:= doFreigabeBox5;
		cmModul12.do02		:= doFreigabeBox6;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_14(enable := TRUE, x := cmModul12.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_14.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Analogausgang
		cmModul12.ao01				:= 0; //Reserve
		
		
		//MODUL 13 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diAbluftventInBetrieb	:= cmModul13.di01; 
		//Reserve				:= cmModul13.di02; 
		//Reserve				:= cmModul13.di03; 
		//Reserve				:= cmModul13.di04; 

		cmModul13.do01			:= doBrandschutzklappeAuf;
		cmModul13.do02			:= doAbluftventilatorEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_15(enable := TRUE, x := cmModul13.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_15.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
		aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Abluftventilator
		LCRLimScal_0(x := aoDrehzahlvorgAbluftventilator, x1 := Betriebsparameter.Abluftventilator.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Abluftventilator.DrehzahlMax, y2 := 32767);
		cmModul13.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 14 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diAbluftklappeOffen		:= cmModul14.di01; 
		diAbluftklappeGeschl	:= cmModul14.di02; 
		//Reserve				:= cmModul14.di03; 
		//Reserve				:= cmModul14.di04; 

		cmModul14.do01			:= doAbluftklappeFreigabe;
		cmModul14.do02			:= FALSE; //Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_16(enable := TRUE, x := cmModul14.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_16.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
		aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Analogausgang
		cmModul14.ao01				:= 0; //Reserve
		
		
		
		//MODUL 15 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		diUmschaltklappe1Offen		:= cmModul15.di01; 
		diUmschaltklappe1Geschl		:= cmModul15.di02; 
		diUmschaltklappe2Offen		:= cmModul15.di03; 
		diUmschaltklappe2Geschl		:= cmModul15.di04; 

		
		cmModul15.do01			:= doUmluftklappe1Freigabe;
		cmModul15.do02			:= doUmluftklappe2Freigabe;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_17(enable := TRUE, x := cmModul15.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_17.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul15.ao01				:= 0; //Reserve
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//Modul 04 Niederdruck Modul 1 ****************************************************************************
		IF (aiModul04.StatusInput01.1 = FALSE AND aiModul04.StatusInput01.0 = TRUE) THEN
			diStatusNiederdruckMinMod1	:= TRUE;
		ELSE
			diStatusNiederdruckMinMod1	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.1 = TRUE AND aiModul04.StatusInput01.0 = FALSE ) THEN
			diStatusNiederdruckMaxMod1	 := TRUE;
		ELSE
			diStatusNiederdruckMaxMod1	 := FALSE;
		END_IF
		
		//Modul 04 Hochdruck Modul 1 ***************************************************************************
		IF (aiModul04.StatusInput01.3 = FALSE AND aiModul04.StatusInput01.2 = TRUE) THEN
			diStatusHochdruckMinMod1 := TRUE;
		ELSE
			diStatusHochdruckMinMod1 := FALSE;
		END_IF
		IF (aiModul04.StatusInput01.3 = TRUE AND aiModul04.StatusInput01.2 = FALSE) THEN
			diStatusHochdruckMaxMod1 := TRUE;
		ELSE
			diStatusHochdruckMaxMod1 := FALSE;
		END_IF
		
		//Modul 04 Eintritt Temperatur **************************************************************************
		IF (aiModul04.StatusInput01.5 = FALSE AND aiModul04.StatusInput01.4 = TRUE) THEN
			diStatusEintrittTempMin	:= TRUE;
		ELSE
			diStatusEintrittTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.5 = TRUE AND aiModul04.StatusInput01.4 = FALSE) THEN
			diStatusEintrittTempMax	:= TRUE;
		ELSE
			diStatusEintrittTempMax	:= FALSE;
		END_IF
		
		//Modul 04 Eintritt Feuchte **************************************************************************
		IF (aiModul04.StatusInput01.7 = FALSE AND aiModul04.StatusInput01.6 = TRUE) THEN
			diStatusEintrittFeuchteMin	:= TRUE;
		ELSE
			diStatusEintrittFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.7 = TRUE AND aiModul04.StatusInput01.6 = FALSE) THEN
			diStatusEintrittFeuchteMax	:= TRUE;
		ELSE
			diStatusEintrittFeuchteMax	:= FALSE;
		END_IF
	
		//Modul 04 Austritt Temperatur ****************************************************************************
		IF (aiModul04.StatusInput02.1 = FALSE AND aiModul04.StatusInput02.0 = TRUE) THEN
			diStatusAustrittTempMin	:= TRUE;
		ELSE
			diStatusAustrittTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.1 = TRUE AND aiModul04.StatusInput02.0 = FALSE ) THEN
			diStatusAustrittTempMax	 := TRUE;
		ELSE
			diStatusAustrittTempMax	 := FALSE;
		END_IF
		
		//Modul 04 Austritt Feuchte ***************************************************************************
		IF (aiModul04.StatusInput02.3 = FALSE AND aiModul04.StatusInput02.2 = TRUE) THEN
			diStatusAustrittFeuchteMin := TRUE;
		ELSE
			diStatusAustrittFeuchteMin := FALSE;
		END_IF
		IF (aiModul04.StatusInput02.3 = TRUE AND aiModul04.StatusInput02.2 = FALSE) THEN
			diStatusAustrittFeuchteMax := TRUE;
		ELSE
			diStatusAustrittFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Niederdruck Modul 2 **************************************************************************
		IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
			diStatusNiederdruckMinMod2	:= TRUE;
		ELSE
			diStatusNiederdruckMinMod2	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
			diStatusNiederdruckMaxMod2	:= TRUE;
		ELSE
			diStatusNiederdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 04 Hochdruck Modul 2 **************************************************************************
		IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
			diStatusHochdruckMinMod2	:= TRUE;
		ELSE
			diStatusHochdruckMinMod2	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
			diStatusHochdruckMaxMod2	:= TRUE;
		ELSE
			diStatusHochdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 5 Luftgeschwindigkeit ****************************************************************************
		IF (cmModul05.StatusInput01.1 = FALSE AND cmModul05.StatusInput01.0 = TRUE) THEN
			diStatusLuftgeschwMin	:= TRUE;
		ELSE
			diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = FALSE ) THEN
			diStatusLuftgeschwMax	:= TRUE;
		ELSE
			diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = TRUE) OR cmModul05.ai01 >= 32767) THEN
			diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF 
		
		//Modul 07 Frischluft Temperatur ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftTempMin	:= TRUE;
		ELSE
			diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			diStatusFrischluftTempMax	 := TRUE;
		ELSE
			diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 08 Frischluft rel. Feuchte ****************************************************************************
		IF (cmModul08.StatusInput01.1 = FALSE AND cmModul08.StatusInput01.0 = TRUE) THEN
			diStatusFrischluftFeuchteMin	:= TRUE;
		ELSE
			diStatusFrischluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul08.StatusInput01.1 = TRUE AND cmModul08.StatusInput01.0 = FALSE ) THEN
			diStatusFrischluftFeuchteMax	 := TRUE;
		ELSE
			diStatusFrischluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 09 Trockenluft Temperatur ****************************************************************************
		IF (cmModul09.StatusInput01.1 = FALSE AND cmModul09.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul09.StatusInput01.1 = TRUE AND cmModul09.StatusInput01.0 = FALSE ) THEN
			diStatusTrockenluftTempMax	 := TRUE;
		ELSE
			diStatusTrockenluftTempMax	 := FALSE;
		END_IF
		
		//Modul 10 Trockenluft rel. Feuchte ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF

		//Modul 11 Abluft Temperatur ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			diStatusAbluftTempMin	:= TRUE;
		ELSE
			diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftTempMax	 := TRUE;
		ELSE
			diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 12 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul12.StatusInput01.1 = FALSE AND cmModul12.StatusInput01.0 = TRUE) THEN
			diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul12.StatusInput01.1 = TRUE AND cmModul12.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftFeuchteMax	 := TRUE;
		ELSE
			diStatusAbluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 13 Dachluft Temperatur ****************************************************************************
		IF (cmModul13.StatusInput01.1 = FALSE AND cmModul13.StatusInput01.0 = TRUE) THEN
			diStatusDachluftTempMin	:= TRUE;
		ELSE
			diStatusDachluftTempMin	:= FALSE;
		END_IF
		IF (cmModul13.StatusInput01.1 = TRUE AND cmModul13.StatusInput01.0 = FALSE ) THEN
			diStatusDachluftTempMax	 := TRUE;
		ELSE
			diStatusDachluftTempMax	 := FALSE;
		END_IF
			
		//Modul 14 Dachluft rel. Feuchte ****************************************************************************
		IF (cmModul14.StatusInput01.1 = FALSE AND cmModul14.StatusInput01.0 = TRUE) THEN
			diStatusDachluftFeuchteMin	:= TRUE;
		ELSE
			diStatusDachluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul14.StatusInput01.1 = TRUE AND cmModul14.StatusInput01.0 = FALSE ) THEN
			diStatusDachluftFeuchteMax	 := TRUE;
		ELSE
			diStatusDachluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 15 Differenzdruck ****************************************************************************
		IF (cmModul15.StatusInput01.1 = FALSE AND cmModul15.StatusInput01.0 = TRUE) THEN
			diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul15.StatusInput01.1 = TRUE AND cmModul15.StatusInput01.0 = FALSE ) THEN
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
	
	
		//MODUL 02 - DIF371 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diNiederdruckOkModul1				:= diModul02.di01; 
		hmiIoTest.DigitalIn.diHochdruckOkModul1					:= diModul02.di02;
		hmiIoTest.DigitalIn.diKopftempKompressorModul1			:= diModul02.di03;
		hmiIoTest.DigitalIn.diOeldruckKompressorModul1			:= diModul02.di04;
		hmiIoTest.DigitalIn.diVollschutzKompressorModul1		:= diModul02.di05;
		hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul1		:= diModul02.di06;
		//Reserve												:= diModul02.di07;
		//Reserve												:= diModul02.di08;
		//Reserve												:= diModul02.di09;
		hmiIoTest.DigitalIn.diBypassklappeOffen					:= diModul02.di10;
		hmiIoTest.DigitalIn.diBypassklappeGeschl				:= diModul02.di11;
		hmiIoTest.DigitalIn.diLeistungsvorgKompressorExtMod1	:= diModul02.di12;
		hmiIoTest.DigitalIn.di24VDCinternIstOk					:= diModul02.di13;
		//Reserve												:= diModul02.di14;
		//Reserve												:= diModul02.di15;
		//Reserve												:= diModul02.di16;
		
		
		//MODUL 03 - DO8322 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		doModul03.do01			:= hmiIoTest.DigitalOut.doTrocknungInBetrieb;
		doModul03.do02			:= hmiIoTest.DigitalOut.doTrocknungStoerung;
		doModul03.do03			:= hmiIoTest.DigitalOut.doKompressorEinModul1;
		doModul03.do04			:= hmiIoTest.DigitalOut.doMagnetventilEinModul1;
		doModul03.do05			:= hmiIoTest.DigitalOut.doOelsumpfheizungEinModul1;
		doModul03.do06			:= hmiIoTest.DigitalOut.doBypassklappeOeffnen;
		doModul03.do07			:= FALSE; //Reserve
		doModul03.do08			:= FALSE; //Reserve

		
		//MODUL 04 - AI8321 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul04.ai05, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul04.ai06, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul04.ai07, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul04.ai08, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
		END_IF
		
		//Niederdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		hmiIoTest.AnalogIn.aiNiederdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul1;
		
		//Hochdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		hmiIoTest.AnalogIn.aiHochdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetHochdruckModul1;
		
		//Eintritt Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittTempMessberMax);
		hmiIoTest.AnalogIn.aiEintrittTemperatur	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetEintrittTemp;
		
		//Eintritt rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiEintrittFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetEintrittFeuchte;
		
		//Austritt Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittTempMessberMax);
		hmiIoTest.AnalogIn.aiAustrittTemperatur	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAustrittTemp;
		
		//Austritt rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAustrittFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAustrittFeuchte;
		
		//Niederdruck Modul 2
		LCRLimScal_0(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		hmiIoTest.AnalogIn.aiNiederdruckModul2	:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul2;
		
		//Hochdruck Modul 2
		LCRLimScal_0(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		hmiIoTest.AnalogIn.aiHochdruckModul2		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetHochdruckModul2;

		
		//MODUL 05 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diNiederdruckOkModul2			:= cmModul05.di01; 
		hmiIoTest.DigitalIn.diHochdruckOkModul2				:= cmModul05.di02; 
		hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul2	:= cmModul05.di03; 
		//Reserve											:= cmModul05.di04; 

		cmModul05.do01					:= hmiIoTest.DigitalOut.doKompressorEinModul2;
		cmModul05.do02					:= hmiIoTest.DigitalOut.doMagnetventilEinModul2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_0(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		hmiIoTest.AnalogIn.aiLuftgeschwindigkeit		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Drehzahlvorgabe FU Kompressor Modul 1
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1, x1 := 0.0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor1.DrehzahlMax, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diVollschutzKompressorModul2	:= cmModul06.di01;
		hmiIoTest.DigitalIn.diOeldruckKompressorModul2		:= cmModul06.di02;
		hmiIoTest.DigitalIn.diKopftempKompressorModul2		:= cmModul06.di03;
		//Reserve											:= cmModul06.di04;
		
		cmModul06.do01			:= hmiIoTest.DigitalOut.doOelsumpfheizungEinModul2;
		cmModul06.do02			:= FALSE; //Reserve
		
		
		//Analogeingang
		//Reserve				:= cmModul06.ai01;
		
		//Drehzahlvorgabe FU Kompressor Modul 2
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2, x1 := 0.0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor2.DrehzahlMax, y2 := 32767);
		cmModul06.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diVentilator1InBetrieb		:= cmModul07.di01; 
		hmiIoTest.DigitalIn.diNotstromaggregatInBetrieb	:= cmModul07.di02; 
		//Reserve										:= cmModul07.di03; 
		//Reserve										:= cmModul07.di04; 

		cmModul07.do01				:= hmiIoTest.DigitalOut.doVentilator1Ein;
		cmModul07.do02				:= hmiIoTest.DigitalOut.doNotstromaggregatEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
		//Drehzahlvorgabe Ventilator 1
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1, x1 := Betriebsparameter.Ventilator1.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator1.DrehzahlMax, y2 := 32767);
		cmModul07.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 08 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox1Offen		:= cmModul08.di01; 
		hmiIoTest.DigitalIn.diBox1Geschl	:= cmModul08.di02; 
		hmiIoTest.DigitalIn.diBox2Offen		:= cmModul08.di03; 
		hmiIoTest.DigitalIn.diBox2Geschl	:= cmModul08.di04; 

		cmModul08.do01			:= hmiIoTest.DigitalOut.doFreigabeBox1;
		cmModul08.do02			:= hmiIoTest.DigitalOut.doFreigabeBox2;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_10(enable := TRUE, x := cmModul08.ai01, base := Betriebsparameter.Sensoren.FilterzeitFrischluft);
		END_IF
		
		//Frischluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_10.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiFrischluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		
		//Temperaturvorgabe Warmluftofen
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoTemperaturvorgWarmluftofen, x1 := 0, y1 := 0, 
		x2 := 100, y2 := 32767);
		cmModul08.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 09 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diVentilator2InBetrieb		:= cmModul09.di01; 
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1	:= cmModul09.di02; 
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator2	:= cmModul09.di03; 
		//Reserve										:= cmModul09.di04; 

		cmModul09.do01				:= hmiIoTest.DigitalOut.doVentilator2Ein; 
		cmModul09.do02				:= FALSE; //Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_11(enable := TRUE, x := cmModul09.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_11.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlTempMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftTemp;
		
		//Drehzahlvorgabe Ventilator 2
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator2, x1 := Betriebsparameter.Ventilator2.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Ventilator2.DrehzahlMax, y2 := 32767);
		cmModul09.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diWarmluftofenInBetrieb			:= cmModul10.di01; 
		hmiIoTest.DigitalIn.diScheitholzofenInBetrieb		:= cmModul10.di02; 
		//Reserve											:= cmModul10.di03; 
		//Reserve											:= cmModul10.di04; 

		cmModul10.do01					:= hmiIoTest.DigitalOut.doWarmluftofenEin;
		cmModul10.do02					:= hmiIoTest.DigitalOut.doHeizregisterEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_12(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitTrockenluft);
		END_IF
		
		//Trockenluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_12.y, x1 := 0, y1 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.TrockenlFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiTrockenluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetTrockenluftFeuchte;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul10.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox3Offen			:= cmModul11.di01; 
		hmiIoTest.DigitalIn.diBox3Geschl		:= cmModul11.di02; 
		hmiIoTest.DigitalIn.diBox4Offen			:= cmModul11.di03; 
		hmiIoTest.DigitalIn.diBox4Geschl		:= cmModul11.di04; 

		cmModul11.do01		:= hmiIoTest.DigitalOut.doFreigabeBox3;
		cmModul11.do02		:= hmiIoTest.DigitalOut.doFreigabeBox4;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_13(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_13.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		hmiIoTest.AnalogIn.aiAbluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Analogausgang
		cmModul11.ao01				:= 0; //Reserve
		
		
		//MODUL 12 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diBox5Offen			:= cmModul12.di01; 
		hmiIoTest.DigitalIn.diBox5Geschl		:= cmModul12.di02; 
		hmiIoTest.DigitalIn.diBox6Offen			:= cmModul12.di03; 
		hmiIoTest.DigitalIn.diBox6Geschl		:= cmModul12.di04; 

		cmModul12.do01		:= hmiIoTest.DigitalOut.doFreigabeBox5;
		cmModul12.do02		:= hmiIoTest.DigitalOut.doFreigabeBox6;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_14(enable := TRUE, x := cmModul12.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_14.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAbluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Analogausgang
		cmModul12.ao01				:= 0; //Reserve
		
		
		//MODUL 13 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diAbluftventInBetrieb	:= cmModul13.di01; 
		//Reserve									:= cmModul13.di02; 
		//Reserve									:= cmModul13.di03; 
		//Reserve									:= cmModul13.di04; 

		cmModul13.do01			:= hmiIoTest.DigitalOut.doBrandschutzklappeAuf;
		cmModul13.do02			:= hmiIoTest.DigitalOut.doAbluftventilatorEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_15(enable := TRUE, x := cmModul13.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft Temperatur
		LCRLimScal_0(x := LCRMovAvgFlt_15.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
		hmiIoTest.AnalogIn.aiDachluftTemperatur		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
		//Drehzahlvorgabe Abluftventilator
		LCRLimScal_0(x := hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator, x1 := Betriebsparameter.Abluftventilator.DrehzahlMin, y1 := 0, 
		x2 := Betriebsparameter.Abluftventilator.DrehzahlMax, y2 := 32767);
		cmModul13.ao01				:= REAL_TO_INT(LCRLimScal_0.y);
		
		
		//MODUL 14 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diAbluftklappeOffen		:= cmModul14.di01; 
		hmiIoTest.DigitalIn.diAbluftklappeGeschl	:= cmModul14.di02; 
		//Reserve									:= cmModul14.di03; 
		//Reserve									:= cmModul14.di04; 

		cmModul14.do01			:= hmiIoTest.DigitalOut.doAbluftklappeFreigabe;
		cmModul14.do02			:= FALSE; //Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_16(enable := TRUE, x := cmModul14.ai01, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Dachluft rel. Feuchte
		LCRLimScal_0(x := LCRMovAvgFlt_16.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiDachluftFeuchte		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		
		//Analogausgang
		cmModul14.ao01				:= 0; //Reserve
		
		
		
		//MODUL 15 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		hmiIoTest.DigitalIn.diUmschaltklappe1Offen		:= cmModul15.di01; 
		hmiIoTest.DigitalIn.diUmschaltklappe1Geschl		:= cmModul15.di02; 
		hmiIoTest.DigitalIn.diUmschaltklappe2Offen		:= cmModul15.di03; 
		hmiIoTest.DigitalIn.diUmschaltklappe2Geschl		:= cmModul15.di04; 

		cmModul15.do01			:= hmiIoTest.DigitalOut.doUmluftklappe1Freigabe;
		cmModul15.do02			:= hmiIoTest.DigitalOut.doUmluftklappe2Freigabe;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_17(enable := TRUE, x := cmModul15.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Kanaldruck
		LCRLimScal_0(x := LCRMovAvgFlt_17.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		hmiIoTest.AnalogIn.aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul15.ao01				:= 0; //Reserve
		
		
		
		//Modulstatus - Auswertung **********************************************************************************************************************************
		//***********************************************************************************************************************************************************
		
		//Modul 04 Niederdruck Modul 1 ****************************************************************************
		IF (aiModul04.StatusInput01.1 = FALSE AND aiModul04.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod1	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod1	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.1 = TRUE AND aiModul04.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod1	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod1	 := FALSE;
		END_IF
		
		//Modul 04 Hochdruck Modul 1 ***************************************************************************
		IF (aiModul04.StatusInput01.3 = FALSE AND aiModul04.StatusInput01.2 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMinMod1 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMinMod1 := FALSE;
		END_IF
		IF (aiModul04.StatusInput01.3 = TRUE AND aiModul04.StatusInput01.2 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod1 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod1 := FALSE;
		END_IF
		
		//Modul 04 Eintritt Temperatur **************************************************************************
		IF (aiModul04.StatusInput01.5 = FALSE AND aiModul04.StatusInput01.4 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusEintrittTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusEintrittTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.5 = TRUE AND aiModul04.StatusInput01.4 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusEintrittTempMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusEintrittTempMax	:= FALSE;
		END_IF
		
		//Modul 04 Eintritt Feuchte **************************************************************************
		IF (aiModul04.StatusInput01.7 = FALSE AND aiModul04.StatusInput01.6 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusEintrittFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusEintrittFeuchteMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput01.7 = TRUE AND aiModul04.StatusInput01.6 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusEintrittFeuchteMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusEintrittFeuchteMax	:= FALSE;
		END_IF
	
		//Modul 04 Austritt Temperatur ****************************************************************************
		IF (aiModul04.StatusInput02.1 = FALSE AND aiModul04.StatusInput02.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAustrittTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAustrittTempMin	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.1 = TRUE AND aiModul04.StatusInput02.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAustrittTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAustrittTempMax	 := FALSE;
		END_IF
		
		//Modul 04 Austritt Feuchte ***************************************************************************
		IF (aiModul04.StatusInput02.3 = FALSE AND aiModul04.StatusInput02.2 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAustrittFeuchteMin := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAustrittFeuchteMin := FALSE;
		END_IF
		IF (aiModul04.StatusInput02.3 = TRUE AND aiModul04.StatusInput02.2 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusAustrittFeuchteMax := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAustrittFeuchteMax := FALSE;
		END_IF
		
		//Modul 04 Niederdruck Modul 2 **************************************************************************
		IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod2	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 04 Hochdruck Modul 2 **************************************************************************
		IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMinMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMinMod2	:= FALSE;
		END_IF
		IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 5 Luftgeschwindigkeit ****************************************************************************
		IF (cmModul05.StatusInput01.1 = FALSE AND cmModul05.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMin	:= FALSE;
		END_IF
		IF (cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwMax	 := FALSE;
		END_IF
		IF ((cmModul05.StatusInput01.1 = TRUE AND cmModul05.StatusInput01.0 = TRUE) OR cmModul05.ai01 >= 32767) THEN
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusLuftgeschwDrahtbruch := FALSE;
		END_IF 
		
		//Modul 07 Frischluft Temperatur ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftTempMax	 := FALSE;
		END_IF
		
		//Modul 08 Frischluft rel. Feuchte ****************************************************************************
		IF (cmModul08.StatusInput01.1 = FALSE AND cmModul08.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul08.StatusInput01.1 = TRUE AND cmModul08.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 09 Trockenluft Temperatur ****************************************************************************
		IF (cmModul09.StatusInput01.1 = FALSE AND cmModul09.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMin	:= FALSE;
		END_IF
		IF (cmModul09.StatusInput01.1 = TRUE AND cmModul09.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftTempMax	 := FALSE;
		END_IF
		
		//Modul 10 Trockenluft rel. Feuchte ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusTrockenluftFeuchteMax	 := FALSE;
		END_IF

		//Modul 11 Abluft Temperatur ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMax	 := FALSE;
		END_IF
		
		//Modul 12 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul12.StatusInput01.1 = FALSE AND cmModul12.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul12.StatusInput01.1 = TRUE AND cmModul12.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 13 Dachluft Temperatur ****************************************************************************
		IF (cmModul13.StatusInput01.1 = FALSE AND cmModul13.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDachluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftTempMin	:= FALSE;
		END_IF
		IF (cmModul13.StatusInput01.1 = TRUE AND cmModul13.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusDachluftTempMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftTempMax	 := FALSE;
		END_IF
			
		//Modul 14 Dachluft rel. Feuchte ****************************************************************************
		IF (cmModul14.StatusInput01.1 = FALSE AND cmModul14.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul14.StatusInput01.1 = TRUE AND cmModul14.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	 := TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	 := FALSE;
		END_IF
		
		//Modul 15 Differenzdruck ****************************************************************************
		IF (cmModul15.StatusInput01.1 = FALSE AND cmModul15.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul15.StatusInput01.1 = TRUE AND cmModul15.StatusInput01.0 = FALSE ) THEN
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
	loc_Erforderl_Mod3	:= TRUE;
	loc_Erforderl_Mod4	:= TRUE;
	loc_Erforderl_Mod5	:= TRUE;
	loc_Erforderl_Mod6	:= gModul2Vorhanden;
	loc_Erforderl_Mod7	:= TRUE;
	loc_Erforderl_Mod8	:= Aktoren.VentUndKlappen.Boxenklappe1Vorhanden OR Aktoren.VentUndKlappen.Boxenklappe2Vorhanden OR 
	Betriebsparameter.Ausstattung.SensorFrischluft OR Betriebsparameter.Ausstattung.WarmluftofenTempVorgabe;
	loc_Erforderl_Mod9	:= Betriebsparameter.Ausstattung.Ventilator2 OR Betriebsparameter.Ausstattung.SensorTrockenluft;
	loc_Erforderl_Mod10	:= Betriebsparameter.Ausstattung.Warmluftofen OR Betriebsparameter.Ausstattung.Scheitholzofen OR 
	Betriebsparameter.Ausstattung.Heizregister OR Betriebsparameter.Ausstattung.SensorTrockenluft;
	loc_Erforderl_Mod11	:= Aktoren.VentUndKlappen.Boxenklappe3Vorhanden OR Aktoren.VentUndKlappen.Boxenklappe4Vorhanden OR
	Betriebsparameter.Ausstattung.SensorAbluft;
	loc_Erforderl_Mod12	:= Betriebsparameter.Ausstattung.SensorAbluft;
	loc_Erforderl_Mod13	:= Betriebsparameter.Ausstattung.Abluftventilator OR Betriebsparameter.Ausstattung.Brandschutzklappe OR
	Betriebsparameter.Ausstattung.SensorDachluft;
	loc_Erforderl_Mod14	:= Betriebsparameter.Ausstattung.Abluftklappe OR Betriebsparameter.Ausstattung.SensorDachluft;
	loc_Erforderl_Mod15	:= Betriebsparameter.Ausstattung.Umschaltklappe1 OR Betriebsparameter.Ausstattung.Umschaltklappe2 OR Betriebsparameter.Ausstattung.SensorKanaldruck;
	loc_Erforderl_Mod16	:= Betriebsparameter.Ausstattung.Energiemessung;
	
	fbLascoFehl_0.FehlerIn	:= (loc_Erforderl_Mod1 AND NOT brModul01.ModulOk) OR (loc_Erforderl_Mod2 AND NOT diModul02.ModulOk) OR 
	(loc_Erforderl_Mod3 AND NOT doModul03.ModulOk) OR (loc_Erforderl_Mod4 AND NOT aiModul04.ModulOk) OR (loc_Erforderl_Mod5 AND NOT cmModul05.ModulOk) OR
	(loc_Erforderl_Mod6 AND NOT cmModul06.ModulOk) OR (loc_Erforderl_Mod7 AND NOT cmModul07.ModulOk) OR (loc_Erforderl_Mod8 AND NOT cmModul08.ModulOk) OR
	(loc_Erforderl_Mod9 AND NOT cmModul09.ModulOk) OR (loc_Erforderl_Mod10 AND NOT cmModul10.ModulOk) OR (loc_Erforderl_Mod11 AND NOT cmModul11.ModulOk) OR
	(loc_Erforderl_Mod12 AND NOT cmModul12.ModulOk) OR (loc_Erforderl_Mod13 AND NOT cmModul13.ModulOk) OR (loc_Erforderl_Mod14 AND NOT cmModul14.ModulOk) OR
	(loc_Erforderl_Mod15 AND NOT cmModul15.ModulOk) OR (loc_Erforderl_Mod16 AND NOT gEnergiemessungModulOk);
	fbLascoFehl_0.VerzZeit	:= Betriebsparameter.Allgemein.VerzoegerungWarnungen;
	fbLascoFehl_0.Mode		:= 2;
	fbLascoFehl_0.Quit		:= hmiButtons.QuitFehler;
	fbLascoFehl_0.Tick		:= sekTick;
	fbLascoFehl_0();
	
	alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] := fbLascoFehl_0.FehlerOut;
	
	
END_PROGRAM
