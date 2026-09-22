/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_13_
#define _BUR_1781697446_13_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct typ_PidControl
{	plcbit Enable;
	float Sollgroesse;
	float Stellgroesse;
	plcbit FehlerReglerMax;
	plcbit FehlerReglerMin;
	plcbit WarnungReglerMax;
	plcbit WarnungReglerMin;
} typ_PidControl;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_13_ */

