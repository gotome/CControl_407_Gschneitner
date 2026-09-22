/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_38_
#define _BUR_1781697446_38_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef enum enumUsbLinkStep
{	WAIT = 0,
	CREATE_NODE_ID_LIST = 1,
	READ_DEVICE_DATA = 2,
	GET_DESCRIPTOR = 3,
	CREATE_FILE_DEVICE = 4,
	UNLINK_DEVICE = 5,
	FINISH = 6,
	ERROR_CASE = 255
} enumUsbLinkStep;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/CSV/UsbLink/UsbLink.typ\\\" scope \\\"local\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_38_ */

