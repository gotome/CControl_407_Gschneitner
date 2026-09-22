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

#ifndef __AS__TYPE_statFehler
#define __AS__TYPE_statFehler
typedef struct statFehler
{	unsigned char WarnungNr;
	unsigned char FehlerNr;
	plcstring WarnungText[141];
	plcstring FehlerText[141];
	plcbit SummeFehler;
	plcbit SummeWarnung;
	plcbit SummeSystem;
} statFehler;
#endif

#ifndef __AS__TYPE_statBerechnungen
#define __AS__TYPE_statBerechnungen
typedef struct statBerechnungen
{	float FrischluftSattDefizit;
	float DachluftSattDefizit;
	float TrockenluftSattDefizit;
	float AbluftSattDefizit;
	float Kanaldruck_mmWs;
} statBerechnungen;
#endif

#ifndef __AS__TYPE_statRestlaufzeitenBoxen
#define __AS__TYPE_statRestlaufzeitenBoxen
typedef struct statRestlaufzeitenBoxen
{	unsigned short Box1Stunden;
	unsigned short Box1Minuten;
	unsigned short Box2Stunden;
	unsigned short Box2Minuten;
	unsigned short Box3Stunden;
	unsigned short Box3Minuten;
	unsigned short Box4Stunden;
	unsigned short Box4Minuten;
	unsigned short Box5Stunden;
	unsigned short Box5Minuten;
	unsigned short Box6Stunden;
	unsigned short Box6Minuten;
} statRestlaufzeitenBoxen;
#endif

#ifndef __AS__TYPE_statAnlage
#define __AS__TYPE_statAnlage
typedef struct statAnlage
{	plcbit Betrieb;
	enumStatus Aktor[40];
	statFehler Fehler;
	float DrehzahlVentilator1;
	float DrehzahlVentilator2;
	float DrehzahlKompressorModul1;
	float DrehzahlKompressorModul2;
	float FrischluftTemperatur;
	float FrischluftFeuchte;
	float DachluftTemperatur;
	float DachluftFeuchte;
	float TrockenluftTemperatur;
	float TrockenluftFeuchte;
	float AbluftTemperatur;
	float AbluftFeuchte;
	float EintrittTemperatur;
	float EintrittFeuchte;
	float AustrittTemperatur;
	float AustrittFeuchte;
	float Kanaldruck;
	float Luftgeschwindigkeit;
	float NiederdruckModul1;
	float NiederdruckModul2;
	float HochdruckModul1;
	float HochdruckModul2;
	float LuftmengeAktuell;
	plcbit UmluftbetriebAktiv;
	plcbit FrischluftbetriebAktiv;
	float EnergieverbrTag;
	float EnergieLeistungAkt;
	float EnergieverbrGes;
	statBerechnungen Berechnungen;
	statRestlaufzeitenBoxen RestlaufzeitenBoxen;
	plcbit WetterIstSchlecht;
} statAnlage;
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
struct fbMathLuft
{	float LuftTemperatur;
	float LuftRelFeuchte;
	float MeterUeberAdria;
	float LuftAbsoluteFeuchteSatt;
	float LuftAbsoluteFeuchte_g_m3;
	float LuftdruckUmgebung;
	float LuftDichte;
	float LuftAbsoluteFeuchte_g_kg;
	float LuftDampfdruckSatt;
	float LuftDampfdruckH2O;
	float TaupunktTemp;
	float LuftSaettigungsdefizit;
	float loc_Taupunkttemp;
	plcbit Freigabe;
};
_BUR_PUBLIC void fbMathLuft(struct fbMathLuft* inst);
struct fbMathTrLftDruck
{	float TrockenluftDruck;
	float LuftDruck_mmWS;
	float LuftDruck_mbar;
	float LuftDruck_bar;
	plcbit Freigabe;
};
_BUR_PUBLIC void fbMathTrLftDruck(struct fbMathTrLftDruck* inst);
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
_GLOBAL_RETAIN parAnlage Betriebsparameter;
_GLOBAL statAnlage gStatusAnlage;
_GLOBAL plcbit doVentilator1Ein;
_GLOBAL plcbit doVentilator2Ein;
_GLOBAL float aiFrischluftTemperatur;
_GLOBAL float aiFrischluftFeuchte;
_GLOBAL float aiTrockenluftTemperatur;
_GLOBAL float aiTrockenluftFeuchte;
_GLOBAL float aiAbluftTemperatur;
_GLOBAL float aiAbluftFeuchte;
_GLOBAL float aiDachluftTemperatur;
_GLOBAL float aiDachluftFeuchte;
_GLOBAL float aiDifferenzdruck;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox1;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox2;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox3;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox4;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox5;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox6;
_GLOBAL struct fbMathLuft Frischluftsensor;
_GLOBAL struct fbMathLuft Dachluftsensor;
_GLOBAL struct fbMathLuft Trockenluftsensor;
_GLOBAL struct fbMathLuft Abluftsensor;
_GLOBAL struct fbMathTrLftDruck Drucksensor;
_GLOBAL plcbit alarmFehler[50];
