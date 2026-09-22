/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_42_
#define _BUR_1790103064_42_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct Client_typ
{	unsigned short sStep;
	struct TcpOpen TcpOpen_0;
	struct TcpClient TcpClient_0;
	struct TcpRecv TcpRecv_0;
	struct TcpSend TcpSend_0;
	struct TcpIoctl TcpIoctl_0;
	struct TcpClose TcpClose_0;
	struct tcpLINGER_typ linger_opt;
} Client_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_42_ */

