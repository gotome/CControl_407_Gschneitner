/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_35_
#define _BUR_1781697446_35_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL unsigned short loc_RestzeitSchlechtMinuten;
_BUR_LOCAL unsigned long loc_RestzeitSchlechtStunden;
_BUR_LOCAL float loc_RestzeitSchlechtMillisek;
_BUR_LOCAL signed short loc_DisplayTimeout;
_BUR_LOCAL plcbit loc_MsgKontrUhrzeitAckn;
_BUR_LOCAL plcbit loc_MsgFalschesDatumAckn;
_BUR_LOCAL unsigned long loc_TimePwReset;
_BUR_LOCAL struct TOF TOF_VerzUmschaltungUmluftkl;
_BUR_LOCAL struct TOF TOF_VerzUmschaltungAbluftvent;
_BUR_LOCAL struct TOF TOF_VerzUmschaltungAbluftklappe;
_BUR_LOCAL struct TOF TOF_VerzUmschaltungBypassklappe;
_BUR_LOCAL plcbit hmiBlink2;
_BUR_LOCAL struct fbLascoPuge fbLascoPuge_1;
_BUR_LOCAL plcbit hmiBlink;
_BUR_LOCAL struct fbLascoPuge fbLascoPuge_0;
_BUR_LOCAL plcbit jahrTick;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_5;
_BUR_LOCAL plcbit tagTick;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_3;
_BUR_LOCAL plcbit stdTick;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_2;
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_1;
_BUR_LOCAL plcbit hmilliTick;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL struct TOF TOF_BoxAufgerufen;
_BUR_LOCAL struct TOF TOF_VerzBetriebsartBox;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Visualisierung/hmiMain/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_35_ */

