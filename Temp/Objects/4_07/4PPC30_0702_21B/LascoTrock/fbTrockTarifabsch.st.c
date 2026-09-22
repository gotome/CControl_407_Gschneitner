#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockTarifabschst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoTrock/fbTrockTarifabsch.nodebug"
#line 3 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoTrock/fbTrockTarifabsch.st"
void fbTrockTarifabsch(struct fbTrockTarifabsch* inst){struct fbTrockTarifabsch* __inst__=inst;{


if((((unsigned long)(unsigned char)__inst__->Freigabe==(unsigned long)(unsigned char)1))){




(__inst__->StartZeit1=((__inst__->StartStd1*100)+__inst__->StartMin1));
(__inst__->StoppZeit1=((__inst__->StoppStd1*100)+__inst__->StoppMin1));


(__inst__->loc_StdVorlaufzeitREAL=(__inst__->VorlaufzeitLuftaufbMin/CheckDivReal(60)));
(__inst__->loc_StdVorlaufzeit=((signed long)(__inst__->loc_StdVorlaufzeitREAL)));

(__inst__->loc_MinVorlaufzeit=(__inst__->VorlaufzeitLuftaufbMin-(__inst__->loc_StdVorlaufzeit*60)));

(__inst__->loc_ZwischenergStartStd=(__inst__->StartStd1-__inst__->loc_StdVorlaufzeit));
if(((__inst__->loc_ZwischenergStartStd<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_ZwischenergStartStd));
}else{
(__inst__->loc_StartStdLuftaufb=__inst__->loc_ZwischenergStartStd);
}

(__inst__->loc_ZwischenergStartMin=(__inst__->StartMin1-__inst__->loc_MinVorlaufzeit));
if(((__inst__->loc_ZwischenergStartMin<0))){
(__inst__->loc_StartMinLuftaufb=(60+__inst__->loc_ZwischenergStartMin));
(__inst__->loc_StartStdLuftaufb=(__inst__->loc_StartStdLuftaufb-1));
if(((__inst__->loc_StartStdLuftaufb<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_StartStdLuftaufb));
}
}else{
(__inst__->loc_StartMinLuftaufb=__inst__->loc_ZwischenergStartMin);
}

(__inst__->StartZeitLuftaufb1=((__inst__->loc_StartStdLuftaufb*100)+__inst__->loc_StartMinLuftaufb));



(__inst__->FreigZeitfenster1=0);
if(((__inst__->StartZeit1>__inst__->StoppZeit1))){
if((((__inst__->AktZeit>=__inst__->StartZeit1))|((__inst__->AktZeit<__inst__->StoppZeit1)))){
(__inst__->FreigZeitfenster1=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeit1))&((__inst__->AktZeit<__inst__->StoppZeit1)))){
(__inst__->FreigZeitfenster1=1);
}
}


(__inst__->FreigabeZeitfensterLuftaufb1=0);
if((((__inst__->StartZeit1!=0))&((__inst__->StoppZeit1!=0)))){
if(((__inst__->StartZeitLuftaufb1>__inst__->StoppZeit1))){
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb1))|((__inst__->AktZeit<__inst__->StoppZeit1)))){
(__inst__->FreigabeZeitfensterLuftaufb1=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb1))&((__inst__->AktZeit<__inst__->StoppZeit1)))){
(__inst__->FreigabeZeitfensterLuftaufb1=1);
}
}
}




(__inst__->StartZeit2=((__inst__->StartStd2*100)+__inst__->StartMin2));
(__inst__->StoppZeit2=((__inst__->StoppStd2*100)+__inst__->StoppMin2));


(__inst__->loc_StdVorlaufzeitREAL=(__inst__->VorlaufzeitLuftaufbMin/CheckDivReal(60)));
(__inst__->loc_StdVorlaufzeit=((signed long)(__inst__->loc_StdVorlaufzeitREAL)));

(__inst__->loc_MinVorlaufzeit=(__inst__->VorlaufzeitLuftaufbMin-(__inst__->loc_StdVorlaufzeit*60)));

(__inst__->loc_ZwischenergStartStd=(__inst__->StartStd2-__inst__->loc_StdVorlaufzeit));
if(((__inst__->loc_ZwischenergStartStd<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_ZwischenergStartStd));
}else{
(__inst__->loc_StartStdLuftaufb=__inst__->loc_ZwischenergStartStd);
}

(__inst__->loc_ZwischenergStartMin=(__inst__->StartMin2-__inst__->loc_MinVorlaufzeit));
if(((__inst__->loc_ZwischenergStartMin<0))){
(__inst__->loc_StartMinLuftaufb=(60+__inst__->loc_ZwischenergStartMin));
(__inst__->loc_StartStdLuftaufb=(__inst__->loc_StartStdLuftaufb-1));
if(((__inst__->loc_StartStdLuftaufb<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_StartStdLuftaufb));
}
}else{
(__inst__->loc_StartMinLuftaufb=__inst__->loc_ZwischenergStartMin);
}

(__inst__->StartZeitLuftaufb2=((__inst__->loc_StartStdLuftaufb*100)+__inst__->loc_StartMinLuftaufb));



(__inst__->FreigZeitfenster2=0);
if(((__inst__->StartZeit2>__inst__->StoppZeit2))){
if((((__inst__->AktZeit>=__inst__->StartZeit2))|((__inst__->AktZeit<__inst__->StoppZeit2)))){
(__inst__->FreigZeitfenster2=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeit2))&((__inst__->AktZeit<__inst__->StoppZeit2)))){
(__inst__->FreigZeitfenster2=1);
}
}


(__inst__->FreigabeZeitfensterLuftaufb2=0);
if((((__inst__->StartZeit2!=0))&((__inst__->StoppZeit2!=0)))){
if(((__inst__->StartZeitLuftaufb2>__inst__->StoppZeit2))){
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb2))|((__inst__->AktZeit<__inst__->StoppZeit2)))){
(__inst__->FreigabeZeitfensterLuftaufb2=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb2))&((__inst__->AktZeit<__inst__->StoppZeit2)))){
(__inst__->FreigabeZeitfensterLuftaufb2=1);
}
}
}




(__inst__->StartZeit3=((__inst__->StartStd3*100)+__inst__->StartMin3));
(__inst__->StoppZeit3=((__inst__->StoppStd3*100)+__inst__->StoppMin3));


(__inst__->loc_StdVorlaufzeitREAL=(__inst__->VorlaufzeitLuftaufbMin/CheckDivReal(60)));
(__inst__->loc_StdVorlaufzeit=((signed long)(__inst__->loc_StdVorlaufzeitREAL)));

(__inst__->loc_MinVorlaufzeit=(__inst__->VorlaufzeitLuftaufbMin-(__inst__->loc_StdVorlaufzeit*60)));

(__inst__->loc_ZwischenergStartStd=(__inst__->StartStd3-__inst__->loc_StdVorlaufzeit));
if(((__inst__->loc_ZwischenergStartStd<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_ZwischenergStartStd));
}else{
(__inst__->loc_StartStdLuftaufb=__inst__->loc_ZwischenergStartStd);
}

(__inst__->loc_ZwischenergStartMin=(__inst__->StartMin3-__inst__->loc_MinVorlaufzeit));
if(((__inst__->loc_ZwischenergStartMin<0))){
(__inst__->loc_StartMinLuftaufb=(60+__inst__->loc_ZwischenergStartMin));
(__inst__->loc_StartStdLuftaufb=(__inst__->loc_StartStdLuftaufb-1));
if(((__inst__->loc_StartStdLuftaufb<0))){
(__inst__->loc_StartStdLuftaufb=(24+__inst__->loc_StartStdLuftaufb));
}
}else{
(__inst__->loc_StartMinLuftaufb=__inst__->loc_ZwischenergStartMin);
}

(__inst__->StartZeitLuftaufb3=((__inst__->loc_StartStdLuftaufb*100)+__inst__->loc_StartMinLuftaufb));



(__inst__->FreigZeitfenster3=0);
if(((__inst__->StartZeit3>__inst__->StoppZeit3))){
if((((__inst__->AktZeit>=__inst__->StartZeit3))|((__inst__->AktZeit<__inst__->StoppZeit3)))){
(__inst__->FreigZeitfenster3=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeit3))&((__inst__->AktZeit<__inst__->StoppZeit3)))){
(__inst__->FreigZeitfenster3=1);
}
}


(__inst__->FreigabeZeitfensterLuftaufb3=0);
if((((__inst__->StartZeit3!=0))&((__inst__->StoppZeit3!=0)))){
if(((__inst__->StartZeitLuftaufb3>__inst__->StoppZeit3))){
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb3))|((__inst__->AktZeit<__inst__->StoppZeit3)))){
(__inst__->FreigabeZeitfensterLuftaufb3=1);
}
}else{
if((((__inst__->AktZeit>=__inst__->StartZeitLuftaufb3))&((__inst__->AktZeit<__inst__->StoppZeit3)))){
(__inst__->FreigabeZeitfensterLuftaufb3=1);
}
}
}


(__inst__->TarifabschaltungEin=(__inst__->FreigZeitfenster1|__inst__->FreigZeitfenster2|__inst__->FreigZeitfenster3));
(__inst__->TarifabschaltungLuftaufbEin=(__inst__->FreigabeZeitfensterLuftaufb1|__inst__->FreigabeZeitfensterLuftaufb2|__inst__->FreigabeZeitfensterLuftaufb3));

}else{

(__inst__->FreigZeitfenster1=0);
(__inst__->FreigZeitfenster2=0);
(__inst__->FreigZeitfenster3=0);
(__inst__->FreigabeZeitfensterLuftaufb1=0);
(__inst__->FreigabeZeitfensterLuftaufb2=0);
(__inst__->FreigabeZeitfensterLuftaufb3=0);
(__inst__->TarifabschaltungEin=0);
(__inst__->TarifabschaltungLuftaufbEin=0);
(__inst__->loc_MinVorlaufzeit=0);
(__inst__->loc_StartMinLuftaufb=0);
(__inst__->loc_StartStdLuftaufb=0);
(__inst__->loc_StdVorlaufzeit=0);
(__inst__->loc_StdVorlaufzeitREAL=0);
(__inst__->loc_ZwischenergStartMin=0);
(__inst__->loc_ZwischenergStartStd=0);

}



}imp1_end0_0:;}
#line 211 "C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoTrock/fbTrockTarifabsch.nodebug"

void __AS__ImplInitfbTrockTarifabsch_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockTarifabsch.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/LascoTrock/fbTrockTarifabsch.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/Libraries/LascoTrock/fbTrockTarifabsch.st\\\"\\n\"");
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
