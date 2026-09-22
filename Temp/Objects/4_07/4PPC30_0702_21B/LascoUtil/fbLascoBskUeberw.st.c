#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoUtil/fbLascoBskUeberwst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoUtil/fbLascoBskUeberw.nodebug"
#line 13 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoUtil/fbLascoBskUeberw.st"
void fbLascoBskUeberw(struct fbLascoBskUeberw* inst){struct fbLascoBskUeberw* __inst__=inst;{


if(__inst__->Freigabe){


(__inst__->curStep=CheckRange(__inst__->nextStep,0,5));





switch(__inst__->curStep){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
}







if(__inst__->Quit){
(__inst__->ctVersucheAuf=0);
(__inst__->ctVersucheZu=0);
}




if((__inst__->FreigabeOeffnen&(__inst__->loc_KlappeIstOffen^1))){
(__inst__->stateEntry=1);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=1);

}else if((__inst__->FreigabeSchliessen&(__inst__->loc_KlappeIstGeschlossen^1))){
(__inst__->stateEntry=1);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=3);
}



}break;case 1:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->loc_KlappeIstGeschlossen=0);
(__inst__->loc_KlappeIstOffen=0);
(__inst__->doKlappeOeffnen=1);
}




(__inst__->TON_Laufzeit.IN=1);;(__inst__->TON_Laufzeit.PT=__inst__->LaufzeitAuf);;TON(&__inst__->TON_Laufzeit);





if((__inst__->diKlappeGeoeffnet&(__inst__->TON_Laufzeit.Q^1))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->ctVersucheAuf=0);
(__inst__->stateEntry=1);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=0);
(__inst__->loc_KlappeIstOffen=1);


}else if(__inst__->TON_Laufzeit.Q){

if((((unsigned long)__inst__->ctVersucheAuf>=(unsigned long)__inst__->MaxVersucheAuf))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheAuf=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->doKlappeOeffnen=0);
(__inst__->nextStep=5);

}else{
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheAuf=(__inst__->ctVersucheAuf+1));
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->doKlappeOeffnen=0);
(__inst__->nextStep=2);
}

}else if((__inst__->FreigabeOeffnen^1)){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->ctVersucheAuf=0);
(__inst__->stateEntry=1);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=0);
}




}break;case 2:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
}






(__inst__->TON_Laufzeit.IN=1);;(__inst__->TON_Laufzeit.PT=__inst__->LaufzeitZu);;TON(&__inst__->TON_Laufzeit);




if((__inst__->diKlappeGeschlossen&__inst__->FreigabeOeffnen)){
(__inst__->stateEntry=1);
(__inst__->ctVersucheZu=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=1);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);

}else if(__inst__->TON_Laufzeit.Q){

if((((unsigned long)__inst__->ctVersucheZu>=(unsigned long)__inst__->MaxVersucheZu))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheZu=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->doKlappeOeffnen=0);
(__inst__->nextStep=5);

}else{
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheZu=(__inst__->ctVersucheZu+1));
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=1);
}

}else if((__inst__->FreigabeOeffnen^1)){
(__inst__->stateEntry=1);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->ctVersucheAuf=0);
(__inst__->nextStep=0);
}



}break;case 3:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->loc_KlappeIstGeschlossen=0);
(__inst__->loc_KlappeIstOffen=0);
(__inst__->doKlappeOeffnen=0);
}




(__inst__->TON_Laufzeit.IN=1);;(__inst__->TON_Laufzeit.PT=__inst__->LaufzeitZu);;TON(&__inst__->TON_Laufzeit);





if((__inst__->diKlappeGeschlossen&(__inst__->TON_Laufzeit.Q^1))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->ctVersucheZu=0);
(__inst__->stateEntry=1);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=0);
(__inst__->loc_KlappeIstGeschlossen=1);


}else if(__inst__->TON_Laufzeit.Q){

if((((unsigned long)__inst__->ctVersucheZu>=(unsigned long)__inst__->MaxVersucheZu))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheZu=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->doKlappeOeffnen=0);
(__inst__->nextStep=5);

}else{
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheZu=(__inst__->ctVersucheZu+1));
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=4);
}

}else if(__inst__->FreigabeOeffnen){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->ctVersucheZu=0);
(__inst__->stateEntry=1);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=0);
}





}break;case 4:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->doKlappeOeffnen=1);
}






(__inst__->TON_Laufzeit.IN=1);;(__inst__->TON_Laufzeit.PT=__inst__->LaufzeitAuf);;TON(&__inst__->TON_Laufzeit);




if((__inst__->diKlappeGeoeffnet&__inst__->FreigabeSchliessen)){
(__inst__->stateEntry=1);
(__inst__->ctVersucheAuf=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=3);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);

}else if(__inst__->TON_Laufzeit.Q){

if((((unsigned long)__inst__->ctVersucheAuf>=(unsigned long)__inst__->MaxVersucheAuf))){
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheAuf=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->doKlappeOeffnen=0);
(__inst__->nextStep=5);

}else{
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->ctVersucheAuf=(__inst__->ctVersucheAuf+1));
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=3);
}

}else if(__inst__->FreigabeOeffnen){
(__inst__->stateEntry=1);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->ctVersucheZu=0);
(__inst__->nextStep=0);
}




}break;case 5:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->Stoerung=1);
}







if(__inst__->Quit){
(__inst__->stateEntry=1);
(__inst__->Stoerung=0);
(__inst__->lastStep=CheckRange(__inst__->curStep,0,5));
(__inst__->nextStep=0);
}



}break;}



}else{


(__inst__->doKlappeOeffnen=0);
(__inst__->ctVersucheAuf=0);
(__inst__->ctVersucheZu=0);
(__inst__->Stoerung=0);
(__inst__->TON_Laufzeit.IN=0);;(__inst__->TON_Laufzeit.PT=(0));;TON(&__inst__->TON_Laufzeit);
(__inst__->stateEntry=1);
(__inst__->curStep=0);
(__inst__->nextStep=0);
(__inst__->lastStep=0);

}





}imp1_end0_0:;}
#line 344 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoUtil/fbLascoBskUeberw.nodebug"

void __AS__ImplInitfbLascoBskUeberw_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoUtil/fbLascoBskUeberw.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoUtil/fbLascoBskUeberw.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoUtil/fbLascoBskUeberw.st\\\"\\n\"");
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
