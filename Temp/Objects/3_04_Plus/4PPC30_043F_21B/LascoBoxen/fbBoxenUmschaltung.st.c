#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenUmschaltungst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenUmschaltung.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenUmschaltung.st"
void fbBoxenUmschaltung(struct fbBoxenUmschaltung* inst){struct fbBoxenUmschaltung* __inst__=inst;{

if(__inst__->Freigabe){


switch(__inst__->step){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}



if(((__inst__->StatusSensorDachluftOk^1)&(__inst__->StatusSensorFrischluftOk^1))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);

}else if(((__inst__->SensorDachluftVhd^1)&(__inst__->SensorFrischluftVhd^1))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);

}else if((__inst__->SensorFrischluftVhd&(__inst__->StatusSensorFrischluftOk^1)&(__inst__->SensorDachluftVhd^1))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);

}else if((__inst__->SensorDachluftVhd&(__inst__->StatusSensorDachluftOk^1)&(__inst__->SensorFrischluftVhd^1))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);

}else if((__inst__->SensorDachluftVhd&__inst__->SensorFrischluftVhd&(__inst__->StatusSensorDachluftOk^1)&(__inst__->StatusSensorFrischluftOk^1))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);
}





if((__inst__->SensorAbluftVhd&__inst__->SensorDachluftVhd&__inst__->StatusSensorAbluftOk&__inst__->StatusSensorDachluftOk)){
(__inst__->stateEntry=1);
(__inst__->step=1);

}else if((__inst__->SensorAbluftVhd&__inst__->SensorFrischluftVhd&__inst__->StatusSensorAbluftOk&__inst__->StatusSensorFrischluftOk)){
(__inst__->stateEntry=1);
(__inst__->step=2);

}else if((__inst__->SensorDachluftVhd&__inst__->StatusSensorDachluftOk)){
(__inst__->stateEntry=1);
(__inst__->step=3);

}else if((__inst__->SensorFrischluftVhd&__inst__->StatusSensorFrischluftOk)){
(__inst__->stateEntry=1);
(__inst__->step=4);
}





}break;case 1:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}





if(((__inst__->FrischluftbetriebOut^1)&(__inst__->UmluftbetriebOut^1))){
if(((__inst__->DachluftTemp<=__inst__->AbluftTemp))){
(__inst__->UmluftbetriebOut=1);
}else if((((__inst__->DachluftTemp+__inst__->DifferenzTempUmschaltung)>=__inst__->AbluftTemp))){
(__inst__->FrischluftbetriebOut=1);
}else{
(__inst__->UmluftbetriebOut=1);
}
}


(__inst__->TON_Umluft.IN=(__inst__->FrischluftbetriebOut&((__inst__->DachluftTemp<=__inst__->AbluftTemp))));;(__inst__->TON_Umluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Umluft);
(__inst__->TON_Frischluft.IN=(__inst__->UmluftbetriebOut&((__inst__->DachluftTemp>(__inst__->AbluftTemp+__inst__->DifferenzTempUmschaltung)))));;(__inst__->TON_Frischluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Frischluft);

if((__inst__->TON_Umluft.Q&~__inst__->zzEdge00000&1?((__inst__->zzEdge00000=__inst__->TON_Umluft.Q&1),1):((__inst__->zzEdge00000=__inst__->TON_Umluft.Q&1),0))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);
}else if((__inst__->TON_Frischluft.Q&~__inst__->zzEdge00001&1?((__inst__->zzEdge00001=__inst__->TON_Frischluft.Q&1),1):((__inst__->zzEdge00001=__inst__->TON_Frischluft.Q&1),0))){
(__inst__->UmluftbetriebOut=0);
(__inst__->FrischluftbetriebOut=1);
}



if(((__inst__->SensorAbluftVhd^1)|(__inst__->SensorDachluftVhd^1)|(__inst__->StatusSensorDachluftOk^1)|(__inst__->StatusSensorAbluftOk^1))){
(__inst__->stateEntry=1);
(__inst__->step=0);
}



}break;case 2:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}





if(((__inst__->FrischluftbetriebOut^1)&(__inst__->UmluftbetriebOut^1))){
if(((__inst__->FrischluftTemp<=__inst__->AbluftTemp))){
(__inst__->UmluftbetriebOut=1);
}else if((((__inst__->FrischluftTemp+__inst__->DifferenzTempUmschaltung)>=__inst__->AbluftTemp))){
(__inst__->FrischluftbetriebOut=1);
}else{
(__inst__->UmluftbetriebOut=1);
}
}


(__inst__->TON_Umluft.IN=(__inst__->FrischluftbetriebOut&((__inst__->FrischluftTemp<=__inst__->AbluftTemp))));;(__inst__->TON_Umluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Umluft);
(__inst__->TON_Frischluft.IN=(__inst__->UmluftbetriebOut&((__inst__->FrischluftTemp>(__inst__->AbluftTemp+__inst__->DifferenzTempUmschaltung)))));;(__inst__->TON_Frischluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Frischluft);

if((__inst__->TON_Umluft.Q&~__inst__->zzEdge00002&1?((__inst__->zzEdge00002=__inst__->TON_Umluft.Q&1),1):((__inst__->zzEdge00002=__inst__->TON_Umluft.Q&1),0))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);
}else if((__inst__->TON_Frischluft.Q&~__inst__->zzEdge00003&1?((__inst__->zzEdge00003=__inst__->TON_Frischluft.Q&1),1):((__inst__->zzEdge00003=__inst__->TON_Frischluft.Q&1),0))){
(__inst__->UmluftbetriebOut=0);
(__inst__->FrischluftbetriebOut=1);
}



if(((__inst__->SensorAbluftVhd^1)|(__inst__->SensorFrischluftVhd^1)|(__inst__->StatusSensorFrischluftOk^1)|(__inst__->StatusSensorAbluftOk^1))){
(__inst__->stateEntry=1);
(__inst__->step=0);
}





}break;case 3:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}





if(((__inst__->FrischluftbetriebOut^1)&(__inst__->UmluftbetriebOut^1))){
if(((__inst__->DachluftTemp<=__inst__->FrischlDachlTempUmschaltung))){
(__inst__->UmluftbetriebOut=1);
}else if(((__inst__->DachluftTemp>=__inst__->FrischlDachlTempUmschaltung))){
(__inst__->FrischluftbetriebOut=1);
}else{
(__inst__->UmluftbetriebOut=1);
}
}


(__inst__->TON_Umluft.IN=(__inst__->FrischluftbetriebOut&((__inst__->DachluftTemp<=(__inst__->FrischlDachlTempUmschaltung-__inst__->Hysterese)))));;(__inst__->TON_Umluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Umluft);
(__inst__->TON_Frischluft.IN=(__inst__->UmluftbetriebOut&((__inst__->DachluftTemp>__inst__->FrischlDachlTempUmschaltung))));;(__inst__->TON_Frischluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Frischluft);

if((__inst__->TON_Umluft.Q&~__inst__->zzEdge00004&1?((__inst__->zzEdge00004=__inst__->TON_Umluft.Q&1),1):((__inst__->zzEdge00004=__inst__->TON_Umluft.Q&1),0))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);
}else if((__inst__->TON_Frischluft.Q&~__inst__->zzEdge00005&1?((__inst__->zzEdge00005=__inst__->TON_Frischluft.Q&1),1):((__inst__->zzEdge00005=__inst__->TON_Frischluft.Q&1),0))){
(__inst__->UmluftbetriebOut=0);
(__inst__->FrischluftbetriebOut=1);
}


if(((__inst__->SensorDachluftVhd^1)|(__inst__->StatusSensorDachluftOk^1))){
(__inst__->stateEntry=1);
(__inst__->step=0);
}



}break;case 4:{

if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}





if(((__inst__->FrischluftbetriebOut^1)&(__inst__->UmluftbetriebOut^1))){
if(((__inst__->FrischluftTemp<=__inst__->FrischlDachlTempUmschaltung))){
(__inst__->UmluftbetriebOut=1);
}else if(((__inst__->FrischluftTemp>=__inst__->FrischlDachlTempUmschaltung))){
(__inst__->FrischluftbetriebOut=1);
}
}


(__inst__->TON_Umluft.IN=(__inst__->FrischluftbetriebOut&((__inst__->FrischluftTemp<=(__inst__->FrischlDachlTempUmschaltung-__inst__->Hysterese)))));;(__inst__->TON_Umluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Umluft);
(__inst__->TON_Frischluft.IN=(__inst__->UmluftbetriebOut&((__inst__->FrischluftTemp>__inst__->FrischlDachlTempUmschaltung))));;(__inst__->TON_Frischluft.PT=__inst__->Umschaltverz);;TON(&__inst__->TON_Frischluft);

if((__inst__->TON_Umluft.Q&~__inst__->zzEdge00006&1?((__inst__->zzEdge00006=__inst__->TON_Umluft.Q&1),1):((__inst__->zzEdge00006=__inst__->TON_Umluft.Q&1),0))){
(__inst__->UmluftbetriebOut=1);
(__inst__->FrischluftbetriebOut=0);
}else if((__inst__->TON_Frischluft.Q&~__inst__->zzEdge00007&1?((__inst__->zzEdge00007=__inst__->TON_Frischluft.Q&1),1):((__inst__->zzEdge00007=__inst__->TON_Frischluft.Q&1),0))){
(__inst__->UmluftbetriebOut=0);
(__inst__->FrischluftbetriebOut=1);
}


if(((__inst__->SensorFrischluftVhd^1)|(__inst__->StatusSensorFrischluftOk^1))){
(__inst__->stateEntry=1);
(__inst__->step=0);
}


}break;}


}else{

(__inst__->stateEntry=1);
(__inst__->step=0);
(__inst__->FrischluftbetriebOut=1);
(__inst__->UmluftbetriebOut=0);

}


}imp1_end0_0:;}
#line 241 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenUmschaltung.nodebug"

void __AS__ImplInitfbBoxenUmschaltung_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenUmschaltung.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenUmschaltung.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenUmschaltung.st\\\"\\n\"");
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
