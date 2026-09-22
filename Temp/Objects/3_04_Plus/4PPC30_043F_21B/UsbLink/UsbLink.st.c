#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/UsbLink/UsbLinkst.h"
#line 1 "C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{


__AS__STRCPY(((unsigned long)(&FileDevice)),((unsigned long)(&"usb_device")));

(step=0);


}}
#line 11 "C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.nodebug"
#line 13 "C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{



if(((CSV01.SW.EXT_DirCopy_HAND_T&~Edge0000100000&1?((Edge0000100000=CSV01.SW.EXT_DirCopy_HAND_T&1),1):((Edge0000100000=CSV01.SW.EXT_DirCopy_HAND_T&1),0))|(hmiButtons.ParameterVonUsbLaden&~Edge0000100001&1?((Edge0000100001=hmiButtons.ParameterVonUsbLaden&1),1):((Edge0000100001=hmiButtons.ParameterVonUsbLaden&1),0))|(hmiButtons.DatenaufzeichnungAufUsb&~Edge0000100002&1?((Edge0000100002=hmiButtons.DatenaufzeichnungAufUsb&1),1):((Edge0000100002=hmiButtons.DatenaufzeichnungAufUsb&1),0))|(hmiButtons.ParameterAufUsbKopieren&~Edge0000100003&1?((Edge0000100003=hmiButtons.ParameterAufUsbKopieren&1),1):((Edge0000100003=hmiButtons.ParameterAufUsbKopieren&1),0)))){
(usbCmdCreateUsbDevice=1);
}


switch(step){


case 0:{


if(usbCmdCreateUsbDevice){
(step=1);
}else{
(step=0);
}



}break;case 1:{

(UsbNodeListGet_0.enable=1);
(UsbNodeListGet_0.pBuffer=((unsigned long)(&node_id_buffer)));
(UsbNodeListGet_0.bufferSize=20);
(UsbNodeListGet_0.filterInterfaceClass=asusb_CLASS_MASS_STORAGE);
(UsbNodeListGet_0.filterInterfaceSubClass=0);
UsbNodeListGet(&UsbNodeListGet_0);


if((((unsigned long)(unsigned short)UsbNodeListGet_0.status==(unsigned long)(unsigned short)0))){
(step=2);

}else if((((unsigned long)(unsigned short)UsbNodeListGet_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(step=1);

}else{
(step=255);
}



}break;case 2:{

(UsbNodeGet_0.enable=1);
(UsbNodeGet_0.nodeId=node_id_buffer[CheckBounds(node,0,4)]);
(UsbNodeGet_0.pBuffer=((unsigned long)(&usb_data_buffer[CheckBounds(node,0,4)])));
(UsbNodeGet_0.bufferSize=140);
UsbNodeGet(&UsbNodeGet_0);


if((((unsigned long)(unsigned short)UsbNodeGet_0.status==(unsigned long)(unsigned short)0))){
(node=(node+1));
if((((unsigned long)(unsigned char)node==(unsigned long)UsbNodeListGet_0.listNodes))){
(node=0);
(step=3);
}

}else if((((unsigned long)(unsigned short)UsbNodeGet_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(step=2);

}else{
(step=255);
}



}break;case 3:{

(UsbDescriptorGet_0.enable=1);
(UsbDescriptorGet_0.nodeId=node_id_buffer[CheckBounds(node,0,4)]);
(UsbDescriptorGet_0.requestType=0);
(UsbDescriptorGet_0.descriptorType=1);
(UsbDescriptorGet_0.languageId=0);
(UsbDescriptorGet_0.pBuffer=((unsigned long)(&device_descriptor[CheckBounds(node,0,4)])));
(UsbDescriptorGet_0.bufferSize=18);
UsbDescriptorGet(&UsbDescriptorGet_0);


if((((unsigned long)(unsigned short)UsbDescriptorGet_0.status==(unsigned long)(unsigned short)0))){
(node=(node+1));
if((((unsigned long)(unsigned char)node==(unsigned long)UsbNodeListGet_0.listNodes))){
(node=0);
(step=4);
}

}else if((((unsigned long)(unsigned short)UsbDescriptorGet_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(step=3);

}else{
(step=255);
}



}break;case 4:{

__AS__STRCPY(((unsigned long)(&device_name)),((unsigned long)(&FileDevice)));
__AS__STRCPY(((unsigned long)(&device_param)),((unsigned long)(&"/DEVICE=")));
__AS__STRCAT(((unsigned long)(&device_param)),((unsigned long)(&usb_data_buffer[CheckBounds(0,0,4)].ifName)));

(DevLink_0.enable=1);
(DevLink_0.pDevice=((unsigned long)(&device_name)));
(DevLink_0.pParam=((unsigned long)(&device_param)));
DevLink(&DevLink_0);


if((((unsigned long)(unsigned short)DevLink_0.status==(unsigned long)(unsigned short)0))){
(step=6);

}else if((((unsigned long)(unsigned short)DevLink_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(step=4);

}else if((((unsigned long)(unsigned short)DevLink_0.status==(unsigned long)(unsigned short)20730))){
(step=5);

}else{
(step=255);
}



}break;case 5:{

(DevUnlink_0.enable=1);
(DevUnlink_0.handle=DevLink_0.handle);
DevUnlink(&DevUnlink_0);

if((((unsigned long)(unsigned short)DevUnlink_0.status==(unsigned long)(unsigned short)0))){
(step=6);
}else if((((unsigned long)(unsigned short)DevUnlink_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(step=1);
}else{
(step=255);
}



}break;case 6:{

(usbCmdCreateUsbDevice=0);
(step=0);




}break;case 255:{

(usbCmdCreateUsbDevice=0);
(step=0);

}break;}



}imp1_case1_7:imp1_endcase1_0:;}
#line 171 "C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.nodebug"

void __AS__ImplInitUsbLink_st(void){__BUR__ENTRY_INIT_FUNCT__();}

unsigned long __AS__STRCAT(unsigned long pDest, unsigned long pSrc)
{strcat((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

unsigned long __AS__STRCPY(unsigned long pDest, unsigned long pSrc)
{strcpy((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

__asm__(".section \".plc\"");
__asm__(".ascii \"iecfile \\\"Logical/Parameter.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Enumeration.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/LaEntfV2.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/LascoBoxen.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/IecCheck/IecCheck.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/Library/CSV/CSV.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnungen.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Alarmsystem/Alarmsys.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/3_04_Plus/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/UsbLink/UsbLink.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/UsbLink/UsbLink.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/UsbLink/UsbLink.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/UsbLink/UsbLink.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/CSV/UsbLink/UsbLink.st\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Objects/3_04_Plus/4PPC30_043F_21B/UsbLink/UsbLink.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'node_id_buffer'\\n\"");
__asm__(".ascii \"plcdata_const 'usb_data_buffer'\\n\"");
__asm__(".ascii \"plcdata_const 'device_descriptor'\\n\"");
__asm__(".ascii \"plcdata_const 'ERR_FUB_BUSY'\\n\"");
__asm__(".ascii \"plcdata_const 'asusb_CLASS_MASS_STORAGE'\\n\"");
__asm__(".previous");
