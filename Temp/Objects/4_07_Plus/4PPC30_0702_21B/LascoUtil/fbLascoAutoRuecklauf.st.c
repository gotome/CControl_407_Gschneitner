#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoUtil/fbLascoAutoRuecklaufst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoAutoRuecklauf.nodebug"
#line 13 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoAutoRuecklauf.st"
void fbLascoAutoRuecklauf(struct fbLascoAutoRuecklauf* inst){struct fbLascoAutoRuecklauf* __inst__=inst;{


if(__inst__->Freigabe){


switch(__inst__->loc_curStep){



case 0:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}

(__inst__->MotorVor=0);
(__inst__->MotorRueck=0);


if(__inst__->Zuendphase){
(__inst__->stateEntry=1);
(__inst__->loc_curStep=1);
}else if(__inst__->Heizphase){
(__inst__->stateEntry=1);
(__inst__->loc_curStep=3);
}



}break;case 1:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->ctLaufzeitEinschub1=0);
(__inst__->ctLaufzeitEinschubVor=0);
}

(__inst__->MotorVor=(((unsigned long)__inst__->LaufzeitEinschubZuendung>=(unsigned long)__inst__->ctLaufzeitEinschub1)));


if((((unsigned long)__inst__->ctLaufzeitEinschub1<=(unsigned long)__inst__->LaufzeitEinschubZuendung))){
(__inst__->ctLaufzeitEinschub1=(__inst__->ctLaufzeitEinschub1+__inst__->sekTick));
}



if(__inst__->MotorVor){
(__inst__->ctLaufzeitEinschubVor=(__inst__->ctLaufzeitEinschubVor+__inst__->sekTick));
}



if(((((unsigned long)__inst__->ctLaufzeitEinschubVor>=__inst__->MaxLaufzeitVor))&(((unsigned long)__inst__->ctLaufzeitEinschub1<(unsigned long)__inst__->LaufzeitEinschubZuendung)))){
(__inst__->loc_RuecklaufErforderlich=1);
}



if((__inst__->Zuendphase^1)){
(__inst__->stateEntry=1);
(__inst__->loc_curStep=0);
}else if(__inst__->loc_RuecklaufErforderlich){
(__inst__->ctLaufzeitEinschubVor=0);
(__inst__->stateEntry=1);
(__inst__->loc_curStep=2);
}



}break;case 2:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->MotorVor=0);
(__inst__->TON_Umschaltverz.IN=1);
}

(__inst__->TON_Umschaltverz.PT=__inst__->VerzUmschaltung);
TON(&__inst__->TON_Umschaltverz);

(__inst__->TOF_Ruecklauf.IN=(__inst__->TON_Umschaltverz.Q&__inst__->loc_RuecklaufErforderlich));
(__inst__->TOF_Ruecklauf.PT=__inst__->Ruecklaufzeit);
TOF(&__inst__->TOF_Ruecklauf);

(__inst__->MotorRueck=__inst__->TOF_Ruecklauf.Q);

if(__inst__->MotorRueck){
(__inst__->loc_RuecklaufErforderlich=0);
}

if((~__inst__->MotorRueck&__inst__->zzEdge00000&1?((__inst__->zzEdge00000=__inst__->MotorRueck&1),1):((__inst__->zzEdge00000=__inst__->MotorRueck&1),0))){
(__inst__->loc_RueckwaertsOk=1);
(__inst__->TON_Umschaltverz.IN=0);;TON(&__inst__->TON_Umschaltverz);
(__inst__->TON_Umschaltverz.IN=1);
}



if((__inst__->TON_Umschaltverz.Q&__inst__->loc_RueckwaertsOk)){
(__inst__->loc_RueckwaertsOk=0);
(__inst__->loc_curStep=1);
(__inst__->TON_Umschaltverz.IN=0);;TON(&__inst__->TON_Umschaltverz);
(__inst__->TOF_Ruecklauf.IN=0);;TOF(&__inst__->TOF_Ruecklauf);
}else if((__inst__->Zuendphase^1)){
(__inst__->loc_curStep=0);
(__inst__->stateEntry=1);
}




}break;case 3:{



if((__inst__->ImpulsVor&~__inst__->zzEdge00001&1?((__inst__->zzEdge00001=__inst__->ImpulsVor&1),1):((__inst__->zzEdge00001=__inst__->ImpulsVor&1),0))){
(__inst__->ctEinschuebeSeitRuecklauf=(__inst__->ctEinschuebeSeitRuecklauf+1));
}else if(__inst__->MotorRueck){
(__inst__->ctEinschuebeSeitRuecklauf=0);
}


if(((((unsigned long)__inst__->ctEinschuebeSeitRuecklauf>=(unsigned long)__inst__->ImpulseVorBisRueck))&(__inst__->ImpulsVor^1))){
(__inst__->loc_RuecklaufErforderlich=1);
}else if(__inst__->MotorRueck){
(__inst__->loc_RuecklaufErforderlich=0);
}


if(((~__inst__->ImpulsVor&__inst__->zzEdge00002&1?((__inst__->zzEdge00002=__inst__->ImpulsVor&1),1):((__inst__->zzEdge00002=__inst__->ImpulsVor&1),0))&__inst__->loc_RuecklaufErforderlich)){
(__inst__->TON_Umschaltverz.IN=1);
}else if((__inst__->ImpulsVor&~__inst__->zzEdge00003&1?((__inst__->zzEdge00003=__inst__->ImpulsVor&1),1):((__inst__->zzEdge00003=__inst__->ImpulsVor&1),0))){
(__inst__->TON_Umschaltverz.IN=0);
}


(__inst__->TOF_Ruecklauf.IN=(__inst__->loc_RuecklaufErforderlich&__inst__->TON_Umschaltverz.Q));


(__inst__->MotorRueck=__inst__->TOF_Ruecklauf.Q);


(__inst__->TON_Umschaltverz.PT=(plctime)__inst__->VerzUmschaltung);
TON(&__inst__->TON_Umschaltverz);

(__inst__->TOF_Ruecklauf.PT=(plctime)__inst__->Ruecklaufzeit);
TOF(&__inst__->TOF_Ruecklauf);

if((__inst__->Heizphase^1)){
(__inst__->loc_curStep=0);
(__inst__->stateEntry=1);
}


}break;}


}else{

(__inst__->stateEntry=1);
(__inst__->loc_curStep=0);
(__inst__->ctLaufzeitEinschub1=0);
(__inst__->ctLaufzeitEinschubVor=0);
(__inst__->MotorVor=0);
(__inst__->MotorRueck=0);
(__inst__->loc_RuecklaufErforderlich=0);
(__inst__->loc_RueckwaertsOk=0);
(__inst__->ctEinschuebeSeitRuecklauf=0);
(__inst__->TON_Umschaltverz.IN=0);
(__inst__->TOF_Ruecklauf.IN=0);


}


}imp1_end0_0:;}
#line 189 "C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoAutoRuecklauf.nodebug"

void __AS__ImplInitfbLascoAutoRuecklauf_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoUtil/fbLascoAutoRuecklauf.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoUtil/fbLascoAutoRuecklauf.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoUtil/fbLascoAutoRuecklauf.st\\\"\\n\"");
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
