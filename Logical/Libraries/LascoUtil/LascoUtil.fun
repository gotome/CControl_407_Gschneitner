(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: LascoUtil.fun
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Funktionen und Funktionsblöcke der Library LascoUtil
 ********************************************************************)

FUNCTION_BLOCK fbLascoAutoRuecklauf (*Automatische Rücklauffunktion für Motoren*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe der Funktion*)
		ImpulseVorBisRueck : UDINT; (*Nach dieser Anzahl von Vorwärtsimpulsen fährt der Motor für die Dauer "Rücklaufzeit" zurück.*)
		Ruecklaufzeit : UDINT; (*Rücklaufzeit*)
		VerzUmschaltung : UDINT; (*Verzögerungszeit zwischen Vor und Zurück*)
		ImpulsVor : BOOL; (*Vorwärtsimpuls des Motors*)
		Zuendphase : BOOL; (*Modus Zündphase (1. Einschub)*)
		Heizphase : BOOL; (*Modus Heizphase*)
		LaufzeitEinschubZuendung : UDINT; (*Laufzeit 1. Einschub bei Zündung*)
		sekTick : BOOL; (*Sekundentakt*)
		MaxLaufzeitVor : REAL; (*Max. Laufzeit Vorwärts bei 1. Einschub (danach fährt Schnecke zurück)*)
	END_VAR
	VAR_OUTPUT
		MotorRueck : BOOL; (*Kommando Motor Rückwärts*)
		MotorVor : BOOL;
	END_VAR
	VAR
		ctEinschuebeSeitRuecklauf : UDINT;
		loc_RuecklaufErforderlich : BOOL;
		TON_Umschaltverz : TON;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		TOF_Ruecklauf : TOF;
		loc_curStep : USINT;
		stateEntry : BOOL;
		ctLaufzeitEinschub1 : UDINT;
		ctLaufzeitEinschubVor : UDINT;
		loc_RueckwaertsOk : BOOL;
		zzEdge00003 : BOOL;
		zzEdge00004 : BOOL;
		zzEdge00005 : BOOL;
		zzEdge00006 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoBskUeberw (*Ansteuerung Brandschutzklappe mit Laufzeitüberwachung und Freiräumung*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe Funktionsbaustein*)
		FreigabeOeffnen : BOOL; (*Befehl Klappe Öffnen*)
		FreigabeSchliessen : BOOL; (*Befehl Klappe Schließen*)
		diKlappeGeschlossen : BOOL; (*Eingang Klappe ist geschlossen*)
		diKlappeGeoeffnet : BOOL; (*Eingang Klappe ist geöffnet*)
		Quit : BOOL; (*Fehlerquittierung*)
		MaxVersucheZu : UDINT; (*Max. Versuche Klappe schließen bis Fehlerausgabe*)
		MaxVersucheAuf : UDINT; (*Max. Versuche Klappe öffnen bis Fehlerausgabe*)
		LaufzeitZu : UDINT; (*Laufzeit Klappe schließen [ms]*)
		LaufzeitAuf : UDINT; (*Laufzeit Klappe öffnen [ms]*)
	END_VAR
	VAR_OUTPUT
		doKlappeOeffnen : BOOL; (*Ausgang Klappe öffnen*)
		Stoerung : BOOL; (*Ausgang Störung*)
		ctVersucheAuf : UDINT; (*Zähler Anzahl Fehlversuche Öffnen*)
		ctVersucheZu : UDINT; (*Zähler Anzahl Fehlversuche Schließen*)
	END_VAR
	VAR
		TON_Laufzeit : TON; (*TON Laufzeitüberwachung*)
		stateEntry : BOOL;
		lastStep : enumStepsBskUeberw;
		nextStep : enumStepsBskUeberw;
		curStep : enumStepsBskUeberw;
		loc_KlappeIstOffen : BOOL;
		loc_KlappeIstGeschlossen : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoEUhr (*Echtzeituhr auslesen*)
	VAR_INPUT
		Freigabe : BOOL;
	END_VAR
	VAR_OUTPUT
		StdMin : INT;
		Jahr : UINT;
		Monat : USINT;
		Tag : USINT;
		WoTag : USINT;
		Stunde : USINT;
		Minute : USINT;
		Sekunde : USINT;
		Milli : UINT;
		Mikro : UINT;
	END_VAR
	VAR
		Echtzeit : Zeit_type;
		DTGetTime_0 : DTGetTime;
		DateTime : DATE_AND_TIME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoTON (*Einschaltverzögerung*)
	VAR_INPUT
		IN : BOOL;
		Zeit : REAL;
		Tick : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		Elapsed : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoTOF (*Ausschaltverzögerung*)
	VAR_INPUT
		IN : BOOL; (*Freigabe*)
		Reset : BOOL; (*Reset Ausschaltverzögerung*)
		Zeit : REAL; (*Verzögerungszeit*)
		Tick : BOOL; (*Taktfrequeunz*)
	END_VAR
	VAR_OUTPUT
		Q : BOOL; (*Ausgang*)
	END_VAR
	VAR
		Elapsed : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoTOG (*Toggle- Funktion*)
	VAR_INPUT
		IN : BOOL;
		Reset : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		ToggImp : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION funLascoMinss : REAL (*Wert in Minuten und Sekunden umwandeln*)
	VAR_INPUT
		IN : REAL;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK fbLascoZdxx (*Tickausgabe bei Zustandsänderung des Einganges*)
	VAR_INPUT
		IN : REAL; (*Eingangsvariable, die auf eine Veränderung kontrolliert wird*)
	END_VAR
	VAR_OUTPUT
		Q : BOOL; (*Flanke, wenn Änderung am Eingang*)
	END_VAR
	VAR
		MEM : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoZbFrg (*Zeitfenster Freigabe*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe*)
		StartZeit : REAL; (*Start-Zeit im Format hhmm*)
		StoppZeit : REAL; (*Stopp-Zeit im Format hhmm*)
	END_VAR
	VAR_OUTPUT
		FreigZeitfenster : BOOL; (*Ausgang Freigabe*)
	END_VAR
	VAR
		EUhr : fbLascoEUhr;
		AktZeit : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoBstd (*Betriebsstundenzähler auf Minutenbasis*)
	VAR_INPUT
		Aktiv : BOOL; (*Betriebsmittel ist Aktiv*)
		minTick : BOOL; (*Minutentakt*)
		Stunden : REFERENCE TO UDINT; (*Betriebsstunden*)
		Reset : BOOL; (*Alles Rücksetzen*)
	END_VAR
	VAR
		Minuten : USINT; (*Minutenzähler*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoBmin (*Betriebsdauer in Minuten zählen*)
	VAR_INPUT
		Aktiv : BOOL; (*Betriebsmittel Aktiv*)
		sekTick : BOOL; (*Sekundentakt*)
		Minuten : REFERENCE TO USINT; (*Ausgabe Minuten*)
		Reset : BOOL; (*Rücksetzen*)
	END_VAR
	VAR
		Sekunden : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoStdMin (*Angehängte Betriebsdauer von Minuten in Stunden umwandeln*)
	VAR_INPUT
		Minuten : REFERENCE TO USINT; (*Betriebsdauer in Minuten*)
		Stunden : REFERENCE TO UDINT; (*Betriebsdauer in Stunden*)
		Reset : BOOL; (*Rücksetzen*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoSrvcInterv (*Funktionsbaustein für Serviceintervalle*)
	VAR_INPUT
		Aktiv : BOOL; (*Bauteil aktiv*)
		Tick : BOOL; (*Taktfrequenz*)
		SrvcIntervall : UDINT; (*Serviceintervall*)
		ZeitBisSrvc : REFERENCE TO UDINT; (*Verbleibende Zeit bis zum Service*)
		SrvcReset : BOOL; (*Servicemeldung zurücksetzen*)
	END_VAR
	VAR_OUTPUT
		SrvcErforderl : BOOL; (*Meldung Service erforderlich*)
	END_VAR
	VAR
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoBrStfLst (*Berechnung der Brennstoffleistung*)
	VAR_INPUT
		sekTick : BOOL; (*Sekundentakt*)
		LeistungAkt : REAL; (*Aktuelle Leistung in kW*)
		Leistung_MWh : REFERENCE TO UDINT; (*Erbrachte Brennstoffleistung in MWh*)
		Leistung_kWh : REFERENCE TO REAL; (*Erbrachte Brennstoffleistung in kWh*)
		Reset : BOOL; (*Rücksetzen*)
	END_VAR
	VAR
		LeistungSek : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoWoPrg (*Wochenprogramm*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe *)
		WoPrg : ARRAY[0..7] OF WoPrg_type; (*Feld Wochenprogramm (Heizzeiten pro Wochentag)*)
	END_VAR
	VAR_OUTPUT
		WoPrgFreigabe : BOOL; (*Ausgang Freigabe Wochenprogramm*)
		WoTag : USINT;
	END_VAR
	VAR
		EUhr : fbLascoEUhr;
		StartZeit_1 : REAL;
		StopZeit_1 : REAL;
		StartZeit_2 : REAL;
		StopZeit_2 : REAL;
		AktZeit : REAL;
		FreigabeZeit_1 : BOOL;
		FreigabeZeit_2 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoDrzuebw (*Drehzahlüberwachung eines Motors*)
	VAR_INPUT
		Motor : BOOL; (*Motor läuft*)
		Impuls : BOOL; (*Drehimpuls*)
		Tick : BOOL; (*Takt*)
		Zeit : REAL; (*max. Dauer Stillstand*)
		Quit : BOOL; (*Fehlerquittierung*)
	END_VAR
	VAR_OUTPUT
		Fehler : BOOL; (*Fehlerausgang*)
	END_VAR
	VAR
		nextStep : USINT;
		curStep : USINT;
		ElapsedTime : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoFehl (*Fehlerverzögerung und Quittierungsverhalten*)
	VAR_INPUT
		FehlerIn : BOOL; (*Fehlereingang*)
		VerzZeit : REAL; (*Verzögerungszeit*)
		Quit : BOOL; (*Fehlerquittierung*)
		Tick : BOOL; (*Taktfrequenz*)
		Mode : USINT; (*0= Fehlerdominant, nur rücksetzbar wenn kein Fehlereingang/1= Quittierdominant/2= Quittierdominant, keine Selbsthaltung /3= Keine Quittierung, keine Selbsthaltung /4= Selbstquittierung*)
	END_VAR
	VAR_OUTPUT
		FehlerOut : BOOL; (*Fehlerausgang*)
	END_VAR
	VAR
		Counter : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoFept (*Fehlergenerierung PT100- Eingang*)
	VAR_INPUT
		IN : REAL; (*PT100- Wert*)
		Quit : BOOL; (*Fehlerquittierung*)
		Enable : BOOL; (*Freigabe*)
		Tick : BOOL; (*Taktfrequenz*)
		VerzZeit : REAL; (*Fehlerverzögerung*)
	END_VAR
	VAR_OUTPUT
		Q : BOOL; (*Fehlerausgang*)
	END_VAR
	VAR
		Counter : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoPuge (*Pulsgenerator*)
	VAR_INPUT
		StartMitPuls : BOOL; (*Mit Puls Starten*)
		StartMitPause : BOOL; (*Mit Pause Starten*)
		Tick : BOOL; (*Taktfrequeunz*)
		ZeitPuls : REAL; (*Pulszeit*)
		ZeitPause : REAL; (*Pausenzeit*)
		Reset : BOOL; (*Reset Pulszeit*)
	END_VAR
	VAR_OUTPUT
		PulsQ : BOOL; (*Puls*)
		PauseQ : BOOL; (*Pause*)
		RestzeitPuls : REAL; (*Restliche Pulszeit*)
		RestzeitPause : REAL; (*Restliche Pausenzeit*)
	END_VAR
	VAR
		currStep : USINT;
		CounterPuls : REAL;
		CounterPause : REAL;
		nextStep : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoLstgStell (*Leistungssteller*)
	VAR_INPUT
		Enable : BOOL; (*Freigabe*)
		GesLeistungMin : REAL; (*Minimale Gesamtleistung*)
		GesLeistungMax : REAL; (*Maximale Gesamtleistung*)
		EinschubPulsMin : REAL; (*Minimale Pulszeit Einschubschnecke*)
		EinschubPulsMax : REAL; (*Maximale Pulszeit Einschubschnecke*)
		SaugzugDrehzMin : REAL; (*Minimale Drehzahl Saugzuggebläse*)
		SaugzugDrehzMax : REAL; (*Maximale Drehzahl Saugzuggebläse*)
		PrimaerStellMin : REAL; (*Minimale Stellung Primärluftklappe*)
		PrimaerStellMax : REAL; (*Maximale Stellung Primärklappe*)
		EinschubPauseMin : REAL; (*Minimale Pulszeit Einschubschnecke*)
		EinschubPauseMax : REAL; (*Maximale Pulszeit Einschubschnecke*)
		SekundaerStellMin : REAL; (*Minimale Stellung Sekundärklappe*)
		SekundaerStellMax : REAL; (*Maximale Stellung Sekundärklappe*)
		GesLeistungSoll : REAL; (*Leistung Sollwert*)
		RostPulsMin : REAL;
		RostPulsMax : REAL;
		RostPauseMin : REAL;
		RostPauseMax : REAL;
		ReziStellMin : REAL;
		ReziStellMax : REAL;
	END_VAR
	VAR_OUTPUT
		EinschubPulsSoll : UDINT; (*Stellgröße Puls Einschub*)
		EinschubPauseSoll : UDINT; (*Stellgröße Pause Einschub*)
		PrimaerStellSoll : REAL; (*Stellgröße Primärklappe*)
		SekundaerStellSoll : REAL; (*Stellgröße Sekundärklappe*)
		SaugzugDrehzSoll : REAL; (*Stellgröße Saugzuggebläse*)
		ReziStellSoll : REAL;
		RostPulsSoll : UDINT;
		RostPauseSoll : UDINT;
	END_VAR
	VAR
		ScalDrehzSaugzug : LCRLimScal;
		ScalStellPrimaer : LCRLimScal;
		ScalStellSekundaer : LCRLimScal;
		ScalPulsEinschub : LCRLimScal;
		ScalPauseEinschub : LCRLimScal;
		ScalPulsRost : LCRLimScal;
		ScalPauseRost : LCRLimScal;
		ScalStellRezi : LCRLimScal;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoLstRamp (*Rampenfunktion, Leistungsanstieg pro Minute*) (*$GROUP=Lasco,$CAT=Warmluftofen,$GROUPICON=LD_user.png,$CATICON=LD_basic.png*)
	VAR_INPUT
		Enable : BOOL; (*Freigabe*)
		LeistungStart : REAL; (*Leistung Out bei Start der Funktion*)
		LeistungSoll : REAL; (*Leistungsvorgabe*)
		sekTick : BOOL; (*Sekundentakt*)
		AnstiegProMinute : REAL; (*Leistungsanstieg pro Minute*)
		Pause : BOOL;
		LeistungOut : REFERENCE TO REAL;
	END_VAR
	VAR_OUTPUT
		Fertig : BOOL; (*Meldung Fertig*)
	END_VAR
	VAR
		AnstiegProSekunde : REAL;
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoZund (*Funktionsblock Zündgebläse*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe Zündung*)
		IstTemp : REAL; (*Ist- Temperatur Brennraum*)
		SollTemp : REAL; (*Soll- Temperatur Brennraum*)
		Zuendzeit : REAL; (*Max. Zündzeit*)
		Nachlaufzeit : REAL; (*Nachlaufzeit Zündgebläse*)
		Tick : BOOL; (*Taktfrequenz für Zeitglieder*)
	END_VAR
	VAR_OUTPUT
		Zuendspule : BOOL; (*Ausgang Zündspule*)
		ZuendungOK : BOOL; (*Meldung Zündung OK*)
		ZuendungFehler : BOOL; (*Fehlermeldung Zündung*)
		Zuendgeblaese : BOOL; (*Ausgang Zündgebläse*)
	END_VAR
	VAR
		TON_Zuendzeit : fbLascoTON;
		TOF_Nachlaufzeit : fbLascoTOF;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoFU (*Ansteuerung Frequenzumrichter*)
	VAR_INPUT
		Freigabe : BOOL; (*Umrichter Freigabe*)
		SollDrehzahl : REAL; (*Drehzahlvorgabe*)
		AnsprechZeitFU : REAL; (*Max. Ansprechverzögerung Betriebsmeldung*)
		BetrMldg : BOOL; (*Betriebsmeldung*)
		RampeUpSek : REAL; (*Rampenzeit Drehzahlerhöhung (sek)*)
		RampeDownSek : REAL; (*Rampenzeit Drehzahlverminderung (sek)*)
		Reset : BOOL; (*Fehler- Reset*)
		Tick : BOOL; (*Taktfrequenz Zeitglieder*)
		MaxDrehzahl : REAL; (*Maximale Drehzahl Umrichter*)
		MinDrehzahl : REAL; (*Minimale Drehzahl Umrichter*)
	END_VAR
	VAR_OUTPUT
		BetriebFU : BOOL; (*Umrichter Betrieb*)
		StoerungFU : BOOL; (*Fehlerausgang*)
		DrehzahlFU : REAL; (*Drehzahlvorgabe*)
	END_VAR
	VAR
		TON_Betriebsmeldung : fbLascoTON;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		InitDone : BOOL;
		ResetDone : BOOL;
		LCRRamp_0 : LCRRamp;
		RampDownMillis : DINT;
		RampUpMillis : DINT;
		IstDrehzahl : REAL;
		Init : BOOL;
		zzEdge00003 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoZweiPunktAchse (*Ansteuerung Zweipunktachse*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe *)
		Vor : BOOL; (*Befehl Vorwärts*)
		Zurueck : BOOL; (*Befehl Rückwärts*)
		AnsprechZeit : REAL; (*Ansprechverzögerung*)
		MinLaufZeit : REAL; (*Nachlaufzeit*)
		Stoerung : BOOL; (*Störungseingang*)
		ESVor : BOOL; (*Endlage Vorwärtsbewegung*)
		ESZurueck : BOOL; (*Endlage Rückwärtsbewegung*)
		Tick : BOOL; (*Taktfrequenz*)
	END_VAR
	VAR_OUTPUT
		Motor_Vor : BOOL; (*Ausgang Vorwärts*)
		Motor_Zurueck : BOOL; (*Ausgang Rückwärts*)
		Fehler : BOOL; (*Fehlerausgang*)
	END_VAR
	VAR
		TON_Ansprechzeit : fbLascoTON;
		TOF_Laufzeit : fbLascoTOF;
		loc_Vor : BOOL;
		TON_AnsprechzeitZurueck : fbLascoTON;
		TOF_LaufzeitZurueck : fbLascoTOF;
		loc_Zurueck : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoStellachse (*Ansteuerung Stellachsen*)
	VAR_INPUT
		Freigabe : BOOL; (*Achse Freigabe*)
		Stoerung : BOOL; (*Fehlereingang*)
		SollStellung : REAL; (*Vorgabe Stellung*)
		IstStellung : REAL; (*Istwert Stellung*)
		EsVor : BOOL; (*Endlage Auf-Bewegung*)
		Hysterese : REAL; (*Hysterese zw. Soll- und Iststellung*)
		EsZurueck : BOOL; (*Endlage Zu-Bewegung*)
	END_VAR
	VAR_OUTPUT
		MotorVor : BOOL; (*Ausgang Motor Vor*)
		MotorZurueck : BOOL; (*Ausgang Motor Zurück*)
		Fehler : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoStellachseAnalog (*Ansteuerung von analogen Stellachsen*)
	VAR_INPUT
		Freigabe : BOOL; (*Achse Freigabe*)
		SollStellung : REAL; (*Vorgabe Stellung*)
		IstStellung : REAL; (*Istwert Stellung*)
		Hysterese : REAL; (*Hysterse zw. Soll- und Iststellung*)
		EsVor : BOOL; (*Endlage Auf-Bewegung*)
		EsZurueck : BOOL; (*Endlage Zu-Bewegung*)
		Stoerung : BOOL; (*Fehlereingang*)
	END_VAR
	VAR_OUTPUT
		MotorStellung : REAL; (*Ausgang Stellgröße Motor*)
		Fehler : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoStellachseDigital (*Ansteuerung von Stellachsen ohne Positionsrückmeldung*)
	VAR_INPUT
		Freigabe : BOOL;
		Sollstellung : REAL;
		Referenz : BOOL;
		Oeffnungszeit : REAL;
		Schliesszeit : REAL;
		MinPosition : REAL;
		MaxPosition : REAL;
		MinImpulsdauer : REAL;
		Tick : BOOL; (*Zehntelsekunden- Takt*)
	END_VAR
	VAR_OUTPUT
		ReferenzOk : BOOL;
		MotorAuf : BOOL;
		MotorZu : BOOL;
		ReferenzAktiv : BOOL;
		IstPosition : REAL;
	END_VAR
	VAR
		LCRContinServo_0 : LCRContinServo;
		zzEdge00000 : BOOL;
		WegProZeitAuf : REAL;
		WegProZeitZu : REAL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoWarmluftsteller (*Ansteuerung Warmluftgebläse mit Kühlreduzierung*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe*)
		IstTemperatur : REAL; (*Aktuelle Temperatur*)
		GrenzTemperatur : REAL; (*Grenztemperatur*)
		Bezugszeit : REAL; (*Bezugszeit*)
		MinderungDRZ : REAL; (*Drehzahlminderung pro Schritt*)
		Tick : BOOL; (*Taktfrequeunz*)
		WLG1MinDRZ : REAL; (*Gebläse 1 Min. Drehzahl*)
		WLG2MinDRZ : REAL; (*Gebläse 2 Min. Drehzahl*)
		WLG1SollDRZ : REAL; (*Gebläse 1 Soll-Drehzahl*)
		WLG2SollDRZ : REAL; (*Gebläse 2 Soll-Drehzahl*)
	END_VAR
	VAR_OUTPUT
		WLG1DRZStell : REAL; (*Stellgröße Gebläse 1*)
		WLG2DRZStell : REAL; (*Stellgröße Gebläse 2*)
	END_VAR
	VAR
		curState : USINT;
		nextState : USINT;
		stateEntry : BOOL;
		locDrehzahl1 : REAL;
		locDrehzahl2 : REAL;
		TON_WarmluftSteller : fbLascoTON;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoFreilauf (*Freilauffunktion für blockierende Motoren*)
	VAR_INPUT
		Freigabe : BOOL; (*Funktion Freigabe*)
		Tick : BOOL; (*Taktfrequenz*)
		Stehzeit : REAL; (*Max. Stehzeit des Motors*)
		Impuls : BOOL; (*Drehimpuls*)
		VerzFreilauf : REAL; (*Verzögerungszeit zw. Richtungswechseln*)
		Freilaufzeit : REAL; (*Freilaufzeit*)
		MaxVersuche : INT; (*Max. Freiläufe pro Minute*)
		Quit : BOOL; (*Fehlerquittierung*)
	END_VAR
	VAR_OUTPUT
		MotorVor : BOOL; (*Freigabe Motor Vorwärts*)
		MotorZurueck : BOOL; (*Freigabe Motor Rückwärts*)
		Fehler : BOOL;
	END_VAR
	VAR
		curStep : USINT;
		nextStep : USINT;
		stateEntry : BOOL;
		DRZWaechter : fbLascoDrzuebw;
		TON_VerzRW : fbLascoTON;
		TON_Freilaufzeit : fbLascoTON;
		CounterVersuche : INT;
		TON_ResetCounter : fbLascoTON;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoFuellst (*Überwachung von Fuellstandssensoren*)
	VAR_INPUT
		Fuellstand : BOOL;
		EinschubEin : BOOL;
		Quit : BOOL;
		Tick : BOOL;
		VerzZeit : REAL;
	END_VAR
	VAR_OUTPUT
		Fehler : BOOL;
	END_VAR
	VAR
		cKeineFlankeFs : UDINT;
		zzEdge00000 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoWlg (*Ansteuerung für Warmluftgebläse ohne Drehzahlvorgabe*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe*)
		StartBeiTemp : REAL; (*Wenn Ist- Temperatur über diesem Wert -> Gebläse Ein*)
		StopBeiTemp : REAL; (*Wenn Ist- Temperatur unter diesem Wert -> Gebläse Aus*)
		IstTemp : REAL; (*Ist- Temperatur*)
		Stoerung : BOOL; (*Störungseingang*)
	END_VAR
	VAR_OUTPUT
		GeblaeseEin : BOOL; (*Ansteuerung Gebläse*)
		Fehler : BOOL; (*Fehlerausgang*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoBsk (*Funktionsbaustein zur Ansteuerung von federrückgestellten Klappenantrieben*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe Funktionsbaustein*)
		Oeffnen : BOOL; (*Befehl Öffnen*)
		KlappeIstOffen : BOOL; (*Eingang Klappe ist Offen*)
		KlappeIstGeschlossen : BOOL; (*Eingang Klappe ist Geschlossen*)
		FahrzeitAuf : UDINT; (*Fahrzeit Klappe Auf [ms]*)
		FahrzeitZu : UDINT; (*Fahrzeit Klappe Zu [ms]*)
		QuitFehler : BOOL; (*Fehlerquittierung*)
		Stoerung : BOOL; (*Eingang Fehler*)
	END_VAR
	VAR_OUTPUT
		KlappeAuf : BOOL; (*Ausgang Klappe Öffnen*)
		Fehler : BOOL; (*Augang Fehler*)
		FehlerFahrzeitAuf : BOOL; (*Ausgang Fehler beim Öffnen*)
		FehlerFahrzeitZu : BOOL; (*Ausgang Fehler beim Schliessen*)
	END_VAR
	VAR
		TON_FahrzeitAuf : TON;
		TON_FahrzeitZu : TON;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		zzEdge00003 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoTrend (*Trenderkennung eines Eingangswertes innerhalb einer Zeitspanne (steigend/fallend)*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL;
		Eingangswert : REAL;
		Zeitspanne : REAL;
		Tick : BOOL;
		MinAbweichung : REAL; (*Mindest-Abweichung bis eine Tendenz erkannt wird*)
	END_VAR
	VAR_OUTPUT
		TendenzSteigend : BOOL;
		TendenzFallend : BOOL;
	END_VAR
	VAR
		ctZeitspanne : REAL;
		Mittelwert : REAL;
		SummeWert : LREAL;
		MittelwertMEM : REAL;
		Abweichung : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbLascoTimerHand (*Timer mit Hand-Funktionen*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL;
		Zeit : REAL;
		Tick : BOOL;
		HandEin : BOOL;
		HandAus : BOOL;
	END_VAR
	VAR_OUTPUT
		Q : BOOL;
	END_VAR
	VAR
		Elapsed : REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbLascoPugeV2 (*Puls/Pause-Generator mit Standard-Timern*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		StartMitPuls : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		curStep : {REDUND_UNREPLICABLE} USINT;
		nextStep : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		PulsOut : {REDUND_UNREPLICABLE} BOOL;
		PauseOut : {REDUND_UNREPLICABLE} BOOL;
		RestzeitPause : {REDUND_UNREPLICABLE} UDINT;
		RestzeitPuls : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_INPUT
		ZeitPuls : {REDUND_UNREPLICABLE} UDINT;
		StartMitPause : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		TON_Schrittzeit : {REDUND_UNREPLICABLE} TON;
	END_VAR
	VAR_INPUT
		ZeitPause : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
END_FUNCTION_BLOCK
