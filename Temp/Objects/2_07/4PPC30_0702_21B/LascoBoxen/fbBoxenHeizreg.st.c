#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoBoxen/fbBoxenHeizregst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenHeizreg.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenHeizreg.st"
void fbBoxenHeizreg(struct fbBoxenHeizreg* inst){struct fbBoxenHeizreg* __inst__=inst;{

if(__inst__->Freigabe){


if(__inst__->QuitFehler){
(__inst__->FehlerOut=0);
}



switch(__inst__->step){


case 0:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->FreigabeHeizregisterOut=0);
(__inst__->DrehzahlHeizregisterOut=(0.00000000000000000000E+00));
}



if((__inst__->Automatikbetrieb&(__inst__->FehlerOut^1)&(__inst__->FehlerSensorAussenluft^1))){
(__inst__->stateEntry=1);
(__inst__->step=1);
}else if((__inst__->Dauerbetrieb&(__inst__->FehlerOut^1))){
(__inst__->stateEntry=1);
(__inst__->step=2);
}




}break;case 1:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


if(((__inst__->loc_WetterIstSchlecht^1)&(__inst__->loc_WetterIstGut^1))){
if(((__inst__->FrischluftSattDefizitIst<__inst__->FrischluftSattDefizitSoll))){
(__inst__->loc_WetterIstSchlecht=1);
}else if(((__inst__->FrischluftSattDefizitIst>=__inst__->FrischluftSattDefizitSoll))){
(__inst__->loc_WetterIstGut=1);
}
}


(__inst__->TON_WetterIstGut.IN=(__inst__->loc_WetterIstSchlecht&((__inst__->FrischluftSattDefizitIst>=(__inst__->FrischluftSattDefizitSoll+__inst__->Hysterese)))));;(__inst__->TON_WetterIstGut.PT=__inst__->UmschaltverzWitterung);;TON(&__inst__->TON_WetterIstGut);
(__inst__->TON_WetterIstSchlecht.IN=(__inst__->loc_WetterIstGut&((__inst__->FrischluftSattDefizitIst<(__inst__->FrischluftSattDefizitSoll-__inst__->Hysterese)))));;(__inst__->TON_WetterIstSchlecht.PT=__inst__->UmschaltverzWitterung);;TON(&__inst__->TON_WetterIstSchlecht);

if((__inst__->TON_WetterIstGut.Q&~__inst__->zzEdge00000&1?((__inst__->zzEdge00000=__inst__->TON_WetterIstGut.Q&1),1):((__inst__->zzEdge00000=__inst__->TON_WetterIstGut.Q&1),0))){
(__inst__->loc_WetterIstGut=1);
(__inst__->loc_WetterIstSchlecht=0);
}else if((__inst__->TON_WetterIstSchlecht.Q&~__inst__->zzEdge00001&1?((__inst__->zzEdge00001=__inst__->TON_WetterIstSchlecht.Q&1),1):((__inst__->zzEdge00001=__inst__->TON_WetterIstSchlecht.Q&1),0))){
(__inst__->loc_WetterIstGut=0);
(__inst__->loc_WetterIstSchlecht=1);
}


(__inst__->FreigabeHeizregisterOut=(__inst__->loc_WetterIstSchlecht|__inst__->WetterIstSchlecht));
(__inst__->DrehzahlHeizregisterOut=__inst__->DrehzahlHeizregisterSoll);



if(__inst__->FehlerSensorAussenluft){
(__inst__->FehlerOut=1);
(__inst__->stateEntry=1);
(__inst__->step=0);

}else if(__inst__->Dauerbetrieb){
(__inst__->stateEntry=1);
(__inst__->step=2);

}else if((__inst__->Automatikbetrieb^1)){
(__inst__->stateEntry=1);
(__inst__->step=0);
}



}break;case 2:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->FreigabeHeizregisterOut=1);
(__inst__->DrehzahlHeizregisterOut=__inst__->DrehzahlHeizregisterSoll);



if(__inst__->Automatikbetrieb){
(__inst__->stateEntry=1);
(__inst__->step=1);

}else if((__inst__->Dauerbetrieb^1)){
(__inst__->stateEntry=1);
(__inst__->step=0);
}



}break;}


}else{

(__inst__->FreigabeHeizregisterOut=0);
(__inst__->DrehzahlHeizregisterOut=(0.00000000000000000000E+00));
(__inst__->step=0);
(__inst__->stateEntry=1);
(__inst__->FehlerOut=0);

}



}imp1_end0_0:;}
#line 125 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenHeizreg.nodebug"

void __AS__ImplInitfbBoxenHeizreg_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoBoxen/fbBoxenHeizreg.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoBoxen/fbBoxenHeizreg.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenHeizreg.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenKonfig\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenVentKlappen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenKlappenanst\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenAbluftkl\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenAbluftvent\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenUmschaltung\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenWLO\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenHeizreg\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenNotstrom\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenSHO\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenLuftmengen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbRestzeit\\\" FUB\\n\"");
__asm__(".previous");
