/* Automation Studio generated header file */
/* Do not edit ! */
/* LascoBoxen 1.00.0 */

#ifndef _LASCOBOXEN_
#define _LASCOBOXEN_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _LascoBoxen_VERSION
#define _LascoBoxen_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum enumStellungKlappenBoxen
{	FBBOX_NICHT_VERWENDET = 0,
	FBBOX_GESCHLOSSEN = 1,
	FBBOX_GEOEFFNET = 2
} enumStellungKlappenBoxen;

typedef struct typBoxenLuftmengenIn
{	float GrundflaecheBox;
	plcbit BoxIstAktiv;
	plcbit Ventilator1;
	plcbit Ventilator2;
} typBoxenLuftmengenIn;

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

typedef struct typKonfigurationBoxenIn
{	plcbit Ventilator1;
	plcbit Ventilator2;
	plcbit Luftentfeuchter;
	plcbit Warmluftofen;
	plcbit Heizregister;
	plcbit Scheitholzofen;
	enum enumStellungKlappenBoxen StellungKlappe1;
	enum enumStellungKlappenBoxen StellungKlappe2;
	enum enumStellungKlappenBoxen StellungKlappe3;
	enum enumStellungKlappenBoxen StellungKlappe4;
	enum enumStellungKlappenBoxen StellungKlappe5;
	enum enumStellungKlappenBoxen StellungKlappe6;
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

typedef struct fbBoxenKonfig
{
	/* VAR_INPUT (analog) */
	unsigned char StundeAktuell;
	struct typKonfigurationBoxenIn Box1In;
	struct typKonfigurationBoxenIn Box2In;
	struct typKonfigurationBoxenIn Box3In;
	struct typKonfigurationBoxenIn Box4In;
	struct typKonfigurationBoxenIn Box5In;
	struct typKonfigurationBoxenIn Box6In;
	/* VAR_OUTPUT (analog) */
	struct typKonfigurationBoxenOut Box1Out;
	struct typKonfigurationBoxenOut Box2Out;
	struct typKonfigurationBoxenOut Box3Out;
	struct typKonfigurationBoxenOut Box4Out;
	struct typKonfigurationBoxenOut Box5Out;
	struct typKonfigurationBoxenOut Box6Out;
	/* VAR (analog) */
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox1;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox2;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox3;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox4;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox5;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox6;
	signed short i;
	/* VAR_INPUT (digital) */
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
	/* VAR_OUTPUT (digital) */
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
	/* VAR (digital) */
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
} fbBoxenKonfig_typ;

typedef struct fbBoxenKlappenanst
{
	/* VAR_INPUT (analog) */
	unsigned long LaufzeitOeffnen;
	unsigned long LaufzeitSchliessen;
	/* VAR (analog) */
	unsigned char step;
	struct TON TON_Laufzeit;
	struct TON TON_AnzVerz;
	/* VAR_INPUT (digital) */
	plcbit Stoerung;
	plcbit QuitFehler;
	plcbit Oeffnen;
	plcbit Schliessen;
	plcbit EndlageOffen;
	plcbit EndlageGeschl;
	plcbit EndlagenVhd;
	/* VAR_OUTPUT (digital) */
	plcbit OeffnenOut;
	plcbit SchliessenOut;
	plcbit FehlerLaufzeitOeffnen;
	plcbit FehlerLaufzeitSchliessen;
	plcbit KlappeIstOffenOut;
	plcbit KlappeIstGeschlOut;
	/* VAR (digital) */
	plcbit stateEntry;
} fbBoxenKlappenanst_typ;

typedef struct fbBoxenVentKlappen
{
	/* VAR_INPUT (analog) */
	float DrzVent1UmschMitLuftaufb;
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
	/* VAR_OUTPUT (analog) */
	float DrehzahlVent1Out;
	float DrehzahlVent2Out;
	unsigned char curStep;
	unsigned long RestAnlaufverzoegerung;
	/* VAR (analog) */
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
	/* VAR_INPUT (digital) */
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
	/* VAR_OUTPUT (digital) */
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
	/* VAR (digital) */
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
} fbBoxenVentKlappen_typ;

typedef struct fbBoxenAbluftkl
{
	/* VAR_INPUT (analog) */
	unsigned long Laufzeit;
	float AbluftFeuchteIst;
	float Hysterese;
	float AbluftFeuchteSoll;
	/* VAR (analog) */
	unsigned char step;
	struct TON TON_Laufzeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Quit;
	plcbit Automatik;
	plcbit EndlageOffen;
	plcbit EndlageGeschl;
	plcbit Oeffnen;
	plcbit Schliessen;
	/* VAR_OUTPUT (digital) */
	plcbit OeffnenOut;
	plcbit SchliessenOut;
	plcbit FehlerLaufzeit;
	/* VAR (digital) */
	plcbit stateEntry;
} fbBoxenAbluftkl_typ;

typedef struct fbBoxenAbluftvent
{
	/* VAR_INPUT (analog) */
	float DrehzahlMin;
	float DrehzahlMax;
	float RampeUp;
	float RampeDown;
	float AbluftFeuchteIst;
	float Hysterese;
	float AbluftFeuchteSoll;
	float DrehzahlSoll;
	/* VAR_OUTPUT (analog) */
	float DrehzahlVentilatorOut;
	/* VAR (analog) */
	unsigned char step;
	struct fbLascoFU fbFuAbluftventilator;
	struct fbLascoEUhr fbLascoEUhr_0;
	struct fbLascoZdxx fbLascoZdxx_0;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Automatik;
	plcbit Ein;
	plcbit VentilatorInBetrieb;
	plcbit QuitFehler;
	/* VAR_OUTPUT (digital) */
	plcbit FehlerOut;
	plcbit FreigabeVentilatorOut;
	/* VAR (digital) */
	plcbit stateEntry;
	plcbit sekTick;
} fbBoxenAbluftvent_typ;

typedef struct fbBoxenUmschaltung
{
	/* VAR_INPUT (analog) */
	float AbluftTemp;
	float FrischluftTemp;
	float DachluftTemp;
	float DifferenzTempUmschaltung;
	float FrischlDachlTempUmschaltung;
	unsigned long Umschaltverz;
	float Hysterese;
	/* VAR (analog) */
	unsigned char step;
	struct TON TON_Umluft;
	struct TON TON_Frischluft;
	/* VAR_INPUT (digital) */
	plcbit SensorFrischluftVhd;
	plcbit SensorDachluftVhd;
	plcbit SensorAbluftVhd;
	plcbit StatusSensorDachluftOk;
	plcbit StatusSensorFrischluftOk;
	plcbit StatusSensorAbluftOk;
	plcbit Freigabe;
	/* VAR_OUTPUT (digital) */
	plcbit FrischluftbetriebOut;
	plcbit UmluftbetriebOut;
	/* VAR (digital) */
	plcbit stateEntry;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit zzEdge00003;
	plcbit zzEdge00004;
	plcbit zzEdge00005;
	plcbit zzEdge00006;
	plcbit zzEdge00007;
} fbBoxenUmschaltung_typ;

typedef struct fbBoxenWLO
{
	/* VAR_INPUT (analog) */
	float FrischluftSattDefizitIst;
	float FrischluftSattDefizitSoll;
	float Hysterese;
	unsigned long UmschaltverzWitterung;
	float WarmlufttemperaturVorgabe;
	unsigned long VerzBetriebsmeldung;
	unsigned long Auskuehlzeit;
	/* VAR_OUTPUT (analog) */
	float WarmlufttempSollOut;
	unsigned long RestAuskuehlzeit;
	/* VAR (analog) */
	unsigned char step;
	struct TON TON_VerzBetriebsmeldung;
	struct TOF TOF_Auskuehlzeit;
	struct TON TON_WetterIstGut;
	struct TON TON_WetterIstSchlecht;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Automatikbetrieb;
	plcbit Dauerbetrieb;
	plcbit FehlerSensorAussenluft;
	plcbit OptionBetriebsmldgVhd;
	plcbit BetriebsmeldungWarmluftofen;
	plcbit QuitFehler;
	plcbit WetterIstSchlecht;
	/* VAR_OUTPUT (digital) */
	plcbit FreigabeWarmluftofenOut;
	plcbit FehlerBetriebsmeldungOut;
	plcbit FehlerSensorAussenluftOut;
	plcbit WarmluftofenAktiv;
	/* VAR (digital) */
	plcbit stateEntry;
	plcbit loc_WetterIstSchlecht;
	plcbit loc_WetterIstGut;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
} fbBoxenWLO_typ;

typedef struct fbBoxenHeizreg
{
	/* VAR_INPUT (analog) */
	float DrehzahlHeizregisterSoll;
	float FrischluftSattDefizitIst;
	float FrischluftSattDefizitSoll;
	float Hysterese;
	unsigned long UmschaltverzWitterung;
	/* VAR_OUTPUT (analog) */
	float DrehzahlHeizregisterOut;
	/* VAR (analog) */
	unsigned char step;
	struct TON TON_WetterIstGut;
	struct TON TON_WetterIstSchlecht;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit QuitFehler;
	plcbit Automatikbetrieb;
	plcbit FehlerSensorAussenluft;
	plcbit Dauerbetrieb;
	plcbit WetterIstSchlecht;
	/* VAR_OUTPUT (digital) */
	plcbit FehlerOut;
	plcbit FreigabeHeizregisterOut;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit stateEntry;
	plcbit loc_WetterIstSchlecht;
	plcbit loc_WetterIstGut;
} fbBoxenHeizreg_typ;

typedef struct fbBoxenNotstrom
{
	/* VAR_INPUT (analog) */
	unsigned long VerzBetriebsmeldung;
	unsigned long Vorlaufzeit;
	unsigned long Nachlaufzeit;
	/* VAR_OUTPUT (analog) */
	unsigned long RestVorlaufzeit;
	unsigned long RestNachlaufzeit;
	/* VAR (analog) */
	struct TON TON_VerzBetriebsmeldung;
	struct TON TON_Vorlaufzeit;
	struct TOF TOF_Nachlaufzeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit BetriebsmldgNotstromaggregat;
	plcbit NotstromaggregatAngefordert;
	plcbit QuitFehler;
	/* VAR_OUTPUT (digital) */
	plcbit FreigabeNotstromaggregatOut;
	plcbit FehlerOut;
	plcbit NotstromBereitOut;
} fbBoxenNotstrom_typ;

typedef struct fbBoxenSHO
{
	/* VAR_INPUT (analog) */
	unsigned long Auskuehlzeit;
	/* VAR_OUTPUT (analog) */
	unsigned long RestAuskuehlzeit;
	/* VAR (analog) */
	struct TOF TOF_Auskuehlzeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Betriebsmeldung;
	/* VAR_OUTPUT (digital) */
	plcbit ScheitholzofenAktiv;
} fbBoxenSHO_typ;

typedef struct fbBoxenLuftmengen
{
	/* VAR_INPUT (analog) */
	struct typBoxenLuftmengenIn Box1;
	struct typBoxenLuftmengenIn Box2;
	struct typBoxenLuftmengenIn Box3;
	struct typBoxenLuftmengenIn Box4;
	struct typBoxenLuftmengenIn Box5;
	struct typBoxenLuftmengenIn Box6;
	float LuftmengeSollProM2FrischlVent1;
	float LuftmengeSollProM2FrischlVent2;
	float LuftmengeSollProM2UmluftVent1;
	float LuftmengeSollProM2UmluftVent2;
	float RegisterflaecheEntfeuchter;
	float LuftgeschwEntfeuchterMin;
	float LuftgeschwEntfeuchterMax;
	/* VAR_OUTPUT (analog) */
	float LuftmengeSollVent1Out;
	float LuftmengeSollVent2Out;
	/* VAR (analog) */
	float loc_LuftmengeSollVent1;
	float loc_LuftmengeSollVent2;
	float loc_MinLuftmengeMitEntfeuchter;
	float loc_MaxLuftmengeMitEntfeuchter;
	/* VAR_INPUT (digital) */
	plcbit FrischluftbetriebAktiv;
	plcbit UmluftbetriebAktiv;
	plcbit EntfeuchterInBetrieb;
} fbBoxenLuftmengen_typ;

typedef struct fbRestzeit
{
	/* VAR_INPUT (analog) */
	unsigned char AktuelleStunde;
	unsigned char AktuelleMinute;
	plcbit (*ZeitfensterIn)[24];
	/* VAR_OUTPUT (analog) */
	unsigned short RestzeitStundenOut;
	unsigned short RestzeitMinutenOut;
	/* VAR (analog) */
	unsigned short loc_MinutenRestTag;
	signed long loc_Aenderung;
	unsigned char i;
	unsigned char loc_StundeEndeZeitfTag;
	unsigned short loc_MinutenRestFolgetag;
	unsigned char ii;
	unsigned char loc_StundeEndeZeitfFolgetag;
	unsigned short loc_MinutenRestGesamt;
	unsigned short loc_RestzeitStunden;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	/* VAR_OUTPUT (digital) */
	plcbit ZeitfensterAktiv;
	/* VAR (digital) */
	plcbit MEM_ZeitfensterIn;
	plcbit loc_firstInitLauf;
	plcbit loc_firstInitPause;
} fbRestzeit_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbBoxenKonfig(struct fbBoxenKonfig* inst);
_BUR_PUBLIC void fbBoxenVentKlappen(struct fbBoxenVentKlappen* inst);
_BUR_PUBLIC void fbBoxenKlappenanst(struct fbBoxenKlappenanst* inst);
_BUR_PUBLIC void fbBoxenAbluftkl(struct fbBoxenAbluftkl* inst);
_BUR_PUBLIC void fbBoxenAbluftvent(struct fbBoxenAbluftvent* inst);
_BUR_PUBLIC void fbBoxenUmschaltung(struct fbBoxenUmschaltung* inst);
_BUR_PUBLIC void fbBoxenWLO(struct fbBoxenWLO* inst);
_BUR_PUBLIC void fbBoxenHeizreg(struct fbBoxenHeizreg* inst);
_BUR_PUBLIC void fbBoxenNotstrom(struct fbBoxenNotstrom* inst);
_BUR_PUBLIC void fbBoxenSHO(struct fbBoxenSHO* inst);
_BUR_PUBLIC void fbBoxenLuftmengen(struct fbBoxenLuftmengen* inst);
_BUR_PUBLIC void fbRestzeit(struct fbRestzeit* inst);


#ifdef __cplusplus
};
#endif
#endif /* _LASCOBOXEN_ */

