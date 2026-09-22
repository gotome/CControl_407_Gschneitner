
TYPE
	typHmiStatus : {REDUND_UNREPLICABLE} 	STRUCT 
		CurUserLevel : {REDUND_UNREPLICABLE} enumPasswortebenen;
		CurPage : {REDUND_UNREPLICABLE} enumSeitenVisu;
		hmiPasswort : {REDUND_UNREPLICABLE} enumPasswoerter;
		Box1 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Box2 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Box3 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Box4 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Box5 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Box6 : {REDUND_UNREPLICABLE} typHmiStatusBoxen;
		Ventilator1 : {REDUND_UNREPLICABLE} typHmiStatusVentilator;
		Ventilator2 : {REDUND_UNREPLICABLE} typHmiStatusVentilator;
		Entfeuchter : {REDUND_UNREPLICABLE} typHmiStatusEntfeuchter;
		WarmluftScheitholzofen : {REDUND_UNREPLICABLE} typHmiStatusWarmluftScheitholz;
		Heizregister : {REDUND_UNREPLICABLE} typHmiStatusHeizregister;
		Brandschutzklappe : {REDUND_UNREPLICABLE} typHmiStatusBrandschutzklappe;
		Umluftklappen : {REDUND_UNREPLICABLE} typHmiStatusUmluftklappen;
		Bypassklappe : {REDUND_UNREPLICABLE} typHmiStatusBypassklappe;
		Abluftklappe : {REDUND_UNREPLICABLE} typHmiStatusAbluftklappe;
		Abluftventilator : {REDUND_UNREPLICABLE} typHmiStatusAbluftventilator;
		Zusatzmeldungen : {REDUND_UNREPLICABLE} typHmiStatusZusatzmeldungen;
		Trendkurven : {REDUND_UNREPLICABLE} typHmiTrendkurven;
		EntfeuchterType : {REDUND_UNREPLICABLE} STRING[20];
		SoftwareVersion : {REDUND_UNREPLICABLE} STRING[16];
		hmiAlarmFilter : {REDUND_UNREPLICABLE} USINT;
		hmiSelectAlarmGroup : {REDUND_UNREPLICABLE} USINT;
		NameSteuerung : {REDUND_UNREPLICABLE} USINT; (*0= LaTronic CControl 4.07, 1= LaTronic CControl 4.07 Plus, 2= LaTronic CControl 3.07, 3= LaTronic CControl 3.04 Plus, 4= HB4000, 5= HB3000,  6= LaTronic CControl 2.07*)
		UserIstAdmin : {REDUND_UNREPLICABLE} BOOL;
		ParameterFileNameAufUsb : {REDUND_UNREPLICABLE} STRING[80];
	END_STRUCT;
	typHmiTrendkurven : {REDUND_UNREPLICABLE} 	STRUCT 
		FrischluftTemp : {REDUND_UNREPLICABLE} REAL;
		FrischluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		DachluftTemp : {REDUND_UNREPLICABLE} REAL;
		DachluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		TrockenluftTemp : {REDUND_UNREPLICABLE} REAL;
		TrockenluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		AbluftTemp : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		EintrittTemp : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		AustrittTemp : {REDUND_UNREPLICABLE} REAL;
		AustrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		NiederdruckMod1 : {REDUND_UNREPLICABLE} REAL;
		NiederdruckMod2 : {REDUND_UNREPLICABLE} REAL;
		HochdruckMod1 : {REDUND_UNREPLICABLE} REAL;
		HochdruckMod2 : {REDUND_UNREPLICABLE} REAL;
		Luftgeschw : {REDUND_UNREPLICABLE} REAL;
		Kanaldruck : {REDUND_UNREPLICABLE} REAL;
		LeistungAktuell : {REDUND_UNREPLICABLE} REAL;
		CursorTrend1 : {REDUND_UNREPLICABLE} REAL;
		CursorTrend2 : {REDUND_UNREPLICABLE} REAL;
		CursorTrend3 : {REDUND_UNREPLICABLE} REAL;
		WertScrollTrend1 : {REDUND_UNREPLICABLE} REAL;
		WertScrollTrend2 : {REDUND_UNREPLICABLE} REAL;
		WertScrollTrend3 : {REDUND_UNREPLICABLE} REAL;
		WertZoomTrend1 : {REDUND_UNREPLICABLE} REAL;
		WertZoomTrend2 : {REDUND_UNREPLICABLE} REAL;
		WertZoomTrend3 : {REDUND_UNREPLICABLE} REAL;
		ZeitScrollTrend1 : {REDUND_UNREPLICABLE} REAL;
		ZeitScrollTrend2 : {REDUND_UNREPLICABLE} REAL;
		ZeitScrollTrend3 : {REDUND_UNREPLICABLE} REAL;
		ZeitZoomTrend1 : {REDUND_UNREPLICABLE} REAL;
		ZeitZoomTrend2 : {REDUND_UNREPLICABLE} REAL;
		ZeitZoomTrend3 : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	typHmiStatusZusatzmeldungen : {REDUND_UNREPLICABLE} 	STRUCT 
		Statustext : {REDUND_UNREPLICABLE} enumZusatzmeldungen;
		RestzeitSchrittAktuell : {REDUND_UNREPLICABLE} UDINT;
		AusgabefeldRestzeit : {REDUND_UNREPLICABLE} enumIcon;
		IconSanduhr : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiStatusBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		Statustext : {REDUND_UNREPLICABLE} enumStatus;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		HintergrundAktiv : {REDUND_UNREPLICABLE} enumIcon;
		HintergrundInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		Trockengut : {REDUND_UNREPLICABLE} enumIcon;
		AnzeigeLaufRestzeit : {REDUND_UNREPLICABLE} enumIcon;
		FarbeTextNameBox : {REDUND_UNREPLICABLE} enumIcon;
		TextindexLaufzeit : {REDUND_UNREPLICABLE} USINT;
		LaufRestzeitStunden : {REDUND_UNREPLICABLE} UINT;
		LaufRestzeitMinuten : {REDUND_UNREPLICABLE} UINT;
		IconWitterung : {REDUND_UNREPLICABLE} USINT; (*0= Gute Witterung, 1= Schlechte Witterung*)
	END_STRUCT;
	typHmiStatusVentilator : {REDUND_UNREPLICABLE} 	STRUCT 
		TextFrischluftDachluft : {REDUND_UNREPLICABLE} USINT;
		LuftmengenregFrischlSperre : {REDUND_UNREPLICABLE} BOOL;
		LuftmengenregUmluftSperre : {REDUND_UNREPLICABLE} BOOL;
		Status : {REDUND_UNREPLICABLE} enumStatus;
		FarbeIcon : {REDUND_UNREPLICABLE} enumIcon;
		IstDrehzahl : {REDUND_UNREPLICABLE} REAL;
		BargraphInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		BargraphAktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeDrehzahl : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldFixdrehzUmluft : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldFixdrehzFrischl : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldLuftmengeUmluft : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldLuftmengeFrischl : {REDUND_UNREPLICABLE} enumIcon;
		Umluftbetrieb : {REDUND_UNREPLICABLE} enumIcon;
		Luftmenge : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiStatusEntfeuchter : {REDUND_UNREPLICABLE} 	STRUCT 
		IstDrehzahlKompressor1 : {REDUND_UNREPLICABLE} REAL;
		IstDrehzahlKompressor2 : {REDUND_UNREPLICABLE} REAL;
		Status : {REDUND_UNREPLICABLE} enumStatus;
		FarbeIcon : {REDUND_UNREPLICABLE} enumIcon;
		EingabeFeuchteEinAusSperre : {REDUND_UNREPLICABLE} BOOL;
		FarbeDrehzahl : {REDUND_UNREPLICABLE} enumIcon;
		FarbeTextStatus : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		IconAbtauung : {REDUND_UNREPLICABLE} enumIcon;
		RestlaufzeitOelsumpfh : {REDUND_UNREPLICABLE} UDINT;
		StatusButtonInselbetrieb : {REDUND_UNREPLICABLE} enumIcon;
		IconAnforderungExtern : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiStatusWarmluftScheitholz : {REDUND_UNREPLICABLE} 	STRUCT 
		EingabeSattDefizitSperre : {REDUND_UNREPLICABLE} BOOL;
		TextindexUeberschrift : {REDUND_UNREPLICABLE} USINT;
		StatusWarmluftofen : {REDUND_UNREPLICABLE} enumStatus;
		StatusScheitholzofen : {REDUND_UNREPLICABLE} enumStatus;
		FarbeIcon : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldShoInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldShoAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldWloInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldWloAktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustextSho : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustextWlo : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiStatusHeizregister : {REDUND_UNREPLICABLE} 	STRUCT 
		Status : {REDUND_UNREPLICABLE} enumStatus;
		FarbeIcon : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		EingabeSattDefizitSperre : {REDUND_UNREPLICABLE} BOOL;
		IstDrehzahl : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	typHmiStatusBrandschutzklappe : {REDUND_UNREPLICABLE} 	STRUCT 
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		Status : {REDUND_UNREPLICABLE} enumStatus;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiStatusUmluftklappen : {REDUND_UNREPLICABLE} 	STRUCT 
		Status : {REDUND_UNREPLICABLE} enumStatus;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldTempDifferenz : {REDUND_UNREPLICABLE} enumIcon;
		EingabefeldTempUmschaltung : {REDUND_UNREPLICABLE} enumIcon;
		EingabeTempSchaltpunktSperre : {REDUND_UNREPLICABLE} BOOL;
		EingabeTempDifferenzSperre : {REDUND_UNREPLICABLE} BOOL;
		TextindexButton : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Frischluft, 2= Dachluft, 3= Umluft*)
		IndexBetriebsart : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Frischluft, 2= Umluft*)
		TextindexEingabeUmschaltpunkt : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	typHmiStatusBypassklappe : {REDUND_UNREPLICABLE} 	STRUCT 
		Status : {REDUND_UNREPLICABLE} enumStatus;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		TextindexButton : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Auf, 2= Zu*)
		IndexBetriebsart : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Auf, 2= Zu*)
	END_STRUCT;
	typHmiStatusAbluftklappe : {REDUND_UNREPLICABLE} 	STRUCT 
		Status : {REDUND_UNREPLICABLE} enumStatus;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		EingabeMaxAbluftfeuchteSperre : {REDUND_UNREPLICABLE} BOOL;
		TextindexButton : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Auf, 2= Zu*)
		IndexBetriebsart : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Auf, 2= Zu*)
	END_STRUCT;
	typHmiStatusAbluftventilator : {REDUND_UNREPLICABLE} 	STRUCT 
		Status : {REDUND_UNREPLICABLE} enumStatus;
		StatusfeldAktiv : {REDUND_UNREPLICABLE} enumIcon;
		StatusfeldInaktiv : {REDUND_UNREPLICABLE} enumIcon;
		FarbeStatustext : {REDUND_UNREPLICABLE} enumIcon;
		EingabeMaxAbluftfeuchteSperre : {REDUND_UNREPLICABLE} BOOL;
		TextindexButton : {REDUND_UNREPLICABLE} USINT;
		IndexBetriebsart : {REDUND_UNREPLICABLE} USINT; (*0= Automatik, 1= Ein, 2= Aus*)
	END_STRUCT;
	typHmiSensoren : {REDUND_UNREPLICABLE} 	STRUCT 
		FrischluftTemp : {REDUND_UNREPLICABLE} REAL;
		FrischluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		FrischluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		DachluftTemp : {REDUND_UNREPLICABLE} REAL;
		DachluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		DachluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		TrockenluftTemp : {REDUND_UNREPLICABLE} REAL;
		TrockenluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		TrockenluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		AbluftTemp : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		AbluftSattDefizit : {REDUND_UNREPLICABLE} REAL;
		EintrittTemp : {REDUND_UNREPLICABLE} REAL;
		EintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		AustrittTemp : {REDUND_UNREPLICABLE} REAL;
		AustrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		NiederdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		HochdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		NiederdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		HochdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		Luftgeschwindigkeit : {REDUND_UNREPLICABLE} REAL;
		LuftmengeAktuell : {REDUND_UNREPLICABLE} REAL;
		KanaldruckmmH2O : {REDUND_UNREPLICABLE} REAL;
		KanaldruckPa : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	typHmiVisibilityTrend : {REDUND_UNREPLICABLE} 	STRUCT 
		FrischluftTemp : {REDUND_UNREPLICABLE} enumIcon;
		FrischluftFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		DachluftTemp : {REDUND_UNREPLICABLE} enumIcon;
		DachluftFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		TrockenluftTemp : {REDUND_UNREPLICABLE} enumIcon;
		TrockenluftFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		AbluftTemp : {REDUND_UNREPLICABLE} enumIcon;
		AbluftFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		Luftgeschw : {REDUND_UNREPLICABLE} enumIcon;
		Kanaldruck : {REDUND_UNREPLICABLE} enumIcon;
		EintrittTemp : {REDUND_UNREPLICABLE} enumIcon;
		EintrittFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		AustrittTemp : {REDUND_UNREPLICABLE} enumIcon;
		AustrittFeuchte : {REDUND_UNREPLICABLE} enumIcon;
		NiederdruckMod1 : {REDUND_UNREPLICABLE} enumIcon;
		NiederdruckMod2 : {REDUND_UNREPLICABLE} enumIcon;
		HochdruckMod1 : {REDUND_UNREPLICABLE} enumIcon;
		HochdruckMod2 : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiVisibility : {REDUND_UNREPLICABLE} 	STRUCT 
		Allgemein : {REDUND_UNREPLICABLE} typHmiVisibilityAllgemein;
		Layers : {REDUND_UNREPLICABLE} typHmiVisibilityLayers;
		Buttons : {REDUND_UNREPLICABLE} typHmiVisibilityButtons;
		Trend : {REDUND_UNREPLICABLE} typHmiVisibilityTrend;
	END_STRUCT;
	typHmiVisibilityAllgemein : {REDUND_UNREPLICABLE} 	STRUCT 
		Testbetrieb : {REDUND_UNREPLICABLE} enumIcon;
		EbeneService : {REDUND_UNREPLICABLE} enumIcon;
		EbeneLasco : {REDUND_UNREPLICABLE} enumIcon;
		UmschaltverzBetriebsartAktiv : {REDUND_UNREPLICABLE} enumIcon;
		Energiemessung : {REDUND_UNREPLICABLE} enumIcon;
		SymbolRegisterUebersicht : {REDUND_UNREPLICABLE} enumIcon;
		SymbolOfenUebersicht : {REDUND_UNREPLICABLE} enumIcon;
		SymbolEntfeuchterFremdUebersicht : {REDUND_UNREPLICABLE} enumIcon;
		SymbolEntfeuchterUebersicht : {REDUND_UNREPLICABLE} enumIcon;
		Luftgeschwindigkeit : {REDUND_UNREPLICABLE} enumIcon;
		Scheitholzofen : {REDUND_UNREPLICABLE} enumIcon;
		Brandschutzklappe : {REDUND_UNREPLICABLE} enumIcon;
		KompressorModul2 : {REDUND_UNREPLICABLE} enumIcon;
		TemperaturvorgWarmluftofen : {REDUND_UNREPLICABLE} enumIcon;
		Warmluftofen : {REDUND_UNREPLICABLE} enumIcon;
		TemperaturvorgHeizregister : {REDUND_UNREPLICABLE} enumIcon;
		Kanaldruck : {REDUND_UNREPLICABLE} enumIcon;
		Abluftventilator : {REDUND_UNREPLICABLE} enumIcon;
		Abluftklappe : {REDUND_UNREPLICABLE} enumIcon;
		Abluft : {REDUND_UNREPLICABLE} enumIcon;
		Dachluft : {REDUND_UNREPLICABLE} enumIcon;
		Trockenluft : {REDUND_UNREPLICABLE} enumIcon;
		Frischluft : {REDUND_UNREPLICABLE} enumIcon;
		Umschaltklappen : {REDUND_UNREPLICABLE} enumIcon;
		Bypassklappe : {REDUND_UNREPLICABLE} enumIcon;
		LaufzRestOelsumpf : {REDUND_UNREPLICABLE} enumIcon;
		Entfeuchter : {REDUND_UNREPLICABLE} enumIcon;
		Box1 : {REDUND_UNREPLICABLE} enumIcon;
		Box2 : {REDUND_UNREPLICABLE} enumIcon;
		Box3 : {REDUND_UNREPLICABLE} enumIcon;
		Box4 : {REDUND_UNREPLICABLE} enumIcon;
		Box5 : {REDUND_UNREPLICABLE} enumIcon;
		Box6 : {REDUND_UNREPLICABLE} enumIcon;
		Ventilator2 : {REDUND_UNREPLICABLE} enumIcon;
		UmluftbetriebVhd : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtKlappen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtTrocknungsger : {REDUND_UNREPLICABLE} enumIcon;
		HB4000Hide : {REDUND_UNREPLICABLE} enumIcon; (*Objekte, die nur in der Konfiguration HB4000 sichtbar sind*)
		HB4000 : {REDUND_UNREPLICABLE} enumIcon; (*Objekte, die nur in der Konfiguration HB4000 sichtbar sind*)
		EingabeTrockengutfeuchteBox : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiVisibilityLayers : {REDUND_UNREPLICABLE} 	STRUCT 
		ErrorDatum : {REDUND_UNREPLICABLE} enumIcon;
		MdgPwSchutzAus : {REDUND_UNREPLICABLE} enumIcon;
		EbeneFehler : {REDUND_UNREPLICABLE} enumIcon;
		EbeneWarnung : {REDUND_UNREPLICABLE} enumIcon;
		MldgDatumFalsch : {REDUND_UNREPLICABLE} enumIcon;
		MldgKontrolleUhrzeit : {REDUND_UNREPLICABLE} enumIcon;
		MldgStockkontrolle : {REDUND_UNREPLICABLE} enumIcon;
		Zeitfenster : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtBox : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtEineBox : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtZweiBoxen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtDreiBoxen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtVierBoxen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtFuenfBoxen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtSechsBoxen : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtEinVentilator : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtZweiVentilatoren : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtVentilatoren : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtRegister : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtOfen : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtEntfeuchterFremd : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtEntfeuchter : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtKlappen : {REDUND_UNREPLICABLE} enumIcon;
		DetailansichtSensoren : {REDUND_UNREPLICABLE} enumIcon;
		Trocknungsbilanz : {REDUND_UNREPLICABLE} enumIcon;
		UebersichtInselbetrieb : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiVisibilityButtons : {REDUND_UNREPLICABLE} 	STRUCT 
		IntervallEinstellenBoxAktuell : {REDUND_UNREPLICABLE} enumIcon;
		NachtrocknEinstellenBoxAktuell : {REDUND_UNREPLICABLE} enumIcon;
		IOTestOK : {REDUND_UNREPLICABLE} enumIcon;
		AckTestbetrieb : {REDUND_UNREPLICABLE} enumIcon;
		LogoutButton : {REDUND_UNREPLICABLE} enumIcon;
	END_STRUCT;
	typHmiTrocknungsbilanz : {REDUND_UNREPLICABLE} 	STRUCT 
		NameBox : {REDUND_UNREPLICABLE} STRING[20];
		LaufzeitGesamt : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitVentilator : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitLuftaufbereitung : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
	typHmiBoxAktuell : {REDUND_UNREPLICABLE} 	STRUCT 
		NameBox : {REDUND_UNREPLICABLE} STRING[20]; (*Name der Box*)
		Trockengut : {REDUND_UNREPLICABLE} enumIcon; (*0 = Losetrocknung, 1= Rundballentrocknung, 2= Mais, 3= Getreide*)
		Aus : {REDUND_UNREPLICABLE} BOOL; (*Box Ausgeschaltet*)
		DauerbetriebEin : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Dauerbetrieb Ein*)
		IntervallbetriebEin : {REDUND_UNREPLICABLE} BOOL;
		NachtrocknungEin : {REDUND_UNREPLICABLE} BOOL;
		SperreDauerbetrieb : {REDUND_UNREPLICABLE} BOOL;
		SperreIntervallbetrieb : {REDUND_UNREPLICABLE} BOOL;
		Status : {REDUND_UNREPLICABLE} enumStatus;
		ZeitbereicheGesperrt : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL;
		Zeitbereiche : {REDUND_UNREPLICABLE} ARRAY[0..23]OF BOOL;
		RestzeitUmschaltverzBetriebsart : {REDUND_UNREPLICABLE} UDINT;
		AnzeigeLaufRestzeit : {REDUND_UNREPLICABLE} enumIcon;
		TextindexLaufzeit : {REDUND_UNREPLICABLE} USINT;
		LaufRestzeitStunden : {REDUND_UNREPLICABLE} UINT;
		LaufRestzeitMinuten : {REDUND_UNREPLICABLE} UINT;
		IconWitterung : {REDUND_UNREPLICABLE} USINT; (*0= Gute Witterung, 1= Schlechte Witterung*)
		TrockengutfeuchteAktuell : {REDUND_UNREPLICABLE} USINT;
	END_STRUCT;
	typIoTest : {REDUND_UNREPLICABLE} 	STRUCT 
		DigitalIn : {REDUND_UNREPLICABLE} typIoTestDigitalIn;
		StatusIn : {REDUND_UNREPLICABLE} typIoTestStatusIn;
		DigitalOut : {REDUND_UNREPLICABLE} typIoTestDigitalOut;
		AnalogIn : {REDUND_UNREPLICABLE} typIoTestAnalogIn;
		AnalogOut : {REDUND_UNREPLICABLE} typIoTestAnalogOut;
	END_STRUCT;
	typIoTestDigitalIn : {REDUND_UNREPLICABLE} 	STRUCT 
		diVentilator1InBetrieb : {REDUND_UNREPLICABLE} BOOL;
		di24VDCinternIstOk : {REDUND_UNREPLICABLE} BOOL;
		diBox1Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox1Geschl : {REDUND_UNREPLICABLE} BOOL;
		diBox2Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox2Geschl : {REDUND_UNREPLICABLE} BOOL;
		diVentilator2InBetrieb : {REDUND_UNREPLICABLE} BOOL;
		diDrehzahlbegrVentilator1 : {REDUND_UNREPLICABLE} BOOL;
		diDrehzahlbegrVentilator2 : {REDUND_UNREPLICABLE} BOOL;
		diScheitholzofenInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		diWarmluftofenInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		diBox3Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox3Geschl : {REDUND_UNREPLICABLE} BOOL;
		diBox4Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox4Geschl : {REDUND_UNREPLICABLE} BOOL;
		diBox5Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox5Geschl : {REDUND_UNREPLICABLE} BOOL;
		diBox6Offen : {REDUND_UNREPLICABLE} BOOL;
		diBox6Geschl : {REDUND_UNREPLICABLE} BOOL;
		diAbluftventInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		diAbluftklappeOffen : {REDUND_UNREPLICABLE} BOOL;
		diAbluftklappeGeschl : {REDUND_UNREPLICABLE} BOOL;
		diUmschaltklappe1Offen : {REDUND_UNREPLICABLE} BOOL;
		diUmschaltklappe1Geschl : {REDUND_UNREPLICABLE} BOOL;
		diUmschaltklappe2Offen : {REDUND_UNREPLICABLE} BOOL;
		diUmschaltklappe2Geschl : {REDUND_UNREPLICABLE} BOOL;
		diNotstromaggregatInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		diNiederdruckOkModul1 : {REDUND_UNREPLICABLE} BOOL;
		diNiederdruckOkModul2 : {REDUND_UNREPLICABLE} BOOL;
		diHochdruckOkModul1 : {REDUND_UNREPLICABLE} BOOL;
		diHochdruckOkModul2 : {REDUND_UNREPLICABLE} BOOL;
		diKopftempKompressorModul1 : {REDUND_UNREPLICABLE} BOOL;
		diKopftempKompressorModul2 : {REDUND_UNREPLICABLE} BOOL;
		diOeldruckKompressorModul1 : {REDUND_UNREPLICABLE} BOOL;
		diOeldruckKompressorModul2 : {REDUND_UNREPLICABLE} BOOL;
		diVollschutzKompressorModul1 : {REDUND_UNREPLICABLE} BOOL;
		diVollschutzKompressorModul2 : {REDUND_UNREPLICABLE} BOOL;
		diBetriebsmldgKompressorModul1 : {REDUND_UNREPLICABLE} BOOL;
		diBetriebsmldgKompressorModul2 : {REDUND_UNREPLICABLE} BOOL;
		diLeistungsvorgKompressorExtMod1 : {REDUND_UNREPLICABLE} BOOL;
		diBypassklappeGeschl : {REDUND_UNREPLICABLE} BOOL;
		diBypassklappeOffen : {REDUND_UNREPLICABLE} BOOL;
		diAnfEntfeuchterExtern : {REDUND_UNREPLICABLE} BOOL; (*Nur bei 3.04 in Verwendung*)
		diDrehfeldIstKorrekt : {REDUND_UNREPLICABLE} BOOL; (*Nur bei 3.04 in Verwendung*)
		di230VACIstOk : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
		diEntfeuchterFremdInBetrieb : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
		diEntfeuchterFremdStoerung : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
		diTasteTrocknungPausieren : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
		diHeizregisterFrostschutz : {REDUND_UNREPLICABLE} BOOL; (*Thermostat Heizregister Forstschutz  EIN*)
	END_STRUCT;
	typIoTestStatusIn : {REDUND_UNREPLICABLE} 	STRUCT 
		diStatusNiederdruckMinMod1 : {REDUND_UNREPLICABLE} BOOL;
		diStatusNiederdruckMaxMod1 : {REDUND_UNREPLICABLE} BOOL;
		diStatusHochdruckMinMod1 : {REDUND_UNREPLICABLE} BOOL;
		diStatusHochdruckMaxMod1 : {REDUND_UNREPLICABLE} BOOL;
		diStatusNiederdruckMinMod2 : {REDUND_UNREPLICABLE} BOOL;
		diStatusNiederdruckMaxMod2 : {REDUND_UNREPLICABLE} BOOL;
		diStatusHochdruckMinMod2 : {REDUND_UNREPLICABLE} BOOL;
		diStatusHochdruckMaxMod2 : {REDUND_UNREPLICABLE} BOOL;
		diStatusDifferenzdruckMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusDifferenzdruckMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusLuftgeschwDrahtbruch : {REDUND_UNREPLICABLE} BOOL;
		diStatusLuftgeschwMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusLuftgeschwMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusEintrittTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusEintrittTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusEintrittFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusEintrittFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusAustrittTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusAustrittTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusAustrittFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusAustrittFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusFrischluftFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusFrischluftFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusFrischluftTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusFrischluftTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusTrockenluftFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusTrockenluftFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusTrockenluftTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusTrockenluftTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusDachluftFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusDachluftFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusDachluftTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusDachluftTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusAbluftTempMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusAbluftTempMin : {REDUND_UNREPLICABLE} BOOL;
		diStatusAbluftFeuchteMax : {REDUND_UNREPLICABLE} BOOL;
		diStatusAbluftFeuchteMin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typIoTestDigitalOut : {REDUND_UNREPLICABLE} 	STRUCT 
		doVentilator1Ein : {REDUND_UNREPLICABLE} BOOL;
		doTrocknungInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox1 : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox2 : {REDUND_UNREPLICABLE} BOOL;
		doTrocknungStoerung : {REDUND_UNREPLICABLE} BOOL;
		doVentilator2Ein : {REDUND_UNREPLICABLE} BOOL;
		doWarmluftofenEin : {REDUND_UNREPLICABLE} BOOL;
		doHeizregisterEin : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox3 : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox4 : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox5 : {REDUND_UNREPLICABLE} BOOL;
		doFreigabeBox6 : {REDUND_UNREPLICABLE} BOOL;
		doBrandschutzklappeAuf : {REDUND_UNREPLICABLE} BOOL;
		doAbluftventilatorEin : {REDUND_UNREPLICABLE} BOOL;
		doAbluftklappeFreigabe : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe1Freigabe : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe2Freigabe : {REDUND_UNREPLICABLE} BOOL;
		doNotstromaggregatEin : {REDUND_UNREPLICABLE} BOOL;
		doKompressorEinModul1 : {REDUND_UNREPLICABLE} BOOL;
		doKompressorEinModul2 : {REDUND_UNREPLICABLE} BOOL;
		doMagnetventilEinModul1 : {REDUND_UNREPLICABLE} BOOL;
		doMagnetventilEinModul2 : {REDUND_UNREPLICABLE} BOOL;
		doOelsumpfheizungEinModul1 : {REDUND_UNREPLICABLE} BOOL;
		doOelsumpfheizungEinModul2 : {REDUND_UNREPLICABLE} BOOL;
		doBypassklappeOeffnen : {REDUND_UNREPLICABLE} BOOL;
		doBypassklappeSchliessen : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe1Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe1Schliessen : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe2Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		doUmluftklappe2Schliessen : {REDUND_UNREPLICABLE} BOOL;
		doAbluftklappeOeffnen : {REDUND_UNREPLICABLE} BOOL;
		doAbluftklappeSchliessen : {REDUND_UNREPLICABLE} BOOL;
		doEntfFremdFreigabe : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
		doLuftentfeuchterStrombegrEin : {REDUND_UNREPLICABLE} BOOL; (*Nur bei HB4000 in Verwendung*)
	END_STRUCT;
	typIoTestAnalogIn : {REDUND_UNREPLICABLE} 	STRUCT 
		aiFrischluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiFrischluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		aiTrockenluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiTrockenluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		aiAbluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiAbluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		aiDachluftTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiDachluftFeuchte : {REDUND_UNREPLICABLE} REAL;
		aiLuftgeschwindigkeit : {REDUND_UNREPLICABLE} REAL;
		aiDifferenzdruck : {REDUND_UNREPLICABLE} REAL;
		aiNiederdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		aiNiederdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		aiHochdruckModul2 : {REDUND_UNREPLICABLE} REAL;
		aiHochdruckModul1 : {REDUND_UNREPLICABLE} REAL;
		aiEintrittTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiEintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		aiAustrittTemperatur : {REDUND_UNREPLICABLE} REAL;
		aiAustrittFeuchte : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	typIoTestAnalogOut : {REDUND_UNREPLICABLE} 	STRUCT 
		aoDrehzahlvorgVentilator1 : {REDUND_UNREPLICABLE} REAL;
		aoTemperaturvorgWarmluftofen : {REDUND_UNREPLICABLE} REAL;
		aoDrehzahlvorgVentilator2 : {REDUND_UNREPLICABLE} REAL;
		aoLeistungsvorgHeizregister : {REDUND_UNREPLICABLE} REAL;
		aoDrehzahlvorgAbluftventilator : {REDUND_UNREPLICABLE} REAL;
		aoDrehzahlvorgKompressorModul1 : {REDUND_UNREPLICABLE} REAL;
		aoDrehzahlvorgKompressorModul2 : {REDUND_UNREPLICABLE} REAL;
	END_STRUCT;
	typHmiButtonsKlappenBoxen : {REDUND_UNREPLICABLE} 	STRUCT 
		Klappe1 : {REDUND_UNREPLICABLE} BOOL;
		Klappe2 : {REDUND_UNREPLICABLE} BOOL;
		Klappe3 : {REDUND_UNREPLICABLE} BOOL;
		Klappe4 : {REDUND_UNREPLICABLE} BOOL;
		Klappe5 : {REDUND_UNREPLICABLE} BOOL;
		Klappe6 : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typHmiButtons : {REDUND_UNREPLICABLE} 	STRUCT 
		IntervallEinstellenBoxAktuell : {REDUND_UNREPLICABLE} BOOL;
		NachtrocknEinstellenAktuell : {REDUND_UNREPLICABLE} BOOL;
		hideDetailansichtBox : {REDUND_UNREPLICABLE} BOOL;
		hideZeitfenster : {REDUND_UNREPLICABLE} BOOL;
		showBox1 : {REDUND_UNREPLICABLE} BOOL;
		showBox2 : {REDUND_UNREPLICABLE} BOOL;
		showBox3 : {REDUND_UNREPLICABLE} BOOL;
		showBox4 : {REDUND_UNREPLICABLE} BOOL;
		showBox5 : {REDUND_UNREPLICABLE} BOOL;
		showBox6 : {REDUND_UNREPLICABLE} BOOL;
		showVentilatoren : {REDUND_UNREPLICABLE} BOOL;
		showEntfeuchterFremd : {REDUND_UNREPLICABLE} BOOL;
		showEntfeuchter : {REDUND_UNREPLICABLE} BOOL;
		showOfen : {REDUND_UNREPLICABLE} BOOL;
		showHeizregister : {REDUND_UNREPLICABLE} BOOL;
		showKlappen : {REDUND_UNREPLICABLE} BOOL;
		showSensoren : {REDUND_UNREPLICABLE} BOOL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		TestbetriebEin : {REDUND_UNREPLICABLE} BOOL;
		TestbetriebAbbrechen : {REDUND_UNREPLICABLE} BOOL;
		TestbetriebAbschliessen : {REDUND_UNREPLICABLE} BOOL;
		IpParameterSetzen : {REDUND_UNREPLICABLE} BOOL;
		DatenaufzeichnungAufUsb : {REDUND_UNREPLICABLE} BOOL;
		DatenaufzeichnungLoeschen : {REDUND_UNREPLICABLE} BOOL;
		Logout : {REDUND_UNREPLICABLE} BOOL;
		TouchKalibrieren : {REDUND_UNREPLICABLE} BOOL;
		SicherheitshinweisOk : {REDUND_UNREPLICABLE} BOOL;
		ResetEnergieverbrTag : {REDUND_UNREPLICABLE} BOOL;
		ResetServiceUhrzeit : {REDUND_UNREPLICABLE} BOOL;
		ButtonsKlappeBox1 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		ButtonsKlappeBox2 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		ButtonsKlappeBox3 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		ButtonsKlappeBox4 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		ButtonsKlappeBox5 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		ButtonsKlappeBox6 : {REDUND_UNREPLICABLE} typHmiButtonsKlappenBoxen;
		changeBetrArtBypassklappe : {REDUND_UNREPLICABLE} BOOL;
		changeBetrArtAbluftvent : {REDUND_UNREPLICABLE} BOOL;
		changeBetrArtAbluftklappe : {REDUND_UNREPLICABLE} BOOL;
		changeBetrArtUmluftklappen : {REDUND_UNREPLICABLE} BOOL;
		ParameterVonUsbLaden : {REDUND_UNREPLICABLE} BOOL;
		ParameterAufUsbKopieren : {REDUND_UNREPLICABLE} BOOL;
		TrocknungsbilanzOk : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox1 : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox2 : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox3 : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox4 : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox5 : {REDUND_UNREPLICABLE} BOOL;
		changeTrockengutBox6 : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typHmiActions : {REDUND_UNREPLICABLE} 	STRUCT 
		cmdChangePageTo : {REDUND_UNREPLICABLE} enumSeitenVisu;
		cmdInselbetriebEntfeuchterEin : {REDUND_UNREPLICABLE} BOOL;
	END_STRUCT;
	typHmiDatenaufzeichnung : {REDUND_UNREPLICABLE} 	STRUCT 
		SaveStepNr : {REDUND_UNREPLICABLE} UINT;
		CopyStepNr : {REDUND_UNREPLICABLE} UINT;
		AnzahlFiles : {REDUND_UNREPLICABLE} UDINT;
		AnzahlEintraegeInFile : {REDUND_UNREPLICABLE} UDINT;
	END_STRUCT;
END_TYPE
