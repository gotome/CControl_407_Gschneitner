/* Automation Studio generated header file */
/* Do not edit ! */
/* LascoUtil 1.00.0 */

#ifndef _LASCOUTIL_
#define _LASCOUTIL_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _LascoUtil_VERSION
#define _LascoUtil_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "LoopConR.h"
#endif
#ifdef _SG4
		#include "LoopConR.h"
#endif
#ifdef _SGC
		#include "LoopConR.h"
#endif


/* Datatypes and datatypes of function blocks */
typedef enum enumStepsBskUeberw
{	BSK_WARTEN = 0,
	BSK_OEFFNEN = 1,
	BSK_OEFFNEN_FEHLER = 2,
	BSK_SCHLIESSEN = 3,
	BSK_SCHLIESSEN_FEHLER = 4,
	BSK_STOERUNG = 5
} enumStepsBskUeberw;

typedef struct WoPrg_type
{	plcbit HZ1_Enable;
	plcbit HZ2_Enable;
	float HZ1_Std_Ein;
	float HZ1_Min_Ein;
	float HZ1_Std_Aus;
	float HZ1_Min_Aus;
	float HZ2_Std_Ein;
	float HZ2_Min_Ein;
	float HZ2_Std_Aus;
	float HZ2_Min_Aus;
} WoPrg_type;

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

typedef struct fbLascoAutoRuecklauf
{
	/* VAR_INPUT (analog) */
	unsigned long ImpulseVorBisRueck;
	unsigned long Ruecklaufzeit;
	unsigned long VerzUmschaltung;
	unsigned long LaufzeitEinschubZuendung;
	float MaxLaufzeitVor;
	/* VAR (analog) */
	unsigned long ctEinschuebeSeitRuecklauf;
	struct TON TON_Umschaltverz;
	struct TOF TOF_Ruecklauf;
	unsigned char loc_curStep;
	unsigned long ctLaufzeitEinschub1;
	unsigned long ctLaufzeitEinschubVor;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit ImpulsVor;
	plcbit Zuendphase;
	plcbit Heizphase;
	plcbit sekTick;
	/* VAR_OUTPUT (digital) */
	plcbit MotorRueck;
	plcbit MotorVor;
	/* VAR (digital) */
	plcbit loc_RuecklaufErforderlich;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit stateEntry;
	plcbit loc_RueckwaertsOk;
	plcbit zzEdge00003;
	plcbit zzEdge00004;
	plcbit zzEdge00005;
	plcbit zzEdge00006;
} fbLascoAutoRuecklauf_typ;

typedef struct fbLascoBskUeberw
{
	/* VAR_INPUT (analog) */
	unsigned long MaxVersucheZu;
	unsigned long MaxVersucheAuf;
	unsigned long LaufzeitZu;
	unsigned long LaufzeitAuf;
	/* VAR_OUTPUT (analog) */
	unsigned long ctVersucheAuf;
	unsigned long ctVersucheZu;
	/* VAR (analog) */
	struct TON TON_Laufzeit;
	enum enumStepsBskUeberw lastStep;
	enum enumStepsBskUeberw nextStep;
	enum enumStepsBskUeberw curStep;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit FreigabeOeffnen;
	plcbit FreigabeSchliessen;
	plcbit diKlappeGeschlossen;
	plcbit diKlappeGeoeffnet;
	plcbit Quit;
	/* VAR_OUTPUT (digital) */
	plcbit doKlappeOeffnen;
	plcbit Stoerung;
	/* VAR (digital) */
	plcbit stateEntry;
	plcbit loc_KlappeIstOffen;
	plcbit loc_KlappeIstGeschlossen;
} fbLascoBskUeberw_typ;

typedef struct fbLascoEUhr
{
	/* VAR_OUTPUT (analog) */
	signed short StdMin;
	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
	/* VAR (analog) */
	struct Zeit_type Echtzeit;
	struct DTGetTime DTGetTime_0;
	plcdt DateTime;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
} fbLascoEUhr_typ;

typedef struct fbLascoTON
{
	/* VAR_INPUT (analog) */
	float Zeit;
	/* VAR (analog) */
	float Elapsed;
	/* VAR_INPUT (digital) */
	plcbit IN;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} fbLascoTON_typ;

typedef struct fbLascoTOF
{
	/* VAR_INPUT (analog) */
	float Zeit;
	/* VAR (analog) */
	float Elapsed;
	/* VAR_INPUT (digital) */
	plcbit IN;
	plcbit Reset;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} fbLascoTOF_typ;

typedef struct fbLascoTOG
{
	/* VAR_INPUT (digital) */
	plcbit IN;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
	/* VAR (digital) */
	plcbit ToggImp;
} fbLascoTOG_typ;

typedef struct fbLascoZdxx
{
	/* VAR_INPUT (analog) */
	float IN;
	/* VAR (analog) */
	float MEM;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} fbLascoZdxx_typ;

typedef struct fbLascoZbFrg
{
	/* VAR_INPUT (analog) */
	float StartZeit;
	float StoppZeit;
	/* VAR (analog) */
	struct fbLascoEUhr EUhr;
	float AktZeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	/* VAR_OUTPUT (digital) */
	plcbit FreigZeitfenster;
} fbLascoZbFrg_typ;

typedef struct fbLascoBstd
{
	/* VAR_INPUT (analog) */
	unsigned long* Stunden;
	/* VAR (analog) */
	unsigned char Minuten;
	/* VAR_INPUT (digital) */
	plcbit Aktiv;
	plcbit minTick;
	plcbit Reset;
} fbLascoBstd_typ;

typedef struct fbLascoBmin
{
	/* VAR_INPUT (analog) */
	unsigned char* Minuten;
	/* VAR (analog) */
	unsigned char Sekunden;
	/* VAR_INPUT (digital) */
	plcbit Aktiv;
	plcbit sekTick;
	plcbit Reset;
} fbLascoBmin_typ;

typedef struct fbLascoStdMin
{
	/* VAR_INPUT (analog) */
	unsigned char* Minuten;
	unsigned long* Stunden;
	/* VAR_INPUT (digital) */
	plcbit Reset;
} fbLascoStdMin_typ;

typedef struct fbLascoSrvcInterv
{
	/* VAR_INPUT (analog) */
	unsigned long SrvcIntervall;
	unsigned long* ZeitBisSrvc;
	/* VAR_INPUT (digital) */
	plcbit Aktiv;
	plcbit Tick;
	plcbit SrvcReset;
	/* VAR_OUTPUT (digital) */
	plcbit SrvcErforderl;
	/* VAR (digital) */
	plcbit zzEdge00000;
} fbLascoSrvcInterv_typ;

typedef struct fbLascoBrStfLst
{
	/* VAR_INPUT (analog) */
	float LeistungAkt;
	unsigned long* Leistung_MWh;
	float* Leistung_kWh;
	/* VAR (analog) */
	float LeistungSek;
	/* VAR_INPUT (digital) */
	plcbit sekTick;
	plcbit Reset;
} fbLascoBrStfLst_typ;

typedef struct fbLascoWoPrg
{
	/* VAR_INPUT (analog) */
	struct WoPrg_type WoPrg[8];
	/* VAR_OUTPUT (analog) */
	unsigned char WoTag;
	/* VAR (analog) */
	struct fbLascoEUhr EUhr;
	float StartZeit_1;
	float StopZeit_1;
	float StartZeit_2;
	float StopZeit_2;
	float AktZeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	/* VAR_OUTPUT (digital) */
	plcbit WoPrgFreigabe;
	/* VAR (digital) */
	plcbit FreigabeZeit_1;
	plcbit FreigabeZeit_2;
} fbLascoWoPrg_typ;

typedef struct fbLascoDrzuebw
{
	/* VAR_INPUT (analog) */
	float Zeit;
	/* VAR (analog) */
	unsigned char nextStep;
	unsigned char curStep;
	float ElapsedTime;
	/* VAR_INPUT (digital) */
	plcbit Motor;
	plcbit Impuls;
	plcbit Tick;
	plcbit Quit;
	/* VAR_OUTPUT (digital) */
	plcbit Fehler;
} fbLascoDrzuebw_typ;

typedef struct fbLascoFehl
{
	/* VAR_INPUT (analog) */
	float VerzZeit;
	unsigned char Mode;
	/* VAR (analog) */
	float Counter;
	/* VAR_INPUT (digital) */
	plcbit FehlerIn;
	plcbit Quit;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit FehlerOut;
} fbLascoFehl_typ;

typedef struct fbLascoFept
{
	/* VAR_INPUT (analog) */
	float IN;
	float VerzZeit;
	/* VAR (analog) */
	float Counter;
	/* VAR_INPUT (digital) */
	plcbit Quit;
	plcbit Enable;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} fbLascoFept_typ;

typedef struct fbLascoPuge
{
	/* VAR_INPUT (analog) */
	float ZeitPuls;
	float ZeitPause;
	/* VAR_OUTPUT (analog) */
	float RestzeitPuls;
	float RestzeitPause;
	/* VAR (analog) */
	unsigned char currStep;
	float CounterPuls;
	float CounterPause;
	unsigned char nextStep;
	/* VAR_INPUT (digital) */
	plcbit StartMitPuls;
	plcbit StartMitPause;
	plcbit Tick;
	plcbit Reset;
	/* VAR_OUTPUT (digital) */
	plcbit PulsQ;
	plcbit PauseQ;
} fbLascoPuge_typ;

typedef struct fbLascoLstgStell
{
	/* VAR_INPUT (analog) */
	float GesLeistungMin;
	float GesLeistungMax;
	float EinschubPulsMin;
	float EinschubPulsMax;
	float SaugzugDrehzMin;
	float SaugzugDrehzMax;
	float PrimaerStellMin;
	float PrimaerStellMax;
	float EinschubPauseMin;
	float EinschubPauseMax;
	float SekundaerStellMin;
	float SekundaerStellMax;
	float GesLeistungSoll;
	float RostPulsMin;
	float RostPulsMax;
	float RostPauseMin;
	float RostPauseMax;
	float ReziStellMin;
	float ReziStellMax;
	/* VAR_OUTPUT (analog) */
	unsigned long EinschubPulsSoll;
	unsigned long EinschubPauseSoll;
	float PrimaerStellSoll;
	float SekundaerStellSoll;
	float SaugzugDrehzSoll;
	float ReziStellSoll;
	unsigned long RostPulsSoll;
	unsigned long RostPauseSoll;
	/* VAR (analog) */
	struct LCRLimScal ScalDrehzSaugzug;
	struct LCRLimScal ScalStellPrimaer;
	struct LCRLimScal ScalStellSekundaer;
	struct LCRLimScal ScalPulsEinschub;
	struct LCRLimScal ScalPauseEinschub;
	struct LCRLimScal ScalPulsRost;
	struct LCRLimScal ScalPauseRost;
	struct LCRLimScal ScalStellRezi;
	/* VAR_INPUT (digital) */
	plcbit Enable;
} fbLascoLstgStell_typ;

typedef struct fbLascoLstRamp
{
	/* VAR_INPUT (analog) */
	float LeistungStart;
	float LeistungSoll;
	float AnstiegProMinute;
	float* LeistungOut;
	/* VAR (analog) */
	float AnstiegProSekunde;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit sekTick;
	plcbit Pause;
	/* VAR_OUTPUT (digital) */
	plcbit Fertig;
	/* VAR (digital) */
	plcbit zzEdge00000;
} fbLascoLstRamp_typ;

typedef struct fbLascoZund
{
	/* VAR_INPUT (analog) */
	float IstTemp;
	float SollTemp;
	float Zuendzeit;
	float Nachlaufzeit;
	/* VAR (analog) */
	struct fbLascoTON TON_Zuendzeit;
	struct fbLascoTOF TOF_Nachlaufzeit;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Zuendspule;
	plcbit ZuendungOK;
	plcbit ZuendungFehler;
	plcbit Zuendgeblaese;
} fbLascoZund_typ;

typedef struct fbLascoFU
{
	/* VAR_INPUT (analog) */
	float SollDrehzahl;
	float AnsprechZeitFU;
	float RampeUpSek;
	float RampeDownSek;
	float MaxDrehzahl;
	float MinDrehzahl;
	/* VAR_OUTPUT (analog) */
	float DrehzahlFU;
	/* VAR (analog) */
	struct fbLascoTON TON_Betriebsmeldung;
	struct LCRRamp LCRRamp_0;
	signed long RampDownMillis;
	signed long RampUpMillis;
	float IstDrehzahl;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit BetrMldg;
	plcbit Reset;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit BetriebFU;
	plcbit StoerungFU;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit InitDone;
	plcbit ResetDone;
	plcbit Init;
	plcbit zzEdge00003;
} fbLascoFU_typ;

typedef struct fbLascoZweiPunktAchse
{
	/* VAR_INPUT (analog) */
	float AnsprechZeit;
	float MinLaufZeit;
	/* VAR (analog) */
	struct fbLascoTON TON_Ansprechzeit;
	struct fbLascoTOF TOF_Laufzeit;
	struct fbLascoTON TON_AnsprechzeitZurueck;
	struct fbLascoTOF TOF_LaufzeitZurueck;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Vor;
	plcbit Zurueck;
	plcbit Stoerung;
	plcbit ESVor;
	plcbit ESZurueck;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Motor_Vor;
	plcbit Motor_Zurueck;
	plcbit Fehler;
	/* VAR (digital) */
	plcbit loc_Vor;
	plcbit loc_Zurueck;
} fbLascoZweiPunktAchse_typ;

typedef struct fbLascoStellachse
{
	/* VAR_INPUT (analog) */
	float SollStellung;
	float IstStellung;
	float Hysterese;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Stoerung;
	plcbit EsVor;
	plcbit EsZurueck;
	/* VAR_OUTPUT (digital) */
	plcbit MotorVor;
	plcbit MotorZurueck;
	plcbit Fehler;
} fbLascoStellachse_typ;

typedef struct fbLascoStellachseAnalog
{
	/* VAR_INPUT (analog) */
	float SollStellung;
	float IstStellung;
	float Hysterese;
	/* VAR_OUTPUT (analog) */
	float MotorStellung;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit EsVor;
	plcbit EsZurueck;
	plcbit Stoerung;
	/* VAR_OUTPUT (digital) */
	plcbit Fehler;
} fbLascoStellachseAnalog_typ;

typedef struct fbLascoStellachseDigital
{
	/* VAR_INPUT (analog) */
	float Sollstellung;
	float Oeffnungszeit;
	float Schliesszeit;
	float MinPosition;
	float MaxPosition;
	float MinImpulsdauer;
	/* VAR_OUTPUT (analog) */
	float IstPosition;
	/* VAR (analog) */
	struct LCRContinServo LCRContinServo_0;
	float WegProZeitAuf;
	float WegProZeitZu;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Referenz;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit ReferenzOk;
	plcbit MotorAuf;
	plcbit MotorZu;
	plcbit ReferenzAktiv;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit zzEdge00003;
} fbLascoStellachseDigital_typ;

typedef struct fbLascoWarmluftsteller
{
	/* VAR_INPUT (analog) */
	float IstTemperatur;
	float GrenzTemperatur;
	float Bezugszeit;
	float MinderungDRZ;
	float WLG1MinDRZ;
	float WLG2MinDRZ;
	float WLG1SollDRZ;
	float WLG2SollDRZ;
	/* VAR_OUTPUT (analog) */
	float WLG1DRZStell;
	float WLG2DRZStell;
	/* VAR (analog) */
	unsigned char curState;
	unsigned char nextState;
	float locDrehzahl1;
	float locDrehzahl2;
	struct fbLascoTON TON_WarmluftSteller;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Tick;
	/* VAR (digital) */
	plcbit stateEntry;
} fbLascoWarmluftsteller_typ;

typedef struct fbLascoFreilauf
{
	/* VAR_INPUT (analog) */
	float Stehzeit;
	float VerzFreilauf;
	float Freilaufzeit;
	signed short MaxVersuche;
	/* VAR (analog) */
	unsigned char curStep;
	unsigned char nextStep;
	struct fbLascoDrzuebw DRZWaechter;
	struct fbLascoTON TON_VerzRW;
	struct fbLascoTON TON_Freilaufzeit;
	signed short CounterVersuche;
	struct fbLascoTON TON_ResetCounter;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Tick;
	plcbit Impuls;
	plcbit Quit;
	/* VAR_OUTPUT (digital) */
	plcbit MotorVor;
	plcbit MotorZurueck;
	plcbit Fehler;
	/* VAR (digital) */
	plcbit stateEntry;
} fbLascoFreilauf_typ;

typedef struct fbLascoFuellst
{
	/* VAR_INPUT (analog) */
	float VerzZeit;
	/* VAR (analog) */
	unsigned long cKeineFlankeFs;
	/* VAR_INPUT (digital) */
	plcbit Fuellstand;
	plcbit EinschubEin;
	plcbit Quit;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit Fehler;
	/* VAR (digital) */
	plcbit zzEdge00000;
} fbLascoFuellst_typ;

typedef struct fbLascoWlg
{
	/* VAR_INPUT (analog) */
	float StartBeiTemp;
	float StopBeiTemp;
	float IstTemp;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Stoerung;
	/* VAR_OUTPUT (digital) */
	plcbit GeblaeseEin;
	plcbit Fehler;
} fbLascoWlg_typ;

typedef struct fbLascoBsk
{
	/* VAR_INPUT (analog) */
	unsigned long FahrzeitAuf;
	unsigned long FahrzeitZu;
	/* VAR (analog) */
	struct TON TON_FahrzeitAuf;
	struct TON TON_FahrzeitZu;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Oeffnen;
	plcbit KlappeIstOffen;
	plcbit KlappeIstGeschlossen;
	plcbit QuitFehler;
	plcbit Stoerung;
	/* VAR_OUTPUT (digital) */
	plcbit KlappeAuf;
	plcbit Fehler;
	plcbit FehlerFahrzeitAuf;
	plcbit FehlerFahrzeitZu;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit zzEdge00003;
} fbLascoBsk_typ;

typedef struct fbLascoTrend
{
	/* VAR_INPUT (analog) */
	float Eingangswert;
	float Zeitspanne;
	float MinAbweichung;
	/* VAR (analog) */
	float ctZeitspanne;
	float Mittelwert;
	double SummeWert;
	float MittelwertMEM;
	float Abweichung;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Tick;
	/* VAR_OUTPUT (digital) */
	plcbit TendenzSteigend;
	plcbit TendenzFallend;
} fbLascoTrend_typ;

typedef struct fbLascoTimerHand
{
	/* VAR_INPUT (analog) */
	float Zeit;
	/* VAR (analog) */
	float Elapsed;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Tick;
	plcbit HandEin;
	plcbit HandAus;
	/* VAR_OUTPUT (digital) */
	plcbit Q;
} fbLascoTimerHand_typ;

typedef struct fbLascoPugeV2
{
	/* VAR_INPUT (analog) */
	unsigned long ZeitPuls;
	unsigned long ZeitPause;
	/* VAR_OUTPUT (analog) */
	unsigned long RestzeitPause;
	unsigned long RestzeitPuls;
	/* VAR (analog) */
	unsigned char curStep;
	unsigned char nextStep;
	struct TON TON_Schrittzeit;
	/* VAR_INPUT (digital) */
	plcbit StartMitPuls;
	plcbit StartMitPause;
	/* VAR_OUTPUT (digital) */
	plcbit PulsOut;
	plcbit PauseOut;
	/* VAR (digital) */
	plcbit stateEntry;
} fbLascoPugeV2_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbLascoAutoRuecklauf(struct fbLascoAutoRuecklauf* inst);
_BUR_PUBLIC void fbLascoBskUeberw(struct fbLascoBskUeberw* inst);
_BUR_PUBLIC void fbLascoEUhr(struct fbLascoEUhr* inst);
_BUR_PUBLIC void fbLascoTON(struct fbLascoTON* inst);
_BUR_PUBLIC void fbLascoTOF(struct fbLascoTOF* inst);
_BUR_PUBLIC void fbLascoTOG(struct fbLascoTOG* inst);
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
_BUR_PUBLIC void fbLascoZbFrg(struct fbLascoZbFrg* inst);
_BUR_PUBLIC void fbLascoBstd(struct fbLascoBstd* inst);
_BUR_PUBLIC void fbLascoBmin(struct fbLascoBmin* inst);
_BUR_PUBLIC void fbLascoStdMin(struct fbLascoStdMin* inst);
_BUR_PUBLIC void fbLascoSrvcInterv(struct fbLascoSrvcInterv* inst);
_BUR_PUBLIC void fbLascoBrStfLst(struct fbLascoBrStfLst* inst);
_BUR_PUBLIC void fbLascoWoPrg(struct fbLascoWoPrg* inst);
_BUR_PUBLIC void fbLascoDrzuebw(struct fbLascoDrzuebw* inst);
_BUR_PUBLIC void fbLascoFehl(struct fbLascoFehl* inst);
_BUR_PUBLIC void fbLascoFept(struct fbLascoFept* inst);
_BUR_PUBLIC void fbLascoPuge(struct fbLascoPuge* inst);
_BUR_PUBLIC void fbLascoLstgStell(struct fbLascoLstgStell* inst);
_BUR_PUBLIC void fbLascoLstRamp(struct fbLascoLstRamp* inst);
_BUR_PUBLIC void fbLascoZund(struct fbLascoZund* inst);
_BUR_PUBLIC void fbLascoFU(struct fbLascoFU* inst);
_BUR_PUBLIC void fbLascoZweiPunktAchse(struct fbLascoZweiPunktAchse* inst);
_BUR_PUBLIC void fbLascoStellachse(struct fbLascoStellachse* inst);
_BUR_PUBLIC void fbLascoStellachseAnalog(struct fbLascoStellachseAnalog* inst);
_BUR_PUBLIC void fbLascoStellachseDigital(struct fbLascoStellachseDigital* inst);
_BUR_PUBLIC void fbLascoWarmluftsteller(struct fbLascoWarmluftsteller* inst);
_BUR_PUBLIC void fbLascoFreilauf(struct fbLascoFreilauf* inst);
_BUR_PUBLIC void fbLascoFuellst(struct fbLascoFuellst* inst);
_BUR_PUBLIC void fbLascoWlg(struct fbLascoWlg* inst);
_BUR_PUBLIC void fbLascoBsk(struct fbLascoBsk* inst);
_BUR_PUBLIC void fbLascoTrend(struct fbLascoTrend* inst);
_BUR_PUBLIC void fbLascoTimerHand(struct fbLascoTimerHand* inst);
_BUR_PUBLIC void fbLascoPugeV2(struct fbLascoPugeV2* inst);
_BUR_PUBLIC float funLascoMinss(float IN);


#ifdef __cplusplus
};
#endif
#endif /* _LASCOUTIL_ */

