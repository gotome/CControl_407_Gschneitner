/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_10_
#define _BUR_1781697446_10_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_GLOBAL struct fbMathTrLftDruck Drucksensor;
_GLOBAL struct fbMathLuft Abluftsensor;
_GLOBAL struct fbMathLuft Trockenluftsensor;
_GLOBAL struct fbMathLuft Dachluftsensor;
_GLOBAL struct fbMathLuft Frischluftsensor;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox6;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox5;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox4;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox3;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox2;
_GLOBAL struct fbCControlWitterung fbSchlechtwetterBox1;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnungen.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_10_ */

