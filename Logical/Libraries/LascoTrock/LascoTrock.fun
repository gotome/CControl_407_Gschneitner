(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: LascoTrock.fun
 * Autor: Rudolf Lachner
 * Erstellt: 10. März 2014
 ********************************************************************
 * Funktionen und Funktionsblöcke der Library LascoTrock
 ********************************************************************)

FUNCTION_BLOCK fbTrockZeitprogramm (*Generierung von Start- und Stoppsignalen aus Zeitprogramm*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe des Funktionsblockes*)
		AktZeit : REAL; (*Aktuelle Zeit im Format hhmm*)
		StartZeit1 : REAL; (*Startzeit 1*)
		StartZeit2 : REAL; (*Startzeit 2*)
		StartZeit3 : REAL; (*Startzeit 3*)
		StartZeit4 : REAL; (*Startzeit 4*)
		StartZeit5 : REAL; (*Startzeit 5*)
		StoppZeit1 : REAL; (*Stoppzeit 1*)
		StoppZeit2 : REAL; (*Stoppzeit 2*)
		StoppZeit3 : REAL; (*Stoppzeit 3*)
		StoppZeit4 : REAL; (*Stoppzeit 4*)
		StoppZeit5 : REAL; (*Stoppzeit 5*)
	END_VAR
	VAR_OUTPUT
		FreigabeZeitprogramm : BOOL; (*Freigabe von Zeitprogramm*)
	END_VAR
	VAR
		FreigZeitfenster1 : BOOL;
		FreigZeitfenster2 : BOOL;
		FreigZeitfenster3 : BOOL;
		FreigZeitfenster4 : BOOL;
		FreigZeitfenster5 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbTrockLaufPause (*Lauf- und Pausenprogramm*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL;
		ZeitLauf : UDINT; (*Laufzeit*)
		ZeitLaufMin : UDINT; (*Mindestlaufzeit*)
		Tick : BOOL; (*Zeittick*)
		Reset : BOOL; (*Reset*)
		ZeitPause : UDINT;
	END_VAR
	VAR_OUTPUT
		FreigabeLpPrg : BOOL; (*Freigabe von Lauf/Pausenprogramm*)
		RestzeitPause : UDINT;
		RestzeitLauf : UDINT;
	END_VAR
	VAR
		currStep : USINT;
		nextStep : USINT;
		CounterLauf : UDINT;
		CounterPause : UDINT;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockNachtrock (*Funktionsbaustein Nachtrocknung*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		AktZeit : {REDUND_UNREPLICABLE} REAL;
		StartZeit1 : {REDUND_UNREPLICABLE} REAL;
		StartZeit2 : {REDUND_UNREPLICABLE} REAL;
		StartZeit3 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit1 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit2 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit3 : {REDUND_UNREPLICABLE} REAL;
		TagTick : {REDUND_UNREPLICABLE} BOOL;
		ZyklusTageSoll : {REDUND_UNREPLICABLE} UDINT;
		DauerNachtrocknungTage : {REDUND_UNREPLICABLE} UDINT;
		StdTick : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		FreigabeNachtrocknung : {REDUND_UNREPLICABLE} BOOL;
		TageNachtrocknungAktiv : {REDUND_UNREPLICABLE} UDINT;
		ZyklusTageIst : {REDUND_UNREPLICABLE} UDINT;
		AktTagFreigabe : {REDUND_UNREPLICABLE} BOOL;
		NachtrocknungFertig : {REDUND_UNREPLICABLE} BOOL;
		StdNachtrocknung : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		FreigZeitfenster1 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster2 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster3 : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockTarifabsch (*Funktionsbaustein Tarifabschaltung*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		StartMin1 : {REDUND_UNREPLICABLE} REAL;
		StartStd1 : {REDUND_UNREPLICABLE} REAL;
		StartMin2 : {REDUND_UNREPLICABLE} REAL;
		StartStd2 : {REDUND_UNREPLICABLE} REAL;
		StartMin3 : {REDUND_UNREPLICABLE} REAL;
		StartStd3 : {REDUND_UNREPLICABLE} REAL;
		AktZeit : {REDUND_UNREPLICABLE} REAL;
		StoppMin1 : {REDUND_UNREPLICABLE} REAL;
		StoppStd1 : {REDUND_UNREPLICABLE} REAL;
		StoppMin2 : {REDUND_UNREPLICABLE} REAL;
		StoppStd2 : {REDUND_UNREPLICABLE} REAL;
		StoppMin3 : {REDUND_UNREPLICABLE} REAL;
		StoppStd3 : {REDUND_UNREPLICABLE} REAL;
		VorlaufzeitLuftaufbMin : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR_OUTPUT
		TarifabschaltungLuftaufbEin : {REDUND_UNREPLICABLE} BOOL;
		TarifabschaltungEin : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		FreigZeitfenster1 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster2 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster3 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeZeitfensterLuftaufb1 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeZeitfensterLuftaufb2 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeZeitfensterLuftaufb3 : {REDUND_UNREPLICABLE} BOOL;
		StartZeit2 : {REDUND_UNREPLICABLE} REAL;
		StartZeit3 : {REDUND_UNREPLICABLE} REAL;
		StartZeit1 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit2 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit3 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit1 : {REDUND_UNREPLICABLE} REAL;
		loc_StdVorlaufzeitREAL : {REDUND_UNREPLICABLE} REAL;
		loc_StdVorlaufzeit : {REDUND_UNREPLICABLE} INT;
		loc_MinVorlaufzeit : {REDUND_UNREPLICABLE} REAL;
		loc_ZwischenergStartStd : {REDUND_UNREPLICABLE} REAL;
		loc_StartStdLuftaufb : {REDUND_UNREPLICABLE} REAL;
		loc_ZwischenergStartMin : {REDUND_UNREPLICABLE} REAL;
		loc_StartMinLuftaufb : {REDUND_UNREPLICABLE} REAL;
		StartZeitLuftaufb1 : {REDUND_UNREPLICABLE} REAL;
		StartZeitLuftaufb2 : {REDUND_UNREPLICABLE} REAL;
		StartZeitLuftaufb3 : {REDUND_UNREPLICABLE} REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockStrombegr (*Strombegrenzung in bestimmten Zeitfenstern*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		StartZeit1 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit1 : {REDUND_UNREPLICABLE} REAL;
		AktZeit : {REDUND_UNREPLICABLE} REAL;
		StartZeit2 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit2 : {REDUND_UNREPLICABLE} REAL;
		StartZeit3 : {REDUND_UNREPLICABLE} REAL;
		StoppZeit3 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlBegrenzung1 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlBegrenzung2 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlBegrenzung3 : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR_OUTPUT
		StrombegrenzungEin : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlBegrenzung : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		FreigZeitfenster1 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster2 : {REDUND_UNREPLICABLE} BOOL;
		FreigZeitfenster3 : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockAutomatik (*Trocknung im Automatikbetrieb*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		WetterIstGut : {REDUND_UNREPLICABLE} BOOL;
		LuftaufberVhd : {REDUND_UNREPLICABLE} BOOL;
		Tick : {REDUND_UNREPLICABLE} BOOL;
		LaufzeitSchlecht : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitSchlechtMin : {REDUND_UNREPLICABLE} UDINT;
		PausenzeitSchlecht : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_OUTPUT
		FreigabeAutomatik : {REDUND_UNREPLICABLE} BOOL;
		Intervallbetrieb : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		fbLaufPause : {REDUND_UNREPLICABLE} fbTrockLaufPause;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockStufen (*Umschaltung der Trockenstufen*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		FeuchteStufen : {REDUND_UNREPLICABLE} ARRAY[0..10] OF REAL;
		FeuchteStart : {REDUND_UNREPLICABLE} REAL;
		VerzStufenwechsel : {REDUND_UNREPLICABLE} UDINT;
		Bestaetigung : {REDUND_UNREPLICABLE} BOOL;
		FeuchteAktuell : {REDUND_UNREPLICABLE} REAL;
		FeuchteEnde : {REDUND_UNREPLICABLE} REAL; (*Gewünschte Feuchte bei Trocknungsende*)
		NachtrocknungFertig : {REDUND_UNREPLICABLE} BOOL;
		AktuelleRezeptNr : {REDUND_UNREPLICABLE} USINT; (*Aktuell gesetztes Rezept*)
		FreigabeAuto : {REDUND_UNREPLICABLE} BOOL; (*Freigabe im Automatikbetrieb*)
	END_VAR
	VAR_OUTPUT
		RezeptStufeIst : {REDUND_UNREPLICABLE} INT;
		MldgBestaetigungErforderl : {REDUND_UNREPLICABLE} BOOL;
		RezeptStufeBeiEnde : {REDUND_UNREPLICABLE} INT;
		MeldungFertig : {REDUND_UNREPLICABLE} BOOL; (*Meldung Trocknungsende erreicht*)
	END_VAR
	VAR
		i : {REDUND_UNREPLICABLE} INT;
		RezeptStufeSoll : {REDUND_UNREPLICABLE} INT;
		fbLascoZdxx_0 : {REDUND_UNREPLICABLE} fbLascoZdxx;
		TickStufe : {REDUND_UNREPLICABLE} BOOL;
		Stufe6_ok : {REDUND_UNREPLICABLE} BOOL;
		TON_AenderungStufeAuto : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockVent (*Ansteuerung, Ventilatoren, Luftentfeuchter und Klappen*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		AnfVent1 : {REDUND_UNREPLICABLE} BOOL;
		AnfVent2 : {REDUND_UNREPLICABLE} BOOL;
		AnfLuftentf : {REDUND_UNREPLICABLE} BOOL;
		Tarifabschaltung : {REDUND_UNREPLICABLE} BOOL;
		Strombegrenzung : {REDUND_UNREPLICABLE} BOOL;
		IstDrehzahlVent1 : {REDUND_UNREPLICABLE} REAL;
		IstDrehzahlVent2 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Max : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Max : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Leistung : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Leistung : {REDUND_UNREPLICABLE} REAL;
		DrehzahlBeiStrombegrenzung : {REDUND_UNREPLICABLE} REAL;
		AnlaufverzVent2 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitKlappen : {REDUND_UNREPLICABLE} UDINT;
		AuslaufzeitLuftentfeuchter : {REDUND_UNREPLICABLE} UDINT;
		MessdauerLuftgeschw : {REDUND_UNREPLICABLE} UDINT;
		sekTick : {REDUND_UNREPLICABLE} BOOL;
		LuftgeschwBeiMaxDrehzahl1Vent : REFERENCE TO REAL;
		LuftgeschwBeiMaxDrehzahl2Vent : REFERENCE TO REAL;
		LuftgeschwAktuell : {REDUND_UNREPLICABLE} REAL;
		KeineKlappenAmLuftentf : {REDUND_UNREPLICABLE} BOOL;
		EinschaltverzLuftentf : {REDUND_UNREPLICABLE} UDINT;
		BetriebsmldgLuftentf : {REDUND_UNREPLICABLE} BOOL; (*Betriebsmeldung von Luftentfeuchter*)
	END_VAR
	VAR_OUTPUT
		curStep : {REDUND_UNREPLICABLE} enumStepTrockVent;
		FreigabeKlappen : {REDUND_UNREPLICABLE} BOOL;
		FreigabeLuftentf : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVent1 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVent2 : {REDUND_UNREPLICABLE} BOOL;
		TON_AnlaufverzVent2 : {REDUND_UNREPLICABLE} TON;
		TON_LaufzeitKlappen : {REDUND_UNREPLICABLE} TON;
		SollDrehzVent1 : {REDUND_UNREPLICABLE} REAL;
		SollDrehzVent2 : {REDUND_UNREPLICABLE} REAL;
		TON_AuslaufzeitLuftentf : {REDUND_UNREPLICABLE} TON;
		TON_Messung : {REDUND_UNREPLICABLE} TON;
		MessungAktiv : {REDUND_UNREPLICABLE} BOOL;
		TON_LuftentfVorbereitung : {REDUND_UNREPLICABLE} TON;
	END_VAR
	VAR
		nextStep : {REDUND_UNREPLICABLE} enumStepTrockVent;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		Mittelwertbildung : {REDUND_UNREPLICABLE} LCRMovAvgFlt;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbTrockVariante (*Auswertung der Anlagenkonfiguration mit Ausgabe einer Nummer und eines Textes*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		Ventilator1 : {REDUND_UNREPLICABLE} BOOL;
		Ventilator2 : {REDUND_UNREPLICABLE} BOOL;
		Luftentfeuchter : {REDUND_UNREPLICABLE} BOOL;
		Warmluftofen : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmldgWarmluftofen : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmldgScheitholzofen : {REDUND_UNREPLICABLE} BOOL;
		Brandschutzklappe : {REDUND_UNREPLICABLE} BOOL;
		Umschaltklappe : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		VarianteNr : {REDUND_UNREPLICABLE} USINT;
		VarianteName : {REDUND_UNREPLICABLE} STRING[200];
	END_VAR
END_FUNCTION_BLOCK
