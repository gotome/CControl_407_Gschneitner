#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockVentst.h"
#line 1 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockVent.nodebug"
#line 13 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockVent.st"
void fbTrockVent(struct fbTrockVent* inst){struct fbTrockVent* __inst__=inst;{

if((((unsigned long)(unsigned char)__inst__->Freigabe==(unsigned long)(unsigned char)1))){

(__inst__->curStep=CheckRange(__inst__->nextStep,0,9));

switch(__inst__->curStep){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->FreigabeKlappen=0);
(__inst__->FreigabeLuftentf=0);
(__inst__->FreigabeVent1=0);
(__inst__->FreigabeVent2=0);
(__inst__->SollDrehzVent1=(3.00000000000000000000E+01));
(__inst__->SollDrehzVent2=(3.00000000000000000000E+01));
}






if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->nextStep=9);
}else if(((__inst__->AnfVent1|__inst__->AnfVent2)&(__inst__->AnfLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=4);
}else if(((__inst__->AnfVent1|__inst__->AnfVent2)&__inst__->AnfLuftentf)){
(__inst__->stateEntry=1);
(__inst__->nextStep=3);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}





}break;case 1:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->TON_AnlaufverzVent2.IN=__inst__->FreigabeVent1);
(__inst__->TON_AnlaufverzVent2.PT=(plctime)__inst__->AnlaufverzVent2);

(__inst__->FreigabeVent1=1);
(__inst__->FreigabeVent2=(__inst__->AnfVent2&__inst__->TON_AnlaufverzVent2.Q));

if((__inst__->Strombegrenzung&((__inst__->DrehzahlVent1Leistung>=__inst__->DrehzahlBeiStrombegrenzung)))){
(__inst__->SollDrehzVent1=__inst__->DrehzahlBeiStrombegrenzung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlBeiStrombegrenzung);
}else{
(__inst__->SollDrehzVent1=__inst__->DrehzahlVent1Leistung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlVent2Leistung);
}



if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->nextStep=9);
(__inst__->TON_AnlaufverzVent2.IN=0);
}else if(((__inst__->AnfVent1^1)&(__inst__->AnfVent2^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=2);
(__inst__->TON_AnlaufverzVent2.IN=0);
}else if((__inst__->AnfLuftentf&(__inst__->FreigabeLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=3);
(__inst__->TON_AnlaufverzVent2.IN=__inst__->FreigabeVent1);
}else if((__inst__->FreigabeLuftentf&(__inst__->AnfLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=7);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}





}break;case 2:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->FreigabeLuftentf=0);
}


(__inst__->SollDrehzVent1=(3.00000000000000000000E+01));
(__inst__->SollDrehzVent2=(3.00000000000000000000E+01));

if(((__inst__->IstDrehzahlVent1==__inst__->SollDrehzVent1))){
(__inst__->FreigabeVent1=0);
}

if(((__inst__->IstDrehzahlVent2==__inst__->SollDrehzVent2))){
(__inst__->FreigabeVent2=0);
}



if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->nextStep=9);
}else if((__inst__->AnfVent1|__inst__->AnfVent2)){
(__inst__->stateEntry=1);
(__inst__->nextStep=0);
}else if((__inst__->FreigabeKlappen&(__inst__->FreigabeVent1^1)&(__inst__->FreigabeVent2^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=4);
}else if(((__inst__->FreigabeVent1^1)&(__inst__->FreigabeVent2^1))){
(__inst__->stateEntry=1);
(__inst__->nextStep=0);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}




}break;case 3:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->SollDrehzVent1=(3.00000000000000000000E+01));
(__inst__->SollDrehzVent2=(3.00000000000000000000E+01));

if(((__inst__->IstDrehzahlVent1==__inst__->SollDrehzVent1))){
(__inst__->FreigabeVent1=0);
}

if(((__inst__->IstDrehzahlVent2==__inst__->SollDrehzVent2))){
(__inst__->FreigabeVent2=0);
}

(__inst__->TON_LaufzeitKlappen.IN=((__inst__->FreigabeVent1^1)&(__inst__->FreigabeVent2^1)));
(__inst__->TON_LaufzeitKlappen.PT=(plctime)__inst__->LaufzeitKlappen);

(__inst__->FreigabeKlappen=__inst__->TON_LaufzeitKlappen.IN);



if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=9);
}else if(((__inst__->AnfLuftentf^1)|((__inst__->AnfVent1|__inst__->AnfVent2)^1))){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=4);
}else if(__inst__->TON_LaufzeitKlappen.Q){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=5);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}




}break;case 4:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->SollDrehzVent1=(3.00000000000000000000E+01));
(__inst__->SollDrehzVent2=(3.00000000000000000000E+01));

if(((__inst__->IstDrehzahlVent1==__inst__->SollDrehzVent1))){
(__inst__->FreigabeVent1=0);
}

if(((__inst__->IstDrehzahlVent2==__inst__->SollDrehzVent2))){
(__inst__->FreigabeVent2=0);
}

(__inst__->TON_LaufzeitKlappen.IN=((__inst__->FreigabeVent1^1)&(__inst__->FreigabeVent2^1)));
(__inst__->TON_LaufzeitKlappen.PT=(plctime)__inst__->LaufzeitKlappen);

(__inst__->FreigabeKlappen=(__inst__->TON_LaufzeitKlappen.IN^1));




if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=9);
}else if(__inst__->AnfLuftentf){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=3);
}else if((__inst__->TON_LaufzeitKlappen.Q&(__inst__->AnfVent1|__inst__->AnfVent2))){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=1);
}else if((__inst__->TON_LaufzeitKlappen.Q&(__inst__->AnfVent1^1)&(__inst__->AnfVent2^1))){
(__inst__->stateEntry=1);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->nextStep=0);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}


}break;case 5:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->TON_AnlaufverzVent2.IN=__inst__->FreigabeVent1);
(__inst__->TON_AnlaufverzVent2.PT=(plctime)__inst__->AnlaufverzVent2);

(__inst__->TON_LuftentfVorbereitung.IN=__inst__->FreigabeVent1);
(__inst__->TON_LuftentfVorbereitung.PT=(plctime)__inst__->EinschaltverzLuftentf);

(__inst__->FreigabeVent1=1);
(__inst__->FreigabeVent2=(__inst__->AnfVent2&__inst__->TON_AnlaufverzVent2.Q));


if((__inst__->Strombegrenzung&((__inst__->DrehzahlVent1Leistung>=__inst__->DrehzahlBeiStrombegrenzung)))){
(__inst__->SollDrehzVent1=__inst__->DrehzahlBeiStrombegrenzung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlBeiStrombegrenzung);
}else{
(__inst__->SollDrehzVent1=__inst__->DrehzahlVent1Leistung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlVent2Leistung);
}



if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->TON_LuftentfVorbereitung.IN=0);
(__inst__->nextStep=9);
}else if((__inst__->AnfLuftentf^1)){
(__inst__->stateEntry=1);
(__inst__->TON_LuftentfVorbereitung.IN=0);
(__inst__->nextStep=4);
}else if(__inst__->TON_LuftentfVorbereitung.Q){
(__inst__->stateEntry=1);
(__inst__->TON_LuftentfVorbereitung.IN=0);
(__inst__->nextStep=6);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}




}break;case 6:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->FreigabeLuftentf=1);



(__inst__->nextStep=1);




}break;case 7:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->TON_AuslaufzeitLuftentf.IN=(__inst__->KeineKlappenAmLuftentf^1));
(__inst__->TON_AuslaufzeitLuftentf.PT=(plctime)__inst__->AuslaufzeitLuftentfeuchter);

(__inst__->FreigabeLuftentf=0);

if((__inst__->Strombegrenzung&((__inst__->DrehzahlVent1Leistung>=__inst__->DrehzahlBeiStrombegrenzung)))){
(__inst__->SollDrehzVent1=__inst__->DrehzahlBeiStrombegrenzung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlBeiStrombegrenzung);
}else{
(__inst__->SollDrehzVent1=__inst__->DrehzahlVent1Leistung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlVent2Leistung);
}


if((__inst__->Tarifabschaltung&(__inst__->BetriebsmldgLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->TON_AuslaufzeitLuftentf.IN=0);
(__inst__->nextStep=9);
}else if(((__inst__->AnfVent1^1)&(__inst__->AnfVent2^1)&(__inst__->BetriebsmldgLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->TON_AuslaufzeitLuftentf.IN=0);
(__inst__->nextStep=2);
}else if(__inst__->AnfLuftentf){
(__inst__->stateEntry=1);
(__inst__->TON_AuslaufzeitLuftentf.IN=0);
(__inst__->nextStep=6);
}else if(((__inst__->TON_AuslaufzeitLuftentf.Q|__inst__->KeineKlappenAmLuftentf)&(__inst__->BetriebsmldgLuftentf^1))){
(__inst__->stateEntry=1);
(__inst__->TON_AuslaufzeitLuftentf.IN=0);
(__inst__->nextStep=8);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}


}break;case 8:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->TON_AnlaufverzVent2.IN=__inst__->FreigabeVent1);
(__inst__->TON_AnlaufverzVent2.PT=(plctime)__inst__->AnlaufverzVent2);

(__inst__->FreigabeVent1=1);
(__inst__->FreigabeVent2=(__inst__->AnfVent2&__inst__->TON_AnlaufverzVent2.Q));


if((__inst__->Strombegrenzung&((__inst__->DrehzahlVent1Leistung>=__inst__->DrehzahlBeiStrombegrenzung)))){
(__inst__->SollDrehzVent1=__inst__->DrehzahlBeiStrombegrenzung);
(__inst__->SollDrehzVent2=__inst__->DrehzahlBeiStrombegrenzung);
}else{
(__inst__->SollDrehzVent1=__inst__->DrehzahlVent1Max);
if(((__inst__->IstDrehzahlVent1==__inst__->SollDrehzVent1))){
(__inst__->SollDrehzVent2=__inst__->DrehzahlVent2Max);
}
}

(__inst__->TON_Messung.IN=(((__inst__->IstDrehzahlVent1==__inst__->DrehzahlVent1Max))&(((__inst__->IstDrehzahlVent2==__inst__->DrehzahlVent2Max))|(__inst__->AnfVent2^1))));
(__inst__->TON_Messung.PT=(plctime)__inst__->MessdauerLuftgeschw);
(__inst__->MessungAktiv=__inst__->TON_Messung.IN);



if(__inst__->Tarifabschaltung){
(__inst__->stateEntry=1);
(__inst__->MessungAktiv=0);
(__inst__->TON_Messung.IN=0);
(__inst__->TON_AnlaufverzVent2.IN=0);
(__inst__->nextStep=9);
}else if(((__inst__->AnfVent1^1)&(__inst__->AnfVent2^1))){
(__inst__->stateEntry=1);
(__inst__->MessungAktiv=0);
(__inst__->TON_Messung.IN=0);
(__inst__->TON_AnlaufverzVent2.IN=0);
(__inst__->nextStep=2);
}else if((__inst__->TON_Messung.Q|__inst__->Strombegrenzung|__inst__->KeineKlappenAmLuftentf)){
if((__inst__->Strombegrenzung^1)){
if(((__inst__->AnfVent1&(__inst__->AnfVent2^1))&__inst__->TON_Messung.Q)){
(CheckWriteAccess(__inst__->LuftgeschwBeiMaxDrehzahl1Vent),(*(__inst__->LuftgeschwBeiMaxDrehzahl1Vent))=__inst__->Mittelwertbildung.y);
}else if(__inst__->TON_Messung.Q){
(CheckWriteAccess(__inst__->LuftgeschwBeiMaxDrehzahl2Vent),(*(__inst__->LuftgeschwBeiMaxDrehzahl2Vent))=__inst__->Mittelwertbildung.y);
}
}
(__inst__->stateEntry=1);
(__inst__->MessungAktiv=0);
(__inst__->TON_Messung.IN=0);
(__inst__->TON_AnlaufverzVent2.IN=0);
(__inst__->nextStep=4);
}else if(__inst__->AnfLuftentf){
(__inst__->stateEntry=1);
(__inst__->MessungAktiv=0);
(__inst__->TON_Messung.IN=0);
(__inst__->TON_AnlaufverzVent2.IN=0);
(__inst__->nextStep=6);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}




}break;case 9:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
}


(__inst__->SollDrehzVent1=(3.00000000000000000000E+01));
(__inst__->SollDrehzVent2=(3.00000000000000000000E+01));

(__inst__->FreigabeLuftentf=0);

if(((__inst__->IstDrehzahlVent1==__inst__->SollDrehzVent1))){
(__inst__->FreigabeVent1=0);
}

if(((__inst__->IstDrehzahlVent2==__inst__->SollDrehzVent2))){
(__inst__->FreigabeVent2=0);
}

(__inst__->FreigabeKlappen=(__inst__->FreigabeVent1|__inst__->FreigabeVent2));



if((__inst__->Tarifabschaltung^1)){
(__inst__->stateEntry=1);
(__inst__->nextStep=0);
}else{
(__inst__->nextStep=CheckRange(__inst__->curStep,0,9));
}

}break;}


if((__inst__->sekTick&__inst__->MessungAktiv)){
(__inst__->Mittelwertbildung.enable=__inst__->MessungAktiv);
(__inst__->Mittelwertbildung.x=__inst__->LuftgeschwAktuell);
(__inst__->Mittelwertbildung.base=30);
LCRMovAvgFlt(&__inst__->Mittelwertbildung);
}


TON(&__inst__->TON_AnlaufverzVent2);
TON(&__inst__->TON_AuslaufzeitLuftentf);
TON(&__inst__->TON_LaufzeitKlappen);
TON(&__inst__->TON_LuftentfVorbereitung);
TON(&__inst__->TON_Messung);

}else{


(__inst__->FreigabeKlappen=0);
(__inst__->FreigabeLuftentf=0);
(__inst__->FreigabeVent1=0);
(__inst__->FreigabeVent2=0);
(__inst__->MessungAktiv=0);
(__inst__->SollDrehzVent1=(0.00000000000000000000E+00));
(__inst__->SollDrehzVent2=(0.00000000000000000000E+00));
(__inst__->TON_AnlaufverzVent2.IN=0);
(__inst__->TON_AuslaufzeitLuftentf.IN=0);
(__inst__->TON_LaufzeitKlappen.IN=0);
(__inst__->TON_Messung.IN=0);
(__inst__->TON_LuftentfVorbereitung.IN=0);
(__inst__->curStep=0);
(__inst__->nextStep=0);

}

}imp1_end0_0:;}
#line 484 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockVent.nodebug"

void __AS__ImplInitfbTrockVent_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockVent.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockVent.st.c\\\" \\\"C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockVent.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockZeitprogramm\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockLaufPause\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockNachtrock\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockTarifabsch\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockStrombegr\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockAutomatik\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockStufen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockVent\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockVariante\\\" FUB\\n\"");
__asm__(".previous");
