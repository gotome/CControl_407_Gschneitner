/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_12_
#define _BUR_1781697446_12_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_GLOBAL struct fbRegPidReglerAllg fbPidAbluftregler;
_GLOBAL struct fbRegPidReglerAllg fbPidHeizregister;
_GLOBAL struct fbRegPidReglerAllg fbPidKompressor2;
_GLOBAL struct fbRegPidReglerAllg fbPidKompressor1;
_GLOBAL struct fbRegPidReglerAllg fbPidLuftmengeVent2;
_GLOBAL struct fbRegPidReglerAllg fbPidLuftmengeVent1;
_GLOBAL struct typ_PidControl PidAbluftregler;
_GLOBAL struct typ_PidControl PidHeizregister;
_GLOBAL struct typ_PidControl PidKompressor2;
_GLOBAL struct typ_PidControl PidKompressor1;
_GLOBAL struct typ_PidControl PidLuftmengeVent2;
_GLOBAL struct typ_PidControl PidLuftmengeVent1;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_12_ */

