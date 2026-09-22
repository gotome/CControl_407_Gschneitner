/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_5_
#define _BUR_1781697446_5_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_GLOBAL plcbit gEnergiemessungModulOk;
_GLOBAL plcbit gWerksparameterLaden;
_GLOBAL unsigned long gAktuellesPasswort;
_GLOBAL_RETAIN plcbit gMindestlaufzOelsumpfOk;
_GLOBAL plcstring VERSION[17];
_GLOBAL plcdt DateTime;
_GLOBAL struct typSysteminfo Systeminfo;
_GLOBAL struct typEchtzeit Echtzeit;
_GLOBAL_RETAIN struct typNutzungsdaten Nutzungsdaten;
_GLOBAL struct cmdAnlage gCmdAnlage;
_GLOBAL struct statAnlage gStatusAnlage;
_GLOBAL enum enumBetriebsmodus gAktModus;
_GLOBAL plcbit gModul2Vorhanden;
_GLOBAL unsigned char CONST_ZEIT_TESTPHASE;
_GLOBAL_RETAIN struct parAnlage Betriebsparameter;
_GLOBAL struct fbTrockStrombegr Strombegrenzung;
_GLOBAL struct fbTrockTarifabsch Tarifabschaltung;
_GLOBAL struct typAktoren Aktoren;
_GLOBAL struct fbBoxenKonfig Boxen;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/LascoBoxen.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_5_ */

