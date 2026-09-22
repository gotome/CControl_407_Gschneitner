/* Automation Studio generated header file */
/* Do not edit ! */
/* LaEntfV2 1.00.0 */

#ifndef _LAENTFV2_
#define _LAENTFV2_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _LaEntfV2_VERSION
#define _LaEntfV2_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct fbEntfOelsumpfheiz
{
	/* VAR_INPUT (analog) */
	float EintrittTemp;
	float parTempOelsumpfheizungAus;
	float parTempOelsumpfheizungEin;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit StatusSensorEintrittOk;
	/* VAR_OUTPUT (digital) */
	plcbit OelsumpfheizungEin;
} fbEntfOelsumpfheiz_typ;

typedef struct fbEntfKompressor
{
	/* VAR_INPUT (analog) */
	float EintrittFeuchte;
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
	/* VAR_OUTPUT (analog) */
	float DrehzahlOut;
	unsigned char curStep;
	/* VAR (analog) */
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
	/* VAR_INPUT (digital) */
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
	/* VAR_OUTPUT (digital) */
	plcbit FreigabeKompressorOut;
	plcbit StoerungOut;
	plcbit AbtauungAktiv;
	plcbit MagnetventilOut;
	plcbit loc_StatusFeuchteOk;
	plcbit FehlerPumpdown;
	plcbit StandbyKlappenumsch;
	/* VAR (digital) */
	plcbit stateEntry;
	plcbit sekTick;
} fbEntfKompressor_typ;

typedef struct fbEntfFremd
{
	/* VAR_INPUT (analog) */
	unsigned long parVerzStoerung;
	unsigned long parEinschaltverzKompressor;
	unsigned long parVerzBetriebEntfeuchter;
	/* VAR (analog) */
	struct TON TON_Stoerung;
	struct TON TON_VerzBetriebsmeldung;
	unsigned char curStep;
	unsigned char nextStep;
	struct TON TON_Kompressor;
	unsigned char lastStep;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit StoerungIn;
	plcbit QuitFehler;
	plcbit Dauerbetrieb;
	plcbit Automatik;
	plcbit BetriebsmldgVentilator;
	plcbit BetriebsmldgEntfeuchter;
	plcbit WitterungIstSchlecht;
	/* VAR_OUTPUT (digital) */
	plcbit StoerungOut;
	plcbit FehlerBetriebsmldg;
	plcbit FreigabeKompressorOut;
	/* VAR (digital) */
	plcbit stateEntry;
} fbEntfFremd_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbEntfOelsumpfheiz(struct fbEntfOelsumpfheiz* inst);
_BUR_PUBLIC void fbEntfKompressor(struct fbEntfKompressor* inst);
_BUR_PUBLIC void fbEntfFremd(struct fbEntfFremd* inst);


#ifdef __cplusplus
};
#endif
#endif /* _LAENTFV2_ */

