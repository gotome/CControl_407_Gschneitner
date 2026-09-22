#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoUtil/fbLascoFUst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoFU.nodebug"
#line 13 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoFU.st"
void fbLascoFU(struct fbLascoFU* inst){struct fbLascoFU* __inst__=inst;{


(__inst__->TON_Betriebsmeldung.IN=(__inst__->Freigabe&(__inst__->BetrMldg^1)&(__inst__->Reset^1)&((__inst__->SollDrehzahl>0))));;(__inst__->TON_Betriebsmeldung.Zeit=__inst__->AnsprechZeitFU);;(__inst__->TON_Betriebsmeldung.Tick=__inst__->Tick);;fbLascoTON(&__inst__->TON_Betriebsmeldung);


if(((__inst__->InitDone^1)|__inst__->Reset)){
(__inst__->ResetDone=1);
(__inst__->InitDone=1);
}


if(__inst__->TON_Betriebsmeldung.Q){
(__inst__->StoerungFU=1);
}


if((__inst__->Freigabe&__inst__->ResetDone)){

(__inst__->BetriebFU=((__inst__->DrehzahlFU!=0)));


(__inst__->RampDownMillis=(signed long)((__inst__->RampeDownSek*1000)>=0.0?(__inst__->RampeDownSek*1000)+0.5:(__inst__->RampeDownSek*1000)-0.5));
(__inst__->RampUpMillis=(signed long)((__inst__->RampeUpSek*1000)>=0.0?(__inst__->RampeUpSek*1000)+0.5:(__inst__->RampeUpSek*1000)-0.5));


(__inst__->LCRRamp_0.enable=__inst__->Freigabe);
(__inst__->LCRRamp_0.y_max=__inst__->MaxDrehzahl);
(__inst__->LCRRamp_0.y_min=__inst__->MinDrehzahl);
(__inst__->LCRRamp_0.y_set=__inst__->IstDrehzahl);
(__inst__->LCRRamp_0.set=(__inst__->Init&~__inst__->zzEdge00000&1?((__inst__->zzEdge00000=__inst__->Init&1),1):((__inst__->zzEdge00000=__inst__->Init&1),0)));
(__inst__->LCRRamp_0.x=__inst__->SollDrehzahl);

if((((signed long)__inst__->RampUpMillis>(signed long)0))){
(__inst__->LCRRamp_0.dy_up=(((__inst__->MaxDrehzahl-__inst__->MinDrehzahl)*1000)/CheckDivReal((float)__inst__->RampUpMillis)));
}else{
(__inst__->LCRRamp_0.dy_up=999999999);
}

if((((signed long)__inst__->RampDownMillis>(signed long)0))){
(__inst__->LCRRamp_0.dy_down=(((__inst__->MaxDrehzahl-__inst__->MinDrehzahl)*1000)/CheckDivReal((float)__inst__->RampDownMillis)));
}else{
(__inst__->LCRRamp_0.dy_down=999999999);
}

LCRRamp(&__inst__->LCRRamp_0);

if((((__inst__->LCRRamp_0.dy_down==999999999))|((__inst__->LCRRamp_0.dy_up==999999999)))){
(__inst__->DrehzahlFU=__inst__->SollDrehzahl);
}else{
(__inst__->DrehzahlFU=__inst__->LCRRamp_0.y);
}

}else{

(__inst__->LCRRamp_0.x=0);
(__inst__->LCRRamp_0.dy_down=999999999);
LCRRamp(&__inst__->LCRRamp_0);

(__inst__->BetriebFU=0);
(__inst__->DrehzahlFU=0);
}



if(((~__inst__->Freigabe&__inst__->zzEdge00001&1?((__inst__->zzEdge00001=__inst__->Freigabe&1),1):((__inst__->zzEdge00001=__inst__->Freigabe&1),0))|((__inst__->Freigabe^1)&(__inst__->BetrMldg^1))|__inst__->Reset|__inst__->BetrMldg)){
(__inst__->ResetDone=1);
(__inst__->StoerungFU=0);
}



}imp1_else6_0:imp1_end6_0:;}
#line 85 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoFU.nodebug"

void __AS__ImplInitfbLascoFU_st(void){}

__asm__(".section \".plc\"");
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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoUtil/fbLascoFU.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoUtil/fbLascoFU.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoFU.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoAutoRuecklauf\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoBskUeberw\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoEUhr\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoTON\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoTOF\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoTOG\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"funLascoMinss\\\" FUN\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoZdxx\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoZbFrg\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoBstd\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoBmin\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoStdMin\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoSrvcInterv\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoBrStfLst\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoWoPrg\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoDrzuebw\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoFehl\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoFept\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoPuge\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoLstgStell\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoLstRamp\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoZund\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoFU\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoZweiPunktAchse\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoStellachse\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoStellachseAnalog\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoStellachseDigital\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoWarmluftsteller\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoFreilauf\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoFuellst\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoWlg\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoBsk\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoTrend\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoTimerHand\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbLascoPugeV2\\\" FUB\\n\"");
__asm__(".previous");
