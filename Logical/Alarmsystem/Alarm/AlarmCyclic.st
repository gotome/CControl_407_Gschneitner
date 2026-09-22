

PROGRAM _INIT

	init	:= FALSE;
	
END_PROGRAM

PROGRAM _CYCLIC

	//Sekundentick generieren
	//=======================
	eUhr(Freigabe:= TRUE);
	fbLascoZdxx_0(IN := eUhr.Sekunde);
	sekTick	:= fbLascoZdxx_0.Q;

	//Fehlergenerierung eingeschaltet *****************************************************************************************************************************************************************
	IF init THEN

		
		//=======================================================================================================================================================
		//FEHLER ------------------------------ FEHLER ------------------------------ FEHLER ------------------------------ FEHLER ------------------------------
		//=======================================================================================================================================================
		
		//00) Fehler Absicherung 24VDC 
		alarmFehler[FEHLER_24VDC]			:= NOT di24VDCinternIstOk;
			
		//01) Fehler FU Kompressor Modul 1
		alarmFehler[FEHLER_FU_KOMPRESSOR_MODUL1]	:= Aktoren.KompressorModul1.StoerungOut;
		
		//02) Fehler FU Kompressor Modul 2
		alarmFehler[FEHLER_FU_KOMPRESSOR_MODUL2]	:= Aktoren.KompressorModul2.StoerungOut;
		
		//03) Fehler Betriebsmeldung Kompressor Modul 1
		fbLascoFehl_0(FehlerIn := doKompressorEinModul1 AND NOT diBetriebsmldgKompressorModul1,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_BETRIEBSMLDG_KOMPR_MOD1]	:= fbLascoFehl_0.FehlerOut;
		
		//04) Fehler Betriebsmeldung Kompressor Modul 2
		fbLascoFehl_1(FehlerIn := gModul2Vorhanden AND doKompressorEinModul2 AND NOT diBetriebsmldgKompressorModul2,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_BETRIEBSMLDG_KOMPR_MOD2]	:= fbLascoFehl_1.FehlerOut;
		
		//05) Fehler Betriebsmeldung Ventilator 1
		fbLascoFehl_2(FehlerIn := Aktoren.VentUndKlappen.FehlerFuVentilator1,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_BETRIEBSMLDG_VENTILATOR1]	:= fbLascoFehl_2.FehlerOut;
		
		//06) Fehler Betriebsmeldung Ventilator 2
		fbLascoFehl_3(FehlerIn := Aktoren.VentUndKlappen.FehlerFuVentilator2,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_BETRIEBSMLDG_VENTILATOR2]	:= fbLascoFehl_3.FehlerOut;
		
		//07) Fehler Betriebsmeldung Abluftventilator
		fbLascoFehl_4(FehlerIn := Aktoren.Abluftventilator.FehlerOut,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_BETRIEBSMLDG_ABLUFTVENT]	:= fbLascoFehl_4.FehlerOut;
		
		//08) Fehler Hochdruck Modul 1
		fbLascoFehl_5(FehlerIn :=  Betriebsparameter.Ausstattung.Entfeuchter AND NOT diHochdruckOkModul1, VerzZeit := 0, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_HOCHDRUCK_MODUL1]			:= fbLascoFehl_5.FehlerOut;
		
		//09) Fehler Hochdruck Modul 2
		fbLascoFehl_6(FehlerIn :=  Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND NOT diHochdruckOkModul2, VerzZeit := 0, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_HOCHDRUCK_MODUL2]			:= fbLascoFehl_6.FehlerOut;
		
		//10) Fehler Niederdruck Modul 1
		fbLascoFehl_7(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND NOT diNiederdruckOkModul1, VerzZeit := 0, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_NIEDERDRUCK_MODUL1]			:= fbLascoFehl_7.FehlerOut;
		
		//11) Fehler Niederdruck Modul 2
		fbLascoFehl_8(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND NOT diNiederdruckOkModul2,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_NIEDERDRUCK_MODUL2]			:= fbLascoFehl_8.FehlerOut;
		
		//12) Fehler Öldruck Kompressor Modul 1
		fbLascoFehl_9(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND NOT diOeldruckKompressorModul1,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD1]			:= fbLascoFehl_9.FehlerOut;
		
		//13) Fehler Öldruck Kompressor Modul 2
		fbLascoFehl_10(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND NOT diOeldruckKompressorModul2,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD2]			:= fbLascoFehl_10.FehlerOut;
		
		//14) Fehler Kopftemperatur Kompressor Modul 1
		fbLascoFehl_11(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND NOT diKopftempKompressorModul1,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_KOPFTEMP_KOMPR_MOD1]			:= fbLascoFehl_11.FehlerOut;
		
		//15) Fehler Kopftemperatur Kompressor Modul 2
		fbLascoFehl_12(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND NOT diKopftempKompressorModul2,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_KOPFTEMP_KOMPR_MOD2]			:= fbLascoFehl_12.FehlerOut;
		
		//16) Fehler Vollschutz Kompressor Modul 1
		fbLascoFehl_13(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND NOT diVollschutzKompressorModul1,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD1]			:= fbLascoFehl_13.FehlerOut;
		
		//17) Fehler Vollschutz Kompressor Modul 2
		fbLascoFehl_14(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND NOT diVollschutzKompressorModul2,
		VerzZeit := 0, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD2]			:= fbLascoFehl_14.FehlerOut;
		
		//18) Fehler Betriebsmeldung Warmluftofen
		alarmFehler[FEHLER_BETRIEBSMLDG_WARMLUFTOFEN]	:= Aktoren.Warmluftofen.FehlerBetriebsmeldungOut;
		
		//19) Fehler Betriebsmeldung Notstromaggregat
		alarmFehler[FEHLER_BETRIEBSMLDG_NOTSTROM]		:= Aktoren.Notstromaggregat.FehlerOut;
	
		//20 - 31) Sensoren
		fbLascoFehl_15(FehlerIn := ((*diStatusFrischluftFeuchteMax OR *)diStatusFrischluftFeuchteMin OR diStatusFrischluftTempMax OR diStatusFrischluftTempMin) AND
		Betriebsparameter.Ausstattung.SensorFrischluft, VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_FRISCHLUFT]	:= fbLascoFehl_15.FehlerOut;
		
		fbLascoFehl_16(FehlerIn := ((*diStatusDachluftFeuchteMax OR *)diStatusDachluftFeuchteMin OR diStatusDachluftTempMax OR diStatusDachluftTempMin) AND
		Betriebsparameter.Ausstattung.SensorDachluft, VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_DACHLUFT]	:= fbLascoFehl_16.FehlerOut;
		
		fbLascoFehl_17(FehlerIn := ((*diStatusTrockenluftFeuchteMax OR *)diStatusTrockenluftFeuchteMin OR diStatusTrockenluftTempMax OR diStatusTrockenluftTempMin) AND
		Betriebsparameter.Ausstattung.SensorTrockenluft, VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_TROCKENLUFT]	:= fbLascoFehl_17.FehlerOut;
		
		fbLascoFehl_18(FehlerIn := ((*diStatusAbluftFeuchteMax OR *)diStatusAbluftFeuchteMin OR diStatusAbluftTempMax OR diStatusAbluftTempMin) AND
		Betriebsparameter.Ausstattung.SensorAbluft,VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, 
		Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_ABLUFT]	:= fbLascoFehl_18.FehlerOut;
		
		fbLascoFehl_19(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND
		((*diStatusEintrittFeuchteMax OR *)diStatusEintrittFeuchteMin OR diStatusEintrittTempMax OR diStatusEintrittTempMin),
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_EINTRITT]	:= fbLascoFehl_19.FehlerOut;

		alarmFehler[FEHLER_SENSOR_AUSTRITT]	:= FALSE;	//Fehler Sensor Austritt nur als Warnung generieren
		
		fbLascoFehl_20(FehlerIn := (diStatusLuftgeschwDrahtbruch OR diStatusLuftgeschwMax OR diStatusLuftgeschwMin) AND Betriebsparameter.Ausstattung.SensorLuftgeschwindigkeit,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_LUFTGESCHW]	:= fbLascoFehl_20.FehlerOut;
		
		fbLascoFehl_21(FehlerIn := (diStatusDifferenzdruckMax OR diStatusDifferenzdruckMin) AND Betriebsparameter.Ausstattung.SensorKanaldruck,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_KANALDRUCK]	:= fbLascoFehl_21.FehlerOut;
		
		fbLascoFehl_22(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND (diStatusNiederdruckMaxMod1 OR diStatusNiederdruckMinMod1),
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD1]	:= fbLascoFehl_22.FehlerOut;
		
		fbLascoFehl_23(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND (diStatusNiederdruckMaxMod2 OR diStatusNiederdruckMinMod2),
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD2]	:= fbLascoFehl_23.FehlerOut;
		
		fbLascoFehl_24(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND (diStatusHochdruckMaxMod1 OR diStatusHochdruckMinMod1),
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_HOCHDRUCK_MOD1]	:= fbLascoFehl_24.FehlerOut;
		
		fbLascoFehl_25(FehlerIn := Betriebsparameter.Ausstattung.Entfeuchter AND gModul2Vorhanden AND (diStatusHochdruckMaxMod2 OR diStatusHochdruckMinMod2),
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmFehler[FEHLER_SENSOR_HOCHDRUCK_MOD2]	:= fbLascoFehl_25.FehlerOut;
	
		//32) Fehler Endlagen Bypassklappe
		alarmFehler[FEHLER_ENDLAGEN_BYPASSKLAPPE]		:= Aktoren.VentUndKlappen.FehlerLaufzeitBypass AND Betriebsparameter.Ausstattung.Bypassklappe;
		
		//33) Fehler Endlagen Umschaltklappe 1
		alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE1]	:= Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl1 AND Betriebsparameter.Ausstattung.Umschaltklappe1;
		
		//34) Fehler Endlagen Umschaltklappe 2
		alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE2]	:= Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl2 AND Betriebsparameter.Ausstattung.Umschaltklappe2;
		
		//35) Fehler Endlagen Boxenklappe 1
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_1]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox1;
		
		//36) Fehler Endlagen Boxenklappe 2
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_2]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox2;
		
		//37) Fehler Endlagen Boxenklappe 3
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_3]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox3;
		
		//38) Fehler Endlagen Boxenklappe 4
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_4]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox4;
		
		//39) Fehler Endlagen Boxenklappe 5
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_5]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox5;
		
		//40) Fehler Endlagen Boxenklappe 6
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_6]		:= Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox6;
		
		//41) Fehler Endlagen Abluftklappe
		alarmFehler[FEHLER_ENDLAGEN_ABLUFTKLAPPE]		:= Aktoren.Abluftklappe.FehlerLaufzeit;
		
		//42) Fehler Temperatur Eintritt zu hoch
		alarmFehler[FEHLER_EINTRITT_TEMP_ZU_HOCH]		:= (gStatusAnlage.EintrittTemperatur > Betriebsparameter.Kompressor1.EintrittTempMax) AND
		Betriebsparameter.Ausstattung.Entfeuchter AND Boxen.FreigabeLuftentfeuchter;
		
		//43) Fehler Temperatur Eintritt zu niedrig
		alarmFehler[FEHLER_EINTRITT_TEMP_ZU_NIEDRIG]	:= (gStatusAnlage.EintrittTemperatur < Betriebsparameter.Kompressor1.EintrittTempMin) AND
		Betriebsparameter.Ausstattung.Entfeuchter AND Boxen.FreigabeLuftentfeuchter;
		
		//44) Fehler Laufzeit Pumpdown Kompressor Modul 1
		alarmFehler[FEHLER_LZ_PUMPDOWN_MOD1]			:= Aktoren.KompressorModul1.FehlerPumpdown;
		
		//45) Fehler Laufzeit Pumpdown Kompressor Modul 2
		alarmFehler[FEHLER_LZ_PUMPDOWN_MOD2]			:= Aktoren.KompressorModul2.FehlerPumpdown AND gModul2Vorhanden;
		
		//46) Drehfeldüberwachung (Nur bei 3.04 Plus vorhanden)
		IF hmiStatus.NameSteuerung = 3 THEN
			alarmFehler[FEHLER_DREHFELD]	:= NOT diDrehfeldIstKorrekt AND NOT alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO];
		ELSE
			alarmFehler[FEHLER_DREHFELD]	:= FALSE;
		END_IF
		
		//47) Störmeldung Entfeuchter Fremdgeräte
		fbLascoFehl_29(FehlerIn := Betriebsparameter.Ausstattung.EntfeuchterFremd AND diEntfeuchterFremdStoerung,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 2);
		alarmFehler[FEHLER_ENTF_FREMD_STOERMELDUNG]			:= fbLascoFehl_29.FehlerOut;

		//48) Fehler Betriebsmeldung Entfeuchter Fremdgerät
		alarmFehler[FEHLER_ENTF_FREMD_BETRMLDG]			:= Betriebsparameter.Ausstattung.EntfeuchterFremd AND Aktoren.EntfeuchterFremd.FehlerBetriebsmldg; //V2.1.2
		
		
		//=======================================================================================================================================================
		//WARNUNGEN ------------------------------ WARNUNGEN ------------------------------ WARNUNGEN ------------------------------ WARNUNGEN ------------------
		//=======================================================================================================================================================

		//00) Warnung wenn Hochdruck Modul 1 zu hoch (Register verschmutzt, Ansaugtemperatur zu hoch oder zu wenig Luftmenge
		fbLascoFehl_26(FehlerIn := gStatusAnlage.Betrieb AND (gStatusAnlage.HochdruckModul1 > Betriebsparameter.Kompressor1.HochdruckMax) AND NOT
		Aktoren.KompressorModul1.KlappenumschaltungAkiv,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungWarnungen, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmWarnung[WARNUNG_HOCHDRUCK_MAX_MOD1]	:= fbLascoFehl_26.FehlerOut;
		
		//01) Warnung wenn Hochdruck Modul 2 zu hoch (Register verschmutzt, Ansaugtemperatur zu hoch oder zu wenig Luftmenge
		fbLascoFehl_27(FehlerIn := gModul2Vorhanden AND gStatusAnlage.Betrieb AND 
		(gStatusAnlage.HochdruckModul2 > Betriebsparameter.Kompressor1.HochdruckMax) AND NOT Aktoren.KompressorModul2.KlappenumschaltungAkiv,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungWarnungen, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 0);
		alarmWarnung[WARNUNG_HOCHDRUCK_MAX_MOD2]	:= fbLascoFehl_27.FehlerOut;
		
		//02) Warnung Sensor Austritt
		fbLascoFehl_28(FehlerIn := diStatusAustrittFeuchteMax OR diStatusAustrittFeuchteMin OR diStatusAustrittTempMax OR diStatusAustrittTempMin,
		VerzZeit := Betriebsparameter.Allgemein.VerzoegerungFehler, Quit := hmiButtons.QuitFehler, Tick := sekTick, Mode := 1);
		alarmWarnung[WARNUNG_SENSOR_AUSTRITT]	:= fbLascoFehl_28.FehlerOut;
		
		//03) Warnung Heizrregister Frostschutz aktiv
		alarmWarnung[WARNUNG_HEIZREGISTER_FROSTSCHUTZ] := diHeizregisterFrostschutz;

		
		//==================================================================================================================================================================
		//Fehlerausgang
		//==================================================================================================================================================================
		
		IF (gStatusAnlage.Betrieb OR gAktModus = STILLSTAND) THEN
			doTrocknungStoerung 	:= gStatusAnlage.Fehler.SummeFehler;
		ELSE
			doTrocknungStoerung	:= FALSE;
		END_IF

	END_IF

	
	//00 - 04 Systemfehler
	
	//alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO]	:= ; Wird in den IO-Mappings erzeugt.
	alarmSystem[FEHLER_IO_TEST_NICHT_FERTIG]		:= NOT Nutzungsdaten.Allgemein.IoTestAbgeschlossen;

	//Fehlerquittierung rücksetzen
	TON_Fehlerquittierung.IN	:= hmiButtons.QuitFehler;
	TON_Fehlerquittierung.PT	:= UDINT_TO_TIME(CONST_VERZ_QUIT);
	TON_Fehlerquittierung();
	
	IF (TON_Fehlerquittierung.Q) THEN
		hmiButtons.QuitFehler	:= FALSE;
	END_IF

	//Gruppenalarme bilden
	//********************
	
	gStatusAnlage.Fehler.SummeFehler := FALSE;
	gStatusAnlage.Fehler.FehlerNr	 := 0;
	ilen := (SIZEOF(alarmFehler) / SIZEOF(alarmFehler[0])) - 1;
	FOR i := 0 TO ilen DO
		IF (alarmFehler[i] = TRUE) THEN
			gStatusAnlage.Fehler.SummeFehler 	:= TRUE;
			gStatusAnlage.Fehler.FehlerNr		:= i + 1;
			EXIT;
		END_IF
	END_FOR
	
	
	gStatusAnlage.Fehler.SummeWarnung := FALSE;
	gStatusAnlage.Fehler.WarnungNr		 := 0;
	ilen := (SIZEOF(alarmWarnung) / SIZEOF(alarmWarnung[0])) - 1;
	FOR i := 0 TO ilen DO
		IF (alarmWarnung[i] = 1) THEN
			gStatusAnlage.Fehler.SummeWarnung 	:= TRUE;
			gStatusAnlage.Fehler.WarnungNr		:= i + 1;
			EXIT;
		END_IF	
	END_FOR

	gStatusAnlage.Fehler.SummeSystem := FALSE;
	ilen := (SIZEOF(alarmSystem) / SIZEOF(alarmSystem[0])) - 1;
	FOR i := 0 TO ilen DO
		IF (alarmSystem[i] = 1) THEN
			gStatusAnlage.Fehler.SummeSystem := TRUE;
			EXIT;	
		END_IF
	END_FOR

	init	:= TRUE;
	
END_PROGRAM