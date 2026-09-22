(*=============================================================================================================================================*)
(*==============================STRUKTUREN NUTZUNGSDATEN ==================================================================================*)

TYPE
	typNutzungsdaten : {REDUND_UNREPLICABLE} 	STRUCT 
		Allgemein : {REDUND_UNREPLICABLE} typNutzungAllgemein;
		Bst : {REDUND_UNREPLICABLE} typBetriebsstunden;
		BstGes : {REDUND_UNREPLICABLE} typBetriebsstunden;
		Serviceintervalle : {REDUND_UNREPLICABLE} typServiceintervalle;
		Energiemessung : {REDUND_UNREPLICABLE} typEnergiemessung;
		Trocknungsbilanz : {REDUND_UNREPLICABLE} typNutzungTrocknungsbilanz;
	END_STRUCT;
	typNutzungTrocknungsbilanz : {REDUND_UNREPLICABLE} 	STRUCT 
		VentStundenBox1 : {REDUND_UNREPLICABLE} UDINT;
		VentStundenBox2 : {REDUND_UNREPLICABLE} UDINT;
		VentStundenBox3 : {REDUND_UNREPLICABLE} UDINT;
		VentStundenBox4 : {REDUND_UNREPLICABLE} UDINT;
		VentStundenBox5 : {REDUND_UNREPLICABLE} UDINT;
		VentStundenBox6 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox1 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox2 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox3 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox4 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox5 : {REDUND_UNREPLICABLE} UDINT;
		LuftaufbStundenBox6 : {REDUND_UNREPLICABLE} UDINT;
		VentMinutenBox1 : {REDUND_UNREPLICABLE} USINT;
		VentMinutenBox2 : {REDUND_UNREPLICABLE} USINT;
		VentMinutenBox3 : {REDUND_UNREPLICABLE} USINT;
		VentMinutenBox4 : {REDUND_UNREPLICABLE} USINT;
		VentMinutenBox5 : {REDUND_UNREPLICABLE} USINT;
		VentMinutenBox6 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox1 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox2 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox3 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox4 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox5 : {REDUND_UNREPLICABLE} USINT;
		LuftaufbMinutenBox6 : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	typNutzungAllgemein : {REDUND_UNREPLICABLE} 	STRUCT 
		LetzterModus : {REDUND_UNREPLICABLE} enumBetriebsmodus;
		DatumLetzterBetrieb : {REDUND_UNREPLICABLE} DATE_AND_TIME;
		IoTestAbgeschlossen : {REDUND_UNREPLICABLE} BOOL;
		SetEthernetOk : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typBetriebsstunden : {REDUND_UNREPLICABLE} 	STRUCT 
		FrischluftbetrStd : {REDUND_UNREPLICABLE} UDINT;
		UmluftbetrStd : {REDUND_UNREPLICABLE} UDINT;
		Ventilator1Std : {REDUND_UNREPLICABLE} UDINT;
		Ventilator2Std : {REDUND_UNREPLICABLE} UDINT;
		Kompressor1Std : {REDUND_UNREPLICABLE} UDINT;
		Kompressor2Std : {REDUND_UNREPLICABLE} UDINT;
		WarmluftofenStd : {REDUND_UNREPLICABLE} UDINT;
		HeizregisterStd : {REDUND_UNREPLICABLE} UDINT;
		ScheitholzofenStd : {REDUND_UNREPLICABLE} UDINT;
		Abtauung1Std : {REDUND_UNREPLICABLE} UDINT;
		Abtauung2Std : {REDUND_UNREPLICABLE} UDINT;
		OelsumpfheizungStd : {REDUND_UNREPLICABLE} UDINT;
		AbluftventStd : {REDUND_UNREPLICABLE} UDINT;
		Box1Std : {REDUND_UNREPLICABLE} UDINT;
		Box2Std : {REDUND_UNREPLICABLE} UDINT;
		Box3Std : {REDUND_UNREPLICABLE} UDINT;
		Box4Std : {REDUND_UNREPLICABLE} UDINT;
		Box5Std : {REDUND_UNREPLICABLE} UDINT;
		Box6Std : {REDUND_UNREPLICABLE} UDINT;
		FrischluftbetrMin : {REDUND_UNREPLICABLE} USINT;
		UmluftbetrMin : {REDUND_UNREPLICABLE} USINT;
		Ventilator1Min : {REDUND_UNREPLICABLE} USINT;
		Ventilator2Min : {REDUND_UNREPLICABLE} USINT;
		Kompressor1Min : {REDUND_UNREPLICABLE} USINT;
		Kompressor2Min : {REDUND_UNREPLICABLE} USINT;
		WarmluftofenMin : {REDUND_UNREPLICABLE} USINT;
		HeizregisterMin : {REDUND_UNREPLICABLE} USINT;
		ScheitholzofenMin : {REDUND_UNREPLICABLE} USINT;
		Abtauung1Min : {REDUND_UNREPLICABLE} USINT;
		Abtauung2Min : {REDUND_UNREPLICABLE} USINT;
		OelsumpfheizungMin : {REDUND_UNREPLICABLE} USINT;
		AbluftventMin : {REDUND_UNREPLICABLE} USINT;
		Box1Min : {REDUND_UNREPLICABLE} USINT;
		Box2Min : {REDUND_UNREPLICABLE} USINT;
		Box3Min : {REDUND_UNREPLICABLE} USINT;
		Box4Min : {REDUND_UNREPLICABLE} USINT;
		Box5Min : {REDUND_UNREPLICABLE} USINT;
		Box6Min : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	typServiceintervalle : {REDUND_UNREPLICABLE} 	STRUCT 
		RestzeitKontrolleUhrzeit : {REDUND_UNREPLICABLE} UDINT;
		KontrolleUhrzeitErforderlich : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typEnergiemessung : {REDUND_UNREPLICABLE} 	STRUCT 
		LeistungAktuell : {REDUND_UNREPLICABLE} REAL;
		EnergieGesamt : {REDUND_UNREPLICABLE} REAL;
		EnergieTag : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
END_TYPE

(*=============================================================================================================================================*)
(*==============================STRUKTUREN ANLAGENKOMMANDOS ==============================================================================*)

TYPE
	cmdAnlage : {REDUND_UNREPLICABLE} 	STRUCT 
		Test : {REDUND_UNREPLICABLE} BOOL;
		Auto : {REDUND_UNREPLICABLE} BOOL;
		Leistung : {REDUND_UNREPLICABLE} cmdLeistung;
		StoppExtern : {REDUND_UNREPLICABLE} BOOL;
		StartExtern : {REDUND_UNREPLICABLE} BOOL;
		Start : {REDUND_UNREPLICABLE} BOOL;
		Stop : {REDUND_UNREPLICABLE} BOOL;
		FehlerStopp : {REDUND_UNREPLICABLE} BOOL;
		FehlerModul1 : {REDUND_UNREPLICABLE} BOOL;
		FehlerModul2 : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	cmdLeistung : {REDUND_UNREPLICABLE} 	STRUCT 
		DrehzahlVentilator1 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVentilator2 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlKompressorModul1 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlKompressorModul2 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlAbluftventilator : {REDUND_UNREPLICABLE} REAL;
		DrehzahlHeizregister : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
END_TYPE

(*=============================================================================================================================================*)
(*==============================STRUKTUREN ANLAGENSTATUS ==================================================================================*)

TYPE
	statFehler : {REDUND_UNREPLICABLE} 	STRUCT 
		WarnungNr : {REDUND_UNREPLICABLE} USINT;
		FehlerNr : {REDUND_UNREPLICABLE} USINT;
		WarnungText : {REDUND_UNREPLICABLE} STRING[140];
		FehlerText : {REDUND_UNREPLICABLE} STRING[140];
		SummeFehler : {REDUND_UNREPLICABLE} BOOL;
		SummeWarnung : {REDUND_UNREPLICABLE} BOOL;
		SummeSystem : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	statAnlage : {REDUND_UNREPLICABLE} 	STRUCT 
		Betrieb : {REDUND_UNREPLICABLE} BOOL;
		Aktor : {REDUND_UNREPLICABLE} ARRAY[0..39]OF enumStatus;
		Fehler : {REDUND_UNREPLICABLE} statFehler;
		DrehzahlVentilator1 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVentilator2 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlKompressorModul1 : {REDUND_UNREPLICABLE} REAL;
		DrehzahlKompressorModul2 : {REDUND_UNREPLICABLE} REAL;
		FrischluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		FrischluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		DachluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		DachluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		TrockenluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		TrockenluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		AbluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		EintrittTemperatur : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		AustrittTemperatur : {REDUND_UNREPLICABLE} REAL;
		AustrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		Kanaldruck : {REDUND_UNREPLICABLE} REAL;
		Luftgeschwindigkeit : {REDUND_UNREPLICABLE} REAL;
		NiederdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		NiederdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		HochdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		HochdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		LuftmengeAktuell : {REDUND_UNREPLICABLE} REAL;
		UmluftbetriebAktiv : {REDUND_UNREPLICABLE} BOOL;
		FrischluftbetriebAktiv : {REDUND_UNREPLICABLE} BOOL;
		EnergieverbrTag : {REDUND_UNREPLICABLE} REAL;
		EnergieLeistungAkt : {REDUND_UNREPLICABLE} REAL;
		EnergieverbrGes : {REDUND_UNREPLICABLE} REAL;
		Berechnungen : {REDUND_UNREPLICABLE} statBerechnungen;
		RestlaufzeitenBoxen : {REDUND_UNREPLICABLE} statRestlaufzeitenBoxen;
		WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	statRestlaufzeitenBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		Box1Stunden : {REDUND_UNREPLICABLE} UINT;
		Box1Minuten : {REDUND_UNREPLICABLE} UINT;
		Box2Stunden : {REDUND_UNREPLICABLE} UINT;
		Box2Minuten : {REDUND_UNREPLICABLE} UINT;
		Box3Stunden : {REDUND_UNREPLICABLE} UINT;
		Box3Minuten : {REDUND_UNREPLICABLE} UINT;
		Box4Stunden : {REDUND_UNREPLICABLE} UINT;
		Box4Minuten : {REDUND_UNREPLICABLE} UINT;
		Box5Stunden : {REDUND_UNREPLICABLE} UINT;
		Box5Minuten : {REDUND_UNREPLICABLE} UINT;
		Box6Stunden : {REDUND_UNREPLICABLE} UINT;
		Box6Minuten : {REDUND_UNREPLICABLE} UINT;
	END_STRUCT;
	statBerechnungen : {REDUND_UNREPLICABLE} 	STRUCT 
		FrischluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		DachluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		TrockenluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		AbluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		Kanaldruck_mmWs : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
END_TYPE

(*=============================================================================================================================================*)
(*==============================STRUKTUREN ANDERE ==========================================================================================*)

TYPE
	typSysteminfo : {REDUND_UNREPLICABLE} 	STRUCT 
		BatteriestatusCpu : {REDUND_UNREPLICABLE} USINT;
		TempCpu : {REDUND_UNREPLICABLE} UINT;
		TempEnv : {REDUND_UNREPLICABLE} UINT;
		NodeNumber : {REDUND_UNREPLICABLE} USINT;
		SerialNumber : {REDUND_UNREPLICABLE} UDINT;
		IpAdress : {REDUND_UNREPLICABLE} STRING[20];
		ErrEx : {REDUND_UNREPLICABLE} ARRAY[0..11]OF typErrEx;
		ErrorEx : {REDUND_UNREPLICABLE} BOOL;
		ErrExString : {REDUND_UNREPLICABLE} STRING[30];
		ErrExStringMEM : {REDUND_UNREPLICABLE} STRING[30];
	END_STRUCT;
	typErrEx : {REDUND_UNREPLICABLE} 	STRUCT 
		Modul : {REDUND_UNREPLICABLE} ARRAY[0..64]OF BOOL;
	END_STRUCT;
	typEchtzeit : {REDUND_UNREPLICABLE} 	STRUCT 
		Jahr : {REDUND_UNREPLICABLE} UINT;
		Monat : {REDUND_UNREPLICABLE} USINT;
		Tag : {REDUND_UNREPLICABLE} USINT;
		WoTag : {REDUND_UNREPLICABLE} USINT;
		Stunde : {REDUND_UNREPLICABLE} USINT;
		Minute : {REDUND_UNREPLICABLE} USINT;
		Sekunde : {REDUND_UNREPLICABLE} USINT;
		Milli : {REDUND_UNREPLICABLE} UINT;
		Mikro : {REDUND_UNREPLICABLE} UINT;
		StdMin : {REDUND_UNREPLICABLE} INT;
	END_STRUCT;
END_TYPE

(*=============================================================================================================================================*)
(*==============================STRUKTUREN AKTOREN =========================================================================================*)

TYPE
	typAktoren : {REDUND_UNREPLICABLE} 	STRUCT 
		VentUndKlappen : {REDUND_UNREPLICABLE} fbBoxenVentKlappen;
		Abluftklappe : {REDUND_UNREPLICABLE} fbBoxenAbluftkl;
		Abluftventilator : {REDUND_UNREPLICABLE} fbBoxenAbluftvent;
		OelsumpfheizungModul1 : {REDUND_UNREPLICABLE} fbEntfOelsumpfheiz;
		OelsumpfheizungModul2 : {REDUND_UNREPLICABLE} fbEntfOelsumpfheiz;
		KompressorModul1 : {REDUND_UNREPLICABLE} fbEntfKompressor;
		KompressorModul2 : {REDUND_UNREPLICABLE} fbEntfKompressor;
		Warmluftofen : {REDUND_UNREPLICABLE} fbBoxenWLO;
		Heizregister : {REDUND_UNREPLICABLE} fbBoxenHeizreg;
		Notstromaggregat : {REDUND_UNREPLICABLE} fbBoxenNotstrom;
		Scheitholzofen : {REDUND_UNREPLICABLE} fbBoxenSHO;
		Brandschutzklappe : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		EntfeuchterFremd : {REDUND_UNREPLICABLE} fbEntfFremd;
	END_STRUCT;
END_TYPE
