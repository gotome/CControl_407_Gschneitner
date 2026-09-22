#ifndef __AS__TYPE_enumUsbLinkStep
#define __AS__TYPE_enumUsbLinkStep
typedef enum enumUsbLinkStep
{	WAIT = 0,
	CREATE_NODE_ID_LIST = 1,
	READ_DEVICE_DATA = 2,
	GET_DESCRIPTOR = 3,
	CREATE_FILE_DEVICE = 4,
	UNLINK_DEVICE = 5,
	FINISH = 6,
	ERROR_CASE = 255,
} enumUsbLinkStep;
#endif

#ifndef __AS__TYPE_usbNode_typ
#define __AS__TYPE_usbNode_typ
typedef struct usbNode_typ
{	unsigned short interfaceClass;
	unsigned short interfaceSubClass;
	unsigned short interfaceProtocol;
	unsigned short vendorId;
	unsigned short productId;
	unsigned short bcdDevice;
	plcstring ifName[128];
} usbNode_typ;
#endif

#ifndef __AS__TYPE_usbDeviceDescr_typ
#define __AS__TYPE_usbDeviceDescr_typ
typedef struct usbDeviceDescr_typ
{	unsigned char length;
	unsigned char descriptorType;
	unsigned short bcdUsb;
	unsigned char deviceClass;
	unsigned char deviceSubClass;
	unsigned char deviceProtocol;
	unsigned char maxPacketSize0;
	unsigned short vendor;
	unsigned short product;
	unsigned short bcdDevice;
	unsigned char manufacturerIndex;
	unsigned char productIndex;
	unsigned char serialNumberIndex;
	unsigned char numConfigurations;
} usbDeviceDescr_typ;
#endif

struct DevLink
{	unsigned long pDevice;
	unsigned long pParam;
	unsigned short status;
	unsigned long handle;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DevLink(struct DevLink* inst);
struct DevUnlink
{	unsigned long handle;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DevUnlink(struct DevUnlink* inst);
struct UsbNodeListGet
{	unsigned long pBuffer;
	unsigned long bufferSize;
	unsigned short filterInterfaceClass;
	unsigned short filterInterfaceSubClass;
	unsigned short status;
	unsigned long allNodes;
	unsigned long listNodes;
	unsigned long attachDetachCount;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void UsbNodeListGet(struct UsbNodeListGet* inst);
struct UsbNodeGet
{	unsigned long nodeId;
	unsigned long pBuffer;
	unsigned long bufferSize;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void UsbNodeGet(struct UsbNodeGet* inst);
struct UsbDescriptorGet
{	unsigned long nodeId;
	unsigned char requestType;
	unsigned char descriptorType;
	unsigned char descriptorIndex;
	unsigned short languageId;
	unsigned long pBuffer;
	unsigned short bufferSize;
	unsigned short status;
	unsigned short actSize;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void UsbDescriptorGet(struct UsbDescriptorGet* inst);
_BUR_LOCAL enumUsbLinkStep step;
_BUR_LOCAL plcbit usbCmdCreateUsbDevice;
_BUR_LOCAL struct UsbNodeListGet UsbNodeListGet_0;
_BUR_LOCAL unsigned long node_id_buffer[5];
_BUR_LOCAL struct UsbNodeGet UsbNodeGet_0;
_BUR_LOCAL unsigned char node;
_BUR_LOCAL struct usbNode_typ usb_data_buffer[5];
_BUR_LOCAL struct UsbDescriptorGet UsbDescriptorGet_0;
_BUR_LOCAL struct usbDeviceDescr_typ device_descriptor[5];
_BUR_LOCAL plcstring FileDevice[81];
_BUR_LOCAL struct DevLink DevLink_0;
_BUR_LOCAL struct DevUnlink DevUnlink_0;
