/* Automation Studio generated header file */
/* Do not edit ! */
/* CControl  */

#ifndef _CCONTROL_
#define _CCONTROL_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct fbCControlWitterung
{
	/* VAR_INPUT (analog) */
	unsigned long MaterialfeuchteIst;
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
	/* VAR_OUTPUT (analog) */
	unsigned char StufeAktuell;
	unsigned long SchlechtwetterPulszeit;
	unsigned long SchlechtwetterPausezeit;
	/* VAR (analog) */
	unsigned char i;
	float SaettigungsdefizitIst;
	struct TON TON_SchrittWitterung;
	unsigned char curStep;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit SensorFrischluftVhd;
	plcbit SensorDachluftVhd;
	plcbit SensorTrockenluftVhd;
	/* VAR_OUTPUT (digital) */
	plcbit WetterIstGut;
	plcbit WetterIstSchlecht;
	/* VAR (digital) */
	plcbit loc_WetterIstGut;
	plcbit loc_WetterIstSchlecht;
	plcbit stateEntry;
} fbCControlWitterung_typ;
#else
/* Data type fbCControlWitterung not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbCControlWitterung(struct fbCControlWitterung* inst);


#ifdef __cplusplus
};
#endif
#endif /* _CCONTROL_ */

