/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_31_
#define _BUR_1790103064_31_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL unsigned short loc_StrombegrStopp1;
_BUR_LOCAL unsigned short loc_StrombegrStart1;
_BUR_LOCAL struct fbBoxenUmschaltung fbEntfUmschaltung_0;
_BUR_LOCAL plcbit stateEntry;
_BUR_LOCAL enum enumBetriebsmodus nextModus;
_BUR_LOCAL plcbit TagTick;
_BUR_LOCAL plcbit stdTick;
_BUR_LOCAL plcbit minTick;
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL struct fbLascoZdxx zdxxStunden;
_BUR_LOCAL struct fbLascoZdxx zdxxTage;
_BUR_LOCAL struct fbLascoZdxx zdxxMinuten;
_BUR_LOCAL struct fbLascoZdxx zdxxSekunden;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/LascoBoxen.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_31_ */

