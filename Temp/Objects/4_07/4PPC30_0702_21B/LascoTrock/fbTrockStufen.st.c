#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockStufenst.h"
#line 1 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockStufen.nodebug"
#line 13 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockStufen.st"
void fbTrockStufen(struct fbTrockStufen* inst){struct fbTrockStufen* __inst__=inst;{



if(((((unsigned long)(unsigned char)__inst__->Freigabe==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)__inst__->FreigabeAuto==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)__inst__->AktuelleRezeptNr!=(unsigned long)(unsigned char)0)))){



if((((__inst__->FeuchteStart>0))&(((signed long)(signed long)(short)__inst__->RezeptStufeIst==(signed long)(signed long)(short)0)))){
for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if(((__inst__->FeuchteStart<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))){
(__inst__->RezeptStufeSoll=__inst__->i);
(__inst__->RezeptStufeIst=__inst__->i);
}
if(((__inst__->FeuchteStart>__inst__->FeuchteStufen[CheckBounds(1,0,10)]))){
(__inst__->RezeptStufeIst=1);
(__inst__->RezeptStufeSoll=1);
}
}imp1_endfor2_0:;
}



for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if(((__inst__->FeuchteAktuell<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))){
(__inst__->RezeptStufeSoll=__inst__->i);
}
}imp1_endfor5_0:;
if(((__inst__->FeuchteAktuell>__inst__->FeuchteStufen[CheckBounds(1,0,10)]))){
(__inst__->RezeptStufeSoll=1);
}



(__inst__->fbLascoZdxx_0.IN=__inst__->RezeptStufeSoll);;fbLascoZdxx(&__inst__->fbLascoZdxx_0);
(__inst__->TickStufe=__inst__->fbLascoZdxx_0.Q);



if((((signed long)(signed long)(short)__inst__->RezeptStufeSoll<=(signed long)(signed long)(short)5))){

(__inst__->Stufe6_ok=0);

(__inst__->TON_AenderungStufeAuto.IN=((((signed long)(signed long)(short)__inst__->RezeptStufeSoll!=(signed long)(signed long)(short)__inst__->RezeptStufeIst))&(__inst__->TickStufe^1)));
(__inst__->TON_AenderungStufeAuto.PT=(plctime)__inst__->VerzStufenwechsel);
TON(&__inst__->TON_AenderungStufeAuto);

if(__inst__->TON_AenderungStufeAuto.Q){
(__inst__->RezeptStufeIst=__inst__->RezeptStufeSoll);
}
}



if(((((signed long)(signed long)(short)__inst__->RezeptStufeSoll==(signed long)(signed long)(short)6))&(__inst__->Stufe6_ok^1))){
(__inst__->MldgBestaetigungErforderl=1);
if(__inst__->Bestaetigung){
(__inst__->RezeptStufeIst=__inst__->RezeptStufeSoll);
(__inst__->Stufe6_ok=1);
}
}else{
(__inst__->MldgBestaetigungErforderl=0);
}


for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if((((__inst__->FeuchteEnde<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))&((__inst__->FeuchteEnde>0)))){
(__inst__->RezeptStufeBeiEnde=__inst__->i);
}else if((((__inst__->FeuchteEnde>0))&((__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]<=__inst__->FeuchteEnde))&(((__inst__->FeuchteEnde>__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))^1))){
(__inst__->RezeptStufeBeiEnde=__inst__->i);
}
}imp1_endfor12_0:;




(__inst__->MeldungFertig=0);

if((((signed long)(signed long)(short)__inst__->RezeptStufeBeiEnde<(signed long)(signed long)(short)6))){
if((((signed long)(signed long)(short)__inst__->RezeptStufeIst>=(signed long)(signed long)(short)__inst__->RezeptStufeBeiEnde))){
(__inst__->MeldungFertig=1);
}
}else if((((signed long)(signed long)(short)__inst__->RezeptStufeBeiEnde>=(signed long)(signed long)(short)6))){
if(__inst__->NachtrocknungFertig){
(__inst__->MeldungFertig=1);
}
}





}else if(((((unsigned long)(unsigned char)__inst__->Freigabe==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)__inst__->AktuelleRezeptNr!=(unsigned long)(unsigned char)0)))){




if((((__inst__->FeuchteStart>0))&(((signed long)(signed long)(short)__inst__->RezeptStufeIst==(signed long)(signed long)(short)0)))){
for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if(((__inst__->FeuchteStart<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))){
(__inst__->RezeptStufeSoll=__inst__->i);
(__inst__->RezeptStufeIst=__inst__->i);
}
if(((__inst__->FeuchteStart>__inst__->FeuchteStufen[CheckBounds(1,0,10)]))){
(__inst__->RezeptStufeIst=1);
(__inst__->RezeptStufeSoll=1);
}
}imp1_endfor18_0:;
}



for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if(((__inst__->FeuchteAktuell<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))){
(__inst__->RezeptStufeSoll=__inst__->i);
}
}imp1_endfor21_0:;
if(((__inst__->FeuchteAktuell>__inst__->FeuchteStufen[CheckBounds(1,0,10)]))){
(__inst__->RezeptStufeSoll=1);
}


(__inst__->fbLascoZdxx_0.IN=__inst__->RezeptStufeSoll);;fbLascoZdxx(&__inst__->fbLascoZdxx_0);
(__inst__->TickStufe=__inst__->fbLascoZdxx_0.Q);



if((((signed long)(signed long)(short)__inst__->RezeptStufeSoll<=(signed long)(signed long)(short)6))){
(__inst__->Stufe6_ok=0);

(__inst__->TON_AenderungStufeAuto.IN=((((signed long)(signed long)(short)__inst__->RezeptStufeSoll!=(signed long)(signed long)(short)__inst__->RezeptStufeIst))&(__inst__->TickStufe^1)));
(__inst__->TON_AenderungStufeAuto.PT=(plctime)__inst__->VerzStufenwechsel);
TON(&__inst__->TON_AenderungStufeAuto);

if(__inst__->TON_AenderungStufeAuto.Q){
(__inst__->RezeptStufeIst=__inst__->RezeptStufeSoll);
}
}



for((__inst__->i=1);__inst__->i<=6;__inst__->i+=1){
if((((__inst__->FeuchteEnde<=__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))&((__inst__->FeuchteEnde>0)))){
(__inst__->RezeptStufeBeiEnde=__inst__->i);
}else if((((__inst__->FeuchteEnde>0))&((__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]<=__inst__->FeuchteEnde))&(((__inst__->FeuchteEnde>__inst__->FeuchteStufen[CheckBounds(__inst__->i,0,10)]))^1))){
(__inst__->RezeptStufeBeiEnde=__inst__->i);
}
}imp1_endfor26_0:;



(__inst__->MeldungFertig=0);
if((((signed long)(signed long)(short)__inst__->RezeptStufeIst>=(signed long)(signed long)(short)__inst__->RezeptStufeBeiEnde))){
(__inst__->MeldungFertig=1);
}

(__inst__->MldgBestaetigungErforderl=0);

}else{

(__inst__->MeldungFertig=0);
(__inst__->MldgBestaetigungErforderl=0);
(__inst__->RezeptStufeIst=0);
(__inst__->RezeptStufeBeiEnde=0);
(__inst__->RezeptStufeSoll=0);

}



}imp1_end0_0:;}
#line 183 "C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockStufen.nodebug"

void __AS__ImplInitfbTrockStufen_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockStufen.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockStufen.st.c\\\" \\\"C:/SharedFolder/CControl_407_Gschneitner/Logical/Libraries/LascoTrock/fbTrockStufen.st\\\"\\n\"");
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
