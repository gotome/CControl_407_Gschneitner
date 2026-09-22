/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_39_
#define _BUR_1790103064_39_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL struct DevUnlink DevUnlink_0;
_BUR_LOCAL struct DevLink DevLink_0;
_BUR_LOCAL plcstring FileDevice[81];
_BUR_LOCAL struct usbDeviceDescr_typ device_descriptor[5];
_BUR_LOCAL struct UsbDescriptorGet UsbDescriptorGet_0;
_BUR_LOCAL struct usbNode_typ usb_data_buffer[5];
_BUR_LOCAL unsigned char node;
_BUR_LOCAL struct UsbNodeGet UsbNodeGet_0;
_BUR_LOCAL unsigned long node_id_buffer[5];
_BUR_LOCAL struct UsbNodeListGet UsbNodeListGet_0;
_BUR_LOCAL plcbit usbCmdCreateUsbDevice;
_BUR_LOCAL enum enumUsbLinkStep step;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/CSV/UsbLink/UsbLink.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_39_ */

