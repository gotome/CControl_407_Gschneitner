
PROGRAM _INIT

	//Strukturen Betriebsparameter und Nutzungsdaten in Strukturen für Visu kopieren
	memcpy(ADR(hmiParameter), ADR(Betriebsparameter), SIZEOF(Betriebsparameter));
	memcpy(ADR(hmiNutzungsdaten), ADR(Nutzungsdaten), SIZEOF(hmiNutzungsdaten));

	//Index Betriebsart von Buttons Klappen je nach letzter Betriebsart setzen
	IF hmiParameter.Abluftklappe.Automatik THEN
		hmiStatus.Abluftklappe.IndexBetriebsart := 0;
	ELSIF hmiParameter.Abluftklappe.Oeffnen THEN
		hmiStatus.Abluftklappe.IndexBetriebsart := 1;
	ELSE
		hmiStatus.Abluftklappe.IndexBetriebsart := 2;
	END_IF
	IF hmiParameter.Abluftventilator.Automatik THEN
		hmiStatus.Abluftventilator.IndexBetriebsart := 0;
	ELSIF hmiParameter.Abluftventilator.Ein THEN
		hmiStatus.Abluftventilator.IndexBetriebsart := 1;
	ELSE
		hmiStatus.Abluftventilator.IndexBetriebsart := 2;
	END_IF
	IF hmiParameter.Umschaltklappen.Automatik THEN
		hmiStatus.Umluftklappen.IndexBetriebsart := 0;
	ELSIF hmiParameter.Umschaltklappen.Frischluft THEN
		hmiStatus.Umluftklappen.IndexBetriebsart := 1;
	ELSE
		hmiStatus.Umluftklappen.IndexBetriebsart := 2;
	END_IF

	hmiVisibility.Layers.Zeitfenster			:= ICON_HIDDEN;
	hmiVisibility.Layers.DetailansichtBox		:= ICON_HIDDEN;
	hmiVisibility.Layers.MdgPwSchutzAus			:= ICON_HIDDEN;
	hmiVisibility.Layers.MldgDatumFalsch		:= ICON_HIDDEN;
	hmiVisibility.Layers.MldgKontrolleUhrzeit 	:= ICON_HIDDEN;
	hmiVisibility.Layers.MldgStockkontrolle		:= ICON_HIDDEN;
	hmiVisibility.Layers.Trocknungsbilanz		:= ICON_HIDDEN;
	
	hmiStatus.hmiPasswort	:= PASSWORT_SPERRE;
	

END_PROGRAM



PROGRAM _CYCLIC
	
	
	//Ticks erzeugen
	//==============
	fbLascoZdxx_0(IN	:= Echtzeit.Milli / 100);
	hmilliTick			:= fbLascoZdxx_0.Q;
	fbLascoZdxx_1(IN	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_1.Q;
	fbLascoZdxx_2(IN	:= Echtzeit.Stunde);
	stdTick				:= fbLascoZdxx_2.Q;
	fbLascoZdxx_3(IN	:= Echtzeit.Tag);
	tagTick				:= fbLascoZdxx_3.Q;
	fbLascoZdxx_5(IN	:= Echtzeit.Jahr);
	jahrTick			:= fbLascoZdxx_5.Q;
       
	fbLascoPuge_0(StartMitPuls := TRUE, Tick := hmilliTick, ZeitPuls := 8, ZeitPause := 8,);
	hmiBlink			:= fbLascoPuge_0.PulsQ;
	
	fbLascoPuge_1(StartMitPuls := TRUE, Tick := hmilliTick, ZeitPuls := 8, ZeitPause := 40,);
	hmiBlink2			:= fbLascoPuge_1.PulsQ;
	

	//Alarmfilter "Historische Alarme"
	//================================
	IF hmiStatus.hmiSelectAlarmGroup > 0 THEN
		hmiStatus.hmiAlarmFilter := 3; //nur Gruppenfilter einschalten
	ELSE
		hmiStatus.hmiAlarmFilter := 0; //alle Filter aus
	END_IF
	
	//Display-Timeoutzeit an lokale Variable übergeben
	loc_DisplayTimeout	:= hmiParameter.Allgemein.DisplayTimeout;
	
	
	//===========================================================================================================================================================================================
	//Betriebsoptionen rücksetzen, wenn in der Ausstattung nicht aktiviert
	//===========================================================================================================================================================================================
	
	IF (hmiParameter.Allgemein.PasswortschutzAus) THEN
		hmiParameter.Allgemein.AutoLogoutEin := FALSE;
	END_IF
	
	//Luftmengenregler ausschalten, wenn Sensor nicht vorhanden
	IF NOT hmiParameter.Ausstattung.SensorLuftgeschwindigkeit THEN
		hmiParameter.Ausstattung.LuftmngReglerFrischlVent1	:= FALSE;
		hmiParameter.Ausstattung.LuftmngReglerFrischlVent2	:= FALSE;
		hmiParameter.Ausstattung.LuftmngReglerUmluftVent1	:= FALSE;
		hmiParameter.Ausstattung.LuftmngReglerUmluftVent2	:= FALSE;
		hmiParameter.Ventilator1.LuftmengenregFrischluftEin	:= FALSE;
		hmiParameter.Ventilator1.LuftmengenregUmluftEin		:= FALSE;
		hmiParameter.Ventilator2.LuftmengenregFrischluftEin	:= FALSE;
		hmiParameter.Ventilator2.LuftmengenregUmluftEin		:= FALSE;
	END_IF
	
	//Schlechtwetterbetrieb: Option Auswahl Sensor zurücksetzen, wenn Sensor nicht in Ausstattung vorhanden
	IF ((hmiParameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert := 0;
	ELSIF ((hmiParameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert := 0;
	ELSIF ((hmiParameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert := 0;
	ELSIF ((hmiParameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert := 0;
	ELSIF ((hmiParameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert := 0;
	ELSIF ((hmiParameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert = 1) AND NOT hmiParameter.Ausstattung.SensorDachluft) OR
		((hmiParameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert = 2) AND NOT hmiParameter.Ausstattung.SensorTrockenluft) THEN
		hmiParameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert := 0;
	END_IF
	
	//Schlechtwetterbetrieb: Wenn kein Frischlufsensor vorhanden (nur Dachluft) -> Dachluftsensor auswählen
	IF (hmiParameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[1].AuswahlSensorGrenzwert := 1;
	END_IF
	IF (hmiParameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[2].AuswahlSensorGrenzwert := 1;
	END_IF
	IF (hmiParameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[3].AuswahlSensorGrenzwert := 1;
	END_IF
	IF (hmiParameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[4].AuswahlSensorGrenzwert := 1;
	END_IF
	IF (hmiParameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[5].AuswahlSensorGrenzwert := 1;
	END_IF
	IF (hmiParameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert = 0) AND NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiParameter.SchlechtwetterBoxen[6].AuswahlSensorGrenzwert := 1;
	END_IF
	
	
	//================================================================================================================================================================================================
	//Aktuelle Type auf Login-Seite anzeigen
	//================================================================================================================================================================================================

	hmiStatus.EntfeuchterType	:= hmiParameter.Entfeuchter.Type[hmiParameter.Entfeuchter.IndexType];	
	
	//===========================================================================================================================================================================================
	//Benutzerverwaltung
	//===========================================================================================================================================================================================
	
	//Passwortschutz
	//==============
	IF (Betriebsparameter.Allgemein.PasswortschutzAus = FALSE) THEN
		IF (hmiStatus.hmiPasswort = PASSWORT_KUNDE) OR (hmiStatus.hmiPasswort = PASSWORT_KUNDE_1) THEN
			hmiStatus.CurUserLevel  := EBENE_KUNDE;
		ELSIF (hmiStatus.hmiPasswort = PASSWORT_SERVICE) THEN
			hmiStatus.CurUserLevel	:= EBENE_SERVICE;
		ELSIF (hmiStatus.hmiPasswort = PASSWORT_LASCO) THEN
			hmiStatus.CurUserLevel  := EBENE_LASCO;
		ELSIF (hmiStatus.hmiPasswort = PASSWORT_ADMIN) OR (hmiStatus.hmiPasswort = PASSWORT_ADMIN_1) THEN
			hmiStatus.CurUserLevel  := EBENE_ADMIN;
		ELSE
			hmiStatus.CurUserLevel  := EBENE_SPERRE;
		END_IF
	ELSE
		IF (hmiStatus.hmiPasswort = PASSWORT_SERVICE) THEN
			hmiStatus.CurUserLevel	:= EBENE_SERVICE;
		ELSIF (hmiStatus.hmiPasswort = PASSWORT_LASCO) THEN
			hmiStatus.CurUserLevel  := EBENE_LASCO;
		ELSIF (hmiStatus.hmiPasswort = PASSWORT_ADMIN) OR (hmiStatus.hmiPasswort = PASSWORT_ADMIN_1) THEN
			hmiStatus.CurUserLevel  := EBENE_ADMIN;
		ELSE
			hmiStatus.CurUserLevel  := EBENE_KUNDE;
		END_IF
	END_IF

	//Aktuell verwendetes Passwort in globale Variable (für CSV)
	IF hmiStatus.hmiPasswort = PASSWORT_ADMIN THEN
		gAktuellesPasswort	:= 110588;
	ELSIF hmiStatus.hmiPasswort = PASSWORT_ADMIN_1 THEN
		gAktuellesPasswort	:= 81190;
	ELSIF hmiStatus.hmiPasswort = PASSWORT_KUNDE THEN
		gAktuellesPasswort	:= 4321;
	ELSIF hmiStatus.hmiPasswort = PASSWORT_KUNDE_1 THEN
		gAktuellesPasswort	:= 1234;
	ELSIF hmiStatus.hmiPasswort = PASSWORT_LASCO THEN
		gAktuellesPasswort	:= 21666;
	ELSIF hmiStatus.hmiPasswort = PASSWORT_SERVICE THEN
		gAktuellesPasswort	:= 8613;
	END_IF
	
	//Variable zum Sperren der Elemente, die nur als Admin geändert werden können
	hmiStatus.UserIstAdmin	:= (hmiStatus.CurUserLevel = EBENE_ADMIN);
	
       
	//Passwort- und Display- Timeout
	//==============================
       
	//Passwort-Timeout auf mind. 1 min setzen
	IF hmiParameter.Allgemein.LoginTimeout < 60 THEN
		hmiParameter.Allgemein.LoginTimeout := 60;
	END_IF
       
	//Passwort rücksetzen
	IF ((loc_TimePwReset >= hmiParameter.Allgemein.LoginTimeout) AND (hmiParameter.Allgemein.AutoLogoutEin)
		AND NOT (hmiParameter.Allgemein.PasswortschutzAus)) OR (hmiButtons.Logout) THEN 
		hmiStatus.hmiPasswort 		:= PASSWORT_SPERRE;
		loc_TimePwReset				:= 0;
		hmiActions.cmdChangePageTo	:= _001_LOGIN;
	ELSIF (hmiStatus.CurUserLevel <> EBENE_SPERRE) AND hmiParameter.Allgemein.AutoLogoutEin AND NOT 
		hmiParameter.Allgemein.PasswortschutzAus AND sekTick THEN
		loc_TimePwReset                   := loc_TimePwReset + 1;
	END_IF

	
	
	//===========================================================================================================================================================================================
	//Sichtbarkeit Allgemein
	//===========================================================================================================================================================================================

	//Box 1 - Box 6 ***********************************************
	IF hmiParameter.Ausstattung.Box1 THEN
		hmiVisibility.Allgemein.Box1 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box1 := ICON_HIDDEN;
	END_IF
	
	IF hmiParameter.Ausstattung.Box2 THEN
		hmiVisibility.Allgemein.Box2 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box2 := ICON_HIDDEN;
	END_IF
	
	IF hmiParameter.Ausstattung.Box3 THEN
		hmiVisibility.Allgemein.Box3 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box3 := ICON_HIDDEN;
	END_IF
	
	IF hmiParameter.Ausstattung.Box4 THEN
		hmiVisibility.Allgemein.Box4 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box4 := ICON_HIDDEN;
	END_IF
	
	IF hmiParameter.Ausstattung.Box5 THEN
		hmiVisibility.Allgemein.Box5 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box5 := ICON_HIDDEN;
	END_IF
	
	IF hmiParameter.Ausstattung.Box6 THEN
		hmiVisibility.Allgemein.Box6 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Box6 := ICON_HIDDEN;
	END_IF
	
	//Feld "Klappen" auf Übersicht ausblenden, wenn keine Klappen und Abluftventilator vorhanden
	IF NOT hmiParameter.Ausstattung.Abluftklappe AND NOT hmiParameter.Ausstattung.Abluftventilator AND NOT
		hmiParameter.Ausstattung.Bypassklappe AND NOT hmiParameter.Ausstattung.Umschaltklappe1 AND NOT hmiParameter.Ausstattung.Umschaltklappe2 THEN
		hmiVisibility.Allgemein.UebersichtKlappen := ICON_HIDDEN;
	ELSE
		hmiVisibility.Allgemein.UebersichtKlappen := ICON_VISIBLE;
	END_IF
	
	//Feld "Trocknungsgeräte" auf Übersicht ausblenden, wenn keine Trocknunggeräte vorhanden
	IF NOT hmiParameter.Ausstattung.Entfeuchter AND NOT hmiParameter.Ausstattung.Heizregister AND NOT
		hmiParameter.Ausstattung.Scheitholzofen AND NOT hmiParameter.Ausstattung.Warmluftofen AND NOT
		hmiParameter.Ausstattung.WarmluftofenBetriebsmldg AND NOT hmiParameter.Ausstattung.EntfeuchterFremd THEN
		hmiVisibility.Allgemein.UebersichtTrocknungsger := ICON_HIDDEN;
	ELSE
		hmiVisibility.Allgemein.UebersichtTrocknungsger := ICON_VISIBLE;
	END_IF
	
	//Ventilator 2 
	IF hmiParameter.Ausstattung.Ventilator2 THEN
		hmiVisibility.Allgemein.Ventilator2	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Ventilator2	:= ICON_HIDDEN;
	END_IF
	
	//Energiemessung 
	hmiVisibility.Allgemein.Energiemessung	:= BOOL_TO_USINT(NOT hmiParameter.Ausstattung.Energiemessung);
	
	//Fehlermeldung auf Übersicht
	IF (gStatusAnlage.Fehler.SummeFehler) THEN
		hmiVisibility.Layers.EbeneFehler := BOOL_TO_USINT(hmiBlink);
	ELSE
		hmiVisibility.Layers.EbeneFehler := ICON_HIDDEN;
	END_IF

	//Warnung auf Übersicht 
	IF gStatusAnlage.Fehler.SummeWarnung OR alarmSystem[FEHLER_IO_TEST_NICHT_FERTIG] OR alarmSystem[FEHLER_KOMMUNIKATION_DISPLAY_IO] THEN
		hmiVisibility.Layers.EbeneWarnung	:= BOOL_TO_USINT(hmiBlink);
	ELSE
		hmiVisibility.Layers.EbeneWarnung	:= ICON_HIDDEN;
	END_IF
	
	//Meldung Datum Falsch 
	IF (Echtzeit.Jahr < 2024) AND (NOT loc_MsgFalschesDatumAckn) THEN
		hmiVisibility.Layers.MldgDatumFalsch := ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.MldgDatumFalsch := ICON_HIDDEN;
	END_IF
	
	//Meldung Kontrolle Uhrzeit 
	IF (hmiNutzungsdaten.Serviceintervalle.KontrolleUhrzeitErforderlich AND NOT loc_MsgKontrUhrzeitAckn) THEN
		hmiVisibility.Layers.MldgKontrolleUhrzeit	:= ICON_VISIBLE;
	END_IF

	//Meldung Stockkontrolle auf Übersicht 
	IF (Echtzeit.Stunde = 12) AND (Echtzeit.Minute = 0) AND (Echtzeit.Sekunde = 0) AND gStatusAnlage.Betrieb THEN
		hmiVisibility.Layers.MldgStockkontrolle	:= ICON_VISIBLE;
	END_IF
	
	//Nach 1 Stunde Bestätigungen Uhrzeitkontrolle rücksetzen
	IF (stdTick) THEN
		loc_MsgFalschesDatumAckn	:= FALSE;
		loc_MsgKontrUhrzeitAckn		:= FALSE;
	END_IF

	//Elemente, die nur ab Ebene Service sichtbar sind
	IF (hmiStatus.CurUserLevel > EBENE_KUNDE) THEN
		hmiVisibility.Allgemein.EbeneService := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.EbeneService := ICON_HIDDEN;
	END_IF
       
	//Elemente, die nur in Ebene LASCO sichtbar sind
	IF (hmiStatus.CurUserLevel > EBENE_SERVICE) THEN
		hmiVisibility.Allgemein.EbeneLasco := ICON_VISIBLE;
	ELSE         
		hmiVisibility.Allgemein.EbeneLasco := ICON_HIDDEN;
	END_IF

	//Logout-Button
	IF (hmiParameter.Allgemein.PasswortschutzAus) THEN
		hmiVisibility.Buttons.LogoutButton := ICON_HIDDEN;
	ELSE
		hmiVisibility.Buttons.LogoutButton := ICON_VISIBLE;
	END_IF
	
	//Elemente, die nur in der Konfiguration HB4000 sichtbar sind
	IF (hmiStatus.NameSteuerung = 4) OR (hmiStatus.NameSteuerung = 5) THEN
		hmiVisibility.Allgemein.HB4000 := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.HB4000 := ICON_HIDDEN;
	END_IF
	
	//Elemente, die in der Konfiguration HB4000 nicht sichtbar sind
	IF (hmiStatus.NameSteuerung = 4) OR (hmiStatus.NameSteuerung = 5) THEN
		hmiVisibility.Allgemein.HB4000Hide := ICON_HIDDEN;
	ELSE
		hmiVisibility.Allgemein.HB4000Hide := ICON_VISIBLE;
	END_IF	
		
	
	//===============================================================================================================================================================================
	//Seitenwechsel über Software
	//===============================================================================================================================================================================
       
	//Auf Übersicht wechseln, wenn Passworteingabe ok
	IF (hmiStatus.CurPage = _001_LOGIN) AND (hmiStatus.CurUserLevel > EBENE_SPERRE) THEN
		hmiActions.cmdChangePageTo := _010_HM_UEBERSICHT;
	END_IF
       
	//Auf Loginseite wechseln, wenn Passwort ungültig
	IF (hmiStatus.CurUserLevel = EBENE_SPERRE) AND (hmiStatus.CurPage <> _000_INIT) AND (hmiStatus.CurPage <> _001_LOGIN)
		AND NOT hmiParameter.Allgemein.PasswortschutzAus THEN
		hmiActions.cmdChangePageTo := _001_LOGIN;
	END_IF
    
	//Nach Bestätigung des Sicherheitshinweises wechseln zu: 1.Login, wenn Passwortschutz, 2.Übersicht, wenn kein Passwortschutz
	IF (EDGEPOS(hmiButtons.SicherheitshinweisOk)) THEN
		IF (hmiParameter.Allgemein.PasswortschutzAus) THEN
			hmiActions.cmdChangePageTo := _010_HM_UEBERSICHT;
		ELSE
			hmiActions.cmdChangePageTo := _001_LOGIN;
		END_IF
	END_IF
    
	//Auf Alarmseite wechseln, wenn Fehler
	IF (hmiStatus.CurUserLevel <> EBENE_SPERRE) AND (hmiStatus.CurPage <> _000_INIT) AND 
		((EDGEPOS(gStatusAnlage.Fehler.SummeFehler)) OR (EDGEPOS(gStatusAnlage.Fehler.SummeWarnung))) THEN
		hmiActions.cmdChangePageTo        := _100_AL;
	END_IF
	
	
	
	//===========================================================================================================================================================================================
	//Detailansicht Sensoren
	//===========================================================================================================================================================================================
	
	//Detailansicht Ein/Ausblenden
	IF hmiButtons.showSensoren THEN
		hmiVisibility.Layers.DetailansichtSensoren	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtSensoren	:= ICON_HIDDEN;
	END_IF
	
	//Sensorwerte übergeben
	//**********************	
	hmiSensoren.FrischluftTemp			:= gStatusAnlage.FrischluftTemperatur;
	hmiSensoren.FrischluftFeuchte		:= gStatusAnlage.FrischluftFeuchte;
	hmiSensoren.FrischluftSattDefizit	:= gStatusAnlage.Berechnungen.FrischluftSattDefizit;
	
	hmiSensoren.DachluftTemp		:= gStatusAnlage.DachluftTemperatur;
	hmiSensoren.DachluftFeuchte		:= gStatusAnlage.DachluftFeuchte;
	hmiSensoren.DachluftSattDefizit	:= gStatusAnlage.Berechnungen.DachluftSattDefizit;
	
	hmiSensoren.TrockenluftTemp			:= gStatusAnlage.TrockenluftTemperatur;
	hmiSensoren.TrockenluftFeuchte		:= gStatusAnlage.TrockenluftFeuchte;
	hmiSensoren.TrockenluftSattDefizit	:= gStatusAnlage.Berechnungen.TrockenluftSattDefizit;
	
	hmiSensoren.AbluftTemp			:= gStatusAnlage.AbluftTemperatur;
	hmiSensoren.AbluftFeuchte		:= gStatusAnlage.AbluftFeuchte;
	hmiSensoren.AbluftSattDefizit	:= gStatusAnlage.Berechnungen.AbluftSattDefizit;
	
	hmiSensoren.EintrittTemp 	:= gStatusAnlage.EintrittTemperatur;
	hmiSensoren.EintrittFeuchte	:= gStatusAnlage.EintrittFeuchte;
	hmiSensoren.AustrittTemp	:= gStatusAnlage.AustrittTemperatur;
	hmiSensoren.AustrittFeuchte	:= gStatusAnlage.AustrittFeuchte;
	
	IF (doVentilator1Ein OR doVentilator2Ein) OR Boxen.EntfeuchterInselbetrieb  THEN
		hmiSensoren.KanaldruckmmH2O		:= gStatusAnlage.Berechnungen.Kanaldruck_mmWs;
		hmiSensoren.KanaldruckPa		:= gStatusAnlage.Kanaldruck;
	ELSE
		hmiSensoren.KanaldruckmmH2O		:= 0.0;
		hmiSensoren.KanaldruckPa		:= 0.0;
	END_IF
	
	IF (doVentilator1Ein OR doVentilator2Ein) OR Boxen.EntfeuchterInselbetrieb THEN
		hmiSensoren.Luftgeschwindigkeit	:= gStatusAnlage.Luftgeschwindigkeit;
		hmiSensoren.LuftmengeAktuell	:= gStatusAnlage.LuftmengeAktuell;
	ELSE
		hmiSensoren.Luftgeschwindigkeit	:= 0.0;
		hmiSensoren.LuftmengeAktuell	:= 0.0;
	END_IF
	
	
	hmiSensoren.NiederdruckModul1	:= gStatusAnlage.NiederdruckModul1;
	hmiSensoren.NiederdruckModul2	:= gStatusAnlage.NiederdruckModul2;
	hmiSensoren.HochdruckModul1		:= gStatusAnlage.HochdruckModul1;
	hmiSensoren.HochdruckModul2		:= gStatusAnlage.HochdruckModul2;
	
	
	//Abluftsensor
	IF hmiParameter.Ausstattung.SensorAbluft THEN
		hmiVisibility.Allgemein.Abluft	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Abluft	:= ICON_HIDDEN;
	END_IF
	
	//Dachluftsensor
	IF hmiParameter.Ausstattung.SensorDachluft THEN
		hmiVisibility.Allgemein.Dachluft	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Dachluft	:= ICON_HIDDEN;
	END_IF
	
	//Frischluftsensor
	IF hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiVisibility.Allgemein.Frischluft	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Frischluft	:= ICON_HIDDEN;
	END_IF
	
	//Kanaldruck
	IF hmiParameter.Ausstattung.SensorKanaldruck THEN
		hmiVisibility.Allgemein.Kanaldruck	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Kanaldruck	:= ICON_HIDDEN;
	END_IF
	
	//Luftgeschwindigkeit
	IF hmiParameter.Ausstattung.SensorLuftgeschwindigkeit THEN
		hmiVisibility.Allgemein.Luftgeschwindigkeit	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Luftgeschwindigkeit	:= ICON_HIDDEN;
	END_IF
	
	//Trockenluft
	IF hmiParameter.Ausstattung.SensorTrockenluft THEN
		hmiVisibility.Allgemein.Trockenluft	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Trockenluft	:= ICON_HIDDEN;
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Konfiguration Hauptübersicht Ventilatoren
	//===========================================================================================================================================================================================
	
	//Je nach Ausstattung Ebene mit 1 oder 2 Ventilatoren anzeigen
	IF hmiParameter.Ausstattung.Ventilator1 AND hmiParameter.Ausstattung.Ventilator2 THEN
		hmiVisibility.Layers.UebersichtZweiVentilatoren	:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtEinVentilator	:= ICON_HIDDEN;
	ELSE
		hmiVisibility.Layers.UebersichtZweiVentilatoren	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtEinVentilator	:= ICON_VISIBLE;
	END_IF
	
	
	//Aussehen von Bargraph/Icons + Übergabe Ist-Drehzahl VENTILATOR 1
	IF Aktoren.VentUndKlappen.FehlerFuVentilator1 THEN
		hmiStatus.Ventilator1.BargraphAktiv		:= ICON_HIDDEN;
		hmiStatus.Ventilator1.BargraphInaktiv	:= ICON_VISIBLE;
		hmiStatus.Ventilator1.FarbeDrehzahl		:= TEXT_HELLGRAU;
		hmiStatus.Ventilator1.FarbeIcon			:= ICON_ROT;
		hmiStatus.Ventilator1.IstDrehzahl		:= 0.0;
	ELSIF Aktoren.VentUndKlappen.FreigabeVentilator1Out THEN
		hmiStatus.Ventilator1.BargraphAktiv		:= ICON_VISIBLE;
		hmiStatus.Ventilator1.BargraphInaktiv	:= ICON_HIDDEN;
		hmiStatus.Ventilator1.FarbeDrehzahl		:= TEXT_GELB;
		hmiStatus.Ventilator1.FarbeIcon			:= ICON_GELB;
		hmiStatus.Ventilator1.IstDrehzahl		:= Aktoren.VentUndKlappen.DrehzahlVent1Out;
	ELSE
		hmiStatus.Ventilator1.BargraphAktiv		:= ICON_HIDDEN;
		hmiStatus.Ventilator1.BargraphInaktiv	:= ICON_VISIBLE;
		hmiStatus.Ventilator1.FarbeDrehzahl		:= TEXT_HELLGRAU;
		hmiStatus.Ventilator1.FarbeIcon			:= ICON_GRAU;
		hmiStatus.Ventilator1.IstDrehzahl		:= 0.0;
	END_IF
	

	//Aussehen von Bargraph/Icons + Übergabe Ist-Drehzahl VENTILATOR 2
	IF hmiParameter.Ausstattung.Ventilator2 THEN	
		IF Aktoren.VentUndKlappen.FehlerFuVentilator2 THEN
			hmiStatus.Ventilator2.BargraphAktiv		:= ICON_HIDDEN;
			hmiStatus.Ventilator2.BargraphInaktiv	:= ICON_VISIBLE;
			hmiStatus.Ventilator2.FarbeDrehzahl		:= TEXT_HELLGRAU;
			hmiStatus.Ventilator2.FarbeIcon			:= ICON_ROT;
			hmiStatus.Ventilator2.IstDrehzahl		:= 0.0;
		ELSIF Aktoren.VentUndKlappen.FreigabeVentilator2Out THEN
			hmiStatus.Ventilator2.BargraphAktiv		:= ICON_VISIBLE;
			hmiStatus.Ventilator2.BargraphInaktiv	:= ICON_HIDDEN;
			hmiStatus.Ventilator2.FarbeDrehzahl		:= TEXT_DUNKELGRAU;
			hmiStatus.Ventilator2.FarbeIcon			:= ICON_GELB;
			hmiStatus.Ventilator2.IstDrehzahl		:= Aktoren.VentUndKlappen.DrehzahlVent2Out;
		ELSE
			hmiStatus.Ventilator2.BargraphAktiv		:= ICON_HIDDEN;
			hmiStatus.Ventilator2.BargraphInaktiv	:= ICON_VISIBLE;
			hmiStatus.Ventilator2.FarbeDrehzahl		:= TEXT_HELLGRAU;
			hmiStatus.Ventilator2.FarbeIcon			:= ICON_GRAU;
			hmiStatus.Ventilator2.IstDrehzahl		:= 0.0;
		END_IF
	END_IF
	

	//===========================================================================================================================================================================================
	//Detailansicht Ventilatoren
	//===========================================================================================================================================================================================

	//Detailansicht Ventilatoren anzeigen
	IF hmiButtons.showVentilatoren THEN
		hmiVisibility.Layers.DetailansichtVentilatoren	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtVentilatoren	:= ICON_HIDDEN;
	END_IF
	
	//Tasten Drehzahlvorgabe Fix oder Luftmengenregelung VENTILATOR 1
	IF hmiParameter.Ausstattung.LuftmngReglerFrischlVent1 THEN
		hmiStatus.Ventilator1.LuftmengenregFrischlSperre	:= FALSE;
		IF hmiParameter.Ventilator1.LuftmengenregFrischluftEin THEN
			hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl	:= ICON_HIDDEN;
			hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl	:= ICON_VISIBLE;
		ELSE
			hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl	:= ICON_VISIBLE;
			hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl	:= ICON_HIDDEN;
		END_IF
	ELSE
		hmiParameter.Ventilator1.LuftmengenregFrischluftEin		:= FALSE;
		hmiStatus.Ventilator1.LuftmengenregFrischlSperre		:= TRUE;
		hmiStatus.Ventilator1.EingabefeldFixdrehzFrischl		:= ICON_VISIBLE;
		hmiStatus.Ventilator1.EingabefeldLuftmengeFrischl		:= ICON_HIDDEN;
	END_IF
	//Tasten und Eingabefelder Umluft nur einblenden, wenn Umluftklappen vorhanden
	IF hmiParameter.Ausstattung.Umschaltklappe1 OR hmiParameter.Ausstattung.Umschaltklappe2 THEN
		hmiStatus.Ventilator1.Umluftbetrieb := ICON_VISIBLE;
		IF hmiParameter.Ausstattung.LuftmngReglerUmluftVent1 THEN
			hmiStatus.Ventilator1.LuftmengenregUmluftSperre	:= FALSE;
			IF hmiParameter.Ventilator1.LuftmengenregUmluftEin THEN
				hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft		:= ICON_HIDDEN;
				hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft	:= ICON_VISIBLE;
			ELSE
				hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft		:= ICON_VISIBLE;
				hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft	:= ICON_HIDDEN;
			END_IF
		ELSE
			hmiParameter.Ventilator1.LuftmengenregUmluftEin		:= FALSE;
			hmiStatus.Ventilator1.LuftmengenregUmluftSperre		:= TRUE;
			hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft		:= ICON_VISIBLE;
			hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft	:= ICON_HIDDEN;
		END_IF
	ELSE
		hmiStatus.Ventilator1.EingabefeldFixdrehzUmluft	:= ICON_HIDDEN;
		hmiStatus.Ventilator1.EingabefeldLuftmengeUmluft := ICON_HIDDEN;
		hmiStatus.Ventilator1.Umluftbetrieb := ICON_HIDDEN;
	END_IF
	
		
	//Tasten Drehzahlvorgabe Fix oder Luftmengenregelung VENTILATOR 2
	IF hmiParameter.Ausstattung.Ventilator2 THEN
		IF hmiParameter.Ausstattung.SensorLuftgeschwindigkeit THEN
			hmiStatus.Ventilator2.Luftmenge := ICON_VISIBLE;
		ELSE
			hmiStatus.Ventilator2.Luftmenge := ICON_HIDDEN;
		END_IF
		IF hmiParameter.Ausstattung.LuftmngReglerFrischlVent2 THEN
			hmiStatus.Ventilator2.LuftmengenregFrischlSperre	:= FALSE;
			IF hmiParameter.Ventilator2.LuftmengenregFrischluftEin THEN
				hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl	:= ICON_HIDDEN;
				hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl	:= ICON_VISIBLE;
			ELSE
				hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl	:= ICON_VISIBLE;
				hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl	:= ICON_HIDDEN;
			END_IF
		ELSE
			hmiParameter.Ventilator2.LuftmengenregFrischluftEin		:= FALSE;
			hmiStatus.Ventilator2.LuftmengenregFrischlSperre		:= TRUE;
			hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl		:= ICON_VISIBLE;
			hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl		:= ICON_HIDDEN;
		END_IF
		//Tasten und Eingabefelder Umluft nur einblenden, wenn Umluftklappen vorhanden
		IF hmiParameter.Ausstattung.Umschaltklappe1 OR hmiParameter.Ausstattung.Umschaltklappe2 THEN
			hmiStatus.Ventilator2.Umluftbetrieb := ICON_VISIBLE;
			IF hmiParameter.Ausstattung.LuftmngReglerUmluftVent2 THEN
				hmiStatus.Ventilator2.LuftmengenregUmluftSperre	:= FALSE;
				IF hmiParameter.Ventilator2.LuftmengenregUmluftEin THEN
					hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft		:= ICON_HIDDEN;
					hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft	:= ICON_VISIBLE;
				ELSE
					hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft		:= ICON_VISIBLE;
					hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft	:= ICON_HIDDEN;
				END_IF
			ELSE
				hmiParameter.Ventilator2.LuftmengenregUmluftEin		:= FALSE;
				hmiStatus.Ventilator2.LuftmengenregUmluftSperre		:= TRUE;
				hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft		:= ICON_VISIBLE;
				hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft	:= ICON_HIDDEN;
			END_IF
		ELSE
			hmiStatus.Ventilator2.Umluftbetrieb := ICON_HIDDEN;
			hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft := ICON_HIDDEN;
			hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft := ICON_HIDDEN;
		END_IF	
	ELSE
		hmiStatus.Ventilator2.BargraphAktiv					:= ICON_HIDDEN;
		hmiStatus.Ventilator2.BargraphInaktiv				:= ICON_HIDDEN;
		hmiStatus.Ventilator2.EingabefeldFixdrehzFrischl	:= ICON_HIDDEN;
		hmiStatus.Ventilator2.EingabefeldFixdrehzUmluft		:= ICON_HIDDEN;
		hmiStatus.Ventilator2.EingabefeldLuftmengeFrischl	:= ICON_HIDDEN;
		hmiStatus.Ventilator2.EingabefeldLuftmengeUmluft	:= ICON_HIDDEN;
		hmiStatus.Ventilator2.Umluftbetrieb					:= ICON_HIDDEN;
		hmiStatus.Ventilator2.Luftmenge						:= ICON_HIDDEN;
	END_IF
	
	
	//Textanzeige "Frischluftbetrieb" & "Dachluftbetrieb" je nach Ausstattung umschalten
	IF hmiParameter.Ausstattung.SensorDachluft THEN
		hmiStatus.Ventilator1.TextFrischluftDachluft := 1;
		hmiStatus.Ventilator2.TextFrischluftDachluft := 1;
	ELSE
		hmiStatus.Ventilator1.TextFrischluftDachluft := 0;
		hmiStatus.Ventilator2.TextFrischluftDachluft := 0;
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Layer Inselbetrieb Entfeuchter
	//===========================================================================================================================================================================================

	//Ebene "Inselbetrieb Entfeuchter" einblenden, wenn kein Ventilator & Box in Ausstattung ausgewählt ist (Start/Stopp Entfeuchter über Fremdsteuerung).
	IF NOT hmiParameter.Ausstattung.Ventilator1 AND NOT hmiParameter.Ausstattung.Box1 THEN
		hmiVisibility.Layers.UebersichtInselbetrieb	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.UebersichtInselbetrieb	:= ICON_HIDDEN;
	END_IF
	
	//Taste "Entfeuchter aktivieren" darstellen (gesperrt, aus, oder ein)
	IF gCmdAnlage.FehlerModul1 OR gCmdAnlage.FehlerModul2 THEN
		hmiStatus.Entfeuchter.StatusButtonInselbetrieb := TASTE_ENTF_INSELBETR_GESPERRT;
		hmiActions.cmdInselbetriebEntfeuchterEin := FALSE;
	ELSIF hmiActions.cmdInselbetriebEntfeuchterEin THEN
		hmiStatus.Entfeuchter.StatusButtonInselbetrieb := TASTE_ENTF_INSELBETR_EIN;
	ELSE
		hmiStatus.Entfeuchter.StatusButtonInselbetrieb := TASTE_ENTF_INSELBETR_AUS;
	END_IF
	
	//Checkmark "Anforderung Extern" darstellen
	IF diAnfEntfeuchterExtern THEN
		hmiStatus.Entfeuchter.IconAnforderungExtern := ICON_GELB;
	ELSE
		hmiStatus.Entfeuchter.IconAnforderungExtern := ICON_GRAU;
	END_IF
	
	
	
	//===========================================================================================================================================================================================
	//Detailansicht Entfeuchter
	//===========================================================================================================================================================================================

	//Info einblenden, wenn Laufzeit Ölsumpfheizung nicht abgeschlossen
	IF gMindestlaufzOelsumpfOk THEN
		hmiVisibility.Allgemein.LaufzRestOelsumpf := ICON_HIDDEN;
	ELSE
		hmiVisibility.Allgemein.LaufzRestOelsumpf := BOOL_TO_USINT(hmiBlink2);
	END_IF
	
	//Restlaufzeit Ölsumpfheizung in Minuten anzeigen
	hmiStatus.Entfeuchter.RestlaufzeitOelsumpfh	:= (hmiParameter.Entfeuchter.RestzeitLaufzOelsumpf / 60000) + 1;
	
	
	//Wenn keine Betriebsart gewählt -> AUS
	IF NOT hmiParameter.Entfeuchter.Aus AND NOT hmiParameter.Entfeuchter.Dauerbetrieb AND NOT hmiParameter.Entfeuchter.Automatikbetrieb THEN
		hmiParameter.Entfeuchter.Aus	:= TRUE;
	END_IF
	
	//Ebene Detailansicht einblenden, wenn Icon auf Übersicht gedrückt wird
	IF hmiButtons.showEntfeuchter THEN
		hmiVisibility.Layers.DetailansichtEntfeuchter	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtEntfeuchter	:= ICON_HIDDEN;
	END_IF
	
	//Ebene Detailansicht Entfeuchter (Fremdgerät), wenn Icon auf Übersicht gedrückt wird
	IF hmiButtons.showEntfeuchterFremd THEN
		hmiVisibility.Layers.DetailansichtEntfeuchterFremd	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtEntfeuchterFremd	:= ICON_HIDDEN;
	END_IF
	
	//Bei Umschaltung Betriebsart -> restliche Betriebsarten ausschalten
	IF EDGEPOS(hmiParameter.Entfeuchter.Aus) THEN
		hmiParameter.Entfeuchter.Dauerbetrieb		:= FALSE;
		hmiParameter.Entfeuchter.Automatikbetrieb	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Entfeuchter.Dauerbetrieb) THEN
		hmiParameter.Entfeuchter.Aus				:= FALSE;
		hmiParameter.Entfeuchter.Automatikbetrieb	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Entfeuchter.Automatikbetrieb) THEN
		hmiParameter.Entfeuchter.Aus			:= FALSE;
		hmiParameter.Entfeuchter.Dauerbetrieb	:= FALSE;
	END_IF
	
	//Eingabefelder Grenzwerte EIN/AUS sperren, wenn nicht im Automatikbetrieb
	IF NOT hmiParameter.Entfeuchter.Automatikbetrieb THEN
		hmiStatus.Entfeuchter.EingabeFeuchteEinAusSperre	:= TRUE;
	ELSE
		hmiStatus.Entfeuchter.EingabeFeuchteEinAusSperre	:= FALSE;
	END_IF
	
	//Luftentfeuchter einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.Entfeuchter THEN
		hmiVisibility.Allgemein.Entfeuchter	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Entfeuchter	:= ICON_HIDDEN;
	END_IF
	
	//Kompressor Modul 2 einblenden, wenn in Ausstattung vorhanden
	IF gModul2Vorhanden AND hmiParameter.Ausstattung.Entfeuchter THEN
		hmiVisibility.Allgemein.KompressorModul2	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.KompressorModul2	:= ICON_HIDDEN;
	END_IF
	
	//Statusanzeige
	IF hmiParameter.Ausstattung.Entfeuchter THEN
		hmiStatus.Entfeuchter.Status	:= gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1];
	ELSIF hmiParameter.Ausstattung.EntfeuchterFremd THEN
		hmiStatus.Entfeuchter.Status	:= gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD];
	END_IF
	hmiStatus.Entfeuchter.IstDrehzahlKompressor1	:= Aktoren.KompressorModul1.DrehzahlOut;
	hmiStatus.Entfeuchter.IstDrehzahlKompressor2	:= Aktoren.KompressorModul2.DrehzahlOut;
	
	IF hmiStatus.Entfeuchter.Status = STATUS_AKTIV THEN
		hmiStatus.Entfeuchter.FarbeTextStatus	:= TEXT_DUNKELGRAU;
		hmiStatus.Entfeuchter.StatusfeldAktiv	:= ICON_VISIBLE;
		hmiStatus.Entfeuchter.StatusfeldInaktiv	:= ICON_HIDDEN;
		hmiStatus.Entfeuchter.IconAbtauung		:= ICON_HIDDEN;
	ELSIF hmiStatus.Entfeuchter.Status = STATUS_STOERUNG THEN
		hmiStatus.Entfeuchter.FarbeTextStatus	:= TEXT_HELLGRAU;
		hmiStatus.Entfeuchter.StatusfeldAktiv	:= ICON_HIDDEN;
		hmiStatus.Entfeuchter.StatusfeldInaktiv	:= ICON_VISIBLE;
		hmiStatus.Entfeuchter.IconAbtauung		:= ICON_HIDDEN;
	ELSIF hmiStatus.Entfeuchter.Status = STATUS_ENTF_STANDBY THEN
		hmiStatus.Entfeuchter.FarbeTextStatus	:= TEXT_HELLGRAU;
		hmiStatus.Entfeuchter.StatusfeldAktiv	:= ICON_HIDDEN;
		hmiStatus.Entfeuchter.StatusfeldInaktiv	:= ICON_VISIBLE;
		hmiStatus.Entfeuchter.IconAbtauung 		:= ICON_HIDDEN;
	ELSIF hmiStatus.Entfeuchter.Status = STATUS_ENTF_ABTAUUNG THEN
		hmiStatus.Entfeuchter.FarbeTextStatus	:= TEXT_DUNKELGRAU;
		hmiStatus.Entfeuchter.StatusfeldAktiv	:= ICON_VISIBLE;
		hmiStatus.Entfeuchter.StatusfeldInaktiv	:= ICON_HIDDEN;
		IF hmiBlink THEN
			hmiStatus.Entfeuchter.IconAbtauung := ICON_VISIBLE;
		ELSE
			hmiStatus.Entfeuchter.IconAbtauung := ICON_HIDDEN;
		END_IF 
	ELSE
		hmiStatus.Entfeuchter.FarbeTextStatus	:= TEXT_HELLGRAU;
		hmiStatus.Entfeuchter.StatusfeldAktiv	:= ICON_HIDDEN;
		hmiStatus.Entfeuchter.StatusfeldInaktiv	:= ICON_VISIBLE;
		hmiStatus.Entfeuchter.IconAbtauung 		:= ICON_HIDDEN;
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Detailansicht Warmluftofen & Scheitholzofen
	//===========================================================================================================================================================================================

	//Ebene Detailansicht einblenden, wenn Icon auf Übersicht gedrückt wird
	IF hmiButtons.showOfen THEN
		hmiVisibility.Layers.DetailansichtOfen	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtOfen	:= ICON_HIDDEN;
	END_IF
	
	//Wenn keine Betriebsart gewählt -> AUS
	IF NOT hmiParameter.Warmluftofen.Aus AND NOT hmiParameter.Warmluftofen.DauerbetriebEin AND NOT hmiParameter.Warmluftofen.AutomatikbetriebEin THEN
		hmiParameter.Warmluftofen.Aus	:= TRUE;
	END_IF
	
	//Bei Umschaltung Betriebsart -> restliche Betriebsarten ausschalten
	IF EDGEPOS(hmiParameter.Warmluftofen.Aus) THEN
		hmiParameter.Warmluftofen.DauerbetriebEin		:= FALSE;
		hmiParameter.Warmluftofen.AutomatikbetriebEin	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Warmluftofen.DauerbetriebEin) THEN
		hmiParameter.Warmluftofen.Aus					:= FALSE;
		hmiParameter.Warmluftofen.AutomatikbetriebEin	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Warmluftofen.AutomatikbetriebEin) THEN
		hmiParameter.Warmluftofen.Aus				:= FALSE;
		hmiParameter.Warmluftofen.DauerbetriebEin	:= FALSE;
	END_IF
	
	//Textindex Überschrift je nach Ausstattung anpassen
	//0= Warmluftofen, 1= Scheitholzofen, 2= Warmluftofen & Scheitholzofen
	IF hmiParameter.Ausstattung.Warmluftofen AND hmiParameter.Ausstattung.Scheitholzofen THEN
		hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift	:= 2;
	ELSIF hmiParameter.Ausstattung.Scheitholzofen THEN
		hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift	:= 1;
	ELSE
		hmiStatus.WarmluftScheitholzofen.TextindexUeberschrift	:= 0;
	END_IF
	
	//Eingabefeld Schaltpunkt Sättigung EIN/AUS sperren, wenn nicht im Automatikbetrieb
	IF NOT hmiParameter.Warmluftofen.AutomatikbetriebEin THEN
		hmiStatus.WarmluftScheitholzofen.EingabeSattDefizitSperre	:= TRUE;
	ELSE
		hmiStatus.WarmluftScheitholzofen.EingabeSattDefizitSperre	:= FALSE;
	END_IF
	
	//Brandschutzklappe einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.Brandschutzklappe THEN
		hmiVisibility.Allgemein.Brandschutzklappe	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Brandschutzklappe	:= ICON_HIDDEN;
	END_IF
	
	//Status Scheitholzofen einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.Scheitholzofen THEN
		hmiVisibility.Allgemein.Scheitholzofen	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Scheitholzofen	:= ICON_HIDDEN;
	END_IF
	
	//Elemente für Warmluftofen einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.Warmluftofen THEN
		hmiVisibility.Allgemein.Warmluftofen := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Warmluftofen := ICON_HIDDEN;
	END_IF
	

	//Temperaturvorgabe Warmluftofen einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.WarmluftofenTempVorgabe THEN
		hmiVisibility.Allgemein.TemperaturvorgWarmluftofen	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.TemperaturvorgWarmluftofen	:= ICON_HIDDEN;
	END_IF
	
	//Statusanzeige Warmluftofen
	IF hmiParameter.Ausstattung.Warmluftofen THEN
		hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen	:= gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN];
		IF hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen = STATUS_AKTIV THEN
			hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo		:= TEXT_DUNKELGRAU;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_VISIBLE;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_HIDDEN;
		ELSIF hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen = STATUS_STOERUNG THEN
			hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo		:= TEXT_HELLGRAU;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_HIDDEN;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_VISIBLE;
		ELSIF hmiStatus.WarmluftScheitholzofen.StatusWarmluftofen = STATUS_AUSKUEHLPHASE THEN
			IF hmiBlink THEN	
				hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo		:= TEXT_HELLGRAU;
				hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_HIDDEN;
				hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_VISIBLE;
			ELSE
				hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo		:= TEXT_DUNKELGRAU;
				hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_VISIBLE;
				hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_HIDDEN;
			END_IF
		ELSE
			hmiStatus.WarmluftScheitholzofen.FarbeStatustextWlo		:= TEXT_HELLGRAU;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_HIDDEN;
			hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.WarmluftScheitholzofen.StatusfeldWloAktiv		:= ICON_HIDDEN;
		hmiStatus.WarmluftScheitholzofen.StatusfeldWloInaktiv	:= ICON_HIDDEN;
	END_IF
	
	//Statusanzeige Scheitholzofen
	IF Betriebsparameter.Ausstattung.Scheitholzofen THEN
		hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen	:= gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN];
		IF hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen = STATUS_AKTIV THEN
			hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho		:= TEXT_DUNKELGRAU;
			hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv		:= ICON_VISIBLE;
			hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv	:= ICON_HIDDEN;
		ELSIF hmiStatus.WarmluftScheitholzofen.StatusScheitholzofen = STATUS_AUSKUEHLPHASE THEN
			IF hmiBlink THEN	
				hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho		:= TEXT_HELLGRAU;
				hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv		:= ICON_HIDDEN;
				hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv	:= ICON_VISIBLE;
			ELSE
				hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho		:= TEXT_DUNKELGRAU;
				hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv		:= ICON_VISIBLE;
				hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv	:= ICON_HIDDEN;
			END_IF
		ELSE
			hmiStatus.WarmluftScheitholzofen.FarbeStatustextSho		:= TEXT_HELLGRAU;
			hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv		:= ICON_HIDDEN;
			hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.WarmluftScheitholzofen.StatusfeldShoAktiv		:= ICON_HIDDEN;
		hmiStatus.WarmluftScheitholzofen.StatusfeldShoInaktiv	:= ICON_HIDDEN;
	END_IF
	
	//Statusanzeige Brandschutzklappe
	IF hmiParameter.Ausstattung.Brandschutzklappe THEN
		hmiStatus.Brandschutzklappe.Status	:= gStatusAnlage.Aktor[AKTOR_BRANDSCHUTZKLAPPE];
		IF hmiStatus.Brandschutzklappe.Status = STATUS_OFFEN THEN
			hmiStatus.Brandschutzklappe.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Brandschutzklappe.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Brandschutzklappe.StatusfeldInaktiv	:= ICON_HIDDEN;
		ELSE
			hmiStatus.Brandschutzklappe.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Brandschutzklappe.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Brandschutzklappe.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Brandschutzklappe.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Brandschutzklappe.StatusfeldInaktiv	:= ICON_HIDDEN;
	END_IF
	
		
	//===========================================================================================================================================================================================
	//Detailansicht Heizregister
	//===========================================================================================================================================================================================

	//Wenn keine Betriebsart gewählt -> AUS
	IF NOT hmiParameter.Heizregister.Aus AND NOT hmiParameter.Heizregister.DauerbetriebEin AND NOT hmiParameter.Heizregister.AutomatikbetriebEin THEN
		hmiParameter.Heizregister.Aus	:= TRUE;
	END_IF
	
	//Ebene Detailansicht einblenden, wenn Icon auf Übersicht gedrückt wird
	IF hmiButtons.showHeizregister THEN
		hmiVisibility.Layers.DetailansichtRegister	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtRegister	:= ICON_HIDDEN;
	END_IF
	
	//Bei Umschaltung Betriebsart -> restliche Betriebsarten ausschalten
	IF EDGEPOS(hmiParameter.Heizregister.Aus) THEN
		hmiParameter.Heizregister.DauerbetriebEin		:= FALSE;
		hmiParameter.Heizregister.AutomatikbetriebEin	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Heizregister.DauerbetriebEin) THEN
		hmiParameter.Heizregister.Aus					:= FALSE;
		hmiParameter.Heizregister.AutomatikbetriebEin	:= FALSE;
	ELSIF EDGEPOS(hmiParameter.Heizregister.AutomatikbetriebEin) THEN
		hmiParameter.Heizregister.Aus				:= FALSE;
		hmiParameter.Heizregister.DauerbetriebEin	:= FALSE;
	END_IF
	
	//Eingabefeld Schaltpunkt Frischluft Sättigung sperren, wenn nicht im Automatikbetrieb
	IF NOT hmiParameter.Heizregister.AutomatikbetriebEin THEN
		hmiStatus.Heizregister.EingabeSattDefizitSperre	:= TRUE;
	ELSE
		hmiStatus.Heizregister.EingabeSattDefizitSperre	:= FALSE;
	END_IF
	
	//Vorgabe Trockenluft-Temperatur einblenden, wenn in Ausstattung vorhanden
	IF hmiParameter.Ausstattung.HeizregisterDrehzahlvorgabe THEN
		hmiVisibility.Allgemein.TemperaturvorgHeizregister	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.TemperaturvorgHeizregister	:= ICON_HIDDEN;
	END_IF
	
	//Statusanzeige
	hmiStatus.Heizregister.Status		:= gStatusAnlage.Aktor[AKTOR_HEIZREGISTER];
	hmiStatus.Heizregister.IstDrehzahl	:= Aktoren.Heizregister.DrehzahlHeizregisterOut;
	IF hmiStatus.Heizregister.Status = STATUS_AKTIV THEN
		hmiStatus.Heizregister.FarbeStatustext		:= TEXT_DUNKELGRAU;
		hmiStatus.Heizregister.StatusfeldAktiv		:= ICON_VISIBLE;
		hmiStatus.Heizregister.StatusfeldInaktiv	:= ICON_HIDDEN;
	ELSIF hmiStatus.Heizregister.Status = STATUS_STOERUNG THEN
		hmiStatus.Heizregister.FarbeStatustext		:= TEXT_HELLGRAU;
		hmiStatus.Heizregister.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Heizregister.StatusfeldInaktiv	:= ICON_VISIBLE;
	ELSE
		hmiStatus.Heizregister.FarbeStatustext		:= TEXT_HELLGRAU;
		hmiStatus.Heizregister.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Heizregister.StatusfeldInaktiv	:= ICON_VISIBLE;
	END_IF
	
	
	
	
	//===========================================================================================================================================================================================
	//Detailansicht Klappen Luftführung
	//===========================================================================================================================================================================================
	
	//Ebene Detailansicht einblenden, wenn Icon auf Übersicht gedrückt wird
	IF hmiButtons.showKlappen THEN
		hmiVisibility.Layers.DetailansichtKlappen	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Layers.DetailansichtKlappen	:= ICON_HIDDEN;
	END_IF
	
	
	//Umluftklappen ***************************************************************************************
	
	//Umschaltklappen Sichtbarkeit je nach Ausstattung
	IF hmiParameter.Ausstattung.Umschaltklappe1 OR hmiParameter.Ausstattung.Umschaltklappe2 THEN
		hmiVisibility.Allgemein.Umschaltklappen	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Umschaltklappen	:= ICON_HIDDEN;
	END_IF

	//Eingabefelder Umschaltpunkte Frischluft/Umluft sperren, wenn nicht im Automatikbetrieb
	IF (hmiStatus.Umluftklappen.IndexBetriebsart = 0) THEN
		hmiStatus.Umluftklappen.EingabeTempDifferenzSperre		:= FALSE;
		hmiStatus.Umluftklappen.EingabeTempSchaltpunktSperre	:= FALSE;
	ELSE
		hmiStatus.Umluftklappen.EingabeTempDifferenzSperre		:= TRUE;
		hmiStatus.Umluftklappen.EingabeTempSchaltpunktSperre	:= TRUE;
	END_IF
	
	//Kunde Gschneitner: die Umluftklappen sind die Warmluft-/Kaltluftumschaltung, eine witterungsgefuehrte
	//Umschaltung darf es nicht geben. Die Betriebsart wird deshalb fest auf Frischluft gestellt, auch wenn die
	//Umschaltklappen in der Ausstattung aktiviert sind (noetig fuer die HMI-Ansichten der Klappen).
	//Folge: gStatusAnlage.FrischluftbetriebAktiv ist immer TRUE, gStatusAnlage.UmluftbetriebAktiv immer FALSE.
	hmiParameter.Umschaltklappen.Automatik		:= FALSE;
	hmiParameter.Umschaltklappen.Frischluft		:= TRUE;
	hmiParameter.Umschaltklappen.Umluft			:= FALSE;
	hmiStatus.Umluftklappen.IndexBetriebsart	:= 1;
	hmiStatus.Umluftklappen.TextindexButton		:= 1;
	
	//Betriebsart Umluftklappen umschalten (Automatik, Frischluft, Umluft) inkl. Verzögerungszeit
	//0= Automatik, 1= Frischluft, 2= Umluft
	//Kunde Gschneitner, keine Umluftklappenlogik aktiv, mit den HMI Buttons wird direkt der Ausgang der Klappe geschaltet!
	(*
	TOF_VerzUmschaltungUmluftkl(IN:= (EDGEPOS(hmiButtons.changeWarmluftVent1)), PT:= hmiParameter.Allgemein.VerzoegerungAenderungKlappen);
	IF hmiButtons.changeWarmluftVent1 THEN
		hmiButtons.changeWarmluftVent1 := FALSE;
		IF hmiStatus.Umluftklappen.IndexBetriebsart < 2 THEN
			hmiStatus.Umluftklappen.IndexBetriebsart := hmiStatus.Umluftklappen.IndexBetriebsart + 1;
		ELSE
			hmiStatus.Umluftklappen.IndexBetriebsart := 0;
		END_IF
	END_IF
	IF EDGENEG(TOF_VerzUmschaltungUmluftkl.Q) THEN
		IF hmiStatus.Umluftklappen.IndexBetriebsart = 0 THEN
			hmiParameter.Umschaltklappen.Automatik	:= TRUE;
			hmiParameter.Umschaltklappen.Frischluft	:= FALSE;
			hmiParameter.Umschaltklappen.Umluft		:= FALSE;
		ELSIF hmiStatus.Umluftklappen.IndexBetriebsart = 1 THEN
			hmiParameter.Umschaltklappen.Automatik	:= FALSE;
			hmiParameter.Umschaltklappen.Frischluft	:= TRUE;
			hmiParameter.Umschaltklappen.Umluft		:= FALSE;
		ELSIF hmiStatus.Umluftklappen.IndexBetriebsart = 2 THEN
			hmiParameter.Umschaltklappen.Automatik	:= FALSE;
			hmiParameter.Umschaltklappen.Frischluft	:= FALSE;
			hmiParameter.Umschaltklappen.Umluft		:= TRUE;
		END_IF
	END_IF

	//Textindex Button je nach Betriebsart und Ausstattung umschalten
	//0= Automatik, 1= Frischluft, 2= Dachluft, 3= Umluft
	IF hmiStatus.Umluftklappen.IndexBetriebsart = 0 THEN
		hmiStatus.Umluftklappen.TextindexButton	:= 0;
	ELSIF hmiStatus.Umluftklappen.IndexBetriebsart = 1 THEN
		IF hmiParameter.Ausstattung.SensorDachluft THEN
			hmiStatus.Umluftklappen.TextindexButton := 2;
		ELSE
			hmiStatus.Umluftklappen.TextindexButton	:= 1;
		END_IF
	ELSIF hmiStatus.Umluftklappen.IndexBetriebsart = 2 THEN
		hmiStatus.Umluftklappen.TextindexButton	:= 3;
	END_IF
	
	//Eingabefelder max. Temperaturdifferenz/Temperatur Umschaltung je nach Ausstattung ein/ausblenden
	IF hmiParameter.Ausstattung.Umschaltklappe1 OR hmiParameter.Ausstattung.Umschaltklappe2 THEN
		IF hmiParameter.Ausstattung.SensorAbluft AND (hmiParameter.Ausstattung.SensorDachluft OR hmiParameter.Ausstattung.SensorFrischluft) THEN
			hmiStatus.Umluftklappen.EingabefeldTempDifferenz	:= ICON_VISIBLE;
			hmiStatus.Umluftklappen.EingabefeldTempUmschaltung	:= ICON_HIDDEN;
		ELSE
			hmiStatus.Umluftklappen.EingabefeldTempDifferenz	:= ICON_HIDDEN;
			hmiStatus.Umluftklappen.EingabefeldTempUmschaltung	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Umluftklappen.EingabefeldTempDifferenz	:= ICON_HIDDEN;
		hmiStatus.Umluftklappen.EingabefeldTempUmschaltung	:= ICON_HIDDEN;
	END_IF
	
	//Textindex Eingabefeld Umschaltpunkt je nach Ausstattung
	//0= Max. Temperaturdifferenz Abluft/Dachluft
	//1= Max. Temperaturdifferenz Abluft/Frischluft
	//2= Dachlufttemperatur Umschaltung
	//3= Frischlufttemperatur Umschaltung
	IF hmiParameter.Ausstattung.SensorAbluft AND hmiParameter.Ausstattung.SensorDachluft THEN
		hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt	:= 0;
	ELSIF hmiParameter.Ausstattung.SensorAbluft AND hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt	:= 1;
	ELSIF hmiParameter.Ausstattung.SensorDachluft THEN
		hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt	:= 2;
	ELSE
		hmiStatus.Umluftklappen.TextindexEingabeUmschaltpunkt	:= 3;
	END_IF
	
	//Statusanzeige
	IF hmiParameter.Ausstattung.Umschaltklappe1 OR hmiParameter.Ausstattung.Umschaltklappe2 THEN
		IF (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1] = STATUS_AKTIV) OR (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2] = STATUS_AKTIV) THEN
			hmiStatus.Umluftklappen.Status				:= STATUS_AKTIV;
			hmiStatus.Umluftklappen.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Umluftklappen.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Umluftklappen.StatusfeldInaktiv	:= ICON_HIDDEN;
		ELSIF (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1] = STATUS_OFFEN) THEN
			hmiStatus.Umluftklappen.Status				:= STATUS_KLAPPE_UMLUFT;
			hmiStatus.Umluftklappen.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Umluftklappen.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Umluftklappen.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1] = STATUS_GESCHLOSSEN) THEN
			hmiStatus.Umluftklappen.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Umluftklappen.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Umluftklappen.StatusfeldInaktiv	:= ICON_VISIBLE;
			IF hmiParameter.Ausstattung.SensorDachluft THEN
				hmiStatus.Umluftklappen.Status	:= STATUS_KLAPPE_DACHLUFT;
			ELSE
				hmiStatus.Umluftklappen.Status	:= STATUS_KLAPPE_FRISCHLUFT;
			END_IF
		ELSIF (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_1] = STATUS_STOERUNG) OR (gStatusAnlage.Aktor[AKTOR_UMSCHALTKLAPPE_2] = STATUS_STOERUNG) THEN
			hmiStatus.Umluftklappen.Status				:= STATUS_STOERUNG;
			hmiStatus.Umluftklappen.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Umluftklappen.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Umluftklappen.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Umluftklappen.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Umluftklappen.StatusfeldInaktiv	:= ICON_HIDDEN;
	END_IF
	
			*)
		
	//Abluftventilator ***************************************************************************************
	
	//Sichtbarkeit je nach Ausstattung
	IF hmiParameter.Ausstattung.Abluftventilator THEN
		hmiVisibility.Allgemein.Abluftventilator := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Abluftventilator := ICON_HIDDEN;
	END_IF

	//Eingabefeld max. Abluft-Feuchte sperren, wenn nicht im Automatikbetrieb
	IF (hmiStatus.Abluftventilator.IndexBetriebsart = 0) THEN
		hmiStatus.Abluftventilator.EingabeMaxAbluftfeuchteSperre := FALSE;
	ELSE
		hmiStatus.Abluftventilator.EingabeMaxAbluftfeuchteSperre := TRUE;
	END_IF
	
	//Betriebsart umschalten (Automatik, Ein, Aus) inkl. Verzögerungszeit
	//0= Automatik, 1= Ein, 2= Aus
	TOF_VerzUmschaltungAbluftvent(IN:= (EDGEPOS(hmiButtons.changeBetrArtAbluftvent)), PT:= hmiParameter.Allgemein.VerzoegerungAenderungKlappen);
	IF hmiButtons.changeBetrArtAbluftvent THEN
		hmiButtons.changeBetrArtAbluftvent := FALSE;
		IF hmiStatus.Abluftventilator.IndexBetriebsart < 2 THEN
			hmiStatus.Abluftventilator.IndexBetriebsart := hmiStatus.Abluftventilator.IndexBetriebsart + 1;
		ELSE
			hmiStatus.Abluftventilator.IndexBetriebsart := 0;
		END_IF
	END_IF
	hmiStatus.Abluftventilator.TextindexButton	:= hmiStatus.Abluftventilator.IndexBetriebsart;
	IF EDGENEG(TOF_VerzUmschaltungAbluftvent.Q) THEN
		IF hmiStatus.Abluftventilator.IndexBetriebsart = 0 THEN
			hmiParameter.Abluftventilator.Automatik	:= TRUE;
			hmiParameter.Abluftventilator.Ein		:= FALSE;
		ELSIF hmiStatus.Abluftventilator.IndexBetriebsart = 1 THEN
			hmiParameter.Abluftventilator.Automatik	:= FALSE;
			hmiParameter.Abluftventilator.Ein		:= TRUE;
		ELSIF hmiStatus.Abluftventilator.IndexBetriebsart = 2 THEN
			hmiParameter.Abluftventilator.Automatik	:= FALSE;
			hmiParameter.Abluftventilator.Ein		:= FALSE;
		END_IF
	END_IF
		
	//Statusanzeige
	hmiStatus.Abluftventilator.Status	:= gStatusAnlage.Aktor[AKTOR_ABLUFTVENTILATOR];
	IF hmiParameter.Ausstattung.Abluftventilator THEN
		IF hmiStatus.Abluftventilator.Status = STATUS_AKTIV THEN
			hmiStatus.Abluftventilator.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Abluftventilator.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Abluftventilator.StatusfeldInaktiv	:= ICON_HIDDEN;	
		ELSE
			hmiStatus.Abluftventilator.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Abluftventilator.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Abluftventilator.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Abluftventilator.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Abluftventilator.StatusfeldInaktiv	:= ICON_HIDDEN;
	END_IF
	
	
	//Abluftklappe ***************************************************************************************
	
	//Sichtbarkeit je nach Ausstattung
	IF hmiParameter.Ausstattung.Abluftklappe THEN
		hmiVisibility.Allgemein.Abluftklappe := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Abluftklappe := ICON_HIDDEN;
	END_IF

	//Eingabefeld max. Abluft-Feuchte sperren, wenn nicht im Automatikbetrieb
	IF (hmiStatus.Abluftklappe.IndexBetriebsart = 0) THEN
		hmiStatus.Abluftklappe.EingabeMaxAbluftfeuchteSperre := FALSE;
	ELSE
		hmiStatus.Abluftklappe.EingabeMaxAbluftfeuchteSperre := TRUE;
	END_IF
	
	//Betriebsart umschalten (Automatik, Auf, Zu) inkl. Verzögerungszeit
	//0= Automatik, 1= Auf, 2= Zu
	TOF_VerzUmschaltungAbluftklappe(IN:= (EDGEPOS(hmiButtons.changeBetrArtAbluftklappe)), PT:= hmiParameter.Allgemein.VerzoegerungAenderungKlappen);
	IF hmiButtons.changeBetrArtAbluftklappe THEN
		hmiButtons.changeBetrArtAbluftklappe := FALSE;
		IF hmiStatus.Abluftklappe.IndexBetriebsart < 2 THEN
			hmiStatus.Abluftklappe.IndexBetriebsart := hmiStatus.Abluftklappe.IndexBetriebsart + 1;
		ELSE
			hmiStatus.Abluftklappe.IndexBetriebsart := 0;
		END_IF
	END_IF
	hmiStatus.Abluftklappe.TextindexButton	:= hmiStatus.Abluftklappe.IndexBetriebsart;
	IF EDGENEG(TOF_VerzUmschaltungAbluftklappe.Q) THEN
		IF hmiStatus.Abluftklappe.IndexBetriebsart = 0 THEN
			hmiParameter.Abluftklappe.Automatik		:= TRUE;
			hmiParameter.Abluftklappe.Oeffnen		:= FALSE;
			hmiParameter.Abluftklappe.Schliessen	:= FALSE;
		ELSIF hmiStatus.Abluftklappe.IndexBetriebsart = 1 THEN
			hmiParameter.Abluftklappe.Automatik		:= FALSE;
			hmiParameter.Abluftklappe.Oeffnen		:= TRUE;
			hmiParameter.Abluftklappe.Schliessen	:= FALSE;
		ELSIF hmiStatus.Abluftklappe.IndexBetriebsart = 2 THEN
			hmiParameter.Abluftklappe.Automatik		:= FALSE;
			hmiParameter.Abluftklappe.Oeffnen		:= FALSE;
			hmiParameter.Abluftklappe.Schliessen	:= TRUE;
		END_IF
	END_IF
		
	//Statusanzeige	
	hmiStatus.Abluftklappe.Status	:= gStatusAnlage.Aktor[AKTOR_ABLUFTKLAPPE];
	IF hmiParameter.Ausstattung.Abluftklappe THEN
		IF hmiStatus.Abluftklappe.Status = STATUS_AKTIV THEN
			hmiStatus.Abluftklappe.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Abluftklappe.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Abluftklappe.StatusfeldInaktiv	:= ICON_HIDDEN;	
		ELSE
			hmiStatus.Abluftklappe.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Abluftklappe.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Abluftklappe.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Abluftklappe.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Abluftklappe.StatusfeldInaktiv	:= ICON_HIDDEN;
	END_IF
	
	
	//Bypassklappe ***************************************************************************************
	
	//Sichtbarkeit je nach Ausstattung
	IF hmiParameter.Ausstattung.Bypassklappe THEN
		hmiVisibility.Allgemein.Bypassklappe := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.Bypassklappe := ICON_HIDDEN;
	END_IF
	
	//Betriebsart umschalten (Automatik, Auf, Zu) inkl. Verzögerungszeit
	//0= Automatik, 1= Auf, 2= Zu
	//Kunde Gschneitner, keine Umluftklappenlogik aktiv, mit den HMI Buttons wird direkt der Ausgang der Klappe geschaltet!
	(*
	TOF_VerzUmschaltungBypassklappe(IN:= (EDGEPOS(hmiButtons.changeWarmluftVent2)), PT:= hmiParameter.Allgemein.VerzoegerungAenderungKlappen);
	IF hmiButtons.changeWarmluftVent2 THEN
		hmiButtons.changeWarmluftVent2 := FALSE;
		IF hmiStatus.Bypassklappe.IndexBetriebsart < 2 THEN
			hmiStatus.Bypassklappe.IndexBetriebsart := hmiStatus.Bypassklappe.IndexBetriebsart + 1;
		ELSE
			hmiStatus.Bypassklappe.IndexBetriebsart := 0;
		END_IF
	END_IF
	hmiStatus.Bypassklappe.TextindexButton	:= hmiStatus.Bypassklappe.IndexBetriebsart;
	IF EDGENEG(TOF_VerzUmschaltungBypassklappe.Q) THEN
		IF hmiStatus.Bypassklappe.IndexBetriebsart = 0 THEN
			hmiParameter.Bypassklappe.Automatik		:= TRUE;
			hmiParameter.Bypassklappe.Oeffnen		:= FALSE;
			hmiParameter.Bypassklappe.Schliessen	:= FALSE;
		ELSIF hmiStatus.Bypassklappe.IndexBetriebsart = 1 THEN
			hmiParameter.Bypassklappe.Automatik		:= FALSE;
			hmiParameter.Bypassklappe.Oeffnen		:= TRUE;
			hmiParameter.Bypassklappe.Schliessen	:= FALSE;
		ELSIF hmiStatus.Bypassklappe.IndexBetriebsart = 2 THEN
			hmiParameter.Bypassklappe.Automatik		:= FALSE;
			hmiParameter.Bypassklappe.Oeffnen		:= FALSE;
			hmiParameter.Bypassklappe.Schliessen	:= TRUE;
		END_IF
	END_IF
		
	//Statusanzeige	
	hmiStatus.Bypassklappe.Status	:= gStatusAnlage.Aktor[AKTOR_BYPASSKLAPPE];
	IF hmiParameter.Ausstattung.Bypassklappe THEN
		IF hmiStatus.Bypassklappe.Status = STATUS_AKTIV THEN
			hmiStatus.Bypassklappe.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Bypassklappe.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Bypassklappe.StatusfeldInaktiv	:= ICON_HIDDEN;	
		ELSE
			hmiStatus.Bypassklappe.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Bypassklappe.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Bypassklappe.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSE
		hmiStatus.Bypassklappe.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Bypassklappe.StatusfeldInaktiv	:= ICON_HIDDEN;
	END_IF
	
	*)
	
	//==========================================================================================================================================================================================
	//Laufzeiten Gesamt sowie Restlaufzeiten von Lauf/Pause anzeigen 
	//0= Betrieb seit ..., 1= Betrieb in ..., 2= Pause in ...
	//==========================================================================================================================================================================================
	
	//Box 1 ************************************************
	IF hmiParameter.Boxen[1].Aus THEN
		hmiStatus.Box1.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
		hmiStatus.Box1.TextindexLaufzeit	:= 0;
	ELSIF hmiParameter.Boxen[1].DauerbetriebEin THEN
		hmiStatus.Box1.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
		//Schlechtwetter - LAUF
		IF fbSchlechtwetterBox1.WetterIstSchlecht AND NOT Boxen.Box1In.LuftaufbIstVerfuegbar AND Boxen.Box1Out.BoxAktiv
			AND (fbSchlechtwetterBox1.SchlechtwetterPausezeit <> 0) THEN
			//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
			loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box1Out.RestzeitSchlechtwetterPuls + 60000); //+1min
			loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
			loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
			hmiStatus.Box1.TextindexLaufzeit	:= 2; 
			hmiStatus.Box1.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
			hmiStatus.Box1.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
		//Schlechtwetter - PAUSE
		ELSIF fbSchlechtwetterBox1.WetterIstSchlecht AND NOT  Boxen.Box1Out.BoxAktiv THEN
			//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
			loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box1Out.RestzeitSchlechtwetterPause + 60000);
			loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
			loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
			hmiStatus.Box1.TextindexLaufzeit	:= 1; 
			hmiStatus.Box1.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
			hmiStatus.Box1.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
		//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
		ELSE
			hmiStatus.Box1.TextindexLaufzeit	:= 0; 
			hmiStatus.Box1.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box1Min);
			hmiStatus.Box1.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box1Std);
		END_IF
	ELSIF hmiParameter.Boxen[1].IntervallbetriebEin OR hmiParameter.Boxen[1].NachtrocknungEin THEN
		hmiStatus.Box1.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
		hmiStatus.Box1.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box1Minuten;
		hmiStatus.Box1.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box1Stunden;
		IF Boxen.Box1Out.BoxAktiv THEN
			hmiStatus.Box1.TextindexLaufzeit := 2;
		ELSE
			hmiStatus.Box1.TextindexLaufzeit := 1;
		END_IF
	END_IF
		
	//Box 2 ************************************************
	IF hmiParameter.Ausstattung.Box2 THEN
		IF hmiParameter.Boxen[2].Aus THEN
			hmiStatus.Box2.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
			hmiStatus.Box2.TextindexLaufzeit	:= 0;
		ELSIF hmiParameter.Boxen[2].DauerbetriebEin THEN
			hmiStatus.Box2.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			//Schlechtwetter - LAUF
			IF fbSchlechtwetterBox2.WetterIstSchlecht AND NOT Boxen.Box2In.LuftaufbIstVerfuegbar AND Boxen.Box2Out.BoxAktiv
				AND (fbSchlechtwetterBox2.SchlechtwetterPausezeit <> 0) THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box2Out.RestzeitSchlechtwetterPuls + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box2.TextindexLaufzeit	:= 2; 
				hmiStatus.Box2.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box2.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Schlechtwetter - PAUSE
			ELSIF fbSchlechtwetterBox2.WetterIstSchlecht AND NOT  Boxen.Box2Out.BoxAktiv THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box2Out.RestzeitSchlechtwetterPause + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box2.TextindexLaufzeit	:= 1; 
				hmiStatus.Box2.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box2.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
			ELSE
				hmiStatus.Box2.TextindexLaufzeit	:= 0; 
				hmiStatus.Box2.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box2Min);
				hmiStatus.Box2.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box2Std);
			END_IF
		ELSIF hmiParameter.Boxen[2].IntervallbetriebEin OR hmiParameter.Boxen[2].NachtrocknungEin THEN
			hmiStatus.Box2.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			hmiStatus.Box2.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box2Minuten;
			hmiStatus.Box2.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box2Stunden;
			IF Boxen.Box2Out.BoxAktiv THEN
				hmiStatus.Box2.TextindexLaufzeit := 2;
			ELSE
				hmiStatus.Box2.TextindexLaufzeit := 1;
			END_IF
		END_IF
	END_IF
	
	//Box 3
	IF hmiParameter.Ausstattung.Box3 THEN
		IF hmiParameter.Boxen[3].Aus THEN
			hmiStatus.Box3.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
			hmiStatus.Box3.TextindexLaufzeit	:= 0;
		ELSIF hmiParameter.Boxen[3].DauerbetriebEin THEN
			hmiStatus.Box3.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			//Schlechtwetter - LAUF
			IF fbSchlechtwetterBox3.WetterIstSchlecht AND NOT Boxen.Box3In.LuftaufbIstVerfuegbar AND Boxen.Box3Out.BoxAktiv
				AND (fbSchlechtwetterBox3.SchlechtwetterPausezeit <> 0) THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box3Out.RestzeitSchlechtwetterPuls + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box3.TextindexLaufzeit	:= 2; 
				hmiStatus.Box3.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box3.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Schlechtwetter - PAUSE
			ELSIF fbSchlechtwetterBox3.WetterIstSchlecht AND NOT  Boxen.Box3Out.BoxAktiv THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box3Out.RestzeitSchlechtwetterPause + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box3.TextindexLaufzeit	:= 1; 
				hmiStatus.Box3.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box3.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
			ELSE
				hmiStatus.Box3.TextindexLaufzeit	:= 0; 
				hmiStatus.Box3.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box3Min);
				hmiStatus.Box3.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box3Std);
			END_IF
		ELSIF hmiParameter.Boxen[3].IntervallbetriebEin OR hmiParameter.Boxen[3].NachtrocknungEin THEN
			hmiStatus.Box3.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			hmiStatus.Box3.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box3Minuten;
			hmiStatus.Box3.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box3Stunden;
			IF Boxen.Box3Out.BoxAktiv THEN
				hmiStatus.Box3.TextindexLaufzeit := 2;
			ELSE
				hmiStatus.Box3.TextindexLaufzeit := 1;
			END_IF
		END_IF
	END_IF
	
	//Box 4
	IF hmiParameter.Ausstattung.Box4 THEN
		IF hmiParameter.Boxen[4].Aus THEN
			hmiStatus.Box4.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
			hmiStatus.Box4.TextindexLaufzeit	:= 0;
		ELSIF hmiParameter.Boxen[4].DauerbetriebEin THEN
			hmiStatus.Box4.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			//Schlechtwetter - LAUF
			IF fbSchlechtwetterBox4.WetterIstSchlecht AND NOT Boxen.Box4In.LuftaufbIstVerfuegbar AND Boxen.Box4Out.BoxAktiv
				AND (fbSchlechtwetterBox4.SchlechtwetterPausezeit <> 0) THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box4Out.RestzeitSchlechtwetterPuls + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box4.TextindexLaufzeit	:= 2; 
				hmiStatus.Box4.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box4.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Schlechtwetter - PAUSE
			ELSIF fbSchlechtwetterBox4.WetterIstSchlecht AND NOT  Boxen.Box4Out.BoxAktiv THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box4Out.RestzeitSchlechtwetterPause + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box4.TextindexLaufzeit	:= 1; 
				hmiStatus.Box4.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box4.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
			ELSE
				hmiStatus.Box4.TextindexLaufzeit	:= 0; 
				hmiStatus.Box4.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box4Min);
				hmiStatus.Box4.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box4Std);
			END_IF
		ELSIF hmiParameter.Boxen[4].IntervallbetriebEin OR hmiParameter.Boxen[4].NachtrocknungEin THEN
			hmiStatus.Box4.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			hmiStatus.Box4.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box4Minuten;
			hmiStatus.Box4.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box4Stunden;
			IF Boxen.Box4Out.BoxAktiv THEN
				hmiStatus.Box4.TextindexLaufzeit := 2;
			ELSE
				hmiStatus.Box4.TextindexLaufzeit := 1;
			END_IF
		END_IF
	END_IF
	
	//Box 5
	IF hmiParameter.Ausstattung.Box5 THEN
		IF hmiParameter.Boxen[5].Aus THEN
			hmiStatus.Box5.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
			hmiStatus.Box5.TextindexLaufzeit	:= 0;
		ELSIF hmiParameter.Boxen[5].DauerbetriebEin THEN
			hmiStatus.Box5.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			//Schlechtwetter - LAUF
			IF fbSchlechtwetterBox5.WetterIstSchlecht AND NOT Boxen.Box5In.LuftaufbIstVerfuegbar AND Boxen.Box5Out.BoxAktiv
				AND (fbSchlechtwetterBox5.SchlechtwetterPausezeit <> 0) THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box5Out.RestzeitSchlechtwetterPuls + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box5.TextindexLaufzeit	:= 2; 
				hmiStatus.Box5.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box5.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Schlechtwetter - PAUSE
			ELSIF fbSchlechtwetterBox5.WetterIstSchlecht AND NOT  Boxen.Box5Out.BoxAktiv THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box5Out.RestzeitSchlechtwetterPause + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box5.TextindexLaufzeit	:= 1; 
				hmiStatus.Box5.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box5.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
			ELSE
				hmiStatus.Box5.TextindexLaufzeit	:= 0; 
				hmiStatus.Box5.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box5Min);
				hmiStatus.Box5.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box5Std);
			END_IF
		ELSIF hmiParameter.Boxen[5].IntervallbetriebEin OR hmiParameter.Boxen[5].NachtrocknungEin THEN
			hmiStatus.Box5.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			hmiStatus.Box5.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box5Minuten;
			hmiStatus.Box5.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box5Stunden;
			IF Boxen.Box5Out.BoxAktiv THEN
				hmiStatus.Box5.TextindexLaufzeit := 2;
			ELSE
				hmiStatus.Box5.TextindexLaufzeit := 1;
			END_IF
		END_IF
	END_IF
	
	//Box 6
	IF hmiParameter.Ausstattung.Box6 THEN
		IF hmiParameter.Boxen[6].Aus THEN
			hmiStatus.Box6.AnzeigeLaufRestzeit	:= ICON_HIDDEN;
			hmiStatus.Box6.TextindexLaufzeit	:= 0;
		ELSIF hmiParameter.Boxen[6].DauerbetriebEin THEN
			hmiStatus.Box6.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			//Schlechtwetter - LAUF
			IF fbSchlechtwetterBox6.WetterIstSchlecht AND NOT Boxen.Box6In.LuftaufbIstVerfuegbar AND Boxen.Box6Out.BoxAktiv
				AND (fbSchlechtwetterBox6.SchlechtwetterPausezeit <> 0) THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box6Out.RestzeitSchlechtwetterPuls + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box6.TextindexLaufzeit	:= 2; 
				hmiStatus.Box6.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box6.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Schlechtwetter - PAUSE
			ELSIF fbSchlechtwetterBox6.WetterIstSchlecht AND NOT  Boxen.Box6Out.BoxAktiv THEN
				//Restlaufzeiten Schlechtwetter von [ms] in [h] und [min] umrechnen
				loc_RestzeitSchlechtMillisek := UDINT_TO_REAL(Boxen.Box6Out.RestzeitSchlechtwetterPause + 60000);
				loc_RestzeitSchlechtStunden := TRUNC(loc_RestzeitSchlechtMillisek / 1000 / 60 / 60);
				loc_RestzeitSchlechtMinuten := REAL_TO_UINT((loc_RestzeitSchlechtMillisek / 1000 / 60) - (60 * loc_RestzeitSchlechtStunden));
				hmiStatus.Box6.TextindexLaufzeit	:= 1; 
				hmiStatus.Box6.LaufRestzeitMinuten	:= loc_RestzeitSchlechtMinuten;
				hmiStatus.Box6.LaufRestzeitStunden	:= UDINT_TO_UINT(loc_RestzeitSchlechtStunden);
				//Automatik und gute Witterung (oder Luftaufbereitung vhd.)
			ELSE
				hmiStatus.Box6.TextindexLaufzeit	:= 0; 
				hmiStatus.Box6.LaufRestzeitMinuten	:= USINT_TO_UINT(hmiNutzungsdaten.Bst.Box6Min);
				hmiStatus.Box6.LaufRestzeitStunden	:= UDINT_TO_UINT(hmiNutzungsdaten.Bst.Box6Std);
			END_IF
		ELSIF hmiParameter.Boxen[6].IntervallbetriebEin OR hmiParameter.Boxen[6].NachtrocknungEin THEN
			hmiStatus.Box6.AnzeigeLaufRestzeit	:= ICON_VISIBLE;
			hmiStatus.Box6.LaufRestzeitMinuten	:= gStatusAnlage.RestlaufzeitenBoxen.Box6Minuten;
			hmiStatus.Box6.LaufRestzeitStunden	:= gStatusAnlage.RestlaufzeitenBoxen.Box6Stunden;
			IF Boxen.Box6Out.BoxAktiv THEN
				hmiStatus.Box6.TextindexLaufzeit := 2;
			ELSE
				hmiStatus.Box6.TextindexLaufzeit := 1;
			END_IF
		END_IF
	END_IF
	
	
	//==========================================================================================================================================================================================
	//Umschaltung Betriebsarten Boxen
	//==========================================================================================================================================================================================
	
	//Wenn Box in Ausstattung gewählt & keine Betriebsart vogewählt -> Betriebsart AUS
	IF NOT hmiParameter.Boxen[1].Aus AND NOT hmiParameter.Boxen[1].DauerbetriebEin AND NOT hmiParameter.Boxen[1].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[1].NachtrocknungEin AND hmiParameter.Ausstattung.Box1 THEN
		hmiParameter.Boxen[1].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box1 THEN
		hmiParameter.Boxen[1].Aus	:= TRUE;
	END_IF
	IF NOT hmiParameter.Boxen[2].Aus AND NOT hmiParameter.Boxen[2].DauerbetriebEin AND NOT hmiParameter.Boxen[2].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[2].NachtrocknungEin AND hmiParameter.Ausstattung.Box2 THEN
		hmiParameter.Boxen[2].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box2 THEN
		hmiParameter.Boxen[2].Aus	:= TRUE;
	END_IF
	IF NOT hmiParameter.Boxen[3].Aus AND NOT hmiParameter.Boxen[3].DauerbetriebEin AND NOT hmiParameter.Boxen[3].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[3].NachtrocknungEin AND hmiParameter.Ausstattung.Box3 THEN
		hmiParameter.Boxen[3].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box3 THEN
		hmiParameter.Boxen[3].Aus	:= TRUE;
	END_IF
	IF NOT hmiParameter.Boxen[4].Aus AND NOT hmiParameter.Boxen[4].DauerbetriebEin AND NOT hmiParameter.Boxen[4].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[4].NachtrocknungEin AND hmiParameter.Ausstattung.Box4 THEN
		hmiParameter.Boxen[4].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box4 THEN
		hmiParameter.Boxen[4].Aus	:= TRUE;
	END_IF
	IF NOT hmiParameter.Boxen[5].Aus AND NOT hmiParameter.Boxen[5].DauerbetriebEin AND NOT hmiParameter.Boxen[5].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[5].NachtrocknungEin AND hmiParameter.Ausstattung.Box5 THEN
		hmiParameter.Boxen[5].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box5 THEN
		hmiParameter.Boxen[5].Aus	:= TRUE;
	END_IF
	IF NOT hmiParameter.Boxen[6].Aus AND NOT hmiParameter.Boxen[6].DauerbetriebEin AND NOT hmiParameter.Boxen[6].IntervallbetriebEin AND NOT
		hmiParameter.Boxen[6].NachtrocknungEin AND hmiParameter.Ausstattung.Box6 THEN
		hmiParameter.Boxen[6].Aus	:= TRUE;
	ELSIF NOT hmiParameter.Ausstattung.Box6 THEN
		hmiParameter.Boxen[6].Aus	:= TRUE;
	END_IF
	
	
	//Wenn Betriebsart gewählt wird -> alle anderen Betriebsarten ausschalten
	IF EDGEPOS(hmiBoxAktuell.Aus) THEN
		hmiBoxAktuell.DauerbetriebEin		:= FALSE;
		hmiBoxAktuell.IntervallbetriebEin	:= FALSE;
		hmiBoxAktuell.NachtrocknungEin		:= FALSE;
	ELSIF EDGEPOS(hmiBoxAktuell.DauerbetriebEin) THEN
		hmiBoxAktuell.Aus					:= FALSE;
		hmiBoxAktuell.IntervallbetriebEin	:= FALSE;
		hmiBoxAktuell.NachtrocknungEin		:= FALSE;
	ELSIF EDGEPOS(hmiBoxAktuell.IntervallbetriebEin) THEN
		hmiBoxAktuell.Aus					:= FALSE;
		hmiBoxAktuell.DauerbetriebEin		:= FALSE;
		hmiBoxAktuell.NachtrocknungEin		:= FALSE;
	ELSIF EDGEPOS(hmiBoxAktuell.NachtrocknungEin) THEN
		hmiBoxAktuell.Aus					:= FALSE;
		hmiBoxAktuell.DauerbetriebEin		:= FALSE;
		hmiBoxAktuell.IntervallbetriebEin	:= FALSE;
	END_IF
	
	//Wenn keine Betriebsart gewählt -> Betriebsart aktuelle Box AUS
	IF NOT hmiBoxAktuell.Aus AND NOT hmiBoxAktuell.DauerbetriebEin AND NOT hmiBoxAktuell.IntervallbetriebEin AND NOT
		hmiBoxAktuell.NachtrocknungEin THEN
		hmiBoxAktuell.Aus	:= TRUE;
	END_IF
	
	//Betriebsart verzögert umschalten (AUS, Dauerbetrieb, Intervallbetrieb, Nachtrocknung)
	TOF_VerzBetriebsartBox(IN:= (NOT TOF_BoxAufgerufen.Q) AND (EDGE(hmiBoxAktuell.Aus) OR EDGE(hmiBoxAktuell.DauerbetriebEin) OR EDGE(hmiBoxAktuell.IntervallbetriebEin) OR 
	EDGE(hmiBoxAktuell.NachtrocknungEin)), PT:= Betriebsparameter.Allgemein.VerzUmschBetriebsartBoxen);
	
	//Verzögerung bei Aufruf Detailansicht Boxen starten (Verhindert das Starten der Umschaltverzögerung Boxen beim 1. Aufruf)
	TOF_BoxAufgerufen(IN:= EDGEPOS(hmiButtons.showBox1) OR EDGEPOS(hmiButtons.showBox2) OR EDGEPOS(hmiButtons.showBox3) OR EDGEPOS(hmiButtons.showBox4) OR
	EDGEPOS(hmiButtons.showBox5) OR EDGEPOS(hmiButtons.showBox6), PT:= T#500ms);
	
	//Symbol Sanduhr mit Restlaufzeit einblenden, wenn Umschaltverzögerung aktiv
	IF TOF_VerzBetriebsartBox.Q THEN
		hmiBoxAktuell.RestzeitUmschaltverzBetriebsart			:= hmiParameter.Allgemein.VerzUmschBetriebsartBoxen - TIME_TO_UDINT(TOF_VerzBetriebsartBox.ET);
		hmiVisibility.Allgemein.UmschaltverzBetriebsartAktiv	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.UmschaltverzBetriebsartAktiv	:= ICON_HIDDEN;
	END_IF
	
	
	
	//===========================================================================================================================================================================================
	//Konfiguration Detailansicht Boxen
	//===========================================================================================================================================================================================

	//Buttons für Einstellung Intervallbetrieb/Nachtrocknung einblenden, wenn jeweilige Betriebsart gewählt
	IF hmiBoxAktuell.IntervallbetriebEin THEN
		hmiVisibility.Buttons.IntervallEinstellenBoxAktuell		:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Buttons.IntervallEinstellenBoxAktuell		:= ICON_HIDDEN;
	END_IF
	IF hmiBoxAktuell.NachtrocknungEin THEN
		hmiVisibility.Buttons.NachtrocknEinstellenBoxAktuell 	:= ICON_VISIBLE;
	ELSE
		hmiVisibility.Buttons.NachtrocknEinstellenBoxAktuell 	:= ICON_HIDDEN;
	END_IF
	
	//Eingabefeld für aktuelle Trockengutfeuchte im Automatikbetrieb anzeigen
	IF hmiBoxAktuell.DauerbetriebEin THEN
		hmiVisibility.Allgemein.EingabeTrockengutfeuchteBox := ICON_VISIBLE;
	ELSE
		hmiVisibility.Allgemein.EingabeTrockengutfeuchteBox := ICON_HIDDEN;
	END_IF
	
		
	
	//Ausstattung mit nur einer Box *************************************************************************************************************************************************************
	IF hmiVisibility.Layers.UebersichtEineBox = ICON_VISIBLE THEN

		//Verzögerung Umschaltung Betriebsarten
		IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
			hmiParameter.Boxen[1].Aus					:= hmiBoxAktuell.Aus;
			hmiParameter.Boxen[1].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
			hmiParameter.Boxen[1].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
			hmiParameter.Boxen[1].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
		END_IF
		
		//Trockengutfeuchte an Box 1 übergeben
		hmiParameter.SchlechtwetterBoxen[1].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
		
		
		//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
		IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
			memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[1].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
			hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[0];
			hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[1];
			hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[2];
			hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[3];
			hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[4];
			hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[5];
			hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[6];
			hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[7];
			hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[8];
			hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[9];
			hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[10];
			hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[11];
			hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[12];
			hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[13];
			hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[14];
			hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[15];
			hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[16];
			hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[17];
			hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[18];
			hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[19];
			hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[20];
			hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[21];
			hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[22];
			hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[23];
			hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
		END_IF
		IF hmiButtons.IntervallEinstellenBoxAktuell THEN
			memcpy(ADR(hmiParameter.Boxen[1].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[1].IntervallbetriebZeiten));
		END_IF
		
			
		//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
		IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
			memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[1].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
			hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[0];
			hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[1];
			hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[2];
			hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[3];
			hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[4];
			hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[5];
			hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[6];
			hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[7];
			hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[8];
			hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[9];
			hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[10];
			hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[11];
			hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[12];
			hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[13];
			hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[14];
			hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[15];
			hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[16];
			hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[17];
			hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[18];
			hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[19];
			hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[20];
			hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[21];
			hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[22];
			hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[23];
			hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
		END_IF
		IF hmiButtons.NachtrocknEinstellenAktuell THEN
			memcpy(ADR(hmiParameter.Boxen[1].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[1].NachtrocknungZeiten));
		END_IF
	END_IF
	
	
	
	
	//Bei aufrufen von Detailansicht Box 1 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox1) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[1].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[1].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[1].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[1].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[1].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box1.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box1.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box1.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box1.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box1Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box1Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box1.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box1.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[1].MaterialfeuchteIst;
		hmiBoxAktuell.Status;
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	//Bei aufrufen von Detailansicht Box 2 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox2) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[2].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[2].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[2].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[2].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[2].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box2.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box2.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box2.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box2.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box2Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box2Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box2.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box2.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[2].MaterialfeuchteIst;
		hmiBoxAktuell.Status;
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	
	//Bei aufrufen von Detailansicht Box 3 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox3) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[3].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[3].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[3].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[3].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[3].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box3.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box3.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box3.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box3.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box3Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box3Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box3.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box3.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[3].MaterialfeuchteIst;
		hmiBoxAktuell.Status;
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	//Bei aufrufen von Detailansicht Box 4 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox4) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[4].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[4].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[4].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[4].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[4].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box4.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box4.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box4.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box4.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box4Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box4Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box4.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box4.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[4].MaterialfeuchteIst;
		hmiBoxAktuell.Status;
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	
	//Bei aufrufen von Detailansicht Box 5 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox5) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[5].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[5].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[5].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[5].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[5].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box5.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box5.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box5.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box5.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box5Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box5Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box5.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box5.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[5].MaterialfeuchteIst;
		hmiBoxAktuell.Status;
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	
	//Bei aufrufen von Detailansicht Box 6 -> Parameter übergeben
	IF EDGEPOS(hmiButtons.showBox6) THEN
		hmiBoxAktuell.Aus							:= hmiParameter.Boxen[6].Aus;
		hmiBoxAktuell.DauerbetriebEin				:= hmiParameter.Boxen[6].DauerbetriebEin;
		hmiBoxAktuell.IntervallbetriebEin			:= hmiParameter.Boxen[6].IntervallbetriebEin;
		hmiBoxAktuell.NachtrocknungEin				:= hmiParameter.Boxen[6].NachtrocknungEin;
		hmiBoxAktuell.NameBox						:= hmiParameter.Boxen[6].NameBox;
		hmiBoxAktuell.AnzeigeLaufRestzeit			:= hmiStatus.Box6.AnzeigeLaufRestzeit;
		hmiBoxAktuell.LaufRestzeitMinuten			:= hmiStatus.Box6.LaufRestzeitMinuten;
		hmiBoxAktuell.LaufRestzeitStunden			:= hmiStatus.Box6.LaufRestzeitStunden;
		hmiBoxAktuell.TextindexLaufzeit				:= hmiStatus.Box6.TextindexLaufzeit;
		hmiBoxAktuell.SperreDauerbetrieb			:= Boxen.Box6Out.DauerbetriebSperre;
		hmiBoxAktuell.SperreIntervallbetrieb		:= Boxen.Box6Out.IntervallbetriebSperre;
		hmiBoxAktuell.Trockengut					:= hmiStatus.Box6.Trockengut;
		hmiBoxAktuell.IconWitterung					:= hmiStatus.Box6.IconWitterung;
		hmiBoxAktuell.TrockengutfeuchteAktuell		:= hmiParameter.SchlechtwetterBoxen[6].MaterialfeuchteIst;
		hmiBoxAktuell.Status; 
		hmiVisibility.Layers.DetailansichtBox		:= ICON_VISIBLE;
	END_IF
	
	
	//Detailansicht Box aufgerufen (bei mehr als einer Box) ========================================================================================================================================================
	IF hmiVisibility.Layers.DetailansichtBox = ICON_VISIBLE THEN
		
	
		//Box 1 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox1 THEN			
		
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[1].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[1].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[1].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[1].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box1.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box1.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box1.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box1.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box1.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[1].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box1Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[1].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[1].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[1].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box1Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[1].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[1].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[1].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[1].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		
		
		
		
		//Box 2 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox2 THEN
			
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[2].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[2].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[2].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[2].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box2.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box2.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box2.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box2.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box2.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[2].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box2Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[2].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[2].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[2].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box2Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[2].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[2].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[2].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[2].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		
		
		//Box 3 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox3 THEN
			
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[3].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[3].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[3].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[3].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box3.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box3.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box3.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box3.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box3.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[3].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box3Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[3].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[3].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[3].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[15]; 
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box3Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[3].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[3].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[3].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[3].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		
		
		
		//Box 4 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox4 THEN
			
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[4].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[4].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[4].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[4].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box4.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box4.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box4.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box4.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box4.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[4].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box4Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[4].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[4].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[4].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[15]; 
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box4Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[4].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[4].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[4].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[4].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		
		
		
		//Box 5 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox5 THEN
			
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[5].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[5].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[5].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[5].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box5.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box5.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box5.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box5.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box5.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[5].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box5Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[5].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[5].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[5].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[15]; 
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box5Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[5].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[5].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[5].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[5].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		
		
		
		//Box 6 aufgerufen ****************************************************************************************************************
		IF hmiButtons.showBox6 THEN
			
			//Verzögerung Umschaltung Betriebsarten
			IF EDGENEG(TOF_VerzBetriebsartBox.Q) THEN		
				hmiParameter.Boxen[6].Aus					:= hmiBoxAktuell.Aus;
				hmiParameter.Boxen[6].DauerbetriebEin		:= hmiBoxAktuell.DauerbetriebEin;
				hmiParameter.Boxen[6].IntervallbetriebEin	:= hmiBoxAktuell.IntervallbetriebEin;
				hmiParameter.Boxen[6].NachtrocknungEin		:= hmiBoxAktuell.NachtrocknungEin;
			END_IF
			
			hmiBoxAktuell.AnzeigeLaufRestzeit				:= hmiStatus.Box6.AnzeigeLaufRestzeit;
			hmiBoxAktuell.LaufRestzeitMinuten				:= hmiStatus.Box6.LaufRestzeitMinuten;
			hmiBoxAktuell.LaufRestzeitStunden				:= hmiStatus.Box6.LaufRestzeitStunden;
			hmiBoxAktuell.TextindexLaufzeit					:= hmiStatus.Box6.TextindexLaufzeit;
			hmiBoxAktuell.Status							:= hmiStatus.Box6.Statustext;
			
			//Bei Aufruf Einstellungen Intervallbetrieb -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.IntervallEinstellenBoxAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[6].IntervallbetriebZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[15];
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box6Out.IntervallbetriebZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.IntervallEinstellenBoxAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[6].IntervallbetriebZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[6].IntervallbetriebZeiten));
			END_IF
		
			
			//Bei Aufruf Einstellungen Nachtrocknung -> Zeitbereiche und Sperrzeiten übergeben und Layer anzeigen
			IF EDGEPOS(hmiButtons.NachtrocknEinstellenAktuell) THEN
				memcpy(ADR(hmiBoxAktuell.Zeitbereiche), ADR(hmiParameter.Boxen[6].NachtrocknungZeiten), SIZEOF(hmiBoxAktuell.Zeitbereiche));
				hmiBoxAktuell.ZeitbereicheGesperrt[0]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[0];
				hmiBoxAktuell.ZeitbereicheGesperrt[1]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[1];
				hmiBoxAktuell.ZeitbereicheGesperrt[2]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[2];
				hmiBoxAktuell.ZeitbereicheGesperrt[3]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[3];
				hmiBoxAktuell.ZeitbereicheGesperrt[4]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[4];
				hmiBoxAktuell.ZeitbereicheGesperrt[5]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[5];
				hmiBoxAktuell.ZeitbereicheGesperrt[6]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[6];
				hmiBoxAktuell.ZeitbereicheGesperrt[7]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[7];
				hmiBoxAktuell.ZeitbereicheGesperrt[8]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[8];
				hmiBoxAktuell.ZeitbereicheGesperrt[9]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[9];
				hmiBoxAktuell.ZeitbereicheGesperrt[10]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[10];
				hmiBoxAktuell.ZeitbereicheGesperrt[11]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[11];
				hmiBoxAktuell.ZeitbereicheGesperrt[12]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[12];
				hmiBoxAktuell.ZeitbereicheGesperrt[13]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[13];
				hmiBoxAktuell.ZeitbereicheGesperrt[14]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[14];
				hmiBoxAktuell.ZeitbereicheGesperrt[15]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[15]; 
				hmiBoxAktuell.ZeitbereicheGesperrt[16]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[16];
				hmiBoxAktuell.ZeitbereicheGesperrt[17]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[17];
				hmiBoxAktuell.ZeitbereicheGesperrt[18]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[18];
				hmiBoxAktuell.ZeitbereicheGesperrt[19]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[19];
				hmiBoxAktuell.ZeitbereicheGesperrt[20]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[20];
				hmiBoxAktuell.ZeitbereicheGesperrt[21]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[21];
				hmiBoxAktuell.ZeitbereicheGesperrt[22]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[22];
				hmiBoxAktuell.ZeitbereicheGesperrt[23]	:= Boxen.Box6Out.NachtrocknungZeitenGesperrt[23];
				hmiVisibility.Layers.Zeitfenster		:= ICON_VISIBLE;
			END_IF
			IF hmiButtons.NachtrocknEinstellenAktuell THEN
				memcpy(ADR(hmiParameter.Boxen[6].NachtrocknungZeiten), ADR(hmiBoxAktuell.Zeitbereiche), SIZEOF(hmiParameter.Boxen[6].NachtrocknungZeiten));
			END_IF
			
			//Aktuelle Trockengutfeuchte bei Änderung an Parametersatz übergeben
			IF (hmiBoxAktuell.TrockengutfeuchteAktuell <> hmiParameter.SchlechtwetterBoxen[6].MaterialfeuchteIst) THEN
				hmiParameter.SchlechtwetterBoxen[6].MaterialfeuchteIst := hmiBoxAktuell.TrockengutfeuchteAktuell;
			END_IF
			
		END_IF
		
		


	END_IF
	
	
	//Wenn Ebene Detailansicht Boxen ausgeblendet wird -> Buttons "Zeige Detailansicht Boxen" zurücksetzen
	IF hmiButtons.hideDetailansichtBox AND NOT TOF_VerzBetriebsartBox.Q THEN
		hmiVisibility.Layers.DetailansichtBox	:= ICON_HIDDEN;
		hmiButtons.hideDetailansichtBox			:= FALSE;
		hmiButtons.showBox1						:= FALSE;
		hmiButtons.showBox2						:= FALSE;
		hmiButtons.showBox3						:= FALSE;
		hmiButtons.showBox4						:= FALSE;
		hmiButtons.showBox5						:= FALSE;
		hmiButtons.showBox6						:= FALSE;
	END_IF
	
	//Wenn Ebene Zeitfenster ausgeblendet wird -> Buttons Einstellungen Zeitfenster zurücksetzen
	IF hmiButtons.hideZeitfenster THEN
		hmiVisibility.Layers.Zeitfenster			:= ICON_HIDDEN;
		hmiButtons.hideZeitfenster					:= FALSE;
		hmiButtons.IntervallEinstellenBoxAktuell	:= FALSE;
		hmiButtons.NachtrocknEinstellenAktuell		:= FALSE;
	END_IF

	//===========================================================================================================================================================================================
	//Statusanzeigen (Texte u. Darstellung) Boxen 1-6
	//===========================================================================================================================================================================================
	
	//Box 1 **********************************************************
	IF gCmdAnlage.Test THEN
		hmiStatus.Box1.Statustext			:= STATUS_TESTBETRIEB;
		hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
		hmiStatus.Box1.FarbeTextNameBox		:= TEXT_HELLGRAU;
		hmiStatus.Box1.HintergrundAktiv		:= ICON_HIDDEN;
		hmiStatus.Box1.HintergrundInaktiv	:= ICON_VISIBLE;
		hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;
	ELSIF hmiParameter.Boxen[1].Aus THEN
		hmiStatus.Box1.Statustext			:= STATUS_STILLSTAND;
		hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
		hmiStatus.Box1.FarbeTextNameBox		:= TEXT_HELLGRAU;
		hmiStatus.Box1.HintergrundAktiv		:= ICON_HIDDEN;
		hmiStatus.Box1.HintergrundInaktiv	:= ICON_VISIBLE;
		hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
		hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;
	ELSIF hmiParameter.Boxen[1].DauerbetriebEin THEN
		IF Boxen.Box1Out.BoxAktiv THEN	
			IF Boxen.Box1In.WetterIstSchlecht AND NOT Boxen.Box1In.LuftaufbIstVerfuegbar THEN
				hmiStatus.Box1.Statustext			:= STATUS_SCHLECHTWETTER_LAUF;
				hmiStatus.Box1.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box1.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box1.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.StatusfeldInaktiv	:= ICON_HIDDEN;
			END_IF
		ELSE
			IF Boxen.Box1In.WetterIstSchlecht AND NOT Boxen.Box1In.LuftaufbIstVerfuegbar THEN	
				hmiStatus.Box1.Statustext			:= STATUS_SCHLECHTWETTER_PAUSE;
				hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;
			ELSE
				hmiStatus.Box1.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;	
			END_IF
		END_IF
	ELSIF hmiParameter.Boxen[1].IntervallbetriebEin THEN
		IF Boxen.Box1Out.BoxAktiv THEN
			hmiStatus.Box1.Statustext			:= STATUS_INTERVALL_LAUF;
			hmiStatus.Box1.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
			hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.StatusfeldInaktiv	:= ICON_HIDDEN;
		ELSE
			hmiStatus.Box1.Statustext			:= STATUS_INTERVALL_PAUSE;
			hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
			hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	ELSIF hmiParameter.Boxen[1].NachtrocknungEin THEN
		IF Boxen.Box1Out.BoxAktiv THEN
			hmiStatus.Box1.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
			hmiStatus.Box1.FarbeStatustext		:= TEXT_DUNKELGRAU;
			hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
			hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.StatusfeldInaktiv	:= ICON_HIDDEN;
		ELSE
			hmiStatus.Box1.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
			hmiStatus.Box1.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box1.FarbeTextNameBox		:= TEXT_GELB;
			hmiStatus.Box1.HintergrundAktiv		:= ICON_VISIBLE;
			hmiStatus.Box1.HintergrundInaktiv	:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box1.StatusfeldInaktiv	:= ICON_VISIBLE;
		END_IF
	END_IF
	
	
	//Box 2 **********************************************************
	IF hmiParameter.Ausstattung.Box2 THEN
		IF gCmdAnlage.Test THEN
			hmiStatus.Box2.Statustext			:= STATUS_TESTBETRIEB;
			hmiStatus.Box2.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box2.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box2.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box2.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box2.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box2.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[2].Aus THEN
			hmiStatus.Box2.Statustext			:= STATUS_STILLSTAND;
			hmiStatus.Box2.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box2.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box2.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box2.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box2.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box2.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[2].DauerbetriebEin THEN
			IF Boxen.Box2Out.BoxAktiv THEN		
				hmiStatus.Box2.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box2.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[2].IntervallbetriebEin THEN
			IF Boxen.Box2Out.BoxAktiv THEN
				hmiStatus.Box2.Statustext			:= STATUS_INTERVALL_LAUF;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box2.Statustext			:= STATUS_INTERVALL_PAUSE;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[2].NachtrocknungEin THEN
			IF Boxen.Box2Out.BoxAktiv THEN
				hmiStatus.Box2.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box2.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
				hmiStatus.Box2.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box2.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box2.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box2.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box2.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		END_IF
	END_IF
	
	//Box 3 **********************************************************
	IF hmiParameter.Ausstattung.Box3 THEN
		IF gCmdAnlage.Test THEN
			hmiStatus.Box3.Statustext			:= STATUS_TESTBETRIEB;
			hmiStatus.Box3.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box3.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box3.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box3.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box3.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box3.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[3].Aus THEN
			hmiStatus.Box3.Statustext			:= STATUS_STILLSTAND;
			hmiStatus.Box3.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box3.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box3.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box3.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box3.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box3.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[3].DauerbetriebEin THEN
			IF Boxen.Box3Out.BoxAktiv THEN		
				hmiStatus.Box3.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box3.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[3].IntervallbetriebEin THEN
			IF Boxen.Box3Out.BoxAktiv THEN
				hmiStatus.Box3.Statustext			:= STATUS_INTERVALL_LAUF;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box3.Statustext			:= STATUS_INTERVALL_PAUSE;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[3].NachtrocknungEin THEN
			IF Boxen.Box3Out.BoxAktiv THEN
				hmiStatus.Box3.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box3.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
				hmiStatus.Box3.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box3.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box3.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box3.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box3.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		END_IF
	END_IF
	
	
	//Box 4 **********************************************************
	IF hmiParameter.Ausstattung.Box4 THEN
		IF gCmdAnlage.Test THEN
			hmiStatus.Box4.Statustext			:= STATUS_TESTBETRIEB;
			hmiStatus.Box4.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box4.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box4.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box4.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box4.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box4.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[4].Aus THEN
			hmiStatus.Box4.Statustext			:= STATUS_STILLSTAND;
			hmiStatus.Box4.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box4.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box4.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box4.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box4.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box4.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[4].DauerbetriebEin THEN
			IF Boxen.Box4Out.BoxAktiv THEN		
				hmiStatus.Box4.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box4.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[4].IntervallbetriebEin THEN
			IF Boxen.Box4Out.BoxAktiv THEN
				hmiStatus.Box4.Statustext			:= STATUS_INTERVALL_LAUF;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box4.Statustext			:= STATUS_INTERVALL_PAUSE;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[4].NachtrocknungEin THEN
			IF Boxen.Box4Out.BoxAktiv THEN
				hmiStatus.Box4.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box4.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
				hmiStatus.Box4.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box4.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box4.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box4.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box4.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		END_IF
	END_IF
	
	
	//Box 5 **********************************************************
	IF hmiParameter.Ausstattung.Box5 THEN
		IF gCmdAnlage.Test THEN
			hmiStatus.Box5.Statustext			:= STATUS_TESTBETRIEB;
			hmiStatus.Box5.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box5.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box5.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box5.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box5.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box5.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[5].Aus THEN
			hmiStatus.Box5.Statustext			:= STATUS_STILLSTAND;
			hmiStatus.Box5.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box5.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box5.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box5.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box5.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box5.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[5].DauerbetriebEin THEN
			IF Boxen.Box5Out.BoxAktiv THEN		
				hmiStatus.Box5.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box5.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[5].IntervallbetriebEin THEN
			IF Boxen.Box5Out.BoxAktiv THEN
				hmiStatus.Box5.Statustext			:= STATUS_INTERVALL_LAUF;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box5.Statustext			:= STATUS_INTERVALL_PAUSE;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[5].NachtrocknungEin THEN
			IF Boxen.Box5Out.BoxAktiv THEN
				hmiStatus.Box5.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box5.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
				hmiStatus.Box5.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box5.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box5.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box5.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box5.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		END_IF
	END_IF
	
	
	//Box 6 **********************************************************
	IF hmiParameter.Ausstattung.Box6 THEN
		IF gCmdAnlage.Test THEN
			hmiStatus.Box6.Statustext			:= STATUS_TESTBETRIEB;
			hmiStatus.Box6.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box6.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box6.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box6.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box6.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box6.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[6].Aus THEN
			hmiStatus.Box6.Statustext			:= STATUS_STILLSTAND;
			hmiStatus.Box6.FarbeStatustext		:= TEXT_HELLGRAU;
			hmiStatus.Box6.FarbeTextNameBox		:= TEXT_HELLGRAU;
			hmiStatus.Box6.HintergrundAktiv		:= ICON_HIDDEN;
			hmiStatus.Box6.HintergrundInaktiv	:= ICON_VISIBLE;
			hmiStatus.Box6.StatusfeldAktiv		:= ICON_HIDDEN;
			hmiStatus.Box6.StatusfeldInaktiv	:= ICON_VISIBLE;
		ELSIF hmiParameter.Boxen[6].DauerbetriebEin THEN
			IF Boxen.Box6Out.BoxAktiv THEN		
				hmiStatus.Box6.Statustext			:= STATUS_DAUERBETRIEB;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box6.Statustext			:= STATUS_DAUERBETRIEB_PAUSIERT;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[6].IntervallbetriebEin THEN
			IF Boxen.Box6Out.BoxAktiv THEN
				hmiStatus.Box6.Statustext			:= STATUS_INTERVALL_LAUF;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box6.Statustext			:= STATUS_INTERVALL_PAUSE;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		ELSIF hmiParameter.Boxen[6].NachtrocknungEin THEN
			IF Boxen.Box6Out.BoxAktiv THEN
				hmiStatus.Box6.Statustext			:= STATUS_NACHTROCKNUNG_LAUF;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_DUNKELGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_HIDDEN;
			ELSE
				hmiStatus.Box6.Statustext			:= STATUS_NACHTROCKNUNG_PAUSE;
				hmiStatus.Box6.FarbeStatustext		:= TEXT_HELLGRAU;
				hmiStatus.Box6.FarbeTextNameBox		:= TEXT_GELB;
				hmiStatus.Box6.HintergrundAktiv		:= ICON_VISIBLE;
				hmiStatus.Box6.HintergrundInaktiv	:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldAktiv		:= ICON_HIDDEN;
				hmiStatus.Box6.StatusfeldInaktiv	:= ICON_VISIBLE;
			END_IF
		END_IF
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Icons für gute & schlechte Witterung pro Box anzeigen
	//===========================================================================================================================================================================================

	hmiStatus.Box1.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox1.WetterIstSchlecht);
	hmiStatus.Box2.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox2.WetterIstSchlecht);
	hmiStatus.Box3.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox3.WetterIstSchlecht);
	hmiStatus.Box4.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox4.WetterIstSchlecht);
	hmiStatus.Box5.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox5.WetterIstSchlecht);
	hmiStatus.Box6.IconWitterung := BOOL_TO_USINT(fbSchlechtwetterBox6.WetterIstSchlecht);
	
	
	
	//===========================================================================================================================================================================================
	//Trockengut je nach Ausstattung und Zustand (Stillstand/Betrieb) darstellen
	//===========================================================================================================================================================================================
	
	//Tasten Auswahl Trockengut - Index setzen
	//0= Heu-Lose, 1= Rundballen, 2= Mais, 3= Getreide, 4= Hopfen, 5= Kräuter, 6= Holz
	
	//Box 1
	IF hmiButtons.changeTrockengutBox1 THEN
		IF hmiParameter.Boxen[1].Trockengut < 6 THEN
			hmiParameter.Boxen[1].Trockengut := hmiParameter.Boxen[1].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[1].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox1 := FALSE;
	END_IF
	
	//Box 2
	IF hmiButtons.changeTrockengutBox2 THEN
		IF hmiParameter.Boxen[2].Trockengut < 6 THEN
			hmiParameter.Boxen[2].Trockengut := hmiParameter.Boxen[2].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[2].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox2 := FALSE;
	END_IF
	
	//Box 3
	IF hmiButtons.changeTrockengutBox3 THEN
		IF hmiParameter.Boxen[3].Trockengut < 6 THEN
			hmiParameter.Boxen[3].Trockengut := hmiParameter.Boxen[3].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[3].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox3 := FALSE;
	END_IF
	
	//Box 4
	IF hmiButtons.changeTrockengutBox4 THEN
		IF hmiParameter.Boxen[4].Trockengut < 6 THEN
			hmiParameter.Boxen[4].Trockengut := hmiParameter.Boxen[4].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[4].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox4 := FALSE;
	END_IF
	
	//Box 5
	IF hmiButtons.changeTrockengutBox5 THEN
		IF hmiParameter.Boxen[5].Trockengut < 6 THEN
			hmiParameter.Boxen[5].Trockengut := hmiParameter.Boxen[5].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[5].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox5 := FALSE;
	END_IF
	
	//Box 6
	IF hmiButtons.changeTrockengutBox6 THEN
		IF hmiParameter.Boxen[6].Trockengut < 6 THEN
			hmiParameter.Boxen[6].Trockengut := hmiParameter.Boxen[6].Trockengut + 1;
		ELSE
			hmiParameter.Boxen[6].Trockengut := 0;
		END_IF
		hmiButtons.changeTrockengutBox6 := FALSE;
	END_IF
	
	
	//Box 1
	IF hmiParameter.Boxen[1].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[1].Trockengut = 0 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 1 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 2 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 3 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 4 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 5 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[1].Trockengut = 6 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[1].Trockengut = 0 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 1 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 2 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 3 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 4 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 5 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[1].Trockengut = 6 THEN
			hmiStatus.Box1.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF		
	END_IF
	
	//Box 2
	IF hmiParameter.Boxen[2].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[2].Trockengut = 0 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 1 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 2 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 3 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 4 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 5 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[2].Trockengut = 6 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[2].Trockengut = 0 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 1 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 2 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 3 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 4 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 5 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[2].Trockengut = 6 THEN
			hmiStatus.Box2.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF
	END_IF	
	
	//Box 3
	IF hmiParameter.Boxen[3].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[3].Trockengut = 0 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 1 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 2 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 3 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 4 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 5 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[3].Trockengut = 6 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[3].Trockengut = 0 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 1 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 2 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 3 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 4 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 5 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[3].Trockengut = 6 THEN
			hmiStatus.Box3.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF
	END_IF
	
	//Box 4
	IF hmiParameter.Boxen[4].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[4].Trockengut = 0 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 1 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 2 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 3 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 4 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 5 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[4].Trockengut = 6 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[4].Trockengut = 0 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 1 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 2 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 3 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 4 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 5 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[4].Trockengut = 6 THEN
			hmiStatus.Box4.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF
	END_IF
	
	//Box 5
	IF hmiParameter.Boxen[5].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[5].Trockengut = 0 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 1 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 2 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 3 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 4 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 5 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[5].Trockengut = 6 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[5].Trockengut = 0 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 1 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 2 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 3 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 4 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 5 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[5].Trockengut = 6 THEN
			hmiStatus.Box5.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF
	END_IF
	
	//Box 6
	IF hmiParameter.Boxen[6].Aus OR gCmdAnlage.Test THEN
		IF hmiParameter.Boxen[6].Trockengut = 0 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HEU_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 1 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_RUNDB_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 2 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_MAIS_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 3 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_GETREIDE_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 4 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HOPFEN_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 5 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_KRAEUTER_GRAU;
		ELSIF hmiParameter.Boxen[6].Trockengut = 6 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HOLZ_GRAU;
		END_IF
	ELSE
		IF hmiParameter.Boxen[6].Trockengut = 0 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HEU_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 1 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_RUNDB_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 2 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_MAIS_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 3 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_GETREIDE_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 4 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HOPFEN_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 5 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_KRAEUTER_GELB;
		ELSIF hmiParameter.Boxen[6].Trockengut = 6 THEN
			hmiStatus.Box6.Trockengut	:= TROCKENGUT_HOLZ_GELB;
		END_IF
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Buttons für Klappenstellungen der einzelnen Boxen (Umschaltung Textindex) (0= nicht verwendet, 1= zu, 2= offen)
	//===========================================================================================================================================================================================
	
	//BOX 1 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox1.Klappe1 THEN
		IF hmiParameter.Boxen[1].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe1	:= hmiParameter.Boxen[1].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox1.Klappe2 THEN
		IF hmiParameter.Boxen[1].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe2	:= hmiParameter.Boxen[1].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox1.Klappe3 THEN
		IF hmiParameter.Boxen[1].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe3	:= hmiParameter.Boxen[1].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox1.Klappe4 THEN
		IF hmiParameter.Boxen[1].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe4	:= hmiParameter.Boxen[1].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox1.Klappe5 THEN
		IF hmiParameter.Boxen[1].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe5	:= hmiParameter.Boxen[1].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox1.Klappe6 THEN
		IF hmiParameter.Boxen[1].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[1].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[1].StellungKlappe6	:= hmiParameter.Boxen[1].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox1.Klappe6	:= FALSE;
	END_IF
	
	
	//BOX 2 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox2.Klappe1 THEN
		IF hmiParameter.Boxen[2].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe1	:= hmiParameter.Boxen[2].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox2.Klappe2 THEN
		IF hmiParameter.Boxen[2].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe2	:= hmiParameter.Boxen[2].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox2.Klappe3 THEN
		IF hmiParameter.Boxen[2].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe3	:= hmiParameter.Boxen[2].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox2.Klappe4 THEN
		IF hmiParameter.Boxen[2].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe4	:= hmiParameter.Boxen[2].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox2.Klappe5 THEN
		IF hmiParameter.Boxen[2].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe5	:= hmiParameter.Boxen[2].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox2.Klappe6 THEN
		IF hmiParameter.Boxen[2].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[2].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[2].StellungKlappe6	:= hmiParameter.Boxen[2].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox2.Klappe6	:= FALSE;
	END_IF
	
	
	//BOX 3 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox3.Klappe1 THEN
		IF hmiParameter.Boxen[3].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe1	:= hmiParameter.Boxen[3].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox3.Klappe2 THEN
		IF hmiParameter.Boxen[3].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe2	:= hmiParameter.Boxen[3].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox3.Klappe3 THEN
		IF hmiParameter.Boxen[3].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe3	:= hmiParameter.Boxen[3].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox3.Klappe4 THEN
		IF hmiParameter.Boxen[3].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe4	:= hmiParameter.Boxen[3].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox3.Klappe5 THEN
		IF hmiParameter.Boxen[3].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe5	:= hmiParameter.Boxen[3].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox3.Klappe6 THEN
		IF hmiParameter.Boxen[3].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[3].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[3].StellungKlappe6	:= hmiParameter.Boxen[3].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox3.Klappe6	:= FALSE;
	END_IF
	
	
	//BOX 4 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox4.Klappe1 THEN
		IF hmiParameter.Boxen[4].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe1	:= hmiParameter.Boxen[4].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox4.Klappe2 THEN
		IF hmiParameter.Boxen[4].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe2	:= hmiParameter.Boxen[4].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox4.Klappe3 THEN
		IF hmiParameter.Boxen[4].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe3	:= hmiParameter.Boxen[4].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox4.Klappe4 THEN
		IF hmiParameter.Boxen[4].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe4	:= hmiParameter.Boxen[4].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox4.Klappe5 THEN
		IF hmiParameter.Boxen[4].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe5	:= hmiParameter.Boxen[4].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox4.Klappe6 THEN
		IF hmiParameter.Boxen[4].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[4].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[4].StellungKlappe6	:= hmiParameter.Boxen[4].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox4.Klappe6	:= FALSE;
	END_IF
	
	
	//BOX 5 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox5.Klappe1 THEN
		IF hmiParameter.Boxen[5].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe1	:= hmiParameter.Boxen[5].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox5.Klappe2 THEN
		IF hmiParameter.Boxen[5].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe2	:= hmiParameter.Boxen[5].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox5.Klappe3 THEN
		IF hmiParameter.Boxen[5].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe3	:= hmiParameter.Boxen[5].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox5.Klappe4 THEN
		IF hmiParameter.Boxen[5].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe4	:= hmiParameter.Boxen[5].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox5.Klappe5 THEN
		IF hmiParameter.Boxen[5].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe5	:= hmiParameter.Boxen[5].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox5.Klappe6 THEN
		IF hmiParameter.Boxen[5].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[5].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[5].StellungKlappe6	:= hmiParameter.Boxen[5].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox5.Klappe6	:= FALSE;
	END_IF
	
	//BOX 6 =========================================================================================================
	IF hmiButtons.ButtonsKlappeBox6.Klappe1 THEN
		IF hmiParameter.Boxen[6].StellungKlappe1 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe1	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe1	:= hmiParameter.Boxen[6].StellungKlappe1 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe1	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox6.Klappe2 THEN
		IF hmiParameter.Boxen[6].StellungKlappe2 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe2	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe2	:= hmiParameter.Boxen[6].StellungKlappe2 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe2	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox6.Klappe3 THEN
		IF hmiParameter.Boxen[6].StellungKlappe3 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe3	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe3	:= hmiParameter.Boxen[6].StellungKlappe3 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe3	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox6.Klappe4 THEN
		IF hmiParameter.Boxen[6].StellungKlappe4 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe4	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe4	:= hmiParameter.Boxen[6].StellungKlappe4 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe4	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox6.Klappe5 THEN
		IF hmiParameter.Boxen[6].StellungKlappe5 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe5	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe5	:= hmiParameter.Boxen[6].StellungKlappe5 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe5	:= FALSE;
	END_IF
	IF hmiButtons.ButtonsKlappeBox6.Klappe6 THEN
		IF hmiParameter.Boxen[6].StellungKlappe6 >= 2 THEN
			hmiParameter.Boxen[6].StellungKlappe6	:= 0;
		ELSE
			hmiParameter.Boxen[6].StellungKlappe6	:= hmiParameter.Boxen[6].StellungKlappe6 + 1;
		END_IF
		hmiButtons.ButtonsKlappeBox6.Klappe6	:= FALSE;
	END_IF	


	//===============================================================================================================================================================================
	//IO-Test
	//===============================================================================================================================================================================
        
	//Wechsel zu Übersichtsseite wenn Test OK
	IF (hmiButtons.TestbetriebAbschliessen) THEN
		hmiActions.cmdChangePageTo := _700_SYS;
		hmiButtons.TestbetriebEin := FALSE;
	END_IF
       
	//Anzeigen der Übersichtsseite wenn Test Abbruch
	IF (hmiButtons.TestbetriebAbbrechen) THEN
		hmiActions.cmdChangePageTo		:= _700_SYS;
		hmiButtons.TestbetriebEin := FALSE;
	END_IF
       
	//Wenn Test "Fertig" -> Test OK setzen
	IF (EDGEPOS(hmiButtons.TestbetriebAbschliessen)) THEN
		hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen := TRUE;
		hmiParameter.Betrieb.BetriebAutoEin := TRUE;
	ELSIF (hmiButtons.TestbetriebEin) THEN
		hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen := FALSE;
		hmiParameter.Betrieb.BetriebAutoEin := FALSE;
	END_IF
       
	//Test OK rücksetzen
	IF (EDGEPOS(hmiButtons.TestbetriebAbbrechen)) OR (EDGEPOS(hmiButtons.TestbetriebEin)) THEN
		hmiNutzungsdaten.Allgemein.IoTestAbgeschlossen := FALSE;
	END_IF
       
	
END_PROGRAM