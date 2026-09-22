/* Automation Studio generated header file */
/* Do not edit ! */
/* LascoReg 1.00.0 */

#ifndef _LASCOREG_
#define _LASCOREG_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _LascoReg_VERSION
#define _LascoReg_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define FBREG_MODUS_AUS 0U
 #define FBREG_MODUS_AUTO 1U
 #define FBREG_MODUS_MANUELL 102U
 #define FBREG_MODUS_OPEN 103U
 #define FBREG_MODUS_CLOSE 104U
 #define FBREG_MODUS_FREEZE 105U
#else
 _GLOBAL_CONST unsigned char FBREG_MODUS_AUS;
 _GLOBAL_CONST unsigned char FBREG_MODUS_AUTO;
 _GLOBAL_CONST unsigned char FBREG_MODUS_MANUELL;
 _GLOBAL_CONST unsigned char FBREG_MODUS_OPEN;
 _GLOBAL_CONST unsigned char FBREG_MODUS_CLOSE;
 _GLOBAL_CONST unsigned char FBREG_MODUS_FREEZE;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct fbRegPidReglerAllg
{
	/* VAR_INPUT (analog) */
	float Hysterese;
	float RampeMax;
	float WindupDaempfung;
	float P_Anteil;
	float AbschwaechungSollwert;
	float D_Filterzeit;
	float I_Anteil;
	float D_Anteil;
	float Aufschaltgroesse;
	unsigned char Mode;
	float Sollwert;
	float Istwert;
	float StellgroesseManuell;
	float StellgroesseMin;
	float StellgroesseMax;
	float RegelbereichMin;
	unsigned long Fehlerverzoegerung;
	float RegelbereichMax;
	/* VAR_OUTPUT (analog) */
	float Stellgroesse;
	float Regelabweichung;
	/* VAR (analog) */
	struct LCRPIDpara PID_Para;
	struct LCRPID PID;
	struct TON TON_FehlerverzoegerungMin;
	struct TON TON_FehlerverzoegerungMax;
	struct LCRLimScal LCRLimScal_0;
	/* VAR_INPUT (digital) */
	plcbit Freigabe;
	plcbit Invert;
	plcbit Hold_I;
	plcbit QuitFehler;
	/* VAR_OUTPUT (digital) */
	plcbit FehlerRegelbereichMin;
	plcbit FehlerRegelbereichMax;
	plcbit WarnungRegelbereichMin;
	plcbit WarnungRegelbereichMax;
} fbRegPidReglerAllg_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void fbRegPidReglerAllg(struct fbRegPidReglerAllg* inst);


#ifdef __cplusplus
};
#endif
#endif /* _LASCOREG_ */

