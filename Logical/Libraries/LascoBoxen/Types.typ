
TYPE
	typBoxenLuftmengenIn : {REDUND_UNREPLICABLE} 	STRUCT 
		GrundflaecheBox : {REDUND_UNREPLICABLE} REAL;
		BoxIstAktiv : {REDUND_UNREPLICABLE} BOOL;
		Ventilator1 : {REDUND_UNREPLICABLE} BOOL;
		Ventilator2 : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typKonfigurationBoxenOut : {REDUND_UNREPLICABLE} 	STRUCT 
		RestzeitSchlechtwetterPuls : {REDUND_UNREPLICABLE} UDINT; (*Restzeit Pulszeit Schlechtwetterbetrieb [ms]*)
		RestzeitSchlechtwetterPause : {REDUND_UNREPLICABLE} UDINT; (*Restzeit Pausezeit Schlechtwetterbetrieb [ms]*)
		BoxBereit : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Box <> AUS*)
		BoxAktiv : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Box <> AUS und Dauerbetrieb oder Zeitbereiche Intervall/Nachtrocknung sind aktiv*)
		DauerbetriebSperre : {REDUND_UNREPLICABLE} BOOL; (*Sperre von Dauerbetrieb für Box*)
		IntervallbetriebSperre : {REDUND_UNREPLICABLE} BOOL; (*Sperre von Intervallbetrieb für Box*)
		IntervallbetriebZeitenGesperrt : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitfenster Intervallbetrieb gesperrt (weil von anderer Box im selben Lüfterkreis gewählt)*)
		NachtrocknungZeitenGesperrt : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitfenster Nachtrocknung gesperrt (weil von anderer Box im selben Lüfterkreis gewählt)*)
	END_STRUCT;
	typKonfigurationBoxenIn : {REDUND_UNREPLICABLE} 	STRUCT 
		Ventilator1 : {REDUND_UNREPLICABLE} BOOL; (*0= Box wird nicht über Ventilator 1 versorgt, 1= Box wird über Ventilator 1 versorgt*)
		Ventilator2 : {REDUND_UNREPLICABLE} BOOL; (*0= Box wird nicht über Ventilator 2 versorgt, 1= Box wird über Ventilator 2 versorgt*)
		Luftentfeuchter : {REDUND_UNREPLICABLE} BOOL; (*0= Luftentfeuchter nicht vorhanden oder nicht von Box verwendet, 1= Luftentfeuchter wird von Box verwendet*)
		Warmluftofen : {REDUND_UNREPLICABLE} BOOL; (*0= Warmluftofen nicht vorhanden oder nicht von Box verwendet, 1= Warmluftofen wird von Box verwendet*)
		Heizregister : {REDUND_UNREPLICABLE} BOOL; (*0= Heizregister nicht vorhanden oder nicht von Box verwendet, 1= Heizregister wird von Box verwendet*)
		Scheitholzofen : {REDUND_UNREPLICABLE} BOOL; (*0= Scheitholzofen nicht vorhanden oder nicht von Box verwendet, 1= Scheitholzofen wird von Box verwendet*)
		StellungKlappe1 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		StellungKlappe2 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		StellungKlappe3 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		StellungKlappe4 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		StellungKlappe5 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		StellungKlappe6 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= Klappe nicht vorhanden oder nicht von Box verwendet, 1= Klappe bei Ansteuerung der Box geschlossen, 2= Klappe bei Ansteuerung der Box geöffnet*)
		DauerbetriebEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Dauerbetrieb ausgewählt (Automatikbetrieb)*)
		WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird im Automatikbetrieb auf Puls/Pausebetrieb umgeschaltet, wenn keine Luftaufbereitung verfügbar ist.*)
		LuftaufbIstVerfuegbar : {REDUND_UNREPLICABLE} BOOL; (*TRUE, wenn eine Luftaufbereitung verfügbar ist (In Ausstattung vorhanden, Betriebsart <> AUS, kein Fehler)*)
		IntervallbetriebEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Intervallbetrieb ausgewählt*)
		NachtrocknungEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Nachtrocknung ausgewählt*)
		IntervallbetriebZeiten : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitfenster Intervallbetrieb*)
		NachtrocknungZeiten : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitfenster Nachtrocknung*)
		SchlechtwetterPulszeit : {REDUND_UNREPLICABLE} UDINT; (*Pulszeit bei Schlechtwettterbetrieb [ms]*)
		SchlechtwetterPausezeit : {REDUND_UNREPLICABLE} UDINT; (*Pausezeit bei Schlechtwetterbetrieb [ms]*)
	END_STRUCT;
	enumStellungKlappenBoxen : 
		(
		FBBOX_NICHT_VERWENDET := 0, (*Stellung der Klappe für Box nicht relevant*)
		FBBOX_GESCHLOSSEN := 1,
		FBBOX_GEOEFFNET := 2
		);
END_TYPE
