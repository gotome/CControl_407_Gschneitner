#ifndef __AS__TYPE_
#define __AS__TYPE_
typedef struct {
	unsigned char bit0  : 1;
	unsigned char bit1  : 1;
	unsigned char bit2  : 1;
	unsigned char bit3  : 1;
	unsigned char bit4  : 1;
	unsigned char bit5  : 1;
	unsigned char bit6  : 1;
	unsigned char bit7  : 1;
} _1byte_bit_field_;

typedef struct {
	unsigned short bit0  : 1;
	unsigned short bit1  : 1;
	unsigned short bit2  : 1;
	unsigned short bit3  : 1;
	unsigned short bit4  : 1;
	unsigned short bit5  : 1;
	unsigned short bit6  : 1;
	unsigned short bit7  : 1;
	unsigned short bit8  : 1;
	unsigned short bit9  : 1;
	unsigned short bit10 : 1;
	unsigned short bit11 : 1;
	unsigned short bit12 : 1;
	unsigned short bit13 : 1;
	unsigned short bit14 : 1;
	unsigned short bit15 : 1;
} _2byte_bit_field_;

typedef struct {
	unsigned long bit0  : 1;
	unsigned long bit1  : 1;
	unsigned long bit2  : 1;
	unsigned long bit3  : 1;
	unsigned long bit4  : 1;
	unsigned long bit5  : 1;
	unsigned long bit6  : 1;
	unsigned long bit7  : 1;
	unsigned long bit8  : 1;
	unsigned long bit9  : 1;
	unsigned long bit10 : 1;
	unsigned long bit11 : 1;
	unsigned long bit12 : 1;
	unsigned long bit13 : 1;
	unsigned long bit14 : 1;
	unsigned long bit15 : 1;
	unsigned long bit16 : 1;
	unsigned long bit17 : 1;
	unsigned long bit18 : 1;
	unsigned long bit19 : 1;
	unsigned long bit20 : 1;
	unsigned long bit21 : 1;
	unsigned long bit22 : 1;
	unsigned long bit23 : 1;
	unsigned long bit24 : 1;
	unsigned long bit25 : 1;
	unsigned long bit26 : 1;
	unsigned long bit27 : 1;
	unsigned long bit28 : 1;
	unsigned long bit29 : 1;
	unsigned long bit30 : 1;
	unsigned long bit31 : 1;
} _4byte_bit_field_;
#endif

#ifndef __AS__TYPE_parAllgemein
#define __AS__TYPE_parAllgemein
typedef struct parAllgemein
{	plcstring IPAdresse[17];
	plcstring SubnetMask[17];
	plcstring DefaultGateway[17];
	plcstring HostName[17];
	plcdt DatumUhrzeitLetzterBetrieb;
	float VerzoegerungWarnungen;
	float VerzoegerungFehler;
	float StandortHoehe;
	float AnsaugflaecheVent;
	unsigned long VerzoegerungAenderungKlappen;
	unsigned long LoginTimeout;
	unsigned long VerzUmschBetriebsartBoxen;
	signed short DisplayTimeout;
	unsigned char Sprache;
	plcbit PasswortschutzAus;
	plcbit AutoLogoutEin;
	plcbit ParameterVorhanden;
} parAllgemein;
#endif

#ifndef __AS__TYPE_parBetrieb
#define __AS__TYPE_parBetrieb
typedef struct parBetrieb
{	plcbit BetriebAutoEin;
} parBetrieb;
#endif

#ifndef __AS__TYPE_parAusstattung
#define __AS__TYPE_parAusstattung
typedef struct parAusstattung
{	plcbit Ventilator1;
	plcbit Ventilator2;
	plcbit Entfeuchter;
	plcbit EntfeuchterFremd;
	plcbit Warmluftofen;
	plcbit WarmluftofenBetriebsmldg;
	plcbit WarmluftofenTempVorgabe;
	plcbit Heizregister;
	plcbit HeizregisterDrehzahlvorgabe;
	plcbit Scheitholzofen;
	plcbit Notstromaggregat;
	plcbit Energiemessung;
	plcbit Bypassklappe;
	plcbit Umschaltklappe1;
	plcbit Umschaltklappe2;
	plcbit Brandschutzklappe;
	plcbit Abluftklappe;
	plcbit Abluftventilator;
	plcbit SensorFrischluft;
	plcbit SensorDachluft;
	plcbit SensorTrockenluft;
	plcbit SensorAbluft;
	plcbit SensorLuftgeschwindigkeit;
	plcbit SensorKanaldruck;
	plcbit Box1;
	plcbit Box2;
	plcbit Box3;
	plcbit Box4;
	plcbit Box5;
	plcbit Box6;
	plcbit AlleBoxenklSchliessenWennAus;
	plcbit MehrereBoxenBelueftbar;
	plcbit LuftmngReglerFrischlVent1;
	plcbit LuftmngReglerUmluftVent1;
	plcbit LuftmngReglerFrischlVent2;
	plcbit LuftmngReglerUmluftVent2;
	plcbit EntfeuchterNurImUmluftbetrieb;
	plcbit BeideVentAusBeiUmschBypasskl;
	plcbit BeideVentAusBeiUmschBoxenkl;
	plcbit Vent1AusWennUmschUmluftkl;
	plcbit Vent2AusWennUmschUmluftkl;
	plcbit AbluftklImFrischlbetrImmerOffen;
	plcbit StellungUmluftklappe1Stillstand;
	plcbit StellungUmluftklappe2Stillstand;
	plcbit EndlagenVhdUmschaltklappe1;
	plcbit EndlagenVhdUmschaltklappe2;
	plcbit EndlagenVhdBypassklappe;
	plcbit EndlagenVhdBoxenklappe1;
	plcbit EndlagenVhdBoxenklappe2;
	plcbit EndlagenVhdBoxenklappe3;
	plcbit EndlagenVhdBoxenklappe4;
	plcbit EndlagenVhdBoxenklappe5;
	plcbit EndlagenVhdBoxenklappe6;
} parAusstattung;
#endif

#ifndef __AS__TYPE_parSchrittkette
#define __AS__TYPE_parSchrittkette
typedef struct parSchrittkette
{	unsigned long AnlaufverzZweiterVentilator;
	unsigned long VerzWetterwechsel;
} parSchrittkette;
#endif

#ifndef __AS__TYPE_parVentilator
#define __AS__TYPE_parVentilator
typedef struct parVentilator
{	float LuftmengeSollFrischluft;
	float LuftmengeSollUmluft;
	float LuftmengeBoxMin;
	float LuftmengeBoxMax;
	float DrehzahlMin;
	float DrehzahlMax;
	float DrehzahlBeiAuskuehlphase;
	float DrzUmschaltung;
	float DrzUmschaltungMitLuftaufb;
	float DrehzahlFixUmluft;
	float DrehzahlFixFrischluft;
	float DrehzahlStrombegrenzung;
	float DrehzahlLeistungsreduz;
	float P;
	float I;
	float D;
	float D_Filter;
	float Hysterese;
	float WindupDaempfung;
	float Fehlerverzoegerung;
	unsigned long ZeitRampeUp;
	unsigned long ZeitRampeDown;
	plcbit LuftmengenregUmluftEin;
	plcbit LuftmengenregFrischluftEin;
} parVentilator;
#endif

#ifndef __AS__TYPE_enumStellungKlappenBoxen
#define __AS__TYPE_enumStellungKlappenBoxen
typedef enum enumStellungKlappenBoxen
{	FBBOX_NICHT_VERWENDET = 0,
	FBBOX_GESCHLOSSEN = 1,
	FBBOX_GEOEFFNET = 2,
} enumStellungKlappenBoxen;
#endif

#ifndef __AS__TYPE_parBoxen
#define __AS__TYPE_parBoxen
typedef struct parBoxen
{	enumStellungKlappenBoxen StellungKlappe1;
	enumStellungKlappenBoxen StellungKlappe2;
	enumStellungKlappenBoxen StellungKlappe3;
	enumStellungKlappenBoxen StellungKlappe4;
	enumStellungKlappenBoxen StellungKlappe5;
	enumStellungKlappenBoxen StellungKlappe6;
	float Grundflaeche;
	plcstring NameBox[21];
	unsigned char Trockengut;
	plcbit Aus;
	plcbit DauerbetriebEin;
	plcbit IntervallbetriebEin;
	plcbit NachtrocknungEin;
	plcbit Ventilator1;
	plcbit Ventilator2;
	plcbit Luftentfeuchter;
	plcbit Warmluftofen;
	plcbit Heizregister;
	plcbit Scheitholzofen;
	plcbit IntervallbetriebZeiten[24];
	plcbit NachtrocknungZeiten[24];
} parBoxen;
#endif

#ifndef __AS__TYPE_parEntfeuchter
#define __AS__TYPE_parEntfeuchter
typedef struct parEntfeuchter
{	plcstring Type[15][21];
	float Registerflaeche[15];
	unsigned long EinschaltverzKompressor;
	unsigned long EinschaltverzAbtau;
	unsigned long MindestlaufzeitOelsumpf;
	unsigned long MaxZeitStromlos;
	unsigned long RestzeitLaufzOelsumpf;
	unsigned long AnlaufverzModul2;
	unsigned long AusschaltverzAbtau;
	float LuftgeschwEntfeuchterMin;
	float LuftgeschwEntfeuchterMax;
	float EintrittFeuchteEin;
	float EintrittFeuchteAus;
	plcbit Dauerbetrieb;
	plcbit Automatikbetrieb;
	plcbit Aus;
	unsigned char IndexType;
	unsigned long VerzStandbyHochdruckMax;
	unsigned long VerzBetriebsmeldung;
} parEntfeuchter;
#endif

#ifndef __AS__TYPE_parKompressor
#define __AS__TYPE_parKompressor
typedef struct parKompressor
{	unsigned long EinschaltverzMagnetventil;
	float DrehzahlMin;
	float DrehzahlMax;
	float NiederdruckMin;
	float NiederdruckMax;
	float RampeDown;
	float RampeUp;
	float NiederdruckPumpDown;
	float DrehzahlFix;
	float DrehzahlReduzierung;
	float EintrittTempMin;
	float EintrittTempMax;
	float HochdruckMax;
	float NiederdruckSoll;
	float Hysterese;
	float P;
	float I;
	float D;
	plcbit DrehzahlregelungEin;
} parKompressor;
#endif

#ifndef __AS__TYPE_parWarmluftofen
#define __AS__TYPE_parWarmluftofen
typedef struct parWarmluftofen
{	float SaettigungFrischlEin;
	float WarmlufttempVorgabeSoll;
	float Hysterese;
	unsigned long Auskuehlzeit;
	unsigned long VerzBetriebsmeldung;
	unsigned long VerzWetterwechsel;
	plcbit DauerbetriebEin;
	plcbit AutomatikbetriebEin;
	plcbit Aus;
} parWarmluftofen;
#endif

#ifndef __AS__TYPE_parHeizregister
#define __AS__TYPE_parHeizregister
typedef struct parHeizregister
{	unsigned long VerzWetterwechsel;
	float SaettigungFrischlEin;
	float TrockenluftTempSoll;
	float Hysterese;
	float DrehzahlVorgabeMin;
	float DrehzahlVorgabeMax;
	float P;
	float I;
	float D;
	plcbit Aus;
	plcbit DauerbetriebEin;
	plcbit AutomatikbetriebEin;
} parHeizregister;
#endif

#ifndef __AS__TYPE_parAbluftventilator
#define __AS__TYPE_parAbluftventilator
typedef struct parAbluftventilator
{	float AbluftfeuchteMax;
	float Hysterese;
	float DrehzahlMin;
	float DrehzahlMax;
	float P;
	float I;
	float D;
	plcbit Ein;
	plcbit Automatik;
} parAbluftventilator;
#endif

#ifndef __AS__TYPE_parAbluftklappe
#define __AS__TYPE_parAbluftklappe
typedef struct parAbluftklappe
{	unsigned long Laufzeit;
	float AbluftfeuchteMax;
	float Hysterese;
	plcbit Automatik;
	plcbit Oeffnen;
	plcbit Schliessen;
} parAbluftklappe;
#endif

#ifndef __AS__TYPE_parUmschaltklappen
#define __AS__TYPE_parUmschaltklappen
typedef struct parUmschaltklappen
{	unsigned long LaufzeitKlappe1;
	unsigned long LaufzeitKlappe2;
	float TemperaturUmschaltung;
	float Hysterese;
	unsigned long Umschaltverzoegerung;
	float TempDifferenzUmschaltung;
	plcbit Automatik;
	plcbit Umluft;
	plcbit Frischluft;
} parUmschaltklappen;
#endif

#ifndef __AS__TYPE_parBypassklappe
#define __AS__TYPE_parBypassklappe
typedef struct parBypassklappe
{	unsigned long Laufzeit;
	plcbit Automatik;
	plcbit Oeffnen;
	plcbit Schliessen;
} parBypassklappe;
#endif

#ifndef __AS__TYPE_parKlappenBoxen
#define __AS__TYPE_parKlappenBoxen
typedef struct parKlappenBoxen
{	unsigned long Laufzeit;
} parKlappenBoxen;
#endif

#ifndef __AS__TYPE_parNotstromaggregat
#define __AS__TYPE_parNotstromaggregat
typedef struct parNotstromaggregat
{	unsigned long Vorlaufzeit;
	unsigned long VerzBetriebsmeldung;
	unsigned long Nachlaufzeit;
} parNotstromaggregat;
#endif

#ifndef __AS__TYPE_parSensoren
#define __AS__TYPE_parSensoren
typedef struct parSensoren
{	float NiederdruckMessberMin;
	float NiederdruckMessberMax;
	float HochdruckMessberMin;
	float HochdruckMessberMax;
	float EintrittTempMessberMin;
	float EintrittTempMessberMax;
	float EintrittFeuchteMessberMin;
	float EintrittFeuchteMessberMax;
	float AustrittTempMessberMin;
	float AustrittTempMessberMax;
	float AustrittFeuchteMessberMin;
	float AustrittFeuchteMessberMax;
	float FrischlTempMessberMin;
	float FrischlTempMessberMax;
	float FrischlFeuchteMessberMin;
	float FrischlFeuchteMessberMax;
	float DachTempMessberMin;
	float DachTempMessberMax;
	float DachFeuchteMessberMin;
	float DachFeuchteMessberMax;
	float TrockenlTempMessberMin;
	float TrockenlTempMessberMax;
	float TrockenlFeuchteMessberMin;
	float TrockenlFeuchteMessberMax;
	float AbluftTempMessberMin;
	float AbluftTempMessberMax;
	float AbluftFeuchteMessberMin;
	float AbluftFeuchteMessberMax;
	float KanaldruckMessberMin;
	float KanaldruckMessberMax;
	float LuftgeschwMessberMin;
	float LuftgeschwMessberMax;
	float OffsetNiederdruckModul1;
	float OffsetNiederdruckModul2;
	float OffsetHochdruckModul1;
	float OffsetHochdruckModul2;
	float OffsetEintrittTemp;
	float OffsetEintrittFeuchte;
	float OffsetAustrittTemp;
	float OffsetAustrittFeuchte;
	float OffsetFrischluftTemp;
	float OffsetFrischluftFeuchte;
	float OffsetDachTemp;
	float OffsetDachFeuchte;
	float OffsetTrockenluftTemp;
	float OffsetTrockenluftFeuchte;
	float OffsetAbluftTemp;
	float OffsetAbluftFeuchte;
	float OffsetKanaldruck;
	float OffsetLuftgeschw;
	unsigned short FilterzeitNiederdruck;
	unsigned short FilterzeitHochdruck;
	unsigned short FilterzeitEintritt;
	unsigned short FilterzeitAustritt;
	unsigned short FilterzeitFrischluft;
	unsigned short FilterzeitDachluft;
	unsigned short FilterzeitTrockenluft;
	unsigned short FilterzeitAbluft;
	unsigned short FilterzeitKanaldruck;
	unsigned short FilterzeitLuftgeschwindigkeit;
} parSensoren;
#endif

#ifndef __AS__TYPE_parServicebereich
#define __AS__TYPE_parServicebereich
typedef struct parServicebereich
{	unsigned long KontrollintervallUhrzeit;
} parServicebereich;
#endif

#ifndef __AS__TYPE_parFernalarmierung
#define __AS__TYPE_parFernalarmierung
typedef struct parFernalarmierung
{	plcstring MailAdresse[4][81];
	plcbit EMailAlarmierungEin;
} parFernalarmierung;
#endif

#ifndef __AS__TYPE_parScheitholzofen
#define __AS__TYPE_parScheitholzofen
typedef struct parScheitholzofen
{	unsigned long Auskuehlzeit;
} parScheitholzofen;
#endif

#ifndef __AS__TYPE_parZeitfenster
#define __AS__TYPE_parZeitfenster
typedef struct parZeitfenster
{	unsigned char StartStd;
	unsigned char StartMin;
	unsigned char StoppStd;
	unsigned char StoppMin;
} parZeitfenster;
#endif

#ifndef __AS__TYPE_parTarifabschaltung
#define __AS__TYPE_parTarifabschaltung
typedef struct parTarifabschaltung
{	parZeitfenster Zeitfenster;
	unsigned char VorlaufzeitAbschaltungLuftaufb;
} parTarifabschaltung;
#endif

#ifndef __AS__TYPE_parStrombegrenzung
#define __AS__TYPE_parStrombegrenzung
typedef struct parStrombegrenzung
{	parZeitfenster Zeitfenster;
} parStrombegrenzung;
#endif

#ifndef __AS__TYPE_parSchlechtwetterBoxenStufen
#define __AS__TYPE_parSchlechtwetterBoxenStufen
typedef struct parSchlechtwetterBoxenStufen
{	float Saettigungsdefizit;
	unsigned long SchlechtwetterZeitLauf;
	unsigned long SchlechtwetterZeitPause;
	unsigned short MaterialfeuchteStufe;
} parSchlechtwetterBoxenStufen;
#endif

#ifndef __AS__TYPE_parSchlechtwetterBoxen
#define __AS__TYPE_parSchlechtwetterBoxen
typedef struct parSchlechtwetterBoxen
{	struct parSchlechtwetterBoxenStufen Stufe[6];
	float HystereseGrenzwert;
	unsigned char AuswahlSensorGrenzwert;
	unsigned char MaterialfeuchteIst;
} parSchlechtwetterBoxen;
#endif

#ifndef __AS__TYPE_parAnlage
#define __AS__TYPE_parAnlage
typedef struct parAnlage
{	parAllgemein Allgemein;
	parBetrieb Betrieb;
	parAusstattung Ausstattung;
	parSchrittkette Schrittkette;
	parVentilator Ventilator1;
	parVentilator Ventilator2;
	struct parBoxen Boxen[6];
	parEntfeuchter Entfeuchter;
	parKompressor Kompressor1;
	parKompressor Kompressor2;
	parWarmluftofen Warmluftofen;
	parHeizregister Heizregister;
	parAbluftventilator Abluftventilator;
	parAbluftklappe Abluftklappe;
	parUmschaltklappen Umschaltklappen;
	parBypassklappe Bypassklappe;
	struct parKlappenBoxen KlappenBoxen[6];
	parNotstromaggregat Notstromaggregat;
	parSensoren Sensoren;
	parServicebereich Servicebereich;
	parFernalarmierung Fernalarmierung;
	parScheitholzofen Scheitholzofen;
	parTarifabschaltung Tarifabschaltung;
	parStrombegrenzung Strombegrenzung;
	struct parSchlechtwetterBoxen SchlechtwetterBoxen[6];
} parAnlage;
#endif

#ifndef __AS__TYPE_enumFehler
#define __AS__TYPE_enumFehler
typedef enum enumFehler
{	FEHLER_24VDC = 0,
	FEHLER_FU_KOMPRESSOR_MODUL1 = 1,
	FEHLER_FU_KOMPRESSOR_MODUL2 = 2,
	FEHLER_BETRIEBSMLDG_KOMPR_MOD1 = 3,
	FEHLER_BETRIEBSMLDG_KOMPR_MOD2 = 4,
	FEHLER_BETRIEBSMLDG_VENTILATOR1 = 5,
	FEHLER_BETRIEBSMLDG_VENTILATOR2 = 6,
	FEHLER_BETRIEBSMLDG_ABLUFTVENT = 7,
	FEHLER_HOCHDRUCK_MODUL1 = 8,
	FEHLER_HOCHDRUCK_MODUL2 = 9,
	FEHLER_NIEDERDRUCK_MODUL1 = 10,
	FEHLER_NIEDERDRUCK_MODUL2 = 11,
	FEHLER_OELDRUCK_KOMPR_MOD1 = 12,
	FEHLER_OELDRUCK_KOMPR_MOD2 = 13,
	FEHLER_KOPFTEMP_KOMPR_MOD1 = 14,
	FEHLER_KOPFTEMP_KOMPR_MOD2 = 15,
	FEHLER_VOLLSCHUTZ_KOMPR_MOD1 = 16,
	FEHLER_VOLLSCHUTZ_KOMPR_MOD2 = 17,
	FEHLER_BETRIEBSMLDG_WARMLUFTOFEN = 18,
	FEHLER_BETRIEBSMLDG_NOTSTROM = 19,
	FEHLER_SENSOR_FRISCHLUFT = 20,
	FEHLER_SENSOR_DACHLUFT = 21,
	FEHLER_SENSOR_TROCKENLUFT = 22,
	FEHLER_SENSOR_ABLUFT = 23,
	FEHLER_SENSOR_EINTRITT = 24,
	FEHLER_SENSOR_AUSTRITT = 25,
	FEHLER_SENSOR_LUFTGESCHW = 26,
	FEHLER_SENSOR_KANALDRUCK = 27,
	FEHLER_SENSOR_NIEDERDRUCK_MOD1 = 28,
	FEHLER_SENSOR_NIEDERDRUCK_MOD2 = 29,
	FEHLER_SENSOR_HOCHDRUCK_MOD1 = 30,
	FEHLER_SENSOR_HOCHDRUCK_MOD2 = 31,
	FEHLER_ENDLAGEN_BYPASSKLAPPE = 32,
	FEHLER_ENDLAGEN_UMSCHALTKLAPPE1 = 33,
	FEHLER_ENDLAGEN_UMSCHALTKLAPPE2 = 34,
	FEHLER_ENDLAGEN_BOXENKLAPPE_1 = 35,
	FEHLER_ENDLAGEN_BOXENKLAPPE_2 = 36,
	FEHLER_ENDLAGEN_BOXENKLAPPE_3 = 37,
	FEHLER_ENDLAGEN_BOXENKLAPPE_4 = 38,
	FEHLER_ENDLAGEN_BOXENKLAPPE_5 = 39,
	FEHLER_ENDLAGEN_BOXENKLAPPE_6 = 40,
	FEHLER_ENDLAGEN_ABLUFTKLAPPE = 41,
	FEHLER_EINTRITT_TEMP_ZU_HOCH = 42,
	FEHLER_EINTRITT_TEMP_ZU_NIEDRIG = 43,
	FEHLER_LZ_PUMPDOWN_MOD1 = 44,
	FEHLER_LZ_PUMPDOWN_MOD2 = 45,
	FEHLER_DREHFELD = 46,
	FEHLER_ENTF_FREMD_STOERMELDUNG = 47,
	FEHLER_ENTF_FREMD_BETRMLDG = 48,
} enumFehler;
#endif

#ifndef __AS__TYPE_enumSeitenVisu
#define __AS__TYPE_enumSeitenVisu
typedef enum enumSeitenVisu
{	_000_INIT = 0,
	_001_LOGIN = 1,
	_010_HM_UEBERSICHT = 10,
	_100_AL = 100,
	_101_AL = 101,
	_400_IW = 400,
	_401_IW = 401,
	_402_IW = 402,
	_403_IW = 403,
	_404_IW = 404,
	_600_SYS = 600,
	_610_SYS = 610,
	_620_SYS = 620,
	_630_SYS = 630,
	_631_SYS = 631,
	_632_SYS = 632,
	_640_SYS = 640,
	_641_SYS = 641,
	_650_SYS = 650,
	_660_SYS = 660,
	_670_SYS = 670,
	_700_SYS = 700,
	_710_SYS = 710,
	_711_SYS = 711,
	_712_SYS = 712,
	_713_SYS = 713,
	_714_SYS = 714,
	_715_SYS = 715,
	_716_SYS = 716,
	_717_SYS = 717,
	_720_SYS = 720,
	_721_SYS = 721,
	_722_SYS = 722,
	_723_SYS = 723,
	_724_SYS = 724,
	_730_SYS = 730,
	_731_SYS = 731,
	_732_SYS = 732,
	_740_SYS = 740,
	_741_SYS = 741,
	_742_SYS = 742,
	_750_SYS = 750,
	_751_SYS = 751,
	_752_SYS = 752,
	_760_SYS = 760,
	_770_SYS = 770,
	_780_SYS = 780,
	_781_SYS = 781,
	_782_SYS = 782,
	_783_SYS = 783,
	_790_SYS = 790,
	_800_TEST = 800,
	_810_TEST = 810,
	_811_TEST = 811,
	_812_TEST = 812,
	_820_TEST = 820,
	_821_TEST = 821,
	_822_TEST = 822,
	_823_TEST = 823,
	_824_TEST = 824,
	_825_TEST = 825,
	_830_TEST = 830,
	_831_TEST = 831,
	_832_TEST = 832,
	_840_TEST = 840,
	_841_TEST = 841,
	_842_TEST = 842,
	_850_TEST = 850,
	_851_TEST = 851,
	_852_TEST = 852,
	_860_TEST = 860,
	_861_TEST = 861,
} enumSeitenVisu;
#endif

#ifndef __AS__TYPE_typHmiActions
#define __AS__TYPE_typHmiActions
typedef struct typHmiActions
{	enumSeitenVisu cmdChangePageTo;
	plcbit cmdInselbetriebEntfeuchterEin;
} typHmiActions;
#endif

#ifndef __AS__TYPE_cmdLeistung
#define __AS__TYPE_cmdLeistung
typedef struct cmdLeistung
{	float DrehzahlVentilator1;
	float DrehzahlVentilator2;
	float DrehzahlKompressorModul1;
	float DrehzahlKompressorModul2;
	float DrehzahlAbluftventilator;
	float DrehzahlHeizregister;
} cmdLeistung;
#endif

#ifndef __AS__TYPE_cmdAnlage
#define __AS__TYPE_cmdAnlage
typedef struct cmdAnlage
{	plcbit Test;
	plcbit Auto;
	cmdLeistung Leistung;
	plcbit StoppExtern;
	plcbit StartExtern;
	plcbit Start;
	plcbit Stop;
	plcbit FehlerStopp;
	plcbit FehlerModul1;
	plcbit FehlerModul2;
} cmdAnlage;
#endif

#ifndef __AS__TYPE_typEchtzeit
#define __AS__TYPE_typEchtzeit
typedef struct typEchtzeit
{	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
	signed short StdMin;
} typEchtzeit;
#endif

#ifndef __AS__TYPE_Zeit_type
#define __AS__TYPE_Zeit_type
typedef struct Zeit_type
{	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
} Zeit_type;
#endif

struct DTGetTime
{	unsigned short status;
	plcdt DT1;
	plcbit enable;
};
_BUR_PUBLIC void DTGetTime(struct DTGetTime* inst);
struct fbLascoEUhr
{	signed short StdMin;
	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
	Zeit_type Echtzeit;
	struct DTGetTime DTGetTime_0;
	plcdt DateTime;
	plcbit Freigabe;
};
_BUR_PUBLIC void fbLascoEUhr(struct fbLascoEUhr* inst);
struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbLascoTON
{	float Zeit;
	float Elapsed;
	plcbit IN;
	plcbit Tick;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoTON(struct fbLascoTON* inst);
struct SysInfo
{	unsigned char init_reason;
	unsigned char init_count;
	unsigned long tick_count;
	unsigned long version;
	plcbit enable;
};
_BUR_PUBLIC void SysInfo(struct SysInfo* inst);
struct LCRRamp
{	float x;
	float dy_up;
	float dy_down;
	float y_max;
	float y_min;
	float y_set;
	unsigned short status;
	float y;
	signed long y_dbl_1;
	signed long y_dbl_2;
	unsigned long timestore1;
	unsigned long timestore2;
	unsigned long getDtForceOff;
	struct SysInfo sysinfo_inst;
	plcbit enable;
	plcbit set;
	plcbit x_reached;
	plcbit max_limit;
	plcbit min_limit;
};
_BUR_PUBLIC void LCRRamp(struct LCRRamp* inst);
struct fbLascoFU
{	float SollDrehzahl;
	float AnsprechZeitFU;
	float RampeUpSek;
	float RampeDownSek;
	float MaxDrehzahl;
	float MinDrehzahl;
	float DrehzahlFU;
	struct fbLascoTON TON_Betriebsmeldung;
	struct LCRRamp LCRRamp_0;
	signed long RampDownMillis;
	signed long RampUpMillis;
	float IstDrehzahl;
	plcbit Freigabe;
	plcbit BetrMldg;
	plcbit Reset;
	plcbit Tick;
	plcbit BetriebFU;
	plcbit StoerungFU;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit InitDone;
	plcbit ResetDone;
	plcbit Init;
	plcbit zzEdge00003;
};
_BUR_PUBLIC void fbLascoFU(struct fbLascoFU* inst);
struct TON
{	plctime PT;
	plctime ET;
	plctime StartTime;
	unsigned long Restart;
	plcbit IN;
	plcbit Q;
	plcbit M;
};
_BUR_PUBLIC void TON(struct TON* inst);
struct fbBoxenKlappenanst
{	unsigned long LaufzeitOeffnen;
	unsigned long LaufzeitSchliessen;
	unsigned char step;
	struct TON TON_Laufzeit;
	struct TON TON_AnzVerz;
	plcbit Stoerung;
	plcbit QuitFehler;
	plcbit Oeffnen;
	plcbit Schliessen;
	plcbit EndlageOffen;
	plcbit EndlageGeschl;
	plcbit EndlagenVhd;
	plcbit OeffnenOut;
	plcbit SchliessenOut;
	plcbit FehlerLaufzeitOeffnen;
	plcbit FehlerLaufzeitSchliessen;
	plcbit KlappeIstOffenOut;
	plcbit KlappeIstGeschlOut;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbBoxenKlappenanst(struct fbBoxenKlappenanst* inst);
struct fbBoxenVentKlappen
{	float DrzVent1UmschMitLuftaufb;
	float DrzVent2UmschMitLuftaufb;
	float DrehzahlVent1Umsch;
	float DrehzahlVent2Umsch;
	float DrehzahlVent1Betrieb;
	float DrehzahlVent2Betrieb;
	float DrehzahlVent1Min;
	float DrehzahlVent1Max;
	float DrehzahlVent2Min;
	float DrehzahlVent2Max;
	float RampeVent1Up;
	float RampeVent1Down;
	float RampeVent2Up;
	float RampeVent2Down;
	unsigned long LaufzeitBypassklappe;
	unsigned long LaufzeitUmschaltklappe1;
	unsigned long LaufzeitUmschaltklappe2;
	unsigned long LaufzeitBoxenklappe1;
	unsigned long LaufzeitBoxenklappe2;
	unsigned long LaufzeitBoxenklappe3;
	unsigned long LaufzeitBoxenklappe4;
	unsigned long LaufzeitBoxenklappe5;
	unsigned long LaufzeitBoxenklappe6;
	unsigned long AnlaufverzZweiterVent;
	float DrehzahlVent1Out;
	float DrehzahlVent2Out;
	unsigned char curStep;
	unsigned long RestAnlaufverzoegerung;
	struct fbLascoEUhr fbLascoEUhr_0;
	struct fbLascoZdxx fbLascoZdxx_0;
	struct fbLascoFU fbFuVentilator1;
	struct fbLascoFU fbFuVentilator2;
	struct fbBoxenKlappenanst Bypassklappe;
	struct fbBoxenKlappenanst Umschaltklappe1;
	struct fbBoxenKlappenanst Umschaltklappe2;
	struct fbBoxenKlappenanst Boxenklappe1;
	struct fbBoxenKlappenanst Boxenklappe2;
	struct fbBoxenKlappenanst Boxenklappe3;
	struct fbBoxenKlappenanst Boxenklappe4;
	struct fbBoxenKlappenanst Boxenklappe5;
	struct fbBoxenKlappenanst Boxenklappe6;
	unsigned char nextStep;
	unsigned char lastStep;
	struct TON TON_AnlaufverzVentilatoren;
	plcbit Freigabe;
	plcbit Ventilator1InBetrieb;
	plcbit Ventilator2InBetrieb;
	plcbit AnforderungVentilator1;
	plcbit AnforderungVentilator2;
	plcbit LuftaufbereitungInBetrieb;
	plcbit BypassklappeOeffnen;
	plcbit BypassklappeSchliessen;
	plcbit Umschaltkl1Oeffnen;
	plcbit Umschaltkl1Schliessen;
	plcbit Umschaltkl2Oeffnen;
	plcbit Umschaltkl2Schliessen;
	plcbit Boxenklappe1Oeffnen;
	plcbit Boxenklappe1Schliessen;
	plcbit Boxenklappe2Oeffnen;
	plcbit Boxenklappe2Schliessen;
	plcbit Boxenklappe3Oeffnen;
	plcbit Boxenklappe3Schliessen;
	plcbit Boxenklappe4Oeffnen;
	plcbit Boxenklappe4Schliessen;
	plcbit Boxenklappe5Oeffnen;
	plcbit Boxenklappe5Schliessen;
	plcbit Boxenklappe6Oeffnen;
	plcbit Boxenklappe6Schliessen;
	plcbit EndlBypassGeschl;
	plcbit EndlBypassOffen;
	plcbit EndlUmschaltkl1Geschl;
	plcbit EndlUmschaltkl1Offen;
	plcbit EndlUmschaltkl2Geschl;
	plcbit EndlUmschaltkl2Offen;
	plcbit EndlBoxenklappe1Offen;
	plcbit EndlBoxenklappe1Geschl;
	plcbit EndlBoxenklappe2Offen;
	plcbit EndlBoxenklappe2Geschl;
	plcbit EndlBoxenklappe3Offen;
	plcbit EndlBoxenklappe3Geschl;
	plcbit EndlBoxenklappe4Offen;
	plcbit EndlBoxenklappe4Geschl;
	plcbit EndlBoxenklappe5Offen;
	plcbit EndlBoxenklappe5Geschl;
	plcbit EndlBoxenklappe6Offen;
	plcbit EndlBoxenklappe6Geschl;
	plcbit QuitFehler;
	plcbit Boxenklappe6Vorhanden;
	plcbit Boxenklappe5Vorhanden;
	plcbit Boxenklappe4Vorhanden;
	plcbit Boxenklappe3Vorhanden;
	plcbit Boxenklappe2Vorhanden;
	plcbit Boxenklappe1Vorhanden;
	plcbit UmluftklVonVent1Abhaengig;
	plcbit UmluftklVonVent2Abhaengig;
	plcbit Boxenkl1VonVent1Abhaengig;
	plcbit Boxenkl1VonVent2Abhaengig;
	plcbit Boxenkl2VonVent1Abhaengig;
	plcbit Boxenkl2VonVent2Abhaengig;
	plcbit Boxenkl3VonVent1Abhaengig;
	plcbit Boxenkl3VonVent2Abhaengig;
	plcbit Boxenkl4VonVent1Abhaengig;
	plcbit Boxenkl4VonVent2Abhaengig;
	plcbit Boxenkl5VonVent1Abhaengig;
	plcbit Boxenkl5VonVent2Abhaengig;
	plcbit Boxenkl6VonVent1Abhaengig;
	plcbit Boxenkl6VonVent2Abhaengig;
	plcbit BypassklVonVent1Abhaengig;
	plcbit BypassklVonVent2Abhaengig;
	plcbit EndlagenVhdBoxenklappe1;
	plcbit EndlagenVhdBoxenklappe2;
	plcbit EndlagenVhdBoxenklappe3;
	plcbit EndlagenVhdBoxenklappe4;
	plcbit EndlagenVhdBoxenklappe5;
	plcbit EndlagenVhdBoxenklappe6;
	plcbit EndlagenVhdUmschaltklappe1;
	plcbit EndlagenVhdUmschaltklappe2;
	plcbit EndlagenVhdBypassklappe;
	plcbit FreigabeVentilator1Out;
	plcbit FreigabeVentilator2Out;
	plcbit BypassSchliessenOut;
	plcbit BypassOeffnenOut;
	plcbit Umschaltkl1SchliessenOut;
	plcbit Umschaltkl1OeffnenOut;
	plcbit Umschaltkl2SchliessenOut;
	plcbit Umschaltkl2OeffnenOut;
	plcbit Boxenklappe1OeffnenOut;
	plcbit Boxenklappe1SchliessenOut;
	plcbit Boxenklappe2OeffnenOut;
	plcbit Boxenklappe2SchliessenOut;
	plcbit Boxenklappe3OeffnenOut;
	plcbit Boxenklappe3SchliessenOut;
	plcbit Boxenklappe4OeffnenOut;
	plcbit Boxenklappe4SchliessenOut;
	plcbit Boxenklappe5OeffnenOut;
	plcbit Boxenklappe5SchliessenOut;
	plcbit Boxenklappe6OeffnenOut;
	plcbit Boxenklappe6SchliessenOut;
	plcbit UmschaltungAktiv;
	plcbit FehlerLaufzeitBypass;
	plcbit FehlerLaufzeitUmschaltkl1;
	plcbit FehlerLaufzeitUmschaltkl2;
	plcbit FehlerLaufzeitKlappeBox1;
	plcbit FehlerLaufzeitKlappeBox2;
	plcbit FehlerLaufzeitKlappeBox3;
	plcbit FehlerLaufzeitKlappeBox4;
	plcbit FehlerLaufzeitKlappeBox5;
	plcbit FehlerLaufzeitKlappeBox6;
	plcbit FehlerFuVentilator1;
	plcbit BypassklappeIstGeschl;
	plcbit BypassklappeIstOffen;
	plcbit Umschaltklappe1IstGeschl;
	plcbit Umschaltklappe1IstOffen;
	plcbit Umschaltklappe2IstGeschl;
	plcbit Umschaltklappe2IstOffen;
	plcbit Boxenklappe1IstOffen;
	plcbit Boxenklappe1IstGeschl;
	plcbit Boxenklappe2IstOffen;
	plcbit Boxenklappe2IstGeschl;
	plcbit Boxenklappe3IstOffen;
	plcbit Boxenklappe3IstGeschl;
	plcbit Boxenklappe4IstOffen;
	plcbit Boxenklappe4IstGeschl;
	plcbit Boxenklappe5IstOffen;
	plcbit Boxenklappe5IstGeschl;
	plcbit Boxenklappe6IstOffen;
	plcbit Boxenklappe6IstGeschl;
	plcbit FehlerFuVentilator2;
	plcbit AnlaufverzVent1Aktiv;
	plcbit AnlaufverzVent2Aktiv;
	plcbit sekTick;
	plcbit loc_AenderungBypassklappe;
	plcbit loc_AenderungUmschaltklappe1;
	plcbit loc_AenderungUmschaltklappe2;
	plcbit loc_AenderungBoxenklappe1;
	plcbit loc_AenderungBoxenklappe2;
	plcbit loc_AenderungBoxenklappe3;
	plcbit loc_AenderungBoxenklappe4;
	plcbit loc_AenderungBoxenklappe5;
	plcbit loc_AenderungBoxenklappe6;
	plcbit loc_UmschaltungErforderlVent1;
	plcbit loc_UmschaltungErforderlVent2;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbBoxenVentKlappen(struct fbBoxenVentKlappen* inst);
struct fbBoxenAbluftkl
{	unsigned long Laufzeit;
	float AbluftFeuchteIst;
	float Hysterese;
	float AbluftFeuchteSoll;
	unsigned char step;
	struct TON TON_Laufzeit;
	plcbit Freigabe;
	plcbit Quit;
	plcbit Automatik;
	plcbit EndlageOffen;
	plcbit EndlageGeschl;
	plcbit Oeffnen;
	plcbit Schliessen;
	plcbit OeffnenOut;
	plcbit SchliessenOut;
	plcbit FehlerLaufzeit;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbBoxenAbluftkl(struct fbBoxenAbluftkl* inst);
struct fbBoxenAbluftvent
{	float DrehzahlMin;
	float DrehzahlMax;
	float RampeUp;
	float RampeDown;
	float AbluftFeuchteIst;
	float Hysterese;
	float AbluftFeuchteSoll;
	float DrehzahlSoll;
	float DrehzahlVentilatorOut;
	unsigned char step;
	struct fbLascoFU fbFuAbluftventilator;
	struct fbLascoEUhr fbLascoEUhr_0;
	struct fbLascoZdxx fbLascoZdxx_0;
	plcbit Freigabe;
	plcbit Automatik;
	plcbit Ein;
	plcbit VentilatorInBetrieb;
	plcbit QuitFehler;
	plcbit FehlerOut;
	plcbit FreigabeVentilatorOut;
	plcbit stateEntry;
	plcbit sekTick;
};
_BUR_PUBLIC void fbBoxenAbluftvent(struct fbBoxenAbluftvent* inst);
struct fbEntfOelsumpfheiz
{	float EintrittTemp;
	float parTempOelsumpfheizungAus;
	float parTempOelsumpfheizungEin;
	plcbit Freigabe;
	plcbit StatusSensorEintrittOk;
	plcbit OelsumpfheizungEin;
};
_BUR_PUBLIC void fbEntfOelsumpfheiz(struct fbEntfOelsumpfheiz* inst);
struct fbEntfKompressor
{	float EintrittFeuchte;
	float parFeuchteEin;
	float parFeuchteAus;
	unsigned long parEinschaltverzAbtau;
	unsigned long parAusschaltverzAbtau;
	unsigned long parEinschaltverzKompressor;
	float Hochdruck;
	float Niederdruck;
	float parNiederdruckMin;
	float parHochdruckMax;
	float parNiederdruckMax;
	float DrehzahlvorgabeFU;
	float DrehzahlMin;
	float DrehzahlMax;
	float RampeUp;
	float RampeDown;
	unsigned long parEinschaltverzMagnetventil;
	float parNiederdruckPumpdown;
	unsigned long parVerzStandbyBeiKlappenumsch;
	float DrehzahlOut;
	unsigned char curStep;
	struct TON TON_Abtau;
	struct TON TON_Kompressor;
	unsigned char lastStep;
	unsigned char nextStep;
	struct fbLascoFU fbFuKompressor;
	struct fbLascoEUhr fbLascoEUhr_0;
	struct fbLascoZdxx fbLascoZdxx_0;
	struct TON TON_EinschaltverzMagnetventil;
	struct TON TON_LaufzeitPumpdown;
	struct TON TON_Klappenumschaltung;
	plcbit SicherheitOk;
	plcbit Freigabe;
	plcbit BetriebsmldgVentilator;
	plcbit Automatik;
	plcbit Dauerbetrieb;
	plcbit StatusSensorNiederdruckOk;
	plcbit StatusSensorEintrittOk;
	plcbit BetriebsmldgKompressor;
	plcbit QuitFehler;
	plcbit diNiederdruckOk;
	plcbit diHochdruckOk;
	plcbit KlappenumschaltungAkiv;
	plcbit FreigabeKompressorOut;
	plcbit StoerungOut;
	plcbit AbtauungAktiv;
	plcbit MagnetventilOut;
	plcbit loc_StatusFeuchteOk;
	plcbit FehlerPumpdown;
	plcbit StandbyKlappenumsch;
	plcbit stateEntry;
	plcbit sekTick;
};
_BUR_PUBLIC void fbEntfKompressor(struct fbEntfKompressor* inst);
struct TOF
{	plctime PT;
	plctime ET;
	plctime StartTime;
	unsigned long Restart;
	plcbit IN;
	plcbit Q;
	plcbit M;
};
_BUR_PUBLIC void TOF(struct TOF* inst);
struct fbBoxenWLO
{	float FrischluftSattDefizitIst;
	float FrischluftSattDefizitSoll;
	float Hysterese;
	unsigned long UmschaltverzWitterung;
	float WarmlufttemperaturVorgabe;
	unsigned long VerzBetriebsmeldung;
	unsigned long Auskuehlzeit;
	float WarmlufttempSollOut;
	unsigned long RestAuskuehlzeit;
	unsigned char step;
	struct TON TON_VerzBetriebsmeldung;
	struct TOF TOF_Auskuehlzeit;
	struct TON TON_WetterIstGut;
	struct TON TON_WetterIstSchlecht;
	plcbit Freigabe;
	plcbit Automatikbetrieb;
	plcbit Dauerbetrieb;
	plcbit FehlerSensorAussenluft;
	plcbit OptionBetriebsmldgVhd;
	plcbit BetriebsmeldungWarmluftofen;
	plcbit QuitFehler;
	plcbit WetterIstSchlecht;
	plcbit FreigabeWarmluftofenOut;
	plcbit FehlerBetriebsmeldungOut;
	plcbit FehlerSensorAussenluftOut;
	plcbit WarmluftofenAktiv;
	plcbit stateEntry;
	plcbit loc_WetterIstSchlecht;
	plcbit loc_WetterIstGut;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
};
_BUR_PUBLIC void fbBoxenWLO(struct fbBoxenWLO* inst);
struct fbBoxenHeizreg
{	float DrehzahlHeizregisterSoll;
	float FrischluftSattDefizitIst;
	float FrischluftSattDefizitSoll;
	float Hysterese;
	unsigned long UmschaltverzWitterung;
	float DrehzahlHeizregisterOut;
	unsigned char step;
	struct TON TON_WetterIstGut;
	struct TON TON_WetterIstSchlecht;
	plcbit Freigabe;
	plcbit QuitFehler;
	plcbit Automatikbetrieb;
	plcbit FehlerSensorAussenluft;
	plcbit Dauerbetrieb;
	plcbit WetterIstSchlecht;
	plcbit FehlerOut;
	plcbit FreigabeHeizregisterOut;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit stateEntry;
	plcbit loc_WetterIstSchlecht;
	plcbit loc_WetterIstGut;
};
_BUR_PUBLIC void fbBoxenHeizreg(struct fbBoxenHeizreg* inst);
struct fbBoxenNotstrom
{	unsigned long VerzBetriebsmeldung;
	unsigned long Vorlaufzeit;
	unsigned long Nachlaufzeit;
	unsigned long RestVorlaufzeit;
	unsigned long RestNachlaufzeit;
	struct TON TON_VerzBetriebsmeldung;
	struct TON TON_Vorlaufzeit;
	struct TOF TOF_Nachlaufzeit;
	plcbit Freigabe;
	plcbit BetriebsmldgNotstromaggregat;
	plcbit NotstromaggregatAngefordert;
	plcbit QuitFehler;
	plcbit FreigabeNotstromaggregatOut;
	plcbit FehlerOut;
	plcbit NotstromBereitOut;
};
_BUR_PUBLIC void fbBoxenNotstrom(struct fbBoxenNotstrom* inst);
struct fbBoxenSHO
{	unsigned long Auskuehlzeit;
	unsigned long RestAuskuehlzeit;
	struct TOF TOF_Auskuehlzeit;
	plcbit Freigabe;
	plcbit Betriebsmeldung;
	plcbit ScheitholzofenAktiv;
};
_BUR_PUBLIC void fbBoxenSHO(struct fbBoxenSHO* inst);
struct fbEntfFremd
{	unsigned long parVerzStoerung;
	unsigned long parEinschaltverzKompressor;
	unsigned long parVerzBetriebEntfeuchter;
	struct TON TON_Stoerung;
	struct TON TON_VerzBetriebsmeldung;
	unsigned char curStep;
	unsigned char nextStep;
	struct TON TON_Kompressor;
	unsigned char lastStep;
	plcbit Freigabe;
	plcbit StoerungIn;
	plcbit QuitFehler;
	plcbit Dauerbetrieb;
	plcbit Automatik;
	plcbit BetriebsmldgVentilator;
	plcbit BetriebsmldgEntfeuchter;
	plcbit WitterungIstSchlecht;
	plcbit StoerungOut;
	plcbit FehlerBetriebsmldg;
	plcbit FreigabeKompressorOut;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbEntfFremd(struct fbEntfFremd* inst);
#ifndef __AS__TYPE_typAktoren
#define __AS__TYPE_typAktoren
typedef struct typAktoren
{	struct fbBoxenVentKlappen VentUndKlappen;
	struct fbBoxenAbluftkl Abluftklappe;
	struct fbBoxenAbluftvent Abluftventilator;
	struct fbEntfOelsumpfheiz OelsumpfheizungModul1;
	struct fbEntfOelsumpfheiz OelsumpfheizungModul2;
	struct fbEntfKompressor KompressorModul1;
	struct fbEntfKompressor KompressorModul2;
	struct fbBoxenWLO Warmluftofen;
	struct fbBoxenHeizreg Heizregister;
	struct fbBoxenNotstrom Notstromaggregat;
	struct fbBoxenSHO Scheitholzofen;
	struct fbBoxenKlappenanst Brandschutzklappe;
	struct fbEntfFremd EntfeuchterFremd;
} typAktoren;
#endif

#ifndef __AS__TYPE_typKonfigurationBoxenOut
#define __AS__TYPE_typKonfigurationBoxenOut
typedef struct typKonfigurationBoxenOut
{	unsigned long RestzeitSchlechtwetterPuls;
	unsigned long RestzeitSchlechtwetterPause;
	plcbit BoxBereit;
	plcbit BoxAktiv;
	plcbit DauerbetriebSperre;
	plcbit IntervallbetriebSperre;
	plcbit IntervallbetriebZeitenGesperrt[24];
	plcbit NachtrocknungZeitenGesperrt[24];
} typKonfigurationBoxenOut;
#endif

#ifndef __AS__TYPE_typKonfigurationBoxenIn
#define __AS__TYPE_typKonfigurationBoxenIn
typedef struct typKonfigurationBoxenIn
{	plcbit Ventilator1;
	plcbit Ventilator2;
	plcbit Luftentfeuchter;
	plcbit Warmluftofen;
	plcbit Heizregister;
	plcbit Scheitholzofen;
	enumStellungKlappenBoxen StellungKlappe1;
	enumStellungKlappenBoxen StellungKlappe2;
	enumStellungKlappenBoxen StellungKlappe3;
	enumStellungKlappenBoxen StellungKlappe4;
	enumStellungKlappenBoxen StellungKlappe5;
	enumStellungKlappenBoxen StellungKlappe6;
	plcbit DauerbetriebEin;
	plcbit WetterIstSchlecht;
	plcbit LuftaufbIstVerfuegbar;
	plcbit IntervallbetriebEin;
	plcbit NachtrocknungEin;
	plcbit IntervallbetriebZeiten[24];
	plcbit NachtrocknungZeiten[24];
	unsigned long SchlechtwetterPulszeit;
	unsigned long SchlechtwetterPausezeit;
} typKonfigurationBoxenIn;
#endif

struct fbLascoPugeV2
{	unsigned long ZeitPuls;
	unsigned long ZeitPause;
	unsigned long RestzeitPause;
	unsigned long RestzeitPuls;
	unsigned char curStep;
	unsigned char nextStep;
	struct TON TON_Schrittzeit;
	plcbit StartMitPuls;
	plcbit StartMitPause;
	plcbit PulsOut;
	plcbit PauseOut;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbLascoPugeV2(struct fbLascoPugeV2* inst);
struct fbBoxenKonfig
{	unsigned char StundeAktuell;
	typKonfigurationBoxenIn Box1In;
	typKonfigurationBoxenIn Box2In;
	typKonfigurationBoxenIn Box3In;
	typKonfigurationBoxenIn Box4In;
	typKonfigurationBoxenIn Box5In;
	typKonfigurationBoxenIn Box6In;
	typKonfigurationBoxenOut Box1Out;
	typKonfigurationBoxenOut Box2Out;
	typKonfigurationBoxenOut Box3Out;
	typKonfigurationBoxenOut Box4Out;
	typKonfigurationBoxenOut Box5Out;
	typKonfigurationBoxenOut Box6Out;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox1;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox2;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox3;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox4;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox5;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox6;
	signed short i;
	plcbit ScheitholzofenNochAktiv;
	plcbit EntfeuchterNochAktiv;
	plcbit BypassklVonBeidenVentAbhaengig;
	plcbit BoxenklVonBeidenVentAbhaengig;
	plcbit WarmluftofenNochAktiv;
	plcbit AlleKlappenSchliessenWennAus;
	plcbit MehrereBoxenBelueftbar;
	plcbit EntfeuchterInselbetrieb;
	plcbit TasteEntfeuchterEinInselbetrieb;
	plcbit AnfEntfeuchterExtern;
	plcbit FreigabeKlappe1Out;
	plcbit FreigabeKlappe2Out;
	plcbit FreigabeKlappe3Out;
	plcbit FreigabeKlappe4Out;
	plcbit FreigabeKlappe5Out;
	plcbit FreigabeKlappe6Out;
	plcbit FreigabeVentilator1;
	plcbit FreigabeVentilator2;
	plcbit FreigabeLuftentfeuchter;
	plcbit FreigabeWarmluftofen;
	plcbit FreigabeHeizregister;
	plcbit FreigabeScheitholzofen;
	plcbit EntfeuchterVonVent1Abhaengig;
	plcbit EntfeuchterVonVent2Abhaengig;
	plcbit WarmluftofenVonVent1Abhaengig;
	plcbit WarmluftofenVonVent2Abhaengig;
	plcbit HeizregisterVonVent1Abhaengig;
	plcbit HeizregisterVonVent2Abhaengig;
	plcbit ScheitholzofenVonVent1Abhaengig;
	plcbit ScheitholzofenVonVent2Abhaengig;
	plcbit NotbetriebBox1;
	plcbit NotbetriebBox2;
	plcbit NotbetriebBox3;
	plcbit NotbetriebBox4;
	plcbit NotbetriebBox5;
	plcbit NotbetriebBox6;
	plcbit NotbetriebVentilator1;
	plcbit NotbetriebVentilator2;
	plcbit Boxenkl1VonVent1Abhaengig;
	plcbit Boxenkl1VonVent2Abhaengig;
	plcbit Boxenkl2VonVent1Abhaengig;
	plcbit Boxenkl2VonVent2Abhaengig;
	plcbit Boxenkl3VonVent1Abhaengig;
	plcbit Boxenkl3VonVent2Abhaengig;
	plcbit Boxenkl4VonVent1Abhaengig;
	plcbit Boxenkl4VonVent2Abhaengig;
	plcbit Boxenkl5VonVent1Abhaengig;
	plcbit Boxenkl5VonVent2Abhaengig;
	plcbit Boxenkl6VonVent1Abhaengig;
	plcbit Boxenkl6VonVent2Abhaengig;
	plcbit BypassklVonVent1Abhaengig;
	plcbit BypassklVonVent2Abhaengig;
	plcbit FreigabeEntfeuchterInselbetrieb;
	plcbit EntfeuchterInselbetrAktivOut;
	plcbit loc_Box1GleicherLuefterkreis;
	plcbit loc_Box2GleicherLuefterkreis;
	plcbit loc_Box3GleicherLuefterkreis;
	plcbit loc_Box4GleicherLuefterkreis;
	plcbit loc_Box5GleicherLuefterkreis;
	plcbit loc_Box6GleicherLuefterkreis;
	plcbit loc_Entf_NotbetriebBox1;
	plcbit loc_Entf_NotbetriebBox2;
	plcbit loc_Entf_NotbetriebBox3;
	plcbit loc_Entf_NotbetriebBox4;
	plcbit loc_Entf_NotbetriebBox5;
	plcbit loc_Entf_NotbetriebBox6;
	plcbit loc_Sho_NotbetriebBox1;
	plcbit loc_Sho_NotbetriebBox2;
	plcbit loc_Sho_NotbetriebBox3;
	plcbit loc_Sho_NotbetriebBox4;
	plcbit loc_Sho_NotbetriebBox5;
	plcbit loc_Sho_NotbetriebBox6;
	plcbit loc_Wlo_NotbetriebBox1;
	plcbit loc_Wlo_NotbetriebBox2;
	plcbit loc_Wlo_NotbetriebBox3;
	plcbit loc_Wlo_NotbetriebBox4;
	plcbit loc_Wlo_NotbetriebBox5;
	plcbit loc_Wlo_NotbetriebBox6;
};
_BUR_PUBLIC void fbBoxenKonfig(struct fbBoxenKonfig* inst);
_BUR_PUBLIC signed long CheckBounds(signed long index, signed long lower, signed long upper);
_BUR_PUBLIC signed long CheckRange(signed long value, signed long lower, signed long upper);
struct fbCControlWitterung
{	unsigned long MaterialfeuchteIst;
	unsigned long MaterialfeuchteStufe[6];
	float FrischluftSaettigungsdefizit;
	float DachluftSaettigungsdefizit;
	float TrockenluftSaettigungsdefizit;
	unsigned char AuswahlSensor;
	float GrenzwertStufeAktuell;
	float HystereseGrenzwert;
	unsigned long VerzWetterwechsel;
	unsigned long SchlechtwetterPulszeitStufe[6];
	unsigned long SchlechtwetterPausezeitStufe[6];
	unsigned char StufeAktuell;
	unsigned long SchlechtwetterPulszeit;
	unsigned long SchlechtwetterPausezeit;
	unsigned char i;
	float SaettigungsdefizitIst;
	struct TON TON_SchrittWitterung;
	unsigned char curStep;
	plcbit Freigabe;
	plcbit SensorFrischluftVhd;
	plcbit SensorDachluftVhd;
	plcbit SensorTrockenluftVhd;
	plcbit WetterIstGut;
	plcbit WetterIstSchlecht;
	plcbit loc_WetterIstGut;
	plcbit loc_WetterIstSchlecht;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbCControlWitterung(struct fbCControlWitterung* inst);
_GLOBAL struct fbBoxenKonfig Boxen;
_GLOBAL typAktoren Aktoren;
_GLOBAL_RETAIN parAnlage Betriebsparameter;
_GLOBAL cmdAnlage gCmdAnlage;
_GLOBAL typEchtzeit Echtzeit;
_GLOBAL_RETAIN typHmiActions hmiActions;
_GLOBAL plcbit diScheitholzofenInBetrieb;
_GLOBAL plcbit diAnfEntfeuchterExtern;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox1;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox2;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox3;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox4;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox5;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox6;
_GLOBAL plcbit alarmFehler[50];
