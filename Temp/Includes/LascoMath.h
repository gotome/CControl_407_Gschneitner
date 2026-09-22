/* Automation Studio generated header file */
/* Do not edit ! */
/* LascoMath 1.00.0 */

#ifndef _LASCOMATH_
#define _LASCOMATH_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _LascoMath_VERSION
#define _LascoMath_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define CONST_MATH_DRUCK_MEERESHOEHE 1013.25f
 #define CONST_MATH_MAX_VALUE 1e+07f
 #define CONST_MATH_LUFTDRUCK 94520.0f
 #define CONST_MATH_GASKONSTANTE 287.0f
 #define CONST_MATH_TEMP_NORM 21.0f
 #define CONST_MATH_FAKTOR_DEBIMO 0.816f
#else
 _GLOBAL_CONST float CONST_MATH_DRUCK_MEERESHOEHE;
 _GLOBAL_CONST float CONST_MATH_MAX_VALUE;
 _GLOBAL_CONST float CONST_MATH_LUFTDRUCK;
 _GLOBAL_CONST float CONST_MATH_GASKONSTANTE;
 _GLOBAL_CONST float CONST_MATH_TEMP_NORM;
 _GLOBAL_CONST float CONST_MATH_FAKTOR_DEBIMO;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct fbMathLuft
{
	/* VAR_INPUT (analog) */
	float LuftTemperatur;
	float LuftRelFeuchte;
	float MeterUeberAdria;
	/* VAR_OUTPUT (analog) */
	float LuftAbsoluteFeuchteSatt;
	float LuftAbsoluteFeuchte_g_m3;
	float LuftdruckUmgebung;
	float LuftDichte;
	float LuftAbsoluteFeuchte_g_kg;
	float LuftDampfdruckSatt;
	float LuftDampfdruckH2O;
	float TaupunktTemp;
	float LuftSaettigungsdefizit;
	/* VAR (analog) */
	float loc_Taupunkttemp;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
} fbMathLuft_typ;

typedef struct fbMathTrGutGew
{
	/* VAR_INPUT (analog) */
	float Boxenflaeche;
	float FuellhoeheTrockengut;
	float GewichtProBallen;
	float AnzahlBallen;
	float FeuchteBeiStart;
	float FeuchteEnde;
	unsigned char Trocknungsgut;
	float WasserentzugProStunde;
	float KorrekturWertFeuchte;
	unsigned long RichtzeitAktStufeTage;
	float* WasserentzugSeitStart;
	float SpezGewichtUser;
	/* VAR_OUTPUT (analog) */
	float FeuchteAktuell;
	float TrockengutGewichtAktuell;
	float TrockengutSpezGewicht;
	float TrockengutGewichtStart;
	float TrockengutGewichtSubstanz;
	float TrockengutGewichtEnde;
	float TrockengutWasserentzug;
	float RestgewichtWasser;
	/* VAR (analog) */
	float loc_TrockengutGewichtEnde;
	float temp2;
	float temp1;
	unsigned long RichtzeitAktStufeStunden;
	float TeilungFeuchteRicht;
	float KorrekturWertFeuchteRicht;
	float FeuchteBeiStartMEM;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Anlagentyp;
	plcbit VentilatorInBetrieb;
	plcbit sekTick;
	plcbit CmdKorrekturFeuchte;
	plcbit KeinStroemungsfuehler;
	plcbit Automatikbetrieb;
	plcbit stdTick;
	/* VAR (digital) */
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit loc_cmdKorrekturFeuchte;
	plcbit zzEdge00003;
	plcbit firstInit;
	plcbit CmdKorrekturFeuchteRicht;
	plcbit zzEdge00004;
} fbMathTrGutGew_typ;

typedef struct fbMathTrLftMenge
{
	/* VAR_INPUT (analog) */
	float DrehzVent1;
	float DrehzVent2;
	float Luftgeschw;
	float LuftkanalQuerschnitt;
	float ZuluftSattDefizit;
	float OffsetWasserentzug;
	/* VAR_OUTPUT (analog) */
	float LuftmengeAktuell;
	float WasserentzugProStunde;
	/* VAR (analog) */
	float loc_DrehzVerhaeltnis;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Ventilator1Betrieb;
	plcbit Ventilator2Betrieb;
	plcbit DrehzRegelungAktiv;
	plcbit Ventilator12FixDrehzahl;
	plcbit Ventilator2Manuell;
	plcbit ZweiBoxenSystem;
} fbMathTrLftMenge_typ;

typedef struct fbMathTrLftDruck
{
	/* VAR_INPUT (analog) */
	float TrockenluftDruck;
	/* VAR_OUTPUT (analog) */
	float LuftDruck_mmWS;
	float LuftDruck_mbar;
	float LuftDruck_bar;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
} fbMathTrLftDruck_typ;

typedef struct fbMathWetter
{
	/* VAR_INPUT (analog) */
	float SattDefizitRezept;
	float SattDefizitAktuell;
	float HystereseUmschaltung;
	unsigned long ZeitVerzUmschaltung;
	/* VAR (analog) */
	struct TOF TOF_WetterGut;
	struct TON TON_WetterSchlecht;
	struct TON TON_WetterGut;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	/* VAR_OUTPUT (digital) */
	plcbit WetterGut;
	plcbit WetterMittel;
	plcbit WetterSchlecht;
	/* VAR (digital) */
	plcbit loc_WetterGut;
	plcbit loc_WetterSchlecht;
} fbMathWetter_typ;

typedef struct fbMathMessblende
{
	/* VAR_INPUT (analog) */
	float TemperaturAktuell;
	float DifferenzdruckMessblende;
	float Kanalquerschnitt;
	float LuftgeschwindigkeitSensor;
	/* VAR_OUTPUT (analog) */
	float LuftdichteAktuell;
	float LuftgeschwindigkeitAktuell;
	float VolumenstromAktuell;
	float LuftdichteNorm;
	float LuftgeschwindigkeitNorm;
	float VolumenstromNorm;
	float VolumenstromVergleich;
	/* VAR_INPUT (digital) */
	plcbit Enable;
} fbMathMessblende_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbMathLuft(struct fbMathLuft* inst);
_BUR_PUBLIC void fbMathTrGutGew(struct fbMathTrGutGew* inst);
_BUR_PUBLIC void fbMathTrLftMenge(struct fbMathTrLftMenge* inst);
_BUR_PUBLIC void fbMathTrLftDruck(struct fbMathTrLftDruck* inst);
_BUR_PUBLIC void fbMathWetter(struct fbMathWetter* inst);
_BUR_PUBLIC void fbMathMessblende(struct fbMathMessblende* inst);


#ifdef __cplusplus
};
#endif
#endif /* _LASCOMATH_ */

