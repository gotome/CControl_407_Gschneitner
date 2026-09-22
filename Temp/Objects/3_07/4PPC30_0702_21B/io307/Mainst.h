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

#ifndef __AS__TYPE_enumStatus
#define __AS__TYPE_enumStatus
typedef enum enumStatus
{	STATUS_NICHT_VERFUEGBAR = 0,
	STATUS_STILLSTAND = 1,
	STATUS_TESTBETRIEB = 2,
	STATUS_DAUERBETRIEB = 3,
	STATUS_INTERVALL_LAUF = 4,
	STATUS_INTERVALL_PAUSE = 5,
	STATUS_NACHTROCKNUNG_LAUF = 6,
	STATUS_NACHTROCKNUNG_PAUSE = 7,
	STATUS_BEREIT = 8,
	STATUS_STOERUNG = 9,
	STATUS_AKTIV = 10,
	STATUS_NICHT_AKTIV = 11,
	STATUS_OFFEN = 12,
	STATUS_GESCHLOSSEN = 13,
	STATUS_NICHT_FREIGEGEBEN = 14,
	STATUS_UNBEKANNT = 15,
	STATUS_IN_BEWEGUNG = 16,
	STATUS_ENTF_ABTAUUNG = 17,
	STATUS_ANLAGE_IN_BETRIEB = 18,
	STATUS_AUSKUEHLPHASE = 19,
	STATUS_ENTF_STANDBY = 20,
	STATUS_KLAPPE_FRISCHLUFT = 21,
	STATUS_KLAPPE_DACHLUFT = 22,
	STATUS_KLAPPE_UMLUFT = 23,
	STATUS_DAUERBETRIEB_PAUSIERT = 24,
	STATUS_SCHLECHTWETTER_LAUF = 25,
	STATUS_SCHLECHTWETTER_PAUSE = 26,
} enumStatus;
#endif

#ifndef __AS__TYPE_enumBetriebsmodus
#define __AS__TYPE_enumBetriebsmodus
typedef enum enumBetriebsmodus
{	STILLSTAND = 0,
	BETRIEB = 1,
	IOTEST = 2,
} enumBetriebsmodus;
#endif

#ifndef __AS__TYPE_enumSystem
#define __AS__TYPE_enumSystem
typedef enum enumSystem
{	FEHLER_IO_TEST_NICHT_FERTIG = 0,
	FEHLER_KOMMUNIKATION_DISPLAY_IO = 1,
} enumSystem;
#endif

#ifndef __AS__TYPE_enumIcon
#define __AS__TYPE_enumIcon
typedef enum enumIcon
{	ICON_VISIBLE = 0,
	ICON_HIDDEN = 1,
	ICON_GRAU = 2,
	ICON_GELB = 3,
	ICON_ROT = 4,
	TEXT_HELLGRAU = 5,
	TEXT_DUNKELGRAU = 6,
	TEXT_GELB = 7,
	TROCKENGUT_HEU_GRAU = 8,
	TROCKENGUT_HEU_GELB = 9,
	TROCKENGUT_RUNDB_GRAU = 10,
	TROCKENGUT_RUNDB_GELB = 11,
	TROCKENGUT_MAIS_GRAU = 12,
	TROCKENGUT_MAIS_GELB = 13,
	TROCKENGUT_GETREIDE_GRAU = 14,
	TROCKENGUT_GETREIDE_GELB = 15,
	TROCKENGUT_HOPFEN_GRAU = 16,
	TROCKENGUT_HOPFEN_GELB = 17,
	TROCKENGUT_KRAEUTER_GRAU = 18,
	TROCKENGUT_KRAEUTER_GELB = 19,
	TROCKENGUT_HOLZ_GRAU = 20,
	TROCKENGUT_HOLZ_GELB = 21,
	TASTE_ENTF_INSELBETR_GESPERRT = 22,
	TASTE_ENTF_INSELBETR_AUS = 23,
	TASTE_ENTF_INSELBETR_EIN = 24,
} enumIcon;
#endif

#ifndef __AS__TYPE_enumPasswoerter
#define __AS__TYPE_enumPasswoerter
typedef enum enumPasswoerter
{	PASSWORT_SPERRE = 0,
	PASSWORT_KUNDE = 4321,
	PASSWORT_LASCO = 21666,
	PASSWORT_ADMIN = 110588,
	PASSWORT_TAN_01 = 222508,
	PASSWORT_TAN_02 = 988036,
	PASSWORT_TAN_03 = 617545,
	PASSWORT_TAN_04 = 548124,
	PASSWORT_TAN_05 = 321642,
	PASSWORT_TAN_06 = 482409,
	PASSWORT_TAN_07 = 679341,
	PASSWORT_TAN_08 = 455576,
	PASSWORT_TAN_09 = 825468,
	PASSWORT_TAN_10 = 959563,
	PASSWORT_TAN_11 = 107316,
	PASSWORT_TAN_12 = 724578,
	PASSWORT_TAN_13 = 804211,
	PASSWORT_TAN_14 = 147228,
	PASSWORT_TAN_15 = 564299,
	PASSWORT_TAN_16 = 832285,
	PASSWORT_TAN_17 = 981185,
	PASSWORT_TAN_18 = 598284,
	PASSWORT_TAN_19 = 730460,
	PASSWORT_TAN_20 = 971962,
	PASSWORT_TAN_21 = 728589,
	PASSWORT_TAN_22 = 396271,
	PASSWORT_TAN_23 = 496146,
	PASSWORT_TAN_24 = 727556,
	PASSWORT_TAN_25 = 110312,
	PASSWORT_TAN_26 = 849433,
	PASSWORT_TAN_27 = 388439,
	PASSWORT_TAN_28 = 907081,
	PASSWORT_TAN_29 = 347765,
	PASSWORT_TAN_30 = 189196,
	PASSWORT_TAN_31 = 129436,
	PASSWORT_TAN_32 = 678825,
	PASSWORT_TAN_33 = 603382,
	PASSWORT_TAN_34 = 752548,
	PASSWORT_TAN_35 = 466127,
	PASSWORT_TAN_36 = 419810,
	PASSWORT_TAN_37 = 628991,
	PASSWORT_TAN_38 = 349832,
	PASSWORT_TAN_39 = 219361,
	PASSWORT_TAN_40 = 257082,
	PASSWORT_TAN_41 = 166753,
	PASSWORT_TAN_42 = 346634,
	PASSWORT_TAN_43 = 635178,
	PASSWORT_TAN_44 = 740794,
	PASSWORT_TAN_45 = 924143,
	PASSWORT_TAN_46 = 162952,
	PASSWORT_TAN_47 = 218710,
	PASSWORT_TAN_48 = 839073,
	PASSWORT_TAN_49 = 423623,
	PASSWORT_TAN_50 = 232733,
	PASSWORT_ZU_GROSS = 999999,
	PASSWORT_ADMIN_1 = 81190,
	PASSWORT_SERVICE = 8613,
	PASSWORT_KUNDE_1 = 1234,
} enumPasswoerter;
#endif

#ifndef __AS__TYPE_enumPasswortebenen
#define __AS__TYPE_enumPasswortebenen
typedef enum enumPasswortebenen
{	EBENE_SPERRE = 0,
	EBENE_KUNDE = 1,
	EBENE_SERVICE = 2,
	EBENE_LASCO = 3,
	EBENE_ADMIN = 4,
} enumPasswortebenen;
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

#ifndef __AS__TYPE_enumZusatzmeldungen
#define __AS__TYPE_enumZusatzmeldungen
typedef enum enumZusatzmeldungen
{	ZM_STILLSTAND_IOTEST_NICHT_ABGE = 0,
	ZM_STILLSTAND_FEHLER = 1,
	ZM_STILLSTAND_BEREIT = 2,
	ZM_STILLSTAND_ENTF_NOCH_IN_BETR = 3,
	ZM_WARTE_AUF_NOTSTROM = 4,
	ZM_AUSKUEHLZEIT_WLO_AKTIV = 5,
	ZM_AUSKUEHLZEIT_SHO_AKTIV = 6,
	ZM_ANLAUFVERZ_VENT2_AKTIV = 7,
	ZM_ANLAUFVERZ_VENT1_AKTIV = 8,
	ZM_TARIFABSCHALTUNG_AKTIV = 9,
	ZM_STROMBEGRENZUNG_AKTIV = 10,
	ZM_KLAPPEN_WERDEN_UMGESCHALTET = 11,
	ZM_FRISCHLUFTBETRIEB = 12,
	ZM_DACHABSAUGUNGSBETRIEB = 13,
	ZM_UMLUFTBETRIEB = 14,
	ZM_WARTE_AUF_ANFORDERUNG_BOX = 15,
	ZM_STILLSTAND_FEHLERSTOPP = 16,
	ZM_FRISCHLUFTB_VLZ_TARIF = 17,
	ZM_DACHABSAUGUNGSB_VLZ_TARIF = 18,
	ZM_UMLUFTBETR_VLZ_TARIF = 19,
	ZM_INSELBETRIEB_AUS = 20,
	ZM_INSELBETRIEB_STANDBY = 21,
	ZM_INSELBETRIEB_AKTIV = 22,
	ZM_INSELBETRIEB_VENT_NICHT_AKTIV = 23,
} enumZusatzmeldungen;
#endif

#ifndef __AS__TYPE_typHmiStatusBoxen
#define __AS__TYPE_typHmiStatusBoxen
typedef struct typHmiStatusBoxen
{	enumStatus Statustext;
	enumIcon FarbeStatustext;
	enumIcon HintergrundAktiv;
	enumIcon HintergrundInaktiv;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon Trockengut;
	enumIcon AnzeigeLaufRestzeit;
	enumIcon FarbeTextNameBox;
	unsigned char TextindexLaufzeit;
	unsigned short LaufRestzeitStunden;
	unsigned short LaufRestzeitMinuten;
	unsigned char IconWitterung;
} typHmiStatusBoxen;
#endif

#ifndef __AS__TYPE_typHmiStatusVentilator
#define __AS__TYPE_typHmiStatusVentilator
typedef struct typHmiStatusVentilator
{	unsigned char TextFrischluftDachluft;
	plcbit LuftmengenregFrischlSperre;
	plcbit LuftmengenregUmluftSperre;
	enumStatus Status;
	enumIcon FarbeIcon;
	float IstDrehzahl;
	enumIcon BargraphInaktiv;
	enumIcon BargraphAktiv;
	enumIcon FarbeDrehzahl;
	enumIcon EingabefeldFixdrehzUmluft;
	enumIcon EingabefeldFixdrehzFrischl;
	enumIcon EingabefeldLuftmengeUmluft;
	enumIcon EingabefeldLuftmengeFrischl;
	enumIcon Umluftbetrieb;
	enumIcon Luftmenge;
} typHmiStatusVentilator;
#endif

#ifndef __AS__TYPE_typHmiStatusEntfeuchter
#define __AS__TYPE_typHmiStatusEntfeuchter
typedef struct typHmiStatusEntfeuchter
{	float IstDrehzahlKompressor1;
	float IstDrehzahlKompressor2;
	enumStatus Status;
	enumIcon FarbeIcon;
	plcbit EingabeFeuchteEinAusSperre;
	enumIcon FarbeDrehzahl;
	enumIcon FarbeTextStatus;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon IconAbtauung;
	unsigned long RestlaufzeitOelsumpfh;
	enumIcon StatusButtonInselbetrieb;
	enumIcon IconAnforderungExtern;
} typHmiStatusEntfeuchter;
#endif

#ifndef __AS__TYPE_typHmiStatusWarmluftScheitholz
#define __AS__TYPE_typHmiStatusWarmluftScheitholz
typedef struct typHmiStatusWarmluftScheitholz
{	plcbit EingabeSattDefizitSperre;
	unsigned char TextindexUeberschrift;
	enumStatus StatusWarmluftofen;
	enumStatus StatusScheitholzofen;
	enumIcon FarbeIcon;
	enumIcon StatusfeldShoInaktiv;
	enumIcon StatusfeldShoAktiv;
	enumIcon StatusfeldWloInaktiv;
	enumIcon StatusfeldWloAktiv;
	enumIcon FarbeStatustextSho;
	enumIcon FarbeStatustextWlo;
} typHmiStatusWarmluftScheitholz;
#endif

#ifndef __AS__TYPE_typHmiStatusHeizregister
#define __AS__TYPE_typHmiStatusHeizregister
typedef struct typHmiStatusHeizregister
{	enumStatus Status;
	enumIcon FarbeIcon;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeSattDefizitSperre;
	float IstDrehzahl;
} typHmiStatusHeizregister;
#endif

#ifndef __AS__TYPE_typHmiStatusBrandschutzklappe
#define __AS__TYPE_typHmiStatusBrandschutzklappe
typedef struct typHmiStatusBrandschutzklappe
{	enumIcon FarbeStatustext;
	enumStatus Status;
	enumIcon StatusfeldInaktiv;
	enumIcon StatusfeldAktiv;
} typHmiStatusBrandschutzklappe;
#endif

#ifndef __AS__TYPE_typHmiStatusUmluftklappen
#define __AS__TYPE_typHmiStatusUmluftklappen
typedef struct typHmiStatusUmluftklappen
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	enumIcon EingabefeldTempDifferenz;
	enumIcon EingabefeldTempUmschaltung;
	plcbit EingabeTempSchaltpunktSperre;
	plcbit EingabeTempDifferenzSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
	unsigned char TextindexEingabeUmschaltpunkt;
} typHmiStatusUmluftklappen;
#endif

#ifndef __AS__TYPE_typHmiStatusBypassklappe
#define __AS__TYPE_typHmiStatusBypassklappe
typedef struct typHmiStatusBypassklappe
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusBypassklappe;
#endif

#ifndef __AS__TYPE_typHmiStatusAbluftklappe
#define __AS__TYPE_typHmiStatusAbluftklappe
typedef struct typHmiStatusAbluftklappe
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeMaxAbluftfeuchteSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusAbluftklappe;
#endif

#ifndef __AS__TYPE_typHmiStatusAbluftventilator
#define __AS__TYPE_typHmiStatusAbluftventilator
typedef struct typHmiStatusAbluftventilator
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeMaxAbluftfeuchteSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusAbluftventilator;
#endif

#ifndef __AS__TYPE_typHmiStatusZusatzmeldungen
#define __AS__TYPE_typHmiStatusZusatzmeldungen
typedef struct typHmiStatusZusatzmeldungen
{	enumZusatzmeldungen Statustext;
	unsigned long RestzeitSchrittAktuell;
	enumIcon AusgabefeldRestzeit;
	enumIcon IconSanduhr;
} typHmiStatusZusatzmeldungen;
#endif

#ifndef __AS__TYPE_typHmiTrendkurven
#define __AS__TYPE_typHmiTrendkurven
typedef struct typHmiTrendkurven
{	float FrischluftTemp;
	float FrischluftFeuchte;
	float DachluftTemp;
	float DachluftFeuchte;
	float TrockenluftTemp;
	float TrockenluftFeuchte;
	float AbluftTemp;
	float AbluftFeuchte;
	float EintrittTemp;
	float EintrittFeuchte;
	float AustrittTemp;
	float AustrittFeuchte;
	float NiederdruckMod1;
	float NiederdruckMod2;
	float HochdruckMod1;
	float HochdruckMod2;
	float Luftgeschw;
	float Kanaldruck;
	float LeistungAktuell;
	float CursorTrend1;
	float CursorTrend2;
	float CursorTrend3;
	float WertScrollTrend1;
	float WertScrollTrend2;
	float WertScrollTrend3;
	float WertZoomTrend1;
	float WertZoomTrend2;
	float WertZoomTrend3;
	float ZeitScrollTrend1;
	float ZeitScrollTrend2;
	float ZeitScrollTrend3;
	float ZeitZoomTrend1;
	float ZeitZoomTrend2;
	float ZeitZoomTrend3;
} typHmiTrendkurven;
#endif

#ifndef __AS__TYPE_typHmiStatus
#define __AS__TYPE_typHmiStatus
typedef struct typHmiStatus
{	enumPasswortebenen CurUserLevel;
	enumSeitenVisu CurPage;
	enumPasswoerter hmiPasswort;
	typHmiStatusBoxen Box1;
	typHmiStatusBoxen Box2;
	typHmiStatusBoxen Box3;
	typHmiStatusBoxen Box4;
	typHmiStatusBoxen Box5;
	typHmiStatusBoxen Box6;
	typHmiStatusVentilator Ventilator1;
	typHmiStatusVentilator Ventilator2;
	typHmiStatusEntfeuchter Entfeuchter;
	typHmiStatusWarmluftScheitholz WarmluftScheitholzofen;
	typHmiStatusHeizregister Heizregister;
	typHmiStatusBrandschutzklappe Brandschutzklappe;
	typHmiStatusUmluftklappen Umluftklappen;
	typHmiStatusBypassklappe Bypassklappe;
	typHmiStatusAbluftklappe Abluftklappe;
	typHmiStatusAbluftventilator Abluftventilator;
	typHmiStatusZusatzmeldungen Zusatzmeldungen;
	typHmiTrendkurven Trendkurven;
	plcstring EntfeuchterType[21];
	plcstring SoftwareVersion[17];
	unsigned char hmiAlarmFilter;
	unsigned char hmiSelectAlarmGroup;
	unsigned char NameSteuerung;
	plcbit UserIstAdmin;
	plcstring ParameterFileNameAufUsb[81];
} typHmiStatus;
#endif

#ifndef __AS__TYPE_typIoTestDigitalIn
#define __AS__TYPE_typIoTestDigitalIn
typedef struct typIoTestDigitalIn
{	plcbit diVentilator1InBetrieb;
	plcbit di24VDCinternIstOk;
	plcbit diBox1Offen;
	plcbit diBox1Geschl;
	plcbit diBox2Offen;
	plcbit diBox2Geschl;
	plcbit diVentilator2InBetrieb;
	plcbit diDrehzahlbegrVentilator1;
	plcbit diDrehzahlbegrVentilator2;
	plcbit diScheitholzofenInBetrieb;
	plcbit diWarmluftofenInBetrieb;
	plcbit diBox3Offen;
	plcbit diBox3Geschl;
	plcbit diBox4Offen;
	plcbit diBox4Geschl;
	plcbit diBox5Offen;
	plcbit diBox5Geschl;
	plcbit diBox6Offen;
	plcbit diBox6Geschl;
	plcbit diAbluftventInBetrieb;
	plcbit diAbluftklappeOffen;
	plcbit diAbluftklappeGeschl;
	plcbit diUmschaltklappe1Offen;
	plcbit diUmschaltklappe1Geschl;
	plcbit diUmschaltklappe2Offen;
	plcbit diUmschaltklappe2Geschl;
	plcbit diNotstromaggregatInBetrieb;
	plcbit diNiederdruckOkModul1;
	plcbit diNiederdruckOkModul2;
	plcbit diHochdruckOkModul1;
	plcbit diHochdruckOkModul2;
	plcbit diKopftempKompressorModul1;
	plcbit diKopftempKompressorModul2;
	plcbit diOeldruckKompressorModul1;
	plcbit diOeldruckKompressorModul2;
	plcbit diVollschutzKompressorModul1;
	plcbit diVollschutzKompressorModul2;
	plcbit diBetriebsmldgKompressorModul1;
	plcbit diBetriebsmldgKompressorModul2;
	plcbit diLeistungsvorgKompressorExtMod1;
	plcbit diBypassklappeGeschl;
	plcbit diBypassklappeOffen;
	plcbit diAnfEntfeuchterExtern;
	plcbit diDrehfeldIstKorrekt;
	plcbit di230VACIstOk;
	plcbit diEntfeuchterFremdInBetrieb;
	plcbit diEntfeuchterFremdStoerung;
	plcbit diTasteTrocknungPausieren;
	plcbit diHeizregisterFrostschutz;
} typIoTestDigitalIn;
#endif

#ifndef __AS__TYPE_typIoTestStatusIn
#define __AS__TYPE_typIoTestStatusIn
typedef struct typIoTestStatusIn
{	plcbit diStatusNiederdruckMinMod1;
	plcbit diStatusNiederdruckMaxMod1;
	plcbit diStatusHochdruckMinMod1;
	plcbit diStatusHochdruckMaxMod1;
	plcbit diStatusNiederdruckMinMod2;
	plcbit diStatusNiederdruckMaxMod2;
	plcbit diStatusHochdruckMinMod2;
	plcbit diStatusHochdruckMaxMod2;
	plcbit diStatusDifferenzdruckMax;
	plcbit diStatusDifferenzdruckMin;
	plcbit diStatusLuftgeschwDrahtbruch;
	plcbit diStatusLuftgeschwMax;
	plcbit diStatusLuftgeschwMin;
	plcbit diStatusEintrittTempMin;
	plcbit diStatusEintrittTempMax;
	plcbit diStatusEintrittFeuchteMin;
	plcbit diStatusEintrittFeuchteMax;
	plcbit diStatusAustrittTempMin;
	plcbit diStatusAustrittTempMax;
	plcbit diStatusAustrittFeuchteMin;
	plcbit diStatusAustrittFeuchteMax;
	plcbit diStatusFrischluftFeuchteMax;
	plcbit diStatusFrischluftFeuchteMin;
	plcbit diStatusFrischluftTempMax;
	plcbit diStatusFrischluftTempMin;
	plcbit diStatusTrockenluftFeuchteMax;
	plcbit diStatusTrockenluftFeuchteMin;
	plcbit diStatusTrockenluftTempMax;
	plcbit diStatusTrockenluftTempMin;
	plcbit diStatusDachluftFeuchteMax;
	plcbit diStatusDachluftFeuchteMin;
	plcbit diStatusDachluftTempMax;
	plcbit diStatusDachluftTempMin;
	plcbit diStatusAbluftTempMax;
	plcbit diStatusAbluftTempMin;
	plcbit diStatusAbluftFeuchteMax;
	plcbit diStatusAbluftFeuchteMin;
} typIoTestStatusIn;
#endif

#ifndef __AS__TYPE_typIoTestDigitalOut
#define __AS__TYPE_typIoTestDigitalOut
typedef struct typIoTestDigitalOut
{	plcbit doVentilator1Ein;
	plcbit doTrocknungInBetrieb;
	plcbit doFreigabeBox1;
	plcbit doFreigabeBox2;
	plcbit doTrocknungStoerung;
	plcbit doVentilator2Ein;
	plcbit doWarmluftofenEin;
	plcbit doHeizregisterEin;
	plcbit doFreigabeBox3;
	plcbit doFreigabeBox4;
	plcbit doFreigabeBox5;
	plcbit doFreigabeBox6;
	plcbit doBrandschutzklappeAuf;
	plcbit doAbluftventilatorEin;
	plcbit doAbluftklappeFreigabe;
	plcbit doUmluftklappe1Freigabe;
	plcbit doUmluftklappe2Freigabe;
	plcbit doNotstromaggregatEin;
	plcbit doKompressorEinModul1;
	plcbit doKompressorEinModul2;
	plcbit doMagnetventilEinModul1;
	plcbit doMagnetventilEinModul2;
	plcbit doOelsumpfheizungEinModul1;
	plcbit doOelsumpfheizungEinModul2;
	plcbit doBypassklappeOeffnen;
	plcbit doBypassklappeSchliessen;
	plcbit doUmluftklappe1Oeffnen;
	plcbit doUmluftklappe1Schliessen;
	plcbit doUmluftklappe2Oeffnen;
	plcbit doUmluftklappe2Schliessen;
	plcbit doAbluftklappeOeffnen;
	plcbit doAbluftklappeSchliessen;
	plcbit doEntfFremdFreigabe;
	plcbit doLuftentfeuchterStrombegrEin;
} typIoTestDigitalOut;
#endif

#ifndef __AS__TYPE_typIoTestAnalogIn
#define __AS__TYPE_typIoTestAnalogIn
typedef struct typIoTestAnalogIn
{	float aiFrischluftTemperatur;
	float aiFrischluftFeuchte;
	float aiTrockenluftTemperatur;
	float aiTrockenluftFeuchte;
	float aiAbluftTemperatur;
	float aiAbluftFeuchte;
	float aiDachluftTemperatur;
	float aiDachluftFeuchte;
	float aiLuftgeschwindigkeit;
	float aiDifferenzdruck;
	float aiNiederdruckModul2;
	float aiNiederdruckModul1;
	float aiHochdruckModul2;
	float aiHochdruckModul1;
	float aiEintrittTemperatur;
	float aiEintrittFeuchte;
	float aiAustrittTemperatur;
	float aiAustrittFeuchte;
} typIoTestAnalogIn;
#endif

#ifndef __AS__TYPE_typIoTestAnalogOut
#define __AS__TYPE_typIoTestAnalogOut
typedef struct typIoTestAnalogOut
{	float aoDrehzahlvorgVentilator1;
	float aoTemperaturvorgWarmluftofen;
	float aoDrehzahlvorgVentilator2;
	float aoLeistungsvorgHeizregister;
	float aoDrehzahlvorgAbluftventilator;
	float aoDrehzahlvorgKompressorModul1;
	float aoDrehzahlvorgKompressorModul2;
} typIoTestAnalogOut;
#endif

#ifndef __AS__TYPE_typIoTest
#define __AS__TYPE_typIoTest
typedef struct typIoTest
{	typIoTestDigitalIn DigitalIn;
	typIoTestStatusIn StatusIn;
	typIoTestDigitalOut DigitalOut;
	typIoTestAnalogIn AnalogIn;
	typIoTestAnalogOut AnalogOut;
} typIoTest;
#endif

#ifndef __AS__TYPE_typHmiButtonsKlappenBoxen
#define __AS__TYPE_typHmiButtonsKlappenBoxen
typedef struct typHmiButtonsKlappenBoxen
{	plcbit Klappe1;
	plcbit Klappe2;
	plcbit Klappe3;
	plcbit Klappe4;
	plcbit Klappe5;
	plcbit Klappe6;
} typHmiButtonsKlappenBoxen;
#endif

#ifndef __AS__TYPE_typHmiButtons
#define __AS__TYPE_typHmiButtons
typedef struct typHmiButtons
{	plcbit IntervallEinstellenBoxAktuell;
	plcbit NachtrocknEinstellenAktuell;
	plcbit hideDetailansichtBox;
	plcbit hideZeitfenster;
	plcbit showBox1;
	plcbit showBox2;
	plcbit showBox3;
	plcbit showBox4;
	plcbit showBox5;
	plcbit showBox6;
	plcbit showVentilatoren;
	plcbit showEntfeuchterFremd;
	plcbit showEntfeuchter;
	plcbit showOfen;
	plcbit showHeizregister;
	plcbit showKlappen;
	plcbit showSensoren;
	plcbit QuitFehler;
	plcbit TestbetriebEin;
	plcbit TestbetriebAbbrechen;
	plcbit TestbetriebAbschliessen;
	plcbit IpParameterSetzen;
	plcbit DatenaufzeichnungAufUsb;
	plcbit DatenaufzeichnungLoeschen;
	plcbit Logout;
	plcbit TouchKalibrieren;
	plcbit SicherheitshinweisOk;
	plcbit ResetEnergieverbrTag;
	plcbit ResetServiceUhrzeit;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox1;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox2;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox3;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox4;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox5;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox6;
	plcbit changeBetrArtBypassklappe;
	plcbit changeBetrArtAbluftvent;
	plcbit changeBetrArtAbluftklappe;
	plcbit changeBetrArtUmluftklappen;
	plcbit ParameterVonUsbLaden;
	plcbit ParameterAufUsbKopieren;
	plcbit TrocknungsbilanzOk;
	plcbit changeTrockengutBox1;
	plcbit changeTrockengutBox2;
	plcbit changeTrockengutBox3;
	plcbit changeTrockengutBox4;
	plcbit changeTrockengutBox5;
	plcbit changeTrockengutBox6;
} typHmiButtons;
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

#ifndef __AS__TYPE_modBR7300
#define __AS__TYPE_modBR7300
typedef struct modBR7300
{	plcbit ModulOk;
} modBR7300;
#endif

#ifndef __AS__TYPE_modCM8281
#define __AS__TYPE_modCM8281
typedef struct modCM8281
{	plcbit di01;
	plcbit di02;
	plcbit di03;
	plcbit di04;
	plcbit do01;
	plcbit do02;
	signed short ai01;
	signed short ao01;
	unsigned char StatusInput01;
	plcbit ModulOk;
} modCM8281;
#endif

#ifndef __AS__TYPE_modAI8321
#define __AS__TYPE_modAI8321
typedef struct modAI8321
{	signed short ai01;
	signed short ai02;
	signed short ai03;
	signed short ai04;
	signed short ai05;
	signed short ai06;
	signed short ai07;
	signed short ai08;
	unsigned char StatusInput01;
	unsigned char StatusInput02;
	plcbit ModulOk;
} modAI8321;
#endif

#ifndef __AS__TYPE_modDO9322
#define __AS__TYPE_modDO9322
typedef struct modDO9322
{	plcbit do01;
	plcbit do02;
	plcbit do03;
	plcbit do04;
	plcbit do05;
	plcbit do06;
	plcbit do07;
	plcbit do08;
	plcbit do09;
	plcbit do10;
	plcbit do11;
	plcbit do12;
	plcbit ModulOk;
} modDO9322;
#endif

#ifndef __AS__TYPE_modDIF371
#define __AS__TYPE_modDIF371
typedef struct modDIF371
{	plcbit di01;
	plcbit di02;
	plcbit di03;
	plcbit di04;
	plcbit di05;
	plcbit di06;
	plcbit di07;
	plcbit di08;
	plcbit di09;
	plcbit di10;
	plcbit di11;
	plcbit di12;
	plcbit di13;
	plcbit di14;
	plcbit di15;
	plcbit di16;
	plcbit ModulOk;
} modDIF371;
#endif

struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbLascoFehl
{	float VerzZeit;
	unsigned char Mode;
	float Counter;
	plcbit FehlerIn;
	plcbit Quit;
	plcbit Tick;
	plcbit FehlerOut;
};
_BUR_PUBLIC void fbLascoFehl(struct fbLascoFehl* inst);
struct LCRLimScal
{	float x;
	float x1;
	float y1;
	float x2;
	float y2;
	float y;
};
_BUR_PUBLIC void LCRLimScal(struct LCRLimScal* inst);
struct LCRMovAvgFlt
{	float x;
	unsigned short base;
	unsigned short status;
	float y;
	signed long sum_old_dbl_1;
	signed long sum_old_dbl_2;
	unsigned long p_xold;
	unsigned short i_xold;
	unsigned short base_old;
	unsigned long bootkey_old;
	plcbit enable;
	plcbit enable_old;
};
_BUR_PUBLIC void LCRMovAvgFlt(struct LCRMovAvgFlt* inst);
_BUR_PUBLIC signed long CheckBounds(signed long index, signed long lower, signed long upper);
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL modDIF371 diModul02;
_BUR_LOCAL modDO9322 doModul03;
_BUR_LOCAL modAI8321 aiModul04;
_BUR_LOCAL modCM8281 cmModul05;
_BUR_LOCAL modCM8281 cmModul06;
_BUR_LOCAL modCM8281 cmModul07;
_BUR_LOCAL modCM8281 cmModul10;
_BUR_LOCAL modBR7300 brModul01;
_BUR_LOCAL modCM8281 cmModul12;
_BUR_LOCAL modCM8281 cmModul11;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_0;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_1;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_2;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_3;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_4;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_5;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_6;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_7;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_8;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_9;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_10;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_11;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_12;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_13;
_BUR_LOCAL struct LCRLimScal LCRLimScal_0;
_BUR_LOCAL struct LCRLimScal LCRLimScal_1;
_BUR_LOCAL struct LCRLimScal LCRLimScal_2;
_BUR_LOCAL struct LCRLimScal LCRLimScal_3;
_BUR_LOCAL struct LCRLimScal LCRLimScal_4;
_BUR_LOCAL struct LCRLimScal LCRLimScal_5;
_BUR_LOCAL struct LCRLimScal LCRLimScal_6;
_BUR_LOCAL struct LCRLimScal LCRLimScal_7;
_BUR_LOCAL struct LCRLimScal LCRLimScal_8;
_BUR_LOCAL struct LCRLimScal LCRLimScal_9;
_BUR_LOCAL struct LCRLimScal LCRLimScal_10;
_BUR_LOCAL struct LCRLimScal LCRLimScal_11;
_BUR_LOCAL struct LCRLimScal LCRLimScal_12;
_BUR_LOCAL struct LCRLimScal LCRLimScal_13;
_BUR_LOCAL struct LCRLimScal LCRLimScal_14;
_BUR_LOCAL struct LCRLimScal LCRLimScal_15;
_BUR_LOCAL struct LCRLimScal LCRLimScal_16;
_BUR_LOCAL struct LCRLimScal LCRLimScal_17;
_BUR_LOCAL plcbit loc_Erforderl_Mod1;
_BUR_LOCAL plcbit loc_Erforderl_Mod2;
_BUR_LOCAL plcbit loc_Erforderl_Mod3;
_BUR_LOCAL plcbit loc_Erforderl_Mod4;
_BUR_LOCAL plcbit loc_Erforderl_Mod5;
_BUR_LOCAL plcbit loc_Erforderl_Mod6;
_BUR_LOCAL plcbit loc_Erforderl_Mod7;
_BUR_LOCAL plcbit loc_Erforderl_Mod8;
_BUR_LOCAL plcbit loc_Erforderl_Mod9;
_BUR_LOCAL plcbit loc_Erforderl_Mod10;
_BUR_LOCAL plcbit loc_Erforderl_Mod11;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_0;
_GLOBAL_RETAIN parAnlage Betriebsparameter;
_GLOBAL plcbit gModul2Vorhanden;
_GLOBAL enumBetriebsmodus gAktModus;
_GLOBAL typEchtzeit Echtzeit;
_GLOBAL plcbit gEnergiemessungModulOk;
_GLOBAL typHmiStatus hmiStatus;
_GLOBAL typIoTest hmiIoTest;
_GLOBAL parAnlage hmiParameter;
_GLOBAL typHmiButtons hmiButtons;
_GLOBAL plcbit doVentilator1Ein;
_GLOBAL plcbit doTrocknungInBetrieb;
_GLOBAL plcbit doFreigabeBox1;
_GLOBAL plcbit doFreigabeBox2;
_GLOBAL plcbit doTrocknungStoerung;
_GLOBAL plcbit doWarmluftofenEin;
_GLOBAL plcbit doHeizregisterEin;
_GLOBAL plcbit doFreigabeBox3;
_GLOBAL plcbit doBrandschutzklappeAuf;
_GLOBAL plcbit doAbluftventilatorEin;
_GLOBAL plcbit doAbluftklappeFreigabe;
_GLOBAL plcbit doUmluftklappe1Freigabe;
_GLOBAL plcbit doUmluftklappe2Freigabe;
_GLOBAL plcbit doNotstromaggregatEin;
_GLOBAL plcbit doKompressorEinModul1;
_GLOBAL plcbit doKompressorEinModul2;
_GLOBAL plcbit doMagnetventilEinModul1;
_GLOBAL plcbit doMagnetventilEinModul2;
_GLOBAL plcbit doOelsumpfheizungEinModul1;
_GLOBAL plcbit doOelsumpfheizungEinModul2;
_GLOBAL plcbit doBypassklappeOeffnen;
_GLOBAL float aoDrehzahlvorgVentilator1;
_GLOBAL float aoLeistungsvorgHeizregister;
_GLOBAL float aoDrehzahlvorgAbluftventilator;
_GLOBAL float aoDrehzahlvorgKompressorModul1;
_GLOBAL float aoDrehzahlvorgKompressorModul2;
_GLOBAL float aiFrischluftTemperatur;
_GLOBAL float aiFrischluftFeuchte;
_GLOBAL float aiAbluftTemperatur;
_GLOBAL float aiAbluftFeuchte;
_GLOBAL float aiDachluftTemperatur;
_GLOBAL float aiDachluftFeuchte;
_GLOBAL float aiLuftgeschwindigkeit;
_GLOBAL float aiDifferenzdruck;
_GLOBAL float aiNiederdruckModul2;
_GLOBAL float aiNiederdruckModul1;
_GLOBAL float aiHochdruckModul2;
_GLOBAL float aiHochdruckModul1;
_GLOBAL float aiEintrittTemperatur;
_GLOBAL float aiEintrittFeuchte;
_GLOBAL float aiAustrittTemperatur;
_GLOBAL float aiAustrittFeuchte;
_GLOBAL plcbit diVentilator1InBetrieb;
_GLOBAL plcbit di24VDCinternIstOk;
_GLOBAL plcbit diBox1Offen;
_GLOBAL plcbit diBox1Geschl;
_GLOBAL plcbit diBox2Offen;
_GLOBAL plcbit diBox2Geschl;
_GLOBAL plcbit diDrehzahlbegrVentilator1;
_GLOBAL plcbit diScheitholzofenInBetrieb;
_GLOBAL plcbit diWarmluftofenInBetrieb;
_GLOBAL plcbit diBox3Offen;
_GLOBAL plcbit diBox3Geschl;
_GLOBAL plcbit diAbluftventInBetrieb;
_GLOBAL plcbit diAbluftklappeOffen;
_GLOBAL plcbit diAbluftklappeGeschl;
_GLOBAL plcbit diUmschaltklappe1Offen;
_GLOBAL plcbit diUmschaltklappe1Geschl;
_GLOBAL plcbit diUmschaltklappe2Offen;
_GLOBAL plcbit diUmschaltklappe2Geschl;
_GLOBAL plcbit diNotstromaggregatInBetrieb;
_GLOBAL plcbit diNiederdruckOkModul1;
_GLOBAL plcbit diNiederdruckOkModul2;
_GLOBAL plcbit diHochdruckOkModul1;
_GLOBAL plcbit diHochdruckOkModul2;
_GLOBAL plcbit diKopftempKompressorModul1;
_GLOBAL plcbit diKopftempKompressorModul2;
_GLOBAL plcbit diOeldruckKompressorModul1;
_GLOBAL plcbit diOeldruckKompressorModul2;
_GLOBAL plcbit diVollschutzKompressorModul1;
_GLOBAL plcbit diVollschutzKompressorModul2;
_GLOBAL plcbit diBetriebsmldgKompressorModul1;
_GLOBAL plcbit diBetriebsmldgKompressorModul2;
_GLOBAL plcbit diLeistungsvorgKompressorExtMod1;
_GLOBAL plcbit diBypassklappeGeschl;
_GLOBAL plcbit diBypassklappeOffen;
_GLOBAL plcbit diStatusNiederdruckMinMod1;
_GLOBAL plcbit diStatusNiederdruckMaxMod1;
_GLOBAL plcbit diStatusHochdruckMinMod1;
_GLOBAL plcbit diStatusHochdruckMaxMod1;
_GLOBAL plcbit diStatusNiederdruckMinMod2;
_GLOBAL plcbit diStatusNiederdruckMaxMod2;
_GLOBAL plcbit diStatusHochdruckMinMod2;
_GLOBAL plcbit diStatusHochdruckMaxMod2;
_GLOBAL plcbit diStatusDifferenzdruckMax;
_GLOBAL plcbit diStatusDifferenzdruckMin;
_GLOBAL plcbit diStatusLuftgeschwDrahtbruch;
_GLOBAL plcbit diStatusLuftgeschwMax;
_GLOBAL plcbit diStatusLuftgeschwMin;
_GLOBAL plcbit diStatusEintrittTempMin;
_GLOBAL plcbit diStatusEintrittTempMax;
_GLOBAL plcbit diStatusEintrittFeuchteMin;
_GLOBAL plcbit diStatusEintrittFeuchteMax;
_GLOBAL plcbit diStatusAustrittTempMin;
_GLOBAL plcbit diStatusAustrittTempMax;
_GLOBAL plcbit diStatusAustrittFeuchteMin;
_GLOBAL plcbit diStatusAustrittFeuchteMax;
_GLOBAL plcbit diStatusFrischluftFeuchteMax;
_GLOBAL plcbit diStatusFrischluftFeuchteMin;
_GLOBAL plcbit diStatusFrischluftTempMax;
_GLOBAL plcbit diStatusFrischluftTempMin;
_GLOBAL plcbit diStatusDachluftFeuchteMax;
_GLOBAL plcbit diStatusDachluftFeuchteMin;
_GLOBAL plcbit diStatusDachluftTempMax;
_GLOBAL plcbit diStatusDachluftTempMin;
_GLOBAL plcbit diStatusAbluftTempMax;
_GLOBAL plcbit diStatusAbluftTempMin;
_GLOBAL plcbit diStatusAbluftFeuchteMax;
_GLOBAL plcbit diStatusAbluftFeuchteMin;
_GLOBAL plcbit alarmSystem[5];
