#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/mappPara/Mainst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

*((char volatile*)&(hmiParameter)) = *((char*)&(hmiParameter));
(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);
(FileCopy_0.enable=0);
FileCopy(&FileCopy_0);

{int zzIndex; plcstring* zzLValue=(plcstring*)hmiStatus.ParameterFileNameAufUsb; plcstring* zzRValue=(plcstring*)"FileNameAufUsb"; for(zzIndex=0; zzIndex<14l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};


if((Betriebsparameter.Allgemein.ParameterVorhanden^1)){
(gWerksparameterLaden=1);
}


}imp32769_else0_0:imp32769_end0_0:;}
#line 22 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.nodebug"
#line 26 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{










if((((__AS__STRING_CMP(UIConnect.New.FileName,"207Werk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"307Werk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"407Werk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"407PlusWerk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"304Werk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"HB4000Werk")==0))|((__AS__STRING_CMP(UIConnect.New.FileName,"HB3000Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"207Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"307Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"407Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"407PlusWerk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"304Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"HB4000Werk")==0))|((__AS__STRING_CMP(FileNameFromUSB,"HB3000Werk")==0)))){
(loc_LockNewFile=1);
}else{
(loc_LockNewFile=0);
}





switch(step){




case 0:{


if(stateEntry){
(stateEntry=0);
(MpRecipeXml_0.Enable=0);
(MpRecipeXml_0.ErrorReset=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
(MpRecipeRegPar_0.ErrorReset=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
(MpRecipeUI_0.ErrorReset=0);
MpRecipeUI(&MpRecipeUI_0);
(hmiButtons.ParameterAufUsbKopieren=0);
(hmiButtons.ParameterVonUsbLaden=0);
}


(MpRecipeXml_0.Enable=1);
((*(unsigned long*)&(MpRecipeXml_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
((*(unsigned long*)&(MpRecipeXml_0.DeviceName))=((unsigned long)(&"CF")));
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"407Werk")));
MpRecipeXml(&MpRecipeXml_0);

((*(unsigned long*)&(MpRecipeRegPar_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeRegPar_0.Enable=1);
((*(unsigned long*)&(MpRecipeRegPar_0.PVName))=((unsigned long)(&"hmiParameter")));
MpRecipeRegPar(&MpRecipeRegPar_0);

((*(unsigned long*)&(MpRecipeUI_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeUI_0.Enable=1);
(MpRecipeUI_0.UISetup=*(struct MpRecipeUISetupType*)&UISetup);
((*(unsigned long*)&(MpRecipeUI_0.UIConnect))=((unsigned long)(&UIConnect)));
MpRecipeUI(&MpRecipeUI_0);




if(hmiButtons.ParameterVonUsbLaden){
(stateEntry=1);
(step=1);

}else if(hmiButtons.ParameterAufUsbKopieren){
(stateEntry=1);
(step=3);

}else if(gWerksparameterLaden){
(stateEntry=1);
(step=4);

}else if((MpRecipeXml_0.Error|MpRecipeRegPar_0.Error|MpRecipeUI_0.Error)){
(stateEntry=1);
(step=255);
}




}break;case 1:{


if(stateEntry){
(stateEntry=0);
(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);
}


(MpRecipeXml_0.Enable=1);

((*(unsigned long*)&(MpRecipeXml_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
((*(unsigned long*)&(MpRecipeXml_0.DeviceName))=((unsigned long)(&"usb_device")));
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&hmiStatus.ParameterFileNameAufUsb)));
MpRecipeXml(&MpRecipeXml_0);

((*(unsigned long*)&(MpRecipeRegPar_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeRegPar_0.Enable=1);
((*(unsigned long*)&(MpRecipeRegPar_0.PVName))=((unsigned long)(&"hmiParameter")));
MpRecipeRegPar(&MpRecipeRegPar_0);

(MpRecipeXml_0.Load=1);




if(MpRecipeXml_0.CommandDone){
(MpRecipeXml_0.Load=0);
(stateEntry=1);
(step=2);

}else if((MpRecipeXml_0.Error|MpRecipeRegPar_0.Error|MpRecipeUI_0.Error)){
(stateEntry=1);
(step=255);
}




}break;case 2:{

if(stateEntry){
(stateEntry=0);
(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);
}

(MpRecipeXml_0.Enable=1);
((*(unsigned long*)&(MpRecipeXml_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
((*(unsigned long*)&(MpRecipeXml_0.DeviceName))=((unsigned long)(&"CF")));
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"407Werk")));
MpRecipeXml(&MpRecipeXml_0);

((*(unsigned long*)&(MpRecipeRegPar_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeRegPar_0.Enable=1);
((*(unsigned long*)&(MpRecipeRegPar_0.PVName))=((unsigned long)(&"hmiParameter")));
MpRecipeRegPar(&MpRecipeRegPar_0);

((*(unsigned long*)&(MpRecipeUI_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeUI_0.Enable=1);
(MpRecipeUI_0.UISetup=*(struct MpRecipeUISetupType*)&UISetup);
((*(unsigned long*)&(MpRecipeUI_0.UIConnect))=((unsigned long)(&UIConnect)));
MpRecipeUI(&MpRecipeUI_0);

{int zzIndex; plcstring* zzLValue=(plcstring*)UIConnect.New.FileName; plcstring* zzRValue=(plcstring*)hmiStatus.ParameterFileNameAufUsb; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UIConnect.New.Create=1);



if(MpRecipeXml_0.CommandDone){
(UIConnect.Recipe.Refresh=1);
(stateEntry=1);
(step=0);

}else if((MpRecipeXml_0.Error|MpRecipeRegPar_0.Error|MpRecipeUI_0.Error)){
(stateEntry=1);
(step=255);
}





}break;case 3:{


if(stateEntry){
(stateEntry=0);
(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);
(FileCopy_0.enable=0);
FileCopy(&FileCopy_0);
}


{int zzIndex; plcstring* zzLValue=(plcstring*)loc_FileName; plcstring* zzRValue=(plcstring*)UIConnect.Recipe.List.Names[UIConnect.Recipe.List.SelectedIndex]; for(zzIndex=0; zzIndex<30l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};

(FileCopy_0.enable=1);
(FileCopy_0.option=fiOVERWRITE);
(FileCopy_0.pDest=((unsigned long)(&loc_FileName)));
(FileCopy_0.pDestDev=((unsigned long)(&"usb_device")));
(FileCopy_0.pSrc=((unsigned long)(&loc_FileName)));
(FileCopy_0.pSrcDev=((unsigned long)(&"CF")));
FileCopy(&FileCopy_0);




if((((unsigned long)(unsigned short)FileCopy_0.status==(unsigned long)(unsigned short)0))){
(stateEntry=1);
(step=0);

}else if((((unsigned long)(unsigned short)FileCopy_0.status!=(unsigned long)(unsigned short)ERR_FUB_BUSY))){
(stateEntry=1);
(step=255);
}





}break;case 4:{


if(stateEntry){
(stateEntry=0);
(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);
(gWerksparameterLaden=0);
}


(MpRecipeXml_0.Enable=1);

((*(unsigned long*)&(MpRecipeXml_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
((*(unsigned long*)&(MpRecipeXml_0.DeviceName))=((unsigned long)(&"CF")));
if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)0))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"407Werk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)1))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"407PlusWerk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)2))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"307Werk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)3))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"304Werk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)4))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"HB4000Werk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)5))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"HB3000Werk")));
}else if((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)6))){
((*(unsigned long*)&(MpRecipeXml_0.FileName))=((unsigned long)(&"207Werk")));
}
MpRecipeXml(&MpRecipeXml_0);

((*(unsigned long*)&(MpRecipeRegPar_0.MpLink))=((unsigned long)(&gMappRecipeLink)));
(MpRecipeRegPar_0.Enable=1);
((*(unsigned long*)&(MpRecipeRegPar_0.PVName))=((unsigned long)(&"hmiParameter")));
MpRecipeRegPar(&MpRecipeRegPar_0);

(MpRecipeXml_0.Load=1);




if(MpRecipeXml_0.CommandDone){
(MpRecipeXml_0.Load=0);
(stateEntry=1);
(step=0);

}else if((MpRecipeXml_0.Error|MpRecipeRegPar_0.Error|MpRecipeUI_0.Error)){
(stateEntry=1);
(step=255);
}





}break;case 255:{


if(stateEntry){
(stateEntry=0);
}

(MpRecipeXml_0.ErrorReset=1);
MpRecipeXml(&MpRecipeXml_0);

(MpRecipeRegPar_0.ErrorReset=1);
MpRecipeRegPar(&MpRecipeRegPar_0);

(MpRecipeUI_0.ErrorReset=1);
MpRecipeUI(&MpRecipeUI_0);


(step=0);
(stateEntry=1);


}break;}



}imp1_case2_5:imp1_endcase2_0:;}
#line 330 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.nodebug"
#line 333 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.st"
void _EXIT __BUR__ENTRY_EXIT_FUNCT__(void){{

(MpRecipeXml_0.Enable=0);
MpRecipeXml(&MpRecipeXml_0);
(MpRecipeRegPar_0.Enable=0);
MpRecipeRegPar(&MpRecipeRegPar_0);
(MpRecipeUI_0.Enable=0);
MpRecipeUI(&MpRecipeUI_0);

}}
#line 342 "C:/SharedFolder/CControl/Logical/Util/mappPara/Main.nodebug"

void __AS__ImplInitMain_st(void){__BUR__ENTRY_INIT_FUNCT__();}

signed long __AS__STRING_CMP(char* pstr1, char* pstr2)
{while (*pstr1 != 0 && *pstr1 == *pstr2){ pstr1++;pstr2++; } return (*pstr1 == 0 && *pstr2 != 0) ? -1 : (*pstr1 != 0 && *pstr2 == 0) ? 1 : *pstr1 - *pstr2;}

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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07_Plus/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Util/mappPara/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Util/mappPara/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/mappPara/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/mappPara/Main.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Util/mappPara/Main.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'hmiParameter'\\n\"");
__asm__(".ascii \"plcdata_const 'ERR_FUB_BUSY'\\n\"");
__asm__(".ascii \"plcdata_const 'fiOVERWRITE'\\n\"");
__asm__(".previous");
