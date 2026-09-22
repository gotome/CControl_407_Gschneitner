
	
PROGRAM _CYCLIC
	
	//Ticks erzeugen
	//==============
	fbLascoZdxx_0(IN	:= Echtzeit.Milli / 100);
	hmilliTick			:= fbLascoZdxx_0.Q;
       
	fbLascoPuge_0(StartMitPuls := TRUE, Tick := hmilliTick, ZeitPuls := 8, ZeitPause := 8,);
	hmiBlink			:= fbLascoPuge_0.PulsQ;
	
	
	//Automatik oder Testmodus
	//************************
	
	gCmdAnlage.Auto   		:= NOT hmiButtons.TestbetriebEin;
	gCmdAnlage.Test   		:= hmiButtons.TestbetriebEin;
	
	
	//Externe Start/Stopp- Signale
(*	gCmdAnlage.StartExtern		:= diAnfEntfeuchterExtern;
	gCmdAnlage.StoppExtern		:= NOT diAnfEntfeuchterExtern;*)
	

	
	//Start- und Stoppsignale auswerten
	//=================================
	
	//Startsignal geben, wenn eine der Boxen angefordert wird
	gCmdAnlage.Start	:= gCmdAnlage.Auto AND (Boxen.Box1Out.BoxBereit OR Boxen.Box2Out.BoxBereit OR Boxen.Box3Out.BoxBereit OR Boxen.Box4Out.BoxBereit OR
	Boxen.Box5Out.BoxBereit OR Boxen.Box6Out.BoxBereit OR Boxen.EntfeuchterInselbetrAktivOut);
	
	//Stopsignal geben, wenn keine Box angefordert ist
	gCmdAnlage.Stop		:= gCmdAnlage.Auto AND NOT Boxen.Box1Out.BoxBereit AND NOT Boxen.Box2Out.BoxBereit AND NOT Boxen.Box3Out.BoxBereit AND NOT Boxen.Box4Out.BoxBereit AND NOT
	Boxen.Box5Out.BoxBereit AND NOT Boxen.Box6Out.BoxBereit AND NOT Boxen.EntfeuchterInselbetrAktivOut;

	//Signal Fehler-Stopp erzeugen (kein Start möglich bzw. Abbruch Trocknung)
	//Fehlerstopp entfernt (Trocknung lässt sich dennoch starten, je nach Fehler werden die einzelnen Aktoren nicht freigegeben
	gCmdAnlage.FehlerStopp	:= FALSE;
(*	gCmdAnlage.FehlerStopp	:= (gCmdAnlage.Auto AND (alarmFehler[FEHLER_24VDC] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_1] OR 
	alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_2] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_3] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_4] OR
	alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_5] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_6] OR alarmFehler[FEHLER_ENDLAGEN_BYPASSKLAPPE] OR
	alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE1] OR alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE2] OR alarmFehler[FEHLER_IO_TEST_NICHT_FERTIG] OR
	alarmFehler[FEHLER_KOMMUNIKATION_DISPLAY_IO] OR alarmFehler[FEHLER_BETRIEBSMLDG_NOTSTROM] OR alarmFehler[FEHLER_BETRIEBSMLDG_VENTILATOR1] OR
	alarmFehler[FEHLER_BETRIEBSMLDG_VENTILATOR2]));
	
	
	//Bei Doppelmodulen Anlage nur stoppen, wenn bei beiden Modulen ein Fehler anliegt
	IF gModul2Vorhanden THEN
		gCmdAnlage.FehlerStopp := (gCmdAnlage.Auto AND (alarmFehler[FEHLER_24VDC] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_1] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_2] OR
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_3] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_4] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_5] OR 
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_6] OR alarmFehler[FEHLER_ENDLAGEN_BYPASSKLAPPE] OR alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE1] OR 
		alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE2] OR alarmFehler[FEHLER_IO_TEST_NICHT_FERTIG] OR alarmFehler[FEHLER_KOMMUNIKATION_DISPLAY_IO] OR 
		alarmFehler[FEHLER_EINTRITT_TEMP_ZU_HOCH] OR alarmFehler[FEHLER_EINTRITT_TEMP_ZU_NIEDRIG] OR (gCmdAnlage.FehlerModul1 AND gCmdAnlage.FehlerModul2)));
	ELSE
		gCmdAnlage.FehlerStopp := (gCmdAnlage.Auto AND (alarmFehler[FEHLER_24VDC] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_1] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_2] OR
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_3] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_4] OR alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_5] OR 
		alarmFehler[FEHLER_ENDLAGEN_BOXENKLAPPE_6] OR alarmFehler[FEHLER_ENDLAGEN_BYPASSKLAPPE] OR alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE1] OR 
		alarmFehler[FEHLER_ENDLAGEN_UMSCHALTKLAPPE2] OR alarmFehler[FEHLER_IO_TEST_NICHT_FERTIG] OR alarmFehler[FEHLER_KOMMUNIKATION_DISPLAY_IO] OR 
		alarmFehler[FEHLER_EINTRITT_TEMP_ZU_HOCH] OR alarmFehler[FEHLER_EINTRITT_TEMP_ZU_NIEDRIG] OR gCmdAnlage.FehlerModul1));
	END_IF
	*)
	//Fehler Modul 1
	gCmdAnlage.FehlerModul1	:= (gCmdAnlage.Auto AND (alarmFehler[FEHLER_BETRIEBSMLDG_KOMPR_MOD1] OR alarmFehler[FEHLER_FU_KOMPRESSOR_MODUL1] OR alarmFehler[FEHLER_HOCHDRUCK_MODUL1] OR
	alarmFehler[FEHLER_KOPFTEMP_KOMPR_MOD1] OR alarmFehler[FEHLER_NIEDERDRUCK_MODUL1] OR alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD1] OR alarmFehler[FEHLER_SENSOR_HOCHDRUCK_MOD1] OR
	alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD1] OR alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD1] OR alarmFehler[FEHLER_LZ_PUMPDOWN_MOD1] OR alarmFehler[FEHLER_DREHFELD] OR
	alarmFehler[FEHLER_ENTF_FREMD_BETRMLDG] OR alarmFehler[FEHLER_ENTF_FREMD_STOERMELDUNG])); //Ab V2.0.0: Fehler Entfeuchter Fremd hinzugefügt
	
	//Fehler Modul 2
	gCmdAnlage.FehlerModul2	:= (gCmdAnlage.Auto AND gModul2Vorhanden AND (alarmFehler[FEHLER_BETRIEBSMLDG_KOMPR_MOD2] OR alarmFehler[FEHLER_FU_KOMPRESSOR_MODUL2] OR alarmFehler[FEHLER_HOCHDRUCK_MODUL2] OR
	alarmFehler[FEHLER_KOPFTEMP_KOMPR_MOD2] OR alarmFehler[FEHLER_NIEDERDRUCK_MODUL2] OR alarmFehler[FEHLER_OELDRUCK_KOMPR_MOD2] OR alarmFehler[FEHLER_SENSOR_HOCHDRUCK_MOD2] OR
	alarmFehler[FEHLER_SENSOR_NIEDERDRUCK_MOD2] OR alarmFehler[FEHLER_VOLLSCHUTZ_KOMPR_MOD2] OR alarmFehler[FEHLER_LZ_PUMPDOWN_MOD2] OR alarmFehler[FEHLER_DREHFELD]));
	
	//Betriebsmeldung und Störmeldung
	gStatusAnlage.Betrieb	:= gAktModus = BETRIEB;
	
	IF gStatusAnlage.Betrieb AND (doVentilator1Ein OR doVentilator2Ein) THEN
		doTrocknungInBetrieb := TRUE;
	ELSIF gStatusAnlage.Betrieb AND (doKompressorEinModul1 OR doKompressorEinModul2) AND NOT Betriebsparameter.Ausstattung.Ventilator1 THEN
		doTrocknungInBetrieb := TRUE;
	ELSIF gStatusAnlage.Betrieb THEN
		doTrocknungInBetrieb := hmiBlink;
	ELSE
		doTrocknungInBetrieb := FALSE;
	END_IF
	
	doTrocknungStoerung		:= gStatusAnlage.Fehler.SummeFehler;

	
END_PROGRAM