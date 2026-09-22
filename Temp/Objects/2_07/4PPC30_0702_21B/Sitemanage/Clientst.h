#ifndef __AS__TYPE_
#define __AS__TYPE_
static signed long __AS__STRING_CMP(char* pstr1, char* pstr2);
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

struct TcpOpen
{	unsigned long pIfAddr;
	unsigned short port;
	unsigned long options;
	unsigned short status;
	unsigned long ident;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpOpen(struct TcpOpen* inst);
struct TcpClient
{	unsigned long ident;
	unsigned long pServer;
	unsigned short portserv;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpClient(struct TcpClient* inst);
struct TcpRecv
{	unsigned long ident;
	unsigned long pData;
	unsigned long datamax;
	unsigned long flags;
	unsigned short status;
	unsigned long recvlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpRecv(struct TcpRecv* inst);
struct TcpSend
{	unsigned long ident;
	unsigned long pData;
	unsigned long datalen;
	unsigned long flags;
	unsigned short status;
	unsigned long sentlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpSend(struct TcpSend* inst);
struct TcpIoctl
{	unsigned long ident;
	unsigned long ioctl;
	unsigned long pData;
	unsigned long datalen;
	unsigned short status;
	unsigned long outlen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpIoctl(struct TcpIoctl* inst);
struct TcpClose
{	unsigned long ident;
	unsigned long how;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void TcpClose(struct TcpClose* inst);
#ifndef __AS__TYPE_tcpLINGER_typ
#define __AS__TYPE_tcpLINGER_typ
typedef struct tcpLINGER_typ
{	unsigned long lOnOff;
	unsigned long lLinger;
} tcpLINGER_typ;
#endif

#ifndef __AS__TYPE_Client_typ
#define __AS__TYPE_Client_typ
typedef struct Client_typ
{	unsigned short sStep;
	struct TcpOpen TcpOpen_0;
	struct TcpClient TcpClient_0;
	struct TcpRecv TcpRecv_0;
	struct TcpSend TcpSend_0;
	struct TcpIoctl TcpIoctl_0;
	struct TcpClose TcpClose_0;
	tcpLINGER_typ linger_opt;
} Client_typ;
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

_BUR_PUBLIC signed short LEN(plcstring IN[32768]);
_BUR_PUBLIC plcstring* CONCAT(plcstring IN1[32768], plcstring IN2[32768]);
_BUR_PUBLIC unsigned short VA_GetActAlarmList(plcbit enable, unsigned long VCHandle, signed long pcAlarmLine, signed long plLen, unsigned short iFunction, unsigned char cSeperator, unsigned char cDateTimeFormat);
_BUR_PUBLIC unsigned short VA_Saccess(plcbit enable, unsigned long VCHandle);
_BUR_PUBLIC unsigned long VA_Setup(plcbit enable, plcstring pProjectName[81]);
_BUR_PUBLIC unsigned short VA_Srelease(plcbit enable, unsigned long VCHandle);
_BUR_LOCAL plcstring Sendstring[351];
_BUR_LOCAL Client_typ Client;
_BUR_LOCAL plcstring EMailText[81];
_BUR_LOCAL plcstring SLASH[2];
_BUR_LOCAL plcstring LEFTBRACKET[2];
_BUR_LOCAL plcstring RIGHTBRACKET[2];
_BUR_LOCAL plcstring COMMA[2];
_BUR_LOCAL plcstring EMail[4][81];
_BUR_LOCAL plcbit UseComma;
_BUR_LOCAL plcstring CommaString[2];
_BUR_LOCAL plcbit Send;
_BUR_LOCAL plcstring resultString[351];
_BUR_LOCAL plcstring ErrorText[81];
_BUR_LOCAL unsigned short ErrNr;
_BUR_LOCAL unsigned short IP_PORT;
_BUR_LOCAL unsigned long IP_ADRESS;
_BUR_LOCAL unsigned long VC_HANDLE;
_BUR_LOCAL plcstring AlarmString[101];
_BUR_LOCAL signed long AlarmLen;
_BUR_LOCAL unsigned short uiAlarmType;
_BUR_LOCAL unsigned char cDateTimeFormat;
_BUR_LOCAL unsigned char cSeparator;
_BUR_LOCAL unsigned short Access_Status;
_BUR_LOCAL unsigned short GetActAlarmList_Status;
_BUR_LOCAL plcbit loc_FehlerAusgelesen;
_BUR_LOCAL plcbit loc_EMailAlarmierungEin;
_GLOBAL_RETAIN parAnlage Betriebsparameter;
_GLOBAL statAnlage gStatusAnlage;
_GLOBAL typHmiButtons hmiButtons;
_GLOBAL unsigned short ERR_FUB_BUSY;
_GLOBAL unsigned short tcpERR_SENTLEN;
_GLOBAL unsigned short tcpERR_INVALID;
_GLOBAL unsigned short tcpERR_NOT_CONNECTED;
_GLOBAL unsigned long tcpSO_LINGER_SET;
