/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_43_
#define _BUR_1790103064_43_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
 #define COMMA ","
 #define RIGHTBRACKET ">"
 #define LEFTBRACKET "<"
 #define SLASH "/"
#else
 _LOCAL_CONST plcstring COMMA[2];
 _LOCAL_CONST plcstring RIGHTBRACKET[2];
 _LOCAL_CONST plcstring LEFTBRACKET[2];
 _LOCAL_CONST plcstring SLASH[2];
#endif


/* Variables */
_BUR_LOCAL plcbit loc_EMailAlarmierungEin;
_BUR_LOCAL plcbit loc_FehlerAusgelesen;
_BUR_LOCAL unsigned short GetActAlarmList_Status;
_BUR_LOCAL unsigned short Access_Status;
_BUR_LOCAL unsigned char cSeparator;
_BUR_LOCAL unsigned char cDateTimeFormat;
_BUR_LOCAL unsigned short uiAlarmType;
_BUR_LOCAL signed long AlarmLen;
_BUR_LOCAL plcstring AlarmString[101];
_BUR_LOCAL unsigned long VC_HANDLE;
_BUR_LOCAL unsigned long IP_ADRESS;
_BUR_LOCAL unsigned short IP_PORT;
_BUR_LOCAL unsigned short ErrNr;
_BUR_LOCAL plcstring ErrorText[81];
_BUR_LOCAL plcstring resultString[351];
_BUR_LOCAL plcbit Send;
_BUR_LOCAL plcstring CommaString[2];
_BUR_LOCAL plcbit UseComma;
_BUR_LOCAL plcstring EMail[4][81];
_BUR_LOCAL plcstring EMailText[81];
_BUR_LOCAL struct Client_typ Client;
_BUR_LOCAL plcstring Sendstring[351];





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.var\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_43_ */

