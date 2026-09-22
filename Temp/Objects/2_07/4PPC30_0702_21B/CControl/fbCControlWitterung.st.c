#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/CControl/fbCControlWitterungst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/CControl/fbCControlWitterung.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/CControl/fbCControlWitterung.st"
void fbCControlWitterung(struct fbCControlWitterung* inst){struct fbCControlWitterung* __inst__=inst;{


if(__inst__->Freigabe){


(__inst__->StufeAktuell=1);
if((((unsigned long)__inst__->MaterialfeuchteIst!=(unsigned long)0))){
for((__inst__->i=1);__inst__->i<=5;__inst__->i+=1){
if((((unsigned long)__inst__->MaterialfeuchteIst<=(unsigned long)__inst__->MaterialfeuchteStufe[CheckBounds(__inst__->i,1,6)-1]))){
(__inst__->StufeAktuell=(__inst__->i+1));
}
}imp1_endfor2_0:;
}



(__inst__->SchlechtwetterPulszeit=__inst__->SchlechtwetterPulszeitStufe[CheckBounds(__inst__->StufeAktuell,1,6)-1]);
(__inst__->SchlechtwetterPausezeit=__inst__->SchlechtwetterPausezeitStufe[CheckBounds(__inst__->StufeAktuell,1,6)-1]);


if(((((unsigned long)(unsigned char)__inst__->AuswahlSensor==(unsigned long)(unsigned char)0))&__inst__->SensorFrischluftVhd)){
(__inst__->SaettigungsdefizitIst=__inst__->FrischluftSaettigungsdefizit);
}else if(((((unsigned long)(unsigned char)__inst__->AuswahlSensor==(unsigned long)(unsigned char)1))&__inst__->SensorDachluftVhd)){
(__inst__->SaettigungsdefizitIst=__inst__->DachluftSaettigungsdefizit);
}else if(((((unsigned long)(unsigned char)__inst__->AuswahlSensor==(unsigned long)(unsigned char)2))&__inst__->SensorTrockenluftVhd)){
(__inst__->SaettigungsdefizitIst=__inst__->TrockenluftSaettigungsdefizit);
}else if(__inst__->SensorFrischluftVhd){
(__inst__->SaettigungsdefizitIst=__inst__->FrischluftSaettigungsdefizit);
}else{
(__inst__->SaettigungsdefizitIst=(0.00000000000000000000E+00));
}


if(((__inst__->SaettigungsdefizitIst!=0))){

(__inst__->loc_WetterIstGut=0);
(__inst__->loc_WetterIstSchlecht=0);
if(((__inst__->SaettigungsdefizitIst>=(__inst__->GrenzwertStufeAktuell+__inst__->HystereseGrenzwert)))){
(__inst__->loc_WetterIstGut=1);
}else if(((__inst__->SaettigungsdefizitIst<=(__inst__->GrenzwertStufeAktuell-__inst__->HystereseGrenzwert)))){
(__inst__->loc_WetterIstSchlecht=1);
}

switch(__inst__->curStep){


case 0:{
if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_SchrittWitterung.IN=0);;TON(&__inst__->TON_SchrittWitterung);
}

if(__inst__->loc_WetterIstGut){
(__inst__->curStep=1);
}else{
(__inst__->curStep=2);
}


}break;case 1:{
if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_SchrittWitterung.IN=0);;TON(&__inst__->TON_SchrittWitterung);
}

(__inst__->WetterIstGut=1);
(__inst__->WetterIstSchlecht=0);

(__inst__->TON_SchrittWitterung.IN=__inst__->loc_WetterIstSchlecht);;(__inst__->TON_SchrittWitterung.PT=(plctime)__inst__->VerzWetterwechsel);;TON(&__inst__->TON_SchrittWitterung);

if(__inst__->TON_SchrittWitterung.Q){
(__inst__->stateEntry=1);
(__inst__->curStep=2);
}


}break;case 2:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_SchrittWitterung.IN=0);;TON(&__inst__->TON_SchrittWitterung);
}

(__inst__->WetterIstGut=0);
(__inst__->WetterIstSchlecht=1);

(__inst__->TON_SchrittWitterung.IN=__inst__->loc_WetterIstGut);;(__inst__->TON_SchrittWitterung.PT=(plctime)__inst__->VerzWetterwechsel);;TON(&__inst__->TON_SchrittWitterung);

if(__inst__->TON_SchrittWitterung.Q){
(__inst__->stateEntry=1);
(__inst__->curStep=1);
}

}break;}

}else{
(__inst__->loc_WetterIstGut=0);
(__inst__->loc_WetterIstSchlecht=0);
(__inst__->WetterIstGut=1);
(__inst__->WetterIstSchlecht=0);
(__inst__->TON_SchrittWitterung.IN=0);;TON(&__inst__->TON_SchrittWitterung);
(__inst__->stateEntry=1);
(__inst__->curStep=0);
}



}else{
(__inst__->loc_WetterIstGut=0);
(__inst__->loc_WetterIstSchlecht=0);
(__inst__->WetterIstGut=0);
(__inst__->WetterIstSchlecht=0);
(__inst__->TON_SchrittWitterung.IN=0);;TON(&__inst__->TON_SchrittWitterung);
(__inst__->stateEntry=1);
(__inst__->curStep=0);
(__inst__->SaettigungsdefizitIst=(0.00000000000000000000E+00));
(__inst__->SchlechtwetterPulszeit=0);
(__inst__->SchlechtwetterPausezeit=0);
(__inst__->StufeAktuell=1);

}



}imp1_end0_0:;}
#line 128 "C:/SharedFolder/CControl/Logical/Libraries/CControl/fbCControlWitterung.nodebug"

void __AS__ImplInitfbCControlWitterung_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/CControl/fbCControlWitterung.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/CControl/fbCControlWitterung.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/CControl/fbCControlWitterung.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbCControlWitterung\\\" FUB\\n\"");
__asm__(".previous");
