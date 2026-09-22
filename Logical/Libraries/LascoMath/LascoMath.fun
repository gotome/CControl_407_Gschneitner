(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: LascoMath.fun
 * Autor: Rudolf Lachner
 * Erstellt: 3. März 2014
 ********************************************************************
 * Funktionen und Funktionsblöcke der Library LascoMath
 ********************************************************************)

FUNCTION_BLOCK fbMathLuft (*Berechnungen aus Temperatur, Feuchtigkeit und Meereshöhe (Sättigungsdefizit, Luftdruck, Taupunkttemperatur, etc...)*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe des Funktionsblocks*)
		LuftTemperatur : REAL; (*Aktuelle Temperatur der Umgebungsluft [°C]*)
		LuftRelFeuchte : REAL; (*relative Feuchtigkeit der Umgebungsluft [%]*)
		MeterUeberAdria : REAL; (*Anlagenstandort Höhe [müA]*)
	END_VAR
	VAR_OUTPUT
		LuftAbsoluteFeuchteSatt : REAL; (*Absolute Feuchtigkeit Satt [g/m³]*)
		LuftAbsoluteFeuchte_g_m3 : REAL; (*Absolute Feuchte [g/m³]*)
		LuftdruckUmgebung : REAL; (*Umgebungsdruck [hPa]*)
		LuftDichte : REAL; (*Luftdichte [kg/m³]*)
		LuftAbsoluteFeuchte_g_kg : REAL; (*Absolute Feuchte [g/kg]*)
		LuftDampfdruckSatt : REAL; (*Sättigungsdampfdruck [mbar]*)
		LuftDampfdruckH2O : REAL; (*Wasserdampfdruck [mbar]*)
		TaupunktTemp : REAL; (*Taupunkttemperatur [°C]*)
		LuftSaettigungsdefizit : REAL; (*Sättigungsdefizit [g/m³]*)
	END_VAR
	VAR
		loc_Taupunkttemp : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbMathTrGutGew (*Berechnungen des Trockengutes (spez. Gewicht, Wasserentzug, Gewicht Start, Gewicht Ende...)*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe des Funktionsblockes*)
		Anlagentyp : BOOL; (*Boxentrocknung = 0 / Ballentrocknung = 1*)
		Boxenflaeche : REAL; (*Grundfläche Trockenbox [m²]*)
		FuellhoeheTrockengut : REAL; (*Füllhöhe Trockengut [m]*)
		GewichtProBallen : REAL; (*Gewicht pro Heuballen [kg]*)
		AnzahlBallen : REAL; (*Anzahl Ballen [Stk]*)
		FeuchteBeiStart : REAL; (*Trockengut- Feuchte bei Start [%]*)
		FeuchteEnde : REAL; (*Gewünschte Feuchte bei Trocknungsende [%]*)
		Trocknungsgut : USINT; (*Heu = 0, Fichte = 1, Buche = 2, Mais = 3, Weizen = 4*)
		VentilatorInBetrieb : BOOL; (*Ventilator 1 oder 2 in Betrieb*)
		WasserentzugProStunde : REAL; (*Aktueller Wasserentzug pro Stunde [kg/h]*)
		sekTick : BOOL; (*Sekundentakt*)
		KorrekturWertFeuchte : REAL; (*Korrekturwert Trockengutfeuchte von Visu [%]*)
		CmdKorrekturFeuchte : BOOL; (*Befehl Korrektur ausführen*)
		KeinStroemungsfuehler : BOOL; (*Kein Strömungsfühler vorhanden*)
		Automatikbetrieb : BOOL; (*Anlage im Automatikbetrieb*)
		RichtzeitAktStufeTage : UDINT; (*Richtzeit der aktuellen Trockengutstufe [Tage]*)
		stdTick : BOOL; (*Stundentakt*)
		WasserentzugSeitStart : REFERENCE TO REAL; (*Wasserentzug aus Trocknungsgut seit Trocknungsstart [kg]*)
		SpezGewichtUser : REAL;
	END_VAR
	VAR_OUTPUT
		FeuchteAktuell : REAL; (*Aktuelle Trockengutfeuchte [%]*)
		TrockengutGewichtAktuell : REAL; (*Aktuelles Trockengutgewicht [kg]*)
		TrockengutSpezGewicht : REAL; (*Trockengut spez. Gewicht [kg/m³]*)
		TrockengutGewichtStart : REAL; (*Trockengut Gewicht bei Trocknungsstart [kg]*)
		TrockengutGewichtSubstanz : REAL; (*Gewicht Trockengut Substanz (bei 0% Feuchte) [kg]*)
		TrockengutGewichtEnde : REAL; (*Trockengut Gewicht bei Trocknungsende [kg]*)
		TrockengutWasserentzug : REAL; (*Gewicht Wasserentzug von Trocknungsstart bis Ende [kg]*)
		RestgewichtWasser : REAL; (*Restliches Gewicht an Wasser, das noch abzutrocknen ist [kg]*)
	END_VAR
	VAR
		loc_TrockengutGewichtEnde : REAL;
		zzEdge00000 : BOOL;
		zzEdge00001 : BOOL;
		zzEdge00002 : BOOL;
		temp2 : REAL;
		temp1 : REAL;
		loc_cmdKorrekturFeuchte : BOOL;
		zzEdge00003 : BOOL;
		firstInit : BOOL;
		RichtzeitAktStufeStunden : UDINT;
		CmdKorrekturFeuchteRicht : BOOL;
		TeilungFeuchteRicht : REAL;
		KorrekturWertFeuchteRicht : REAL;
		FeuchteBeiStartMEM : REAL;
		zzEdge00004 : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbMathTrLftMenge
	VAR_INPUT
		DrehzVent1 : REAL; (*Aktuelle Drehzahl Ventilator 1 [%]*)
		DrehzVent2 : REAL; (*Aktuelle Drehzahl Ventilator 2 [%]*)
		Freigabe : BOOL; (*Freigabe des Funktionsblockes*)
		Ventilator1Betrieb : BOOL; (*Ventilator 1 in Betrieb*)
		Ventilator2Betrieb : BOOL; (*Ventilator 2 in Betrieb*)
		DrehzRegelungAktiv : BOOL; (*Mengen- oder Druckregelung aktiv*)
		Ventilator12FixDrehzahl : BOOL; (*Ventilator 1 + 2 mit Fixdrehzahl*)
		Ventilator2Manuell : BOOL; (*Ventilator 2 Manuell*)
		Luftgeschw : REAL; (*Aktuelle Luftgeschwindigkeit [m/s]*)
		LuftkanalQuerschnitt : REAL; (*Querschnitt Luftkanal [m²]*)
		ZuluftSattDefizit : REAL; (*Sättigungsdefizit der Zuluft [g/m³]*)
		OffsetWasserentzug : REAL; (*Offset für Wasserentzug pro Stunde*)
		ZweiBoxenSystem : BOOL;
	END_VAR
	VAR_OUTPUT
		LuftmengeAktuell : REAL; (*Aktuelle Luftmenge [m³/h]*)
		WasserentzugProStunde : REAL; (*Wasserentzug pro Stunde [kg/h]*)
	END_VAR
	VAR
		loc_DrehzVerhaeltnis : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbMathTrLftDruck (*Berechnungen mit Drucksensor*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe des Funktionsblockes*)
		TrockenluftDruck : REAL; (*Überdruck der Trockenluft [Pa]*)
	END_VAR
	VAR_OUTPUT
		LuftDruck_mmWS : REAL; (*Aktueller Luftdruck [mmWS]*)
		LuftDruck_mbar : REAL; (*Aktueller Luftdruck [mbar]*)
		LuftDruck_bar : REAL; (*Aktueller Luftdruck [bar]*)
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbMathWetter (*Auswertung des aktuellen Wetters anhand Rezept und Sättigungsdefizit*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL; (*Freigabe des Funktionsblocks*)
		SattDefizitRezept : REAL; (*Aktuelles Sättigungsdefizit im Rezept [g/m³]*)
		SattDefizitAktuell : REAL; (*Aktuelles Sättigungsdefizit der Frischluft [g/m³]*)
		HystereseUmschaltung : REAL; (*Hysterese für die Wetterumschaltung [g/m³]*)
		ZeitVerzUmschaltung : UDINT; (*Zeitverzögerung Wetterumschaltung [ms]*)
	END_VAR
	VAR_OUTPUT
		WetterGut : BOOL; (*Ausgang Wetter Gut*)
		WetterMittel : BOOL; (*Ausgang Wetter Mittel*)
		WetterSchlecht : BOOL; (*Ausgang Wetter Schlecht*)
	END_VAR
	VAR
		loc_WetterGut : BOOL;
		loc_WetterSchlecht : BOOL;
		TOF_WetterGut : TOF;
		TON_WetterSchlecht : TON;
		TON_WetterGut : TON;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK fbMathMessblende (*Berechnungen für Messkanäle mit Messblende*) (*$GROUP=Anwender*)
	VAR_INPUT
		Enable : BOOL;
		TemperaturAktuell : REAL; (*Aktuelle Temperatur an der Messblende [°C]*)
	END_VAR
	VAR_OUTPUT
		LuftdichteAktuell : REAL;
	END_VAR
	VAR_INPUT
		DifferenzdruckMessblende : REAL; (*[Pa]*)
	END_VAR
	VAR_OUTPUT
		LuftgeschwindigkeitAktuell : REAL; (*[m/s]*)
	END_VAR
	VAR_INPUT
		Kanalquerschnitt : REAL; (*[m²]*)
	END_VAR
	VAR_OUTPUT
		VolumenstromAktuell : REAL; (*[m³/h]*)
		LuftdichteNorm : REAL;
		LuftgeschwindigkeitNorm : REAL;
		VolumenstromNorm : REAL;
	END_VAR
	VAR_INPUT
		LuftgeschwindigkeitSensor : REAL;
	END_VAR
	VAR_OUTPUT
		VolumenstromVergleich : REAL;
	END_VAR
END_FUNCTION_BLOCK
