
PROGRAM _INIT
	
	hmiStatus.NameSteuerung	:= 2; //= LaTronic CControl 3.07
	
END_PROGRAM



PROGRAM _CYCLIC
	 
	//Zeitticks generieren
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	//Bei Konfiguration 3.07 -> Text auf Login-Seite anpassen, Nicht verfügbare Optionen ausschalten, Entfeuchter einschalten
	hmiParameter.Ausstattung.Entfeuchter := TRUE;
	hmiParameter.Ausstattung.Box4 := FALSE;
	hmiParameter.Ausstattung.Box5 := FALSE;
	hmiParameter.Ausstattung.Box6 := FALSE;
	hmiParameter.Ausstattung.LuftmngReglerFrischlVent2 := FALSE;
	hmiParameter.Ausstattung.LuftmngReglerUmluftVent2 := FALSE;
	hmiParameter.Ausstattung.SensorTrockenluft := FALSE;
	hmiParameter.Ausstattung.Ventilator2 := FALSE;
	hmiParameter.Ausstattung.WarmluftofenTempVorgabe := FALSE;
	hmiParameter.Ausstattung.HeizregisterDrehzahlvorgabe := FALSE;
	
	IF hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.Ausstattung.SensorDachluft := FALSE;
	ELSIF hmiParameter.Ausstattung.SensorDachluft THEN
		hmiParameter.Ausstattung.SensorFrischluft := FALSE;
	END_IF
	
	IF hmiParameter.Ausstattung.Abluftklappe THEN
		hmiParameter.Ausstattung.Abluftventilator := FALSE;
	ELSIF hmiParameter.Ausstattung.Abluftventilator THEN
		hmiParameter.Ausstattung.Abluftklappe := FALSE;
	END_IF
	
	
	
	//Kein Testbetrieb
	IF (gAktModus <> IOTEST) THEN
		
		
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************
		brModul01;
	
		//MODUL 02 - DIF371 ***********************************************************************************************************
		diNiederdruckOkModul1				:= diModul02.di01;
		diHochdruckOkModul1					:= diModul02.di02;
		diBox1Offen							:= diModul02.di03;
		diBox1Geschl						:= diModul02.di04;
		diKopftempKompressorModul1			:= diModul02.di05;
		diOeldruckKompressorModul1			:= diModul02.di06;
		diVollschutzKompressorModul1		:= diModul02.di07;
		diScheitholzofenInBetrieb			:= diModul02.di08;
		diBetriebsmldgKompressorModul1		:= diModul02.di09;
		//Reserve							:= diModul02.di10;
		diVentilator1InBetrieb				:= diModul02.di11;
		diWarmluftofenInBetrieb				:= diModul02.di12;
		diLeistungsvorgKompressorExtMod1	:= diModul02.di13;
		diBypassklappeOffen					:= diModul02.di14;
		diBypassklappeGeschl				:= diModul02.di15;
		di24VDCinternIstOk					:= diModul02.di16;
		
		//MODUL 03 - DO9322 ***********************************************************************************************************
		doModul03.do01						:= doTrocknungInBetrieb;
		doModul03.do02						:= doTrocknungStoerung;
		doModul03.do03						:= doHeizregisterEin;
		doModul03.do04						:= doKompressorEinModul1;
		doModul03.do05						:= doMagnetventilEinModul1;
		doModul03.do06						:= doOelsumpfheizungEinModul1; 		
		doModul03.do07						:= doVentilator1Ein; 			
		doModul03.do08						:= doBypassklappeOeffnen; 
		doModul03.do09						:= doWarmluftofenEin;
		doModul03.do10						:= doUmluftklappe1Freigabe;
		doModul03.do11						:= doBrandschutzklappeAuf;
		doModul03.do12						:= doFreigabeBox1;
		
		//MODUL 04 - AI8321 ***********************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul04.ai05, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul04.ai06, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul04.ai07, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul04.ai08, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Niederdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		aiNiederdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul1;
		
		//Hochdruck Modul 1
		LCRLimScal_1(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		aiHochdruckModul1		:= LCRLimScal_1.y + Betriebsparameter.Sensoren.OffsetHochdruckModul1;
		
		//Eintritt Temperatur
		LCRLimScal_2(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittTempMessberMax);
		aiEintrittTemperatur	:= LCRLimScal_2.y + Betriebsparameter.Sensoren.OffsetEintrittTemp;
		
		//Eintritt rel. Feuchte
		LCRLimScal_3(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);
		aiEintrittFeuchte		:= LCRLimScal_3.y + Betriebsparameter.Sensoren.OffsetEintrittFeuchte;
		
		//Austritt Temperatur
		LCRLimScal_4(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittTempMessberMax);
		aiAustrittTemperatur	:= LCRLimScal_4.y + Betriebsparameter.Sensoren.OffsetAustrittTemp;
		
		//Austritt rel. Feuchte
		LCRLimScal_5(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);
		aiAustrittFeuchte		:= LCRLimScal_5.y + Betriebsparameter.Sensoren.OffsetAustrittFeuchte;
		
		//Je nach Ausstattung Frischluft- oder Dachluftfühler
		IF Betriebsparameter.Ausstattung.SensorDachluft THEN
			//Dachluft Temperatur
			LCRLimScal_6(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
			aiDachluftTemperatur	:= LCRLimScal_6.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
			//Dachluft rel. Feuchte
			LCRLimScal_7(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
			aiDachluftFeuchte		:= LCRLimScal_7.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		ELSE
			//Frischluft Temperatur
			LCRLimScal_6(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
			aiFrischluftTemperatur	:= LCRLimScal_6.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
			//Frischluft rel. Feuchte
			LCRLimScal_7(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
			aiFrischluftFeuchte		:= LCRLimScal_7.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		END_IF
		
		
		//MODUL 05 - CM8281 ***********************************************************************************************************
		diUmschaltklappe1Offen	:= cmModul05.di01; 
		diUmschaltklappe2Offen	:= cmModul05.di02;
		diUmschaltklappe1Geschl	:= cmModul05.di03;
		diUmschaltklappe2Geschl	:= cmModul05.di04; 

		cmModul05.do01	:= doUmluftklappe2Freigabe; 
		cmModul05.do02	:= doNotstromaggregatEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_8(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		aiLuftgeschwindigkeit		:= LCRLimScal_8.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Drehzahlvorgabe FU Kompressor Modul 1
		LCRLimScal_9(x := aoDrehzahlvorgKompressorModul1, x1 := 0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor1.DrehzahlMax, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_9.y);
		
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************
		diBox2Offen				:= cmModul06.di01;
		diBox3Offen				:= cmModul06.di02;
		diBox2Geschl			:= cmModul06.di03;
		diBox3Geschl			:= cmModul06.di04;
		
		cmModul06.do01			:= doFreigabeBox2;
		cmModul06.do02			:= doFreigabeBox3;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_12(enable := TRUE, x := cmModul06.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_16(x := LCRMovAvgFlt_12.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		aiAbluftTemperatur	:= LCRLimScal_16.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 1
		LCRLimScal_10(x := aoDrehzahlvorgVentilator1, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul06.ao01			:= REAL_TO_INT(LCRLimScal_10.y);
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************
		diAbluftklappeOffen			:= cmModul07.di01;
		diAbluftklappeGeschl		:= cmModul07.di02;
		diAbluftventInBetrieb		:= cmModul07.di03;
		diNotstromaggregatInBetrieb	:= cmModul07.di04;
		
		
		cmModul07.do01			:= doAbluftklappeFreigabe OR doAbluftventilatorEin;
		cmModul07.do02			:= FALSE;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF

		//Abluft rel. Feuchte
		LCRLimScal_11(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		aiAbluftFeuchte		:= LCRLimScal_11.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Drehzahlvorgabe FU Abluftventilator
		LCRLimScal_12(x := aoDrehzahlvorgAbluftventilator, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul07.ao01			:= REAL_TO_INT(LCRLimScal_12.y);
		

		
		//MODUL 08 - AT2222 ***********************************************************************************************************

		(*	//Öltemperatur Kompressor Modul 1 PT100 (Eingang wird zuerst in REAL umgewandelt, damit die Nachkommastelle erhalten bleibt)
		loc_OeltempModul01			:= INT_TO_REAL(atModul08.at01 / 10);
		tcOeltempKompressorModul1	:= (loc_OeltempModul01) + Betriebsparameter.Sensoren.OffsetOeltempKompressorModul1;
		
		//Öltemperatur Kompressor Modul 2 PT100 (Eingang wird zuerst in REAL umgewandelt, damit die Nachkommastelle erhalten bleibt)
		loc_OeltempModul02			:= INT_TO_REAL(atModul08.at02 / 10);
		tcOeltempKompressorModul2	:= (loc_OeltempModul02) + Betriebsparameter.Sensoren.OffsetOeltempKompressorModul2;
		*)
		
		//Modul 9 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.
		
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************
		diBetriebsmldgKompressorModul2	:= cmModul10.di01;
		diDrehzahlbegrVentilator1		:= cmModul10.di02;
		diNiederdruckOkModul2			:= cmModul10.di03;
		diHochdruckOkModul2				:= cmModul10.di04;
		
		
		cmModul10.do01					:= doKompressorEinModul2;
		cmModul10.do02					:= FALSE;	//Reserve
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_10(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
		END_IF
		
		//Niederdruck Kompressor Modul 2
		LCRLimScal_13(x := LCRMovAvgFlt_10.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		aiNiederdruckModul2		:= LCRLimScal_13.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul2;
		
		//Drehzahlvorgabe FU Kompressor Modul 2
		LCRLimScal_14(x := aoDrehzahlvorgKompressorModul2, x1 := 0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor2.DrehzahlMax, y2 := 32767);
		cmModul10.ao01			:= REAL_TO_INT(LCRLimScal_14.y);
		
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************
		diOeldruckKompressorModul2		:= cmModul11.di01;
		diVollschutzKompressorModul2	:= cmModul11.di02;
		diKopftempKompressorModul2		:= cmModul11.di03;
		//Reserve						:= cmModul11.di04;
		
			
		cmModul11.do01					:= doOelsumpfheizungEinModul2;
		cmModul11.do02					:= doMagnetventilEinModul2;	
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_11(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
		END_IF
		
		//Hochdruck Kompressor Modul 2
		LCRLimScal_15(x := LCRMovAvgFlt_11.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		aiHochdruckModul2		:= LCRLimScal_15.y + Betriebsparameter.Sensoren.OffsetHochdruckModul2;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_17(x := aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul11.ao01				:= REAL_TO_INT(LCRLimScal_17.y);
		
		
				
		//MODUL 12 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Reserve						:= cmModul12.di01; 
		//Reserve						:= cmModul12.di02; 
		//Reserve						:= cmModul12.di03; 
		//Reserve						:= cmModul12.di04; 

		cmModul12.do01					:= FALSE;	//Reserve
		cmModul12.do02					:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_13(enable := TRUE, x := cmModul12.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Differenzdruck
		LCRLimScal_0(x := LCRMovAvgFlt_13.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul12.ao01				:= 0;	//Reserve
		
		
		
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
		IF Betriebsparameter.Ausstattung.SensorDachluft THEN
			//Modul 04 Dachluft Temperatur **************************************************************************
			IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
				diStatusDachluftTempMin	:= TRUE;
			ELSE
				diStatusDachluftTempMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
				diStatusDachluftTempMax	:= TRUE;
			ELSE
				diStatusDachluftTempMax	:= FALSE;
			END_IF
		
			//Modul 04 Dachluft Feuchte **************************************************************************
			IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
				diStatusDachluftFeuchteMin	:= TRUE;
			ELSE
				diStatusDachluftFeuchteMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
				diStatusDachluftFeuchteMax	:= TRUE;
			ELSE
				diStatusDachluftFeuchteMax	:= FALSE;
			END_IF
		ELSE
			//Modul 04 Frischluft Temperatur **************************************************************************
			IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
				diStatusFrischluftTempMin	:= TRUE;
			ELSE
				diStatusFrischluftTempMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
				diStatusFrischluftTempMax	:= TRUE;
			ELSE
				diStatusFrischluftTempMax	:= FALSE;
			END_IF
		
			//Modul 04 Frischluft Feuchte **************************************************************************
			IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
				diStatusFrischluftFeuchteMin	:= TRUE;
			ELSE
				diStatusFrischluftFeuchteMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
				diStatusFrischluftFeuchteMax	:= TRUE;
			ELSE
				diStatusFrischluftFeuchteMax	:= FALSE;
			END_IF
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
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
		
		//Modul 06 Abluft Temperatur ****************************************************************************
		IF (cmModul06.StatusInput01.1 = FALSE AND cmModul06.StatusInput01.0 = TRUE) THEN
			diStatusAbluftTempMin	:= TRUE;
		ELSE
			diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul06.StatusInput01.1 = TRUE AND cmModul06.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftTempMax	:= TRUE;
		ELSE
			diStatusAbluftTempMax	:= FALSE;
		END_IF
		
		//Modul 07 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			diStatusAbluftFeuchteMax	:= TRUE;
		ELSE
			diStatusAbluftFeuchteMax	:= FALSE;
		END_IF
		
(*		//Modul 08 Öltemperatur Kompressor Modul 1 ****************************************************************************
		IF (atModul08.StatusInput01.1 = FALSE AND atModul08.StatusInput01.0 = TRUE) THEN
			diStatusOeltempMinMod1	:= TRUE;
		ELSE
			diStatusOeltempMinMod1	:= FALSE;
		END_IF
		IF (atModul08.StatusInput01.1 = TRUE AND atModul08.StatusInput01.0 = FALSE ) THEN
			diStatusOeltempMaxMod1	:= TRUE;
		ELSE
			diStatusOeltempMaxMod1	:= FALSE;
		END_IF
		
		//Modul 08 Öltemperatur Kompressor Modul 2 ***************************************************************************
		IF (atModul08.StatusInput01.3 = FALSE AND atModul08.StatusInput01.2 = TRUE) THEN
			diStatusOeltempMinMod2 := TRUE;
		ELSE
			diStatusOeltempMinMod2 := FALSE;
		END_IF
		IF (atModul08.StatusInput01.3 = TRUE AND atModul08.StatusInput01.2 = FALSE) THEN
			diStatusOeltempMaxMod2 := TRUE;
		ELSE
			diStatusOeltempMaxMod2 := FALSE;
		END_IF*)

		//Modul 10 Niederdruck Kompressor Modul 2 ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			diStatusNiederdruckMinMod2	:= TRUE;
		ELSE
			diStatusNiederdruckMinMod2	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			diStatusNiederdruckMaxMod2	:= TRUE;
		ELSE
			diStatusNiederdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 11 Hochdruck Kompressor Modul 2 ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			diStatusHochdruckMinMod2	:= TRUE;
		ELSE
			diStatusHochdruckMinMod2	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			diStatusHochdruckMaxMod2	:= TRUE;
		ELSE
			diStatusHochdruckMaxMod2	:= FALSE;
		END_IF	
		
		//Modul 12 Differenzdruck ****************************************************************************
		IF (cmModul12.StatusInput01.1 = FALSE AND cmModul12.StatusInput01.0 = TRUE) THEN
			diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul12.StatusInput01.1 = TRUE AND cmModul12.StatusInput01.0 = FALSE ) THEN
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
		
			
		//MODUL 01 - BR7300 Busempfänger **********************************************************************************************
	
	
		//MODUL 02 - DIF371 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diNiederdruckOkModul1				:= diModul02.di01;
		hmiIoTest.DigitalIn.diHochdruckOkModul1					:= diModul02.di02;
		hmiIoTest.DigitalIn.diBox1Offen							:= diModul02.di03;
		hmiIoTest.DigitalIn.diBox1Geschl						:= diModul02.di04;
		hmiIoTest.DigitalIn.diKopftempKompressorModul1			:= diModul02.di05;
		hmiIoTest.DigitalIn.diOeldruckKompressorModul1			:= diModul02.di06;
		hmiIoTest.DigitalIn.diVollschutzKompressorModul1		:= diModul02.di07;
		hmiIoTest.DigitalIn.diScheitholzofenInBetrieb			:= diModul02.di08;
		hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul1		:= diModul02.di09;
		//Reserve												:= diModul02.di10;
		hmiIoTest.DigitalIn.diVentilator1InBetrieb				:= diModul02.di11;
		hmiIoTest.DigitalIn.diWarmluftofenInBetrieb				:= diModul02.di12;
		hmiIoTest.DigitalIn.diLeistungsvorgKompressorExtMod1	:= diModul02.di13;
		hmiIoTest.DigitalIn.diBypassklappeOffen					:= diModul02.di14;
		hmiIoTest.DigitalIn.diBypassklappeGeschl				:= diModul02.di15;
		hmiIoTest.DigitalIn.di24VDCinternIstOk					:= diModul02.di16;
		
		//MODUL 03 - DO9322 ***********************************************************************************************************
		doModul03.do01						:= hmiIoTest.DigitalOut.doTrocknungInBetrieb;
		doModul03.do02						:= hmiIoTest.DigitalOut.doTrocknungStoerung;
		doModul03.do03						:= hmiIoTest.DigitalOut.doHeizregisterEin;
		doModul03.do04						:= hmiIoTest.DigitalOut.doKompressorEinModul1;
		doModul03.do05						:= hmiIoTest.DigitalOut.doMagnetventilEinModul1;
		doModul03.do06						:= hmiIoTest.DigitalOut.doOelsumpfheizungEinModul1; 		
		doModul03.do07						:= hmiIoTest.DigitalOut.doVentilator1Ein; 			
		doModul03.do08						:= hmiIoTest.DigitalOut.doBypassklappeOeffnen; 
		doModul03.do09						:= hmiIoTest.DigitalOut.doWarmluftofenEin;
		doModul03.do10						:= hmiIoTest.DigitalOut.doUmluftklappe1Freigabe;
		doModul03.do11						:= hmiIoTest.DigitalOut.doBrandschutzklappeAuf;
		doModul03.do12						:= hmiIoTest.DigitalOut.doFreigabeBox1;
		
		//MODUL 04 - AI8321 ***********************************************************************************************************
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_0(enable := TRUE, x := aiModul04.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
			LCRMovAvgFlt_1(enable := TRUE, x := aiModul04.ai02, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
			LCRMovAvgFlt_2(enable := TRUE, x := aiModul04.ai03, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_3(enable := TRUE, x := aiModul04.ai04, base := Betriebsparameter.Sensoren.FilterzeitEintritt);
			LCRMovAvgFlt_4(enable := TRUE, x := aiModul04.ai05, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_5(enable := TRUE, x := aiModul04.ai06, base := Betriebsparameter.Sensoren.FilterzeitAustritt);
			LCRMovAvgFlt_6(enable := TRUE, x := aiModul04.ai07, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
			LCRMovAvgFlt_7(enable := TRUE, x := aiModul04.ai08, base := Betriebsparameter.Sensoren.FilterzeitDachluft);
		END_IF
		
		//Niederdruck Modul 1
		LCRLimScal_0(x := LCRMovAvgFlt_0.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		hmiIoTest.AnalogIn.aiNiederdruckModul1		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul1;
		
		//Hochdruck Modul 1
		LCRLimScal_1(x := LCRMovAvgFlt_1.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		hmiIoTest.AnalogIn.aiHochdruckModul1		:= LCRLimScal_1.y + Betriebsparameter.Sensoren.OffsetHochdruckModul1;
		
		//Eintritt Temperatur
		LCRLimScal_2(x := LCRMovAvgFlt_2.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittTempMessberMax);
		hmiIoTest.AnalogIn.aiEintrittTemperatur	:= LCRLimScal_2.y + Betriebsparameter.Sensoren.OffsetEintrittTemp;
		
		//Eintritt rel. Feuchte
		LCRLimScal_3(x := LCRMovAvgFlt_3.y, x1 := 0, y1 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.EintrittFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiEintrittFeuchte		:= LCRLimScal_3.y + Betriebsparameter.Sensoren.OffsetEintrittFeuchte;
		
		//Austritt Temperatur
		LCRLimScal_4(x := LCRMovAvgFlt_4.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittTempMessberMax);
		hmiIoTest.AnalogIn.aiAustrittTemperatur	:= LCRLimScal_4.y + Betriebsparameter.Sensoren.OffsetAustrittTemp;
		
		//Austritt rel. Feuchte
		LCRLimScal_5(x := LCRMovAvgFlt_5.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AustrittFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAustrittFeuchte		:= LCRLimScal_5.y + Betriebsparameter.Sensoren.OffsetAustrittFeuchte;

		//Je nach Ausstattung Frischluft- oder Dachluftfühler
		IF Betriebsparameter.Ausstattung.SensorDachluft THEN
			//Dachluft Temperatur
			LCRLimScal_6(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachTempMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.DachTempMessberMax);
			hmiIoTest.AnalogIn.aiDachluftTemperatur	:= LCRLimScal_6.y + Betriebsparameter.Sensoren.OffsetDachTemp;
		
			//Dachluft rel. Feuchte
			LCRLimScal_7(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.DachFeuchteMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.DachFeuchteMessberMax);
			hmiIoTest.AnalogIn.aiDachluftFeuchte		:= LCRLimScal_7.y + Betriebsparameter.Sensoren.OffsetDachFeuchte;
		ELSE
			//Frischluft Temperatur
			LCRLimScal_6(x := LCRMovAvgFlt_6.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlTempMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlTempMessberMax);
			hmiIoTest.AnalogIn.aiFrischluftTemperatur	:= LCRLimScal_6.y + Betriebsparameter.Sensoren.OffsetFrischluftTemp;
		
			//Frischluft rel. Feuchte
			LCRLimScal_7(x := LCRMovAvgFlt_7.y, x1 := 0, y1 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMin, 
			x2 := 32767, y2 := Betriebsparameter.Sensoren.FrischlFeuchteMessberMax);
			hmiIoTest.AnalogIn.aiFrischluftFeuchte		:= LCRLimScal_7.y + Betriebsparameter.Sensoren.OffsetFrischluftFeuchte;
		END_IF
		
		//MODUL 05 - CM8281 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diUmschaltklappe1Offen	:= cmModul05.di01; 
		hmiIoTest.DigitalIn.diUmschaltklappe2Offen	:= cmModul05.di02;
		hmiIoTest.DigitalIn.diUmschaltklappe1Geschl	:= cmModul05.di03;
		hmiIoTest.DigitalIn.diUmschaltklappe2Geschl	:= cmModul05.di04; 

		cmModul05.do01	:= hmiIoTest.DigitalOut.doUmluftklappe2Freigabe; 
		cmModul05.do02	:= hmiIoTest.DigitalOut.doNotstromaggregatEin;

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_8(enable := TRUE, x := cmModul05.ai01, base := Betriebsparameter.Sensoren.FilterzeitLuftgeschwindigkeit);
		END_IF
		
		//Luftgeschwindigkeit
		LCRLimScal_8(x := LCRMovAvgFlt_8.y, x1 := 0, y1 := Betriebsparameter.Sensoren.LuftgeschwMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.LuftgeschwMessberMax);
		hmiIoTest.AnalogIn.aiLuftgeschwindigkeit		:= LCRLimScal_8.y + Betriebsparameter.Sensoren.OffsetLuftgeschw;
		
		//Drehzahlvorgabe FU Kompressor Modul 1
		LCRLimScal_9(x := hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul1, x1 := 0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor1.DrehzahlMax, y2 := 32767);
		cmModul05.ao01				:= REAL_TO_INT(LCRLimScal_9.y);
		
		
		
		//MODUL 06 - CM8281 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diBox2Offen				:= cmModul06.di01;
		hmiIoTest.DigitalIn.diBox3Offen				:= cmModul06.di02;
		hmiIoTest.DigitalIn.diBox2Geschl			:= cmModul06.di03;
		hmiIoTest.DigitalIn.diBox3Geschl			:= cmModul06.di04;
		
		cmModul06.do01			:= hmiIoTest.DigitalOut.doFreigabeBox2;
		cmModul06.do02			:= hmiIoTest.DigitalOut.doFreigabeBox3;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_12(enable := TRUE, x := cmModul06.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF
		
		//Abluft Temperatur
		LCRLimScal_16(x := LCRMovAvgFlt_12.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftTempMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftTempMessberMax);
		hmiIoTest.AnalogIn.aiAbluftTemperatur	:= LCRLimScal_16.y + Betriebsparameter.Sensoren.OffsetAbluftTemp;
		
		//Drehzahlvorgabe FU Ventilator 1
		LCRLimScal_10(x := hmiIoTest.AnalogOut.aoDrehzahlvorgVentilator1, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul06.ao01			:= REAL_TO_INT(LCRLimScal_10.y);
		
		
		
		//MODUL 07 - CM8281 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diAbluftklappeOffen			:= cmModul07.di01;
		hmiIoTest.DigitalIn.diAbluftklappeGeschl		:= cmModul07.di02;
		hmiIoTest.DigitalIn.diAbluftventInBetrieb		:= cmModul07.di03;
		hmiIoTest.DigitalIn.diNotstromaggregatInBetrieb	:= cmModul07.di04;
		
		
		cmModul07.do01			:= hmiIoTest.DigitalOut.doAbluftklappeFreigabe OR hmiIoTest.DigitalOut.doAbluftventilatorEin;
		cmModul07.do02			:= FALSE;
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_9(enable := TRUE, x := cmModul07.ai01, base := Betriebsparameter.Sensoren.FilterzeitAbluft);
		END_IF

		//Abluft rel. Feuchte
		LCRLimScal_11(x := LCRMovAvgFlt_9.y, x1 := 0, y1 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.AbluftFeuchteMessberMax);
		hmiIoTest.AnalogIn.aiAbluftFeuchte		:= LCRLimScal_11.y + Betriebsparameter.Sensoren.OffsetAbluftFeuchte;
		
		//Drehzahlvorgabe FU Abluftventilator
		LCRLimScal_12(x := hmiIoTest.AnalogOut.aoDrehzahlvorgAbluftventilator, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul07.ao01			:= REAL_TO_INT(LCRLimScal_12.y);
		

		
		//MODUL 08 - AT2222 ***********************************************************************************************************

		(*	//Öltemperatur Kompressor Modul 1 PT100 (Eingang wird zuerst in REAL umgewandelt, damit die Nachkommastelle erhalten bleibt)
		loc_OeltempModul01			:= INT_TO_REAL(atModul08.at01 / 10);
		tcOeltempKompressorModul1	:= (loc_OeltempModul01) + Betriebsparameter.Sensoren.OffsetOeltempKompressorModul1;
		
		//Öltemperatur Kompressor Modul 2 PT100 (Eingang wird zuerst in REAL umgewandelt, damit die Nachkommastelle erhalten bleibt)
		loc_OeltempModul02			:= INT_TO_REAL(atModul08.at02 / 10);
		tcOeltempKompressorModul2	:= (loc_OeltempModul02) + Betriebsparameter.Sensoren.OffsetOeltempKompressorModul2;
		*)
		
		//Modul 9 - AP3131 **********************************************************************************************************
		//***************************************************************************************************************************
		
		//Modul zur Energiemessung - Wird im Programm "Energiemessung" aufgerufen.
		
		
		
		//MODUL 10 - CM8281 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diBetriebsmldgKompressorModul2	:= cmModul10.di01;
		hmiIoTest.DigitalIn.diDrehzahlbegrVentilator1		:= cmModul10.di02;
		hmiIoTest.DigitalIn.diNiederdruckOkModul2			:= cmModul10.di03;
		hmiIoTest.DigitalIn.diHochdruckOkModul2				:= cmModul10.di04;
		
		
		cmModul10.do01					:= hmiIoTest.DigitalOut.doKompressorEinModul2;
		cmModul10.do02					:= FALSE;	//Reserve
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_10(enable := TRUE, x := cmModul10.ai01, base := Betriebsparameter.Sensoren.FilterzeitNiederdruck);
		END_IF
		
		//Niederdruck Kompressor Modul 2
		LCRLimScal_13(x := LCRMovAvgFlt_10.y, x1 := 0, y1 := Betriebsparameter.Sensoren.NiederdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.NiederdruckMessberMax);
		hmiIoTest.AnalogIn.aiNiederdruckModul2		:= LCRLimScal_13.y + Betriebsparameter.Sensoren.OffsetNiederdruckModul2;
		
		//Drehzahlvorgabe FU Kompressor Modul 2
		LCRLimScal_14(x := hmiIoTest.AnalogOut.aoDrehzahlvorgKompressorModul2, x1 := 0, y1 := 0, 
		x2 := Betriebsparameter.Kompressor2.DrehzahlMax, y2 := 32767);
		cmModul10.ao01			:= REAL_TO_INT(LCRLimScal_14.y);
		
		
		
		//MODUL 11 - CM8281 ***********************************************************************************************************
		hmiIoTest.DigitalIn.diOeldruckKompressorModul2		:= cmModul11.di01;
		hmiIoTest.DigitalIn.diVollschutzKompressorModul2	:= cmModul11.di02;
		hmiIoTest.DigitalIn.diKopftempKompressorModul2		:= cmModul11.di03;
		//Reserve						:= cmModul11.di04;
		
			
		cmModul11.do01					:= hmiIoTest.DigitalOut.doOelsumpfheizungEinModul2;
		cmModul11.do02					:= hmiIoTest.DigitalOut.doMagnetventilEinModul2;	
		
		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_11(enable := TRUE, x := cmModul11.ai01, base := Betriebsparameter.Sensoren.FilterzeitHochdruck);
		END_IF
		
		//Hochdruck Kompressor Modul 2
		LCRLimScal_15(x := LCRMovAvgFlt_11.y, x1 := 0, y1 := Betriebsparameter.Sensoren.HochdruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.HochdruckMessberMax);
		hmiIoTest.AnalogIn.aiHochdruckModul2		:= LCRLimScal_15.y + Betriebsparameter.Sensoren.OffsetHochdruckModul2;
		
		//Leistungsvorgabe Heizregister
		LCRLimScal_17(x := hmiIoTest.AnalogOut.aoLeistungsvorgHeizregister, x1 := 0.0, y1 := 0, x2 := 100.0, y2 := 32767);
		cmModul11.ao01				:= REAL_TO_INT(LCRLimScal_17.y);
		
		
		//MODUL 12 - CM8281 ***********************************************************************************************************************************
		//*****************************************************************************************************************************************************
		//Reserve						:= cmModul12.di01; 
		//Reserve						:= cmModul12.di02; 
		//Reserve						:= cmModul12.di03; 
		//Reserve						:= cmModul12.di04; 

		cmModul12.do01					:= FALSE;	//Reserve
		cmModul12.do02					:= FALSE;	//Reserve

		//Eingangssignale filtern
		IF sekTick THEN
			LCRMovAvgFlt_13(enable := TRUE, x := cmModul12.ai01, base := Betriebsparameter.Sensoren.FilterzeitKanaldruck);
		END_IF
		
		//Differenzdruck
		LCRLimScal_0(x := LCRMovAvgFlt_13.y, x1 := 0, y1 := Betriebsparameter.Sensoren.KanaldruckMessberMin, 
		x2 := 32767, y2 := Betriebsparameter.Sensoren.KanaldruckMessberMax);
		hmiIoTest.AnalogIn.aiDifferenzdruck		:= LCRLimScal_0.y + Betriebsparameter.Sensoren.OffsetKanaldruck;
		
		//Analogausgang
		cmModul12.ao01				:= 0;	//Reserve
		
		
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
		
		IF Betriebsparameter.Ausstattung.SensorDachluft THEN
			//Modul 04 Dachluft Temperatur **************************************************************************
			IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
				hmiIoTest.StatusIn.diStatusDachluftTempMin	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusDachluftTempMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
				hmiIoTest.StatusIn.diStatusDachluftTempMax	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusDachluftTempMax	:= FALSE;
			END_IF
		
			//Modul 04 Dachluft Feuchte **************************************************************************
			IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
				hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusDachluftFeuchteMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
				hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusDachluftFeuchteMax	:= FALSE;
			END_IF
		ELSE
			//Modul 04 Frischluft Temperatur **************************************************************************
			IF (aiModul04.StatusInput02.5 = FALSE AND aiModul04.StatusInput02.4 = TRUE) THEN
				hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusFrischluftTempMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.5 = TRUE AND aiModul04.StatusInput02.4 = FALSE) THEN
				hmiIoTest.StatusIn.diStatusFrischluftTempMax	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusFrischluftTempMax	:= FALSE;
			END_IF
		
			//Modul 04 Frischluft Feuchte **************************************************************************
			IF (aiModul04.StatusInput02.7 = FALSE AND aiModul04.StatusInput02.6 = TRUE) THEN
				hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusFrischluftFeuchteMin	:= FALSE;
			END_IF
			IF (aiModul04.StatusInput02.7 = TRUE AND aiModul04.StatusInput02.6 = FALSE) THEN
				hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	:= TRUE;
			ELSE
				hmiIoTest.StatusIn.diStatusFrischluftFeuchteMax	:= FALSE;
			END_IF
		END_IF
		
		//Modul 05 Luftgeschwindigkeit ****************************************************************************
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
		
		//Modul 06 Abluft Temperatur ****************************************************************************
		IF (cmModul06.StatusInput01.1 = FALSE AND cmModul06.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMin	:= FALSE;
		END_IF
		IF (cmModul06.StatusInput01.1 = TRUE AND cmModul06.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftTempMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftTempMax	:= FALSE;
		END_IF
		
		//Modul 07 Abluft rel. Feuchte ****************************************************************************
		IF (cmModul07.StatusInput01.1 = FALSE AND cmModul07.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMin	:= FALSE;
		END_IF
		IF (cmModul07.StatusInput01.1 = TRUE AND cmModul07.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusAbluftFeuchteMax	:= FALSE;
		END_IF
		
(*		//Modul 08 Öltemperatur Kompressor Modul 1 ****************************************************************************
		IF (atModul08.StatusInput01.1 = FALSE AND atModul08.StatusInput01.0 = TRUE) THEN
			diStatusOeltempMinMod1	:= TRUE;
		ELSE
			diStatusOeltempMinMod1	:= FALSE;
		END_IF
		IF (atModul08.StatusInput01.1 = TRUE AND atModul08.StatusInput01.0 = FALSE ) THEN
			diStatusOeltempMaxMod1	:= TRUE;
		ELSE
			diStatusOeltempMaxMod1	:= FALSE;
		END_IF
		
		//Modul 08 Öltemperatur Kompressor Modul 2 ***************************************************************************
		IF (atModul08.StatusInput01.3 = FALSE AND atModul08.StatusInput01.2 = TRUE) THEN
			diStatusOeltempMinMod2 := TRUE;
		ELSE
			diStatusOeltempMinMod2 := FALSE;
		END_IF
		IF (atModul08.StatusInput01.3 = TRUE AND atModul08.StatusInput01.2 = FALSE) THEN
			diStatusOeltempMaxMod2 := TRUE;
		ELSE
			diStatusOeltempMaxMod2 := FALSE;
		END_IF*)

		//Modul 10 Niederdruck Kompressor Modul 2 ****************************************************************************
		IF (cmModul10.StatusInput01.1 = FALSE AND cmModul10.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMinMod2	:= FALSE;
		END_IF
		IF (cmModul10.StatusInput01.1 = TRUE AND cmModul10.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusNiederdruckMaxMod2	:= FALSE;
		END_IF
		
		//Modul 11 Hochdruck Kompressor Modul 2 ****************************************************************************
		IF (cmModul11.StatusInput01.1 = FALSE AND cmModul11.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMinMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMinMod2	:= FALSE;
		END_IF
		IF (cmModul11.StatusInput01.1 = TRUE AND cmModul11.StatusInput01.0 = FALSE ) THEN
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod2	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusHochdruckMaxMod2	:= FALSE;
		END_IF	
		
		//Modul 12 Differenzdruck ****************************************************************************
		IF (cmModul12.StatusInput01.1 = FALSE AND cmModul12.StatusInput01.0 = TRUE) THEN
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= TRUE;
		ELSE
			hmiIoTest.StatusIn.diStatusDifferenzdruckMin	:= FALSE;
		END_IF
		IF (cmModul12.StatusInput01.1 = TRUE AND cmModul12.StatusInput01.0 = FALSE ) THEN
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
	loc_Erforderl_Mod6	:= TRUE;
	loc_Erforderl_Mod7	:= Betriebsparameter.Ausstattung.Abluftklappe OR Betriebsparameter.Ausstattung.Abluftventilator OR Betriebsparameter.Ausstattung.Notstromaggregat OR
		Betriebsparameter.Ausstattung.SensorAbluft;
	loc_Erforderl_Mod8	:= Betriebsparameter.Ausstattung.Energiemessung;
	loc_Erforderl_Mod9	:= gModul2Vorhanden;
	loc_Erforderl_Mod10	:= gModul2Vorhanden;
	loc_Erforderl_Mod11	:= Betriebsparameter.Ausstattung.SensorKanaldruck;

	
	fbLascoFehl_0.FehlerIn	:= (loc_Erforderl_Mod1 AND NOT brModul01.ModulOk) OR (loc_Erforderl_Mod2 AND NOT diModul02.ModulOk) OR 
	(loc_Erforderl_Mod3 AND NOT doModul03.ModulOk) OR (loc_Erforderl_Mod4 AND NOT aiModul04.ModulOk) OR (loc_Erforderl_Mod5 AND NOT cmModul05.ModulOk) OR
	(loc_Erforderl_Mod6 AND NOT cmModul06.ModulOk) OR (loc_Erforderl_Mod7 AND NOT cmModul07.ModulOk) OR (loc_Erforderl_Mod8 AND NOT gEnergiemessungModulOk) OR
	(loc_Erforderl_Mod9 AND NOT cmModul10.ModulOk) OR (loc_Erforderl_Mod10 AND NOT cmModul11.ModulOk) OR (loc_Erforderl_Mod11 AND NOT cmModul12.ModulOk);
	fbLascoFehl_0.Mode		:= 2;
	fbLascoFehl_0.Quit		:= hmiButtons.QuitFehler;
	fbLascoFehl_0.Tick		:= sekTick;
	fbLascoFehl_0();
	
	alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] := fbLascoFehl_0.FehlerOut;
	
	
END_PROGRAM


