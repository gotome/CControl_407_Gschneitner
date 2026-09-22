/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790072252_1_
#define _BUR_1790072252_1_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
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

typedef struct parBetrieb
{	plcbit BetriebAutoEin;
} parBetrieb;

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

typedef struct parSchrittkette
{	unsigned long AnlaufverzZweiterVentilator;
	unsigned long VerzWetterwechsel;
} parSchrittkette;

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

typedef struct parAbluftklappe
{	unsigned long Laufzeit;
	float AbluftfeuchteMax;
	float Hysterese;
	plcbit Automatik;
	plcbit Oeffnen;
	plcbit Schliessen;
} parAbluftklappe;

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

typedef struct parBypassklappe
{	unsigned long Laufzeit;
	plcbit Automatik;
	plcbit Oeffnen;
	plcbit Schliessen;
} parBypassklappe;

typedef struct parKlappenBoxen
{	unsigned long Laufzeit;
} parKlappenBoxen;

typedef struct parNotstromaggregat
{	unsigned long Vorlaufzeit;
	unsigned long VerzBetriebsmeldung;
	unsigned long Nachlaufzeit;
} parNotstromaggregat;

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

typedef struct parServicebereich
{	unsigned long KontrollintervallUhrzeit;
} parServicebereich;

typedef struct parFernalarmierung
{	plcstring MailAdresse[4][81];
	plcbit EMailAlarmierungEin;
} parFernalarmierung;

typedef struct parScheitholzofen
{	unsigned long Auskuehlzeit;
} parScheitholzofen;

typedef struct parZeitfenster
{	unsigned char StartStd;
	unsigned char StartMin;
	unsigned char StoppStd;
	unsigned char StoppMin;
} parZeitfenster;

typedef struct parTarifabschaltung
{	struct parZeitfenster Zeitfenster;
	unsigned char VorlaufzeitAbschaltungLuftaufb;
} parTarifabschaltung;

typedef struct parStrombegrenzung
{	struct parZeitfenster Zeitfenster;
} parStrombegrenzung;

typedef struct parSchlechtwetterBoxenStufen
{	float Saettigungsdefizit;
	unsigned long SchlechtwetterZeitLauf;
	unsigned long SchlechtwetterZeitPause;
	unsigned short MaterialfeuchteStufe;
} parSchlechtwetterBoxenStufen;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct parSchlechtwetterBoxen
{	struct parSchlechtwetterBoxenStufen Stufe[6];
	float HystereseGrenzwert;
	unsigned char AuswahlSensorGrenzwert;
	unsigned char MaterialfeuchteIst;
} parSchlechtwetterBoxen;
#else
/* Data type parSchlechtwetterBoxen not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct parAnlage
{	struct parAllgemein Allgemein;
	struct parBetrieb Betrieb;
	struct parAusstattung Ausstattung;
	struct parSchrittkette Schrittkette;
	struct parVentilator Ventilator1;
	struct parVentilator Ventilator2;
	struct parBoxen Boxen[6];
	struct parEntfeuchter Entfeuchter;
	struct parKompressor Kompressor1;
	struct parKompressor Kompressor2;
	struct parWarmluftofen Warmluftofen;
	struct parHeizregister Heizregister;
	struct parAbluftventilator Abluftventilator;
	struct parAbluftklappe Abluftklappe;
	struct parUmschaltklappen Umschaltklappen;
	struct parBypassklappe Bypassklappe;
	struct parKlappenBoxen KlappenBoxen[6];
	struct parNotstromaggregat Notstromaggregat;
	struct parSensoren Sensoren;
	struct parServicebereich Servicebereich;
	struct parFernalarmierung Fernalarmierung;
	struct parScheitholzofen Scheitholzofen;
	struct parTarifabschaltung Tarifabschaltung;
	struct parStrombegrenzung Strombegrenzung;
	struct parSchlechtwetterBoxen SchlechtwetterBoxen[6];
} parAnlage;
#else
/* Data type parAnlage not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Parameter.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790072252_1_ */

