#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LaEntfV2/fbEntfFremdst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfFremd.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfFremd.st"
void fbEntfFremd(struct fbEntfFremd* inst){struct fbEntfFremd* __inst__=inst;{


(__inst__->TON_Stoerung.IN=__inst__->StoerungIn);;(__inst__->TON_Stoerung.PT=__inst__->parVerzStoerung);;TON(&__inst__->TON_Stoerung);


if((__inst__->TON_Stoerung.Q|__inst__->TON_VerzBetriebsmeldung.Q)){
(__inst__->StoerungOut=1);
}


if(__inst__->TON_VerzBetriebsmeldung.Q){
(__inst__->FehlerBetriebsmldg=1);
}



if((__inst__->QuitFehler&(__inst__->StoerungIn^1))){
(__inst__->StoerungOut=0);
(__inst__->FehlerBetriebsmldg=0);
}



(__inst__->curStep=__inst__->nextStep);

switch(__inst__->curStep){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->FreigabeKompressorOut=0);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->TON_VerzBetriebsmeldung.IN=0);;(__inst__->TON_VerzBetriebsmeldung.PT=0);;TON(&__inst__->TON_VerzBetriebsmeldung);
}







if((((__inst__->Automatik&__inst__->WitterungIstSchlecht)|__inst__->Dauerbetrieb)&__inst__->Freigabe&__inst__->BetriebsmldgVentilator&(__inst__->StoerungOut^1))){
(__inst__->nextStep=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->stateEntry=1);
}else{
(__inst__->nextStep=__inst__->curStep);
}




}break;case 1:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->FreigabeKompressorOut=0);
}




(__inst__->TON_Kompressor.IN=1);;(__inst__->TON_Kompressor.PT=__inst__->parEinschaltverzKompressor);;TON(&__inst__->TON_Kompressor);






if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->WitterungIstSchlecht^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|__inst__->StoerungOut|(__inst__->BetriebsmldgVentilator^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);

}else if(__inst__->TON_Kompressor.Q){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=2);
}




}break;case 2:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->TON_VerzBetriebsmeldung.IN=0);;(__inst__->TON_VerzBetriebsmeldung.PT=0);;TON(&__inst__->TON_VerzBetriebsmeldung);
}




(__inst__->FreigabeKompressorOut=1);


(__inst__->TON_VerzBetriebsmeldung.IN=(__inst__->FreigabeKompressorOut&(__inst__->BetriebsmldgEntfeuchter^1)));;(__inst__->TON_VerzBetriebsmeldung.PT=__inst__->parVerzBetriebEntfeuchter);;TON(&__inst__->TON_VerzBetriebsmeldung);





if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|(__inst__->Freigabe^1)|((__inst__->WitterungIstSchlecht^1)&__inst__->Automatik)|__inst__->StoerungOut|(__inst__->BetriebsmldgVentilator^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=3);
}else{
(__inst__->nextStep=__inst__->curStep);
}





}break;case 3:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->TON_VerzBetriebsmeldung.IN=0);;(__inst__->TON_VerzBetriebsmeldung.PT=0);;TON(&__inst__->TON_VerzBetriebsmeldung);
(__inst__->FreigabeKompressorOut=0);
}


(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);



}break;}




}imp1_case3_3:imp1_endcase3_0:;}
#line 148 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfFremd.nodebug"

void __AS__ImplInitfbEntfFremd_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LaEntfV2/fbEntfFremd.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LaEntfV2/fbEntfFremd.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfFremd.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfOelsumpfheiz\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfKompressor\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfFremd\\\" FUB\\n\"");
__asm__(".previous");
