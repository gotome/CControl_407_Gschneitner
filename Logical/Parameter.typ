
TYPE
	parAnlage : {REDUND_UNREPLICABLE} 	STRUCT 
		Allgemein : {REDUND_UNREPLICABLE} parAllgemein;
		Betrieb : {REDUND_UNREPLICABLE} parBetrieb;
		Ausstattung : {REDUND_UNREPLICABLE} parAusstattung;
		Schrittkette : {REDUND_UNREPLICABLE} parSchrittkette;
		Ventilator1 : {REDUND_UNREPLICABLE} parVentilator;
		Ventilator2 : {REDUND_UNREPLICABLE} parVentilator;
		Boxen : {REDUND_UNREPLICABLE} ARRAY[1..6]OF parBoxen;
		Entfeuchter : {REDUND_UNREPLICABLE} parEntfeuchter;
		Kompressor1 : {REDUND_UNREPLICABLE} parKompressor;
		Kompressor2 : {REDUND_UNREPLICABLE} parKompressor;
		Warmluftofen : {REDUND_UNREPLICABLE} parWarmluftofen;
		Heizregister : {REDUND_UNREPLICABLE} parHeizregister;
		Abluftventilator : {REDUND_UNREPLICABLE} parAbluftventilator;
		Abluftklappe : {REDUND_UNREPLICABLE} parAbluftklappe;
		Umschaltklappen : {REDUND_UNREPLICABLE} parUmschaltklappen;
		Bypassklappe : {REDUND_UNREPLICABLE} parBypassklappe;
		KlappenBoxen : {REDUND_UNREPLICABLE} ARRAY[1..6]OF parKlappenBoxen;
		Notstromaggregat : {REDUND_UNREPLICABLE} parNotstromaggregat;
		Sensoren : {REDUND_UNREPLICABLE} parSensoren;
		Servicebereich : {REDUND_UNREPLICABLE} parServicebereich;
		Fernalarmierung : {REDUND_UNREPLICABLE} parFernalarmierung;
		Scheitholzofen : {REDUND_UNREPLICABLE} parScheitholzofen;
		Tarifabschaltung : {REDUND_UNREPLICABLE} parTarifabschaltung;
		Strombegrenzung : {REDUND_UNREPLICABLE} parStrombegrenzung;
		SchlechtwetterBoxen : {REDUND_UNREPLICABLE} ARRAY[1..6]OF parSchlechtwetterBoxen;
	END_STRUCT;
	parAllgemein : {REDUND_UNREPLICABLE} 	STRUCT 
		IPAdresse : {REDUND_UNREPLICABLE} STRING[16];
		SubnetMask : {REDUND_UNREPLICABLE} STRING[16];
		DefaultGateway : {REDUND_UNREPLICABLE} STRING[16];
		HostName : {REDUND_UNREPLICABLE} STRING[16];
		DatumUhrzeitLetzterBetrieb : {REDUND_UNREPLICABLE} DATE_AND_TIME;
		VerzoegerungWarnungen : {REDUND_UNREPLICABLE} REAL;
		VerzoegerungFehler : {REDUND_UNREPLICABLE} REAL;
		StandortHoehe : {REDUND_UNREPLICABLE} REAL;
		AnsaugflaecheVent : {REDUND_UNREPLICABLE} REAL; (*Ansaugfläche des Ventilators (für Luftmengenregelung ohne Entfeuchter)*)
		VerzoegerungAenderungKlappen : {REDUND_UNREPLICABLE} UDINT;
		LoginTimeout : {REDUND_UNREPLICABLE} UDINT;
		VerzUmschBetriebsartBoxen : {REDUND_UNREPLICABLE} UDINT;
		DisplayTimeout : {REDUND_UNREPLICABLE} INT;
		Sprache : {REDUND_UNREPLICABLE} USINT;
		PasswortschutzAus : {REDUND_UNREPLICABLE} BOOL;
		AutoLogoutEin : {REDUND_UNREPLICABLE} BOOL;
		ParameterVorhanden : {REDUND_UNREPLICABLE} BOOL; (*Wenn FALSE, wird beim Neustart der Standardparametersatz geladen*)
	END_STRUCT;
	parBetrieb : {REDUND_UNREPLICABLE} 	STRUCT 
		BetriebAutoEin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parAusstattung : {REDUND_UNREPLICABLE} 	STRUCT 
		Ventilator1 : {REDUND_UNREPLICABLE} BOOL := TRUE;
		Ventilator2 : {REDUND_UNREPLICABLE} BOOL;
		Entfeuchter : {REDUND_UNREPLICABLE} BOOL;
		EntfeuchterFremd : {REDUND_UNREPLICABLE} BOOL;
		Warmluftofen : {REDUND_UNREPLICABLE} BOOL;
		WarmluftofenBetriebsmldg : {REDUND_UNREPLICABLE} BOOL;
		WarmluftofenTempVorgabe : {REDUND_UNREPLICABLE} BOOL;
		Heizregister : {REDUND_UNREPLICABLE} BOOL;
		HeizregisterDrehzahlvorgabe : {REDUND_UNREPLICABLE} BOOL;
		Scheitholzofen : {REDUND_UNREPLICABLE} BOOL;
		Notstromaggregat : {REDUND_UNREPLICABLE} BOOL;
		Energiemessung : {REDUND_UNREPLICABLE} BOOL;
		Bypassklappe : {REDUND_UNREPLICABLE} BOOL;
		Umschaltklappe1 : {REDUND_UNREPLICABLE} BOOL;
		Umschaltklappe2 : {REDUND_UNREPLICABLE} BOOL;
		Brandschutzklappe : {REDUND_UNREPLICABLE} BOOL;
		Abluftklappe : {REDUND_UNREPLICABLE} BOOL;
		Abluftventilator : {REDUND_UNREPLICABLE} BOOL;
		SensorFrischluft : {REDUND_UNREPLICABLE} BOOL;
		SensorDachluft : {REDUND_UNREPLICABLE} BOOL;
		SensorTrockenluft : {REDUND_UNREPLICABLE} BOOL;
		SensorAbluft : {REDUND_UNREPLICABLE} BOOL;
		SensorLuftgeschwindigkeit : {REDUND_UNREPLICABLE} BOOL;
		SensorKanaldruck : {REDUND_UNREPLICABLE} BOOL;
		Box1 : {REDUND_UNREPLICABLE} BOOL := TRUE;
		Box2 : {REDUND_UNREPLICABLE} BOOL;
		Box3 : {REDUND_UNREPLICABLE} BOOL;
		Box4 : {REDUND_UNREPLICABLE} BOOL;
		Box5 : {REDUND_UNREPLICABLE} BOOL;
		Box6 : {REDUND_UNREPLICABLE} BOOL;
		AlleBoxenklSchliessenWennAus : {REDUND_UNREPLICABLE} BOOL; (*Wenn aktiv, werden alle angesteuerten Boxenklappen im Stillstand geschlossen*)
		MehrereBoxenBelueftbar : {REDUND_UNREPLICABLE} BOOL;
		LuftmngReglerFrischlVent1 : {REDUND_UNREPLICABLE} BOOL; (*Auswahl, ob Luftmengenregelung im Frischluft/Dachluftbetrieb bei Ventilator 1 möglich*)
		LuftmngReglerUmluftVent1 : {REDUND_UNREPLICABLE} BOOL; (*Auswahl, ob Luftmengenregelung im Umluftbetrieb bei Ventilator 1 möglich*)
		LuftmngReglerFrischlVent2 : {REDUND_UNREPLICABLE} BOOL; (*Auswahl, ob Luftmengenregelung im Frischluft/Dachluftbetrieb bei Ventilator 2 möglich*)
		LuftmngReglerUmluftVent2 : {REDUND_UNREPLICABLE} BOOL; (*Auswahl, ob Luftmengenregelung im Umluftbetrieb bei Ventilator 2 möglich*)
		EntfeuchterNurImUmluftbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Betrieb des Entfeuchters ist nur im Umluftbetrieb möglich*)
		BeideVentAusBeiUmschBypasskl : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird die Drehzahl beider Ventilatoren bei Umschaltung der Bypassklappe reduziert*)
		BeideVentAusBeiUmschBoxenkl : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird die Drehzahl beider Ventilatoren bei Umschaltung der Boxenklappen reduziert*)
		Vent1AusWennUmschUmluftkl : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird die Drehzahl von Ventilator 1 bei Umschaltung Umluftklappen reduziert*)
		Vent2AusWennUmschUmluftkl : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird die Drehzahl von Ventilator 2 bei Umschaltung Umluftklappen reduziert*)
		AbluftklImFrischlbetrImmerOffen : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird die Abluftklappe im Frischluftbetrieb immer geöffnet (im Automatikbetrieb der Klappe)*)
		StellungUmluftklappe1Stillstand : {REDUND_UNREPLICABLE} BOOL; (*FALSE= Frischluft, TRUE= Umluft*)
		StellungUmluftklappe2Stillstand : {REDUND_UNREPLICABLE} BOOL; (*FALSE= Frischluft, TRUE= Umluft*)
		EndlagenVhdUmschaltklappe1 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdUmschaltklappe2 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBypassklappe : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe1 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe2 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe3 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe4 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe5 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
		EndlagenVhdBoxenklappe6 : {REDUND_UNREPLICABLE} BOOL; (*Option Endlagen: Sind keine Endlagen vorhanden, wird die Klappe für die eingestellte Laufzeit umgeschaltet.*)
	END_STRUCT;
	parSchrittkette : {REDUND_UNREPLICABLE} 	STRUCT 
		AnlaufverzZweiterVentilator : {REDUND_UNREPLICABLE} UDINT;
		VerzWetterwechsel : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	parVentilator : {REDUND_UNREPLICABLE} 	STRUCT 
		LuftmengeSollFrischluft : {REDUND_UNREPLICABLE} REAL; (*Soll-Luftmenge im Frischluftbetrieb in m³/h pro m² Boxenfläche*)
		LuftmengeSollUmluft : {REDUND_UNREPLICABLE} REAL; (*Soll-Luftmenge im Umluftbetrieb in m³/h pro m² Boxenfläche*)
		LuftmengeBoxMin : {REDUND_UNREPLICABLE} REAL; (*Minimale Lufmenge pro m² Boxenfläche in m³/h*)
		LuftmengeBoxMax : {REDUND_UNREPLICABLE} REAL; (*Maximale Lufmenge pro m² Boxenfläche in m³/h*)
		DrehzahlMin : {REDUND_UNREPLICABLE} REAL; (*Minimale Drehzahl des Ventilators [%]*)
		DrehzahlMax : {REDUND_UNREPLICABLE} REAL; (*Maximale Drehzahl des Ventilators [%]*)
		DrehzahlBeiAuskuehlphase : {REDUND_UNREPLICABLE} REAL; (*Soll-Drehzahl, wenn keine Box aktiv und WLO oder SHO noch in Betrieb [%]*)
		DrzUmschaltung : {REDUND_UNREPLICABLE} REAL; (*Soll-Drehzahl bei Klappenumschaltungen, wenn keine Luftaufbereitung in Betrieb ist [%]*)
		DrzUmschaltungMitLuftaufb : {REDUND_UNREPLICABLE} REAL; (*Soll-Drehzahl bei Klappenumschaltungen, wenn Luftaufbereitung in Betrieb ist [%]*)
		DrehzahlFixUmluft : {REDUND_UNREPLICABLE} REAL; (*Fix-Drehzahl bei Umluftbetrieb [%]*)
		DrehzahlFixFrischluft : {REDUND_UNREPLICABLE} REAL; (*Fix-Drehzahl bei Frischluftbetrieb [%]*)
		DrehzahlStrombegrenzung : {REDUND_UNREPLICABLE} REAL; (*Maximale Drehzahl, wenn Zeitfenster Strombegrenzung aktiv ist [%]*)
		DrehzahlLeistungsreduz : {REDUND_UNREPLICABLE} REAL; (*Maximale Drehzahl, wenn digitaler Eingang für Leistungsreduzierung aktiv ist [%]*)
		P : {REDUND_UNREPLICABLE} REAL;
		I : {REDUND_UNREPLICABLE} REAL;
		D : {REDUND_UNREPLICABLE} REAL;
		D_Filter : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		WindupDaempfung : {REDUND_UNREPLICABLE} REAL;
		Fehlerverzoegerung : {REDUND_UNREPLICABLE} REAL;
		ZeitRampeUp : {REDUND_UNREPLICABLE} UDINT; (*Rampenzeit UP [s]*)
		ZeitRampeDown : {REDUND_UNREPLICABLE} UDINT; (*Rampenzeit DOWN [s]*)
		LuftmengenregUmluftEin : {REDUND_UNREPLICABLE} BOOL; (*Wenn Ein, ist die Luftmengenregelung im Umluftbetrieb aktiv*)
		LuftmengenregFrischluftEin : {REDUND_UNREPLICABLE} BOOL; (*Wenn Ein, ist die Luftmengenregelung im Frischluftbetrieb aktiv*)
	END_STRUCT;
	parBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		StellungKlappe1 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		StellungKlappe2 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		StellungKlappe3 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		StellungKlappe4 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		StellungKlappe5 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		StellungKlappe6 : {REDUND_UNREPLICABLE} enumStellungKlappenBoxen; (*0= nicht verwendet, 1= geschlossen, 2= offen*)
		Grundflaeche : {REDUND_UNREPLICABLE} REAL; (*Grundfläche Box bei Losetrocknung in m²*)
		NameBox : {REDUND_UNREPLICABLE} STRING[20]; (*Name der Box*)
		Trockengut : {REDUND_UNREPLICABLE} USINT; (*0 = Heu (Lose), 1= Rundballen, 2= Mais, 3= Getreide, 4= Hopfen, 5= Kräuter, 6= Holz*)
		Aus : {REDUND_UNREPLICABLE} BOOL; (*Box Ausgeschaltet*)
		DauerbetriebEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Dauerbetrieb Ein*)
		IntervallbetriebEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Intervallbetrieb Ein*)
		NachtrocknungEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Nachtrocknung Ein*)
		Ventilator1 : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		Ventilator2 : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		Luftentfeuchter : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		Warmluftofen : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		Heizregister : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		Scheitholzofen : {REDUND_UNREPLICABLE} BOOL; (*0= nicht für Box zuständig, 1= für Box zuständig*)
		IntervallbetriebZeiten : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitbereiche 0-23h Intervallbetrieb*)
		NachtrocknungZeiten : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL; (*Zeitbereiche 0-23h Nachtrocknungsbetrieb*)
	END_STRUCT;
	parZeitfenster : {REDUND_UNREPLICABLE} 	STRUCT 
		StartStd : {REDUND_UNREPLICABLE} USINT;
		StartMin : {REDUND_UNREPLICABLE} USINT;
		StoppStd : {REDUND_UNREPLICABLE} USINT;
		StoppMin : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	parEntfeuchter : {REDUND_UNREPLICABLE} 	STRUCT 
		Type : {REDUND_UNREPLICABLE} ARRAY[0..14]OF STRING[20];
		Registerflaeche : {REDUND_UNREPLICABLE} ARRAY[0..14]OF REAL;
		EinschaltverzKompressor : {REDUND_UNREPLICABLE} UDINT;
		EinschaltverzAbtau : {REDUND_UNREPLICABLE} UDINT;
		MindestlaufzeitOelsumpf : {REDUND_UNREPLICABLE} UDINT;
		MaxZeitStromlos : {REDUND_UNREPLICABLE} UDINT;
		RestzeitLaufzOelsumpf : {REDUND_UNREPLICABLE} UDINT;
		AnlaufverzModul2 : {REDUND_UNREPLICABLE} UDINT;
		AusschaltverzAbtau : {REDUND_UNREPLICABLE} UDINT;
		LuftgeschwEntfeuchterMin : {REDUND_UNREPLICABLE} REAL; (*Minimale Luftgeschwindigkeit über den Entfeuchter in m/s*)
		LuftgeschwEntfeuchterMax : {REDUND_UNREPLICABLE} REAL; (*Maximale Luftgeschwindigkeit über den Entfeuchter in m/s*)
		EintrittFeuchteEin : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchteAus : {REDUND_UNREPLICABLE} REAL;
		Dauerbetrieb : {REDUND_UNREPLICABLE} BOOL;
		Automatikbetrieb : {REDUND_UNREPLICABLE} BOOL;
		Aus : {REDUND_UNREPLICABLE} BOOL;
		IndexType : {REDUND_UNREPLICABLE} USINT;
		VerzStandbyHochdruckMax : {REDUND_UNREPLICABLE} UDINT; (*Wenn während Klappenumschaltung oder Strombegrenzung Ventilator Hochdruck überschritten -> Standby*)
		VerzBetriebsmeldung : {REDUND_UNREPLICABLE} UDINT; (*Nur für Fremdgeräte in Verwendung*)
	END_STRUCT;
	parKompressor : {REDUND_UNREPLICABLE} 	STRUCT 
		EinschaltverzMagnetventil : {REDUND_UNREPLICABLE} UDINT;
		DrehzahlMin : {REDUND_UNREPLICABLE} REAL;
		DrehzahlMax : {REDUND_UNREPLICABLE} REAL;
		NiederdruckMin : {REDUND_UNREPLICABLE} REAL;
		NiederdruckMax : {REDUND_UNREPLICABLE} REAL;
		RampeDown : {REDUND_UNREPLICABLE} REAL;
		RampeUp : {REDUND_UNREPLICABLE} REAL;
		NiederdruckPumpDown : {REDUND_UNREPLICABLE} REAL;
		DrehzahlFix : {REDUND_UNREPLICABLE} REAL;
		DrehzahlReduzierung : {REDUND_UNREPLICABLE} REAL;
		EintrittTempMin : {REDUND_UNREPLICABLE} REAL;
		EintrittTempMax : {REDUND_UNREPLICABLE} REAL;
		HochdruckMax : {REDUND_UNREPLICABLE} REAL;
		NiederdruckSoll : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		P : {REDUND_UNREPLICABLE} REAL;
		I : {REDUND_UNREPLICABLE} REAL;
		D : {REDUND_UNREPLICABLE} REAL;
		DrehzahlregelungEin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parWarmluftofen : {REDUND_UNREPLICABLE} 	STRUCT 
		SaettigungFrischlEin : {REDUND_UNREPLICABLE} REAL;
		WarmlufttempVorgabeSoll : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		Auskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
		VerzBetriebsmeldung : {REDUND_UNREPLICABLE} UDINT;
		VerzWetterwechsel : {REDUND_UNREPLICABLE} UDINT;
		DauerbetriebEin : {REDUND_UNREPLICABLE} BOOL;
		AutomatikbetriebEin : {REDUND_UNREPLICABLE} BOOL;
		Aus : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parHeizregister : {REDUND_UNREPLICABLE} 	STRUCT 
		VerzWetterwechsel : {REDUND_UNREPLICABLE} UDINT;
		SaettigungFrischlEin : {REDUND_UNREPLICABLE} REAL;
		TrockenluftTempSoll : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVorgabeMin : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVorgabeMax : {REDUND_UNREPLICABLE} REAL;
		P : {REDUND_UNREPLICABLE} REAL;
		I : {REDUND_UNREPLICABLE} REAL;
		D : {REDUND_UNREPLICABLE} REAL;
		Aus : {REDUND_UNREPLICABLE} BOOL;
		DauerbetriebEin : {REDUND_UNREPLICABLE} BOOL;
		AutomatikbetriebEin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parAbluftventilator : {REDUND_UNREPLICABLE} 	STRUCT 
		AbluftfeuchteMax : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		DrehzahlMin : {REDUND_UNREPLICABLE} REAL;
		DrehzahlMax : {REDUND_UNREPLICABLE} REAL;
		P : {REDUND_UNREPLICABLE} REAL;
		I : {REDUND_UNREPLICABLE} REAL;
		D : {REDUND_UNREPLICABLE} REAL;
		Ein : {REDUND_UNREPLICABLE} BOOL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parAbluftklappe : {REDUND_UNREPLICABLE} 	STRUCT 
		Laufzeit : {REDUND_UNREPLICABLE} UDINT;
		AbluftfeuchteMax : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Schliessen : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parUmschaltklappen : {REDUND_UNREPLICABLE} 	STRUCT 
		LaufzeitKlappe1 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitKlappe2 : {REDUND_UNREPLICABLE} UDINT;
		TemperaturUmschaltung : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		Umschaltverzoegerung : {REDUND_UNREPLICABLE} UDINT;
		TempDifferenzUmschaltung : {REDUND_UNREPLICABLE} REAL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		Umluft : {REDUND_UNREPLICABLE} BOOL;
		Frischluft : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parBypassklappe : {REDUND_UNREPLICABLE} 	STRUCT 
		Laufzeit : {REDUND_UNREPLICABLE} UDINT;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Schliessen : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parKlappenBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		Laufzeit : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	parNotstromaggregat : {REDUND_UNREPLICABLE} 	STRUCT 
		Vorlaufzeit : {REDUND_UNREPLICABLE} UDINT;
		VerzBetriebsmeldung : {REDUND_UNREPLICABLE} UDINT;
		Nachlaufzeit : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	parSensoren : {REDUND_UNREPLICABLE} 	STRUCT 
		NiederdruckMessberMin : {REDUND_UNREPLICABLE} REAL;
		NiederdruckMessberMax : {REDUND_UNREPLICABLE} REAL;
		HochdruckMessberMin : {REDUND_UNREPLICABLE} REAL;
		HochdruckMessberMax : {REDUND_UNREPLICABLE} REAL;
		EintrittTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		EintrittTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		AustrittTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		AustrittTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		AustrittFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		AustrittFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		FrischlTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		FrischlTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		FrischlFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		FrischlFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		DachTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		DachTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		DachFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		DachFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		TrockenlTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		TrockenlTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		TrockenlFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		TrockenlFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		AbluftTempMessberMin : {REDUND_UNREPLICABLE} REAL;
		AbluftTempMessberMax : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchteMessberMin : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchteMessberMax : {REDUND_UNREPLICABLE} REAL;
		KanaldruckMessberMin : {REDUND_UNREPLICABLE} REAL;
		KanaldruckMessberMax : {REDUND_UNREPLICABLE} REAL;
		LuftgeschwMessberMin : {REDUND_UNREPLICABLE} REAL;
		LuftgeschwMessberMax : {REDUND_UNREPLICABLE} REAL;
		OffsetNiederdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		OffsetNiederdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		OffsetHochdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		OffsetHochdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		OffsetEintrittTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetEintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetAustrittTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetAustrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetFrischluftTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetFrischluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetDachTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetDachFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetTrockenluftTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetTrockenluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetAbluftTemp : {REDUND_UNREPLICABLE} REAL;
		OffsetAbluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		OffsetKanaldruck : {REDUND_UNREPLICABLE} REAL;
		OffsetLuftgeschw : {REDUND_UNREPLICABLE} REAL;
		FilterzeitNiederdruck : {REDUND_UNREPLICABLE} UINT;
		FilterzeitHochdruck : {REDUND_UNREPLICABLE} UINT;
		FilterzeitEintritt : {REDUND_UNREPLICABLE} UINT;
		FilterzeitAustritt : {REDUND_UNREPLICABLE} UINT;
		FilterzeitFrischluft : {REDUND_UNREPLICABLE} UINT;
		FilterzeitDachluft : {REDUND_UNREPLICABLE} UINT;
		FilterzeitTrockenluft : {REDUND_UNREPLICABLE} UINT;
		FilterzeitAbluft : {REDUND_UNREPLICABLE} UINT;
		FilterzeitKanaldruck : {REDUND_UNREPLICABLE} UINT;
		FilterzeitLuftgeschwindigkeit : {REDUND_UNREPLICABLE} UINT;
	END_STRUCT;
	parServicebereich : {REDUND_UNREPLICABLE} 	STRUCT 
		KontrollintervallUhrzeit : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	parFernalarmierung : {REDUND_UNREPLICABLE} 	STRUCT 
		MailAdresse : {REDUND_UNREPLICABLE} ARRAY[0..3]OF STRING[80];
		EMailAlarmierungEin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	parScheitholzofen : {REDUND_UNREPLICABLE} 	STRUCT 
		Auskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	parTarifabschaltung : {REDUND_UNREPLICABLE} 	STRUCT 
		Zeitfenster : {REDUND_UNREPLICABLE} parZeitfenster;
		VorlaufzeitAbschaltungLuftaufb : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	parStrombegrenzung : {REDUND_UNREPLICABLE} 	STRUCT 
		Zeitfenster : {REDUND_UNREPLICABLE} parZeitfenster;
	END_STRUCT;
	parSchlechtwetterBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		Stufe : {REDUND_UNREPLICABLE} ARRAY[1..6]OF parSchlechtwetterBoxenStufen;
		HystereseGrenzwert : {REDUND_UNREPLICABLE} REAL;
		AuswahlSensorGrenzwert : {REDUND_UNREPLICABLE} USINT; (*Option Auswahl zuständiger Sensor für Grenzwert (0= Frischluft, 1= Dachluft, 2= Trockenluft)*)
		MaterialfeuchteIst : {REDUND_UNREPLICABLE} USINT; (*Aktuell Materialfeuchte (Trockengutfeuchte) der Box (%)*)
	END_STRUCT;
	parSchlechtwetterBoxenStufen : {REDUND_UNREPLICABLE} 	STRUCT 
		Saettigungsdefizit : {REDUND_UNREPLICABLE} REAL; (*Grenzwert Sättigungsdefizit Schlechtwetter [g/m³]*)
		SchlechtwetterZeitLauf : {REDUND_UNREPLICABLE} UDINT; (*Laufzeit bei Schlechtwetter [ms]*)
		SchlechtwetterZeitPause : {REDUND_UNREPLICABLE} UDINT; (*Pausenzeit bei Schlechtwetter [ms]*)
		MaterialfeuchteStufe : {REDUND_UNREPLICABLE} UINT; (*Max. Trockengutfeuchte der Stufe (%)*)
	END_STRUCT;
END_TYPE
