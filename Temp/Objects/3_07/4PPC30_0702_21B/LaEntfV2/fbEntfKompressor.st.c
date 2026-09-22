#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LaEntfV2/fbEntfKompressorst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfKompressor.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfKompressor.st"
void fbEntfKompressor(struct fbEntfKompressor* inst){struct fbEntfKompressor* __inst__=inst;{



(__inst__->fbLascoEUhr_0.Freigabe=1);;fbLascoEUhr(&__inst__->fbLascoEUhr_0);
(__inst__->fbLascoZdxx_0.IN=__inst__->fbLascoEUhr_0.Sekunde);;fbLascoZdxx(&__inst__->fbLascoZdxx_0);
(__inst__->sekTick=__inst__->fbLascoZdxx_0.Q);


if(((__inst__->SicherheitOk^1)|__inst__->fbFuKompressor.StoerungFU)){
(__inst__->StoerungOut=1);
}



if(__inst__->QuitFehler){
(__inst__->FehlerPumpdown=0);
(__inst__->StoerungOut=0);
}


(__inst__->fbFuKompressor.AnsprechZeitFU=5);
(__inst__->fbFuKompressor.BetrMldg=__inst__->BetriebsmldgKompressor);
(__inst__->fbFuKompressor.MinDrehzahl=(0.00000000000000000000E+00));
(__inst__->fbFuKompressor.MaxDrehzahl=__inst__->DrehzahlMax);
(__inst__->fbFuKompressor.RampeUpSek=__inst__->RampeUp);
(__inst__->fbFuKompressor.RampeDownSek=__inst__->RampeDown);
(__inst__->fbFuKompressor.Reset=__inst__->QuitFehler);
(__inst__->fbFuKompressor.Tick=__inst__->sekTick);
fbLascoFU(&__inst__->fbFuKompressor);
(__inst__->FreigabeKompressorOut=__inst__->fbFuKompressor.BetriebFU);
(__inst__->DrehzahlOut=__inst__->fbFuKompressor.DrehzahlFU);


if(((__inst__->Dauerbetrieb^1)&(__inst__->Automatik^1))){
(__inst__->loc_StatusFeuchteOk=0);
}else if(__inst__->Dauerbetrieb){
(__inst__->loc_StatusFeuchteOk=1);
}else if((((__inst__->EintrittFeuchte<=__inst__->parFeuchteAus))&__inst__->loc_StatusFeuchteOk)){
(__inst__->loc_StatusFeuchteOk=0);
}else if((((__inst__->EintrittFeuchte>=__inst__->parFeuchteEin))&(__inst__->loc_StatusFeuchteOk^1))){
(__inst__->loc_StatusFeuchteOk=1);
}


(__inst__->curStep=__inst__->nextStep);

switch(__inst__->curStep){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->fbFuKompressor.Freigabe=0);
(__inst__->fbFuKompressor.SollDrehzahl=(0.00000000000000000000E+00));
(__inst__->TON_EinschaltverzMagnetventil.IN=0);;(__inst__->TON_EinschaltverzMagnetventil.PT=0);;TON(&__inst__->TON_EinschaltverzMagnetventil);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->TON_Abtau.IN=0);;(__inst__->TON_Abtau.PT=0);;TON(&__inst__->TON_Abtau);
(__inst__->AbtauungAktiv=0);
(__inst__->MagnetventilOut=0);
}








if((((__inst__->Automatik&__inst__->StatusSensorEintrittOk)|__inst__->Dauerbetrieb)&__inst__->Freigabe&__inst__->StatusSensorNiederdruckOk&__inst__->loc_StatusFeuchteOk&__inst__->SicherheitOk&__inst__->BetriebsmldgVentilator&__inst__->diHochdruckOk&__inst__->diNiederdruckOk)){
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
(__inst__->fbFuKompressor.Freigabe=0);
(__inst__->fbFuKompressor.SollDrehzahl=(0.00000000000000000000E+00));
(__inst__->MagnetventilOut=0);
(__inst__->AbtauungAktiv=0);
}




(__inst__->TON_Kompressor.IN=1);;(__inst__->TON_Kompressor.PT=__inst__->parEinschaltverzKompressor);;TON(&__inst__->TON_Kompressor);

(__inst__->fbFuKompressor.Freigabe=__inst__->TON_Kompressor.Q);
(__inst__->fbFuKompressor.SollDrehzahl=__inst__->DrehzahlvorgabeFU);






if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->StatusSensorEintrittOk^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|(__inst__->StatusSensorNiederdruckOk^1)|(__inst__->SicherheitOk^1)|(__inst__->BetriebsmldgVentilator^1)|(__inst__->loc_StatusFeuchteOk^1)|(__inst__->diHochdruckOk^1)|(__inst__->diNiederdruckOk^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);

}else if(__inst__->fbFuKompressor.Freigabe){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=2);
}




}break;case 2:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Kompressor.IN=0);;(__inst__->TON_Kompressor.PT=0);;TON(&__inst__->TON_Kompressor);
(__inst__->TON_EinschaltverzMagnetventil.IN=0);;(__inst__->TON_EinschaltverzMagnetventil.PT=0);;TON(&__inst__->TON_EinschaltverzMagnetventil);
(__inst__->MagnetventilOut=0);
}




(__inst__->TON_EinschaltverzMagnetventil.IN=1);;(__inst__->TON_EinschaltverzMagnetventil.PT=__inst__->parEinschaltverzMagnetventil);;TON(&__inst__->TON_EinschaltverzMagnetventil);
(__inst__->MagnetventilOut=(__inst__->TON_EinschaltverzMagnetventil.Q|(((unsigned long)__inst__->parEinschaltverzMagnetventil==(unsigned long)0))));






if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->StatusSensorEintrittOk^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|(__inst__->StatusSensorNiederdruckOk^1)|(__inst__->SicherheitOk^1)|(__inst__->BetriebsmldgVentilator^1)|(__inst__->diHochdruckOk^1)|(__inst__->diNiederdruckOk^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
if(__inst__->MagnetventilOut){
(__inst__->nextStep=4);
}else{
(__inst__->nextStep=0);
}

}else if(__inst__->MagnetventilOut){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=3);
}




}break;case 3:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Abtau.IN=0);;(__inst__->TON_Abtau.PT=0);;TON(&__inst__->TON_Abtau);
(__inst__->AbtauungAktiv=0);
(__inst__->TON_Klappenumschaltung.IN=0);;(__inst__->TON_Klappenumschaltung.PT=0);;TON(&__inst__->TON_Klappenumschaltung);
}



(__inst__->fbFuKompressor.SollDrehzahl=__inst__->DrehzahlvorgabeFU);


(__inst__->TON_Abtau.IN=((__inst__->Niederdruck<=__inst__->parNiederdruckMin)));;(__inst__->TON_Abtau.PT=__inst__->parEinschaltverzAbtau);;TON(&__inst__->TON_Abtau);


(__inst__->TON_Klappenumschaltung.IN=(((__inst__->Hochdruck>__inst__->parHochdruckMax))&__inst__->KlappenumschaltungAkiv));;(__inst__->TON_Klappenumschaltung.PT=__inst__->parVerzStandbyBeiKlappenumsch);;TON(&__inst__->TON_Klappenumschaltung);





if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->StatusSensorEintrittOk^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|(__inst__->StatusSensorNiederdruckOk^1)|(__inst__->SicherheitOk^1)|(__inst__->BetriebsmldgVentilator^1)|(__inst__->loc_StatusFeuchteOk^1)|(__inst__->diHochdruckOk^1)|(__inst__->diNiederdruckOk^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=4);

}else if(__inst__->TON_Abtau.Q){
(__inst__->stateEntry=1);
(__inst__->AbtauungAktiv=1);
(__inst__->nextStep=6);
(__inst__->lastStep=__inst__->curStep);

}else if(__inst__->TON_Klappenumschaltung.Q){
(__inst__->stateEntry=1);
(__inst__->nextStep=7);
(__inst__->lastStep=__inst__->curStep);
}else{
(__inst__->nextStep=__inst__->curStep);
}



}break;case 4:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Abtau.IN=0);;(__inst__->TON_Abtau.PT=0);;TON(&__inst__->TON_Abtau);
(__inst__->AbtauungAktiv=0);
(__inst__->MagnetventilOut=0);
(__inst__->fbFuKompressor.SollDrehzahl=__inst__->DrehzahlMin);
(__inst__->TON_LaufzeitPumpdown.IN=0);;(__inst__->TON_LaufzeitPumpdown.PT=0);;TON(&__inst__->TON_LaufzeitPumpdown);
}




(__inst__->TON_LaufzeitPumpdown.IN=1);;(__inst__->TON_LaufzeitPumpdown.PT=(300000));;TON(&__inst__->TON_LaufzeitPumpdown);





if((((__inst__->Automatik&__inst__->StatusSensorEintrittOk)|__inst__->Dauerbetrieb)&__inst__->StatusSensorNiederdruckOk&__inst__->SicherheitOk&__inst__->Freigabe&__inst__->BetriebsmldgVentilator&__inst__->loc_StatusFeuchteOk)){
(__inst__->MagnetventilOut=1);
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=3);

}else if((((__inst__->Niederdruck<__inst__->parNiederdruckPumpdown))|(__inst__->StatusSensorNiederdruckOk^1)|__inst__->fbFuKompressor.StoerungFU|__inst__->TON_LaufzeitPumpdown.Q|(__inst__->diNiederdruckOk^1)|(__inst__->diHochdruckOk^1))){
(__inst__->stateEntry=1);
if(__inst__->TON_LaufzeitPumpdown.Q){
(__inst__->FehlerPumpdown=1);
}
(__inst__->TON_LaufzeitPumpdown.IN=0);;(__inst__->TON_LaufzeitPumpdown.PT=0);;TON(&__inst__->TON_LaufzeitPumpdown);
(__inst__->nextStep=5);
(__inst__->lastStep=__inst__->curStep);
}else{
(__inst__->nextStep=__inst__->curStep);
}



}break;case 5:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Abtau.IN=0);;(__inst__->TON_Abtau.PT=0);;TON(&__inst__->TON_Abtau);
(__inst__->AbtauungAktiv=0);
}



(__inst__->fbFuKompressor.Freigabe=0);
(__inst__->fbFuKompressor.SollDrehzahl=(0.00000000000000000000E+00));




(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);



}break;case 6:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Abtau.IN=0);;(__inst__->TON_Abtau.PT=0);;TON(&__inst__->TON_Abtau);
(__inst__->AbtauungAktiv=1);
(__inst__->fbFuKompressor.SollDrehzahl=(0.00000000000000000000E+00));
(__inst__->MagnetventilOut=0);
}


if(((__inst__->fbFuKompressor.DrehzahlFU==(0.00000000000000000000E+00)))){
(__inst__->fbFuKompressor.Freigabe=0);
}


(__inst__->TON_Abtau.IN=((__inst__->Niederdruck>=__inst__->parNiederdruckMax)));;(__inst__->TON_Abtau.PT=__inst__->parAusschaltverzAbtau);;TON(&__inst__->TON_Abtau);





if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->StatusSensorEintrittOk^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|(__inst__->StatusSensorNiederdruckOk^1)|(__inst__->SicherheitOk^1)|(__inst__->BetriebsmldgVentilator^1)|(__inst__->loc_StatusFeuchteOk^1)|(__inst__->diHochdruckOk^1)|(__inst__->diNiederdruckOk^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);

}else if(__inst__->TON_Abtau.Q){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=1);
}



}break;case 7:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->TON_Klappenumschaltung.IN=0);;(__inst__->TON_Klappenumschaltung.PT=0);;TON(&__inst__->TON_Klappenumschaltung);
(__inst__->StandbyKlappenumsch=1);
(__inst__->fbFuKompressor.SollDrehzahl=(0.00000000000000000000E+00));
(__inst__->MagnetventilOut=0);
}


if(((__inst__->fbFuKompressor.DrehzahlFU==(0.00000000000000000000E+00)))){
(__inst__->fbFuKompressor.Freigabe=0);
}


(__inst__->TON_Klappenumschaltung.IN=(__inst__->KlappenumschaltungAkiv^1));;(__inst__->TON_Klappenumschaltung.PT=__inst__->parVerzStandbyBeiKlappenumsch);;TON(&__inst__->TON_Klappenumschaltung);





if((((__inst__->Automatik^1)&(__inst__->Dauerbetrieb^1))|((__inst__->StatusSensorEintrittOk^1)&__inst__->Automatik)|(__inst__->Freigabe^1)|(__inst__->StatusSensorNiederdruckOk^1)|(__inst__->SicherheitOk^1)|(__inst__->BetriebsmldgVentilator^1)|(__inst__->loc_StatusFeuchteOk^1)|(__inst__->diHochdruckOk^1)|(__inst__->diNiederdruckOk^1))){
(__inst__->stateEntry=1);
(__inst__->StandbyKlappenumsch=0);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);

}else if(__inst__->TON_Klappenumschaltung.Q){
(__inst__->stateEntry=1);
(__inst__->StandbyKlappenumsch=0);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=1);
}


}break;}

}imp1_case3_7:imp1_endcase3_0:;}
#line 348 "C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfKompressor.nodebug"

void __AS__ImplInitfbEntfKompressor_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LaEntfV2/fbEntfKompressor.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LaEntfV2/fbEntfKompressor.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LaEntfV2/fbEntfKompressor.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfOelsumpfheiz\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfKompressor\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbEntfFremd\\\" FUB\\n\"");
__asm__(".previous");
