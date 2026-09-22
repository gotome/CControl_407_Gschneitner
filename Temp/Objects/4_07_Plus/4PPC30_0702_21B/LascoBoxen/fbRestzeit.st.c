#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoBoxen/fbRestzeitst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbRestzeit.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbRestzeit.st"
void fbRestzeit(struct fbRestzeit* inst){struct fbRestzeit* __inst__=inst;{

if(__inst__->Freigabe){


(__inst__->ZeitfensterAktiv=(CheckReadAccess(__inst__->ZeitfensterIn),(*(__inst__->ZeitfensterIn))[CheckBounds(__inst__->AktuelleStunde,0,23)]));



if(__inst__->ZeitfensterAktiv){


(__inst__->loc_Aenderung=memcmp(((unsigned long)(&((*(__inst__->ZeitfensterIn))))),((unsigned long)(&__inst__->MEM_ZeitfensterIn)),24));
if(((((signed long)__inst__->loc_Aenderung!=(signed long)0))|__inst__->loc_firstInitLauf)){
(__inst__->loc_firstInitLauf=0);
(__inst__->loc_StundeEndeZeitfTag=23);
(__inst__->loc_StundeEndeZeitfFolgetag=23);
__AS__MEMCPY(((unsigned long)(&__inst__->MEM_ZeitfensterIn)),((unsigned long)(&((*(__inst__->ZeitfensterIn))))),1);
}



(__inst__->loc_MinutenRestTag=(60-__inst__->AktuelleMinute));
for((__inst__->i=(__inst__->AktuelleStunde+1));__inst__->i<=__inst__->loc_StundeEndeZeitfTag;__inst__->i+=1){
if((((unsigned long)(unsigned char)(CheckReadAccess(__inst__->ZeitfensterIn),(*(__inst__->ZeitfensterIn))[CheckBounds(__inst__->i,0,23)])==(unsigned long)(unsigned char)1))){
(__inst__->loc_MinutenRestTag=(__inst__->loc_MinutenRestTag+60));
}else{
(__inst__->loc_StundeEndeZeitfTag=__inst__->i);
}
}imp1_endfor3_0:;


(__inst__->loc_MinutenRestFolgetag=0);
if((((unsigned long)(unsigned char)__inst__->loc_StundeEndeZeitfTag==(unsigned long)(unsigned char)23))){
for((__inst__->ii=0);__inst__->ii<=__inst__->loc_StundeEndeZeitfFolgetag;__inst__->ii+=1){
if((((unsigned long)(unsigned char)(CheckReadAccess(__inst__->ZeitfensterIn),(*(__inst__->ZeitfensterIn))[CheckBounds(__inst__->ii,0,23)])==(unsigned long)(unsigned char)1))){
(__inst__->loc_MinutenRestFolgetag=(__inst__->loc_MinutenRestFolgetag+60));
}else{
(__inst__->loc_StundeEndeZeitfFolgetag=__inst__->ii);
}
}imp1_endfor6_0:;
}else{
(__inst__->loc_MinutenRestFolgetag=0);
(__inst__->loc_StundeEndeZeitfFolgetag=23);
}



(__inst__->loc_MinutenRestGesamt=(__inst__->loc_MinutenRestTag+__inst__->loc_MinutenRestFolgetag));


(__inst__->loc_RestzeitStunden=(((unsigned long)(__inst__->loc_MinutenRestGesamt))/((unsigned long)(CheckDivUint(60)))));

if((((unsigned long)(unsigned short)__inst__->loc_RestzeitStunden<=(unsigned long)(unsigned short)24))){
(__inst__->RestzeitStundenOut=(__inst__->loc_RestzeitStunden));
(__inst__->RestzeitMinutenOut=(__inst__->loc_MinutenRestGesamt-(__inst__->RestzeitStundenOut*60)));
}else{
(__inst__->RestzeitStundenOut=65535);
(__inst__->RestzeitMinutenOut=65535);
}



(__inst__->loc_firstInitPause=1);



}else{


(__inst__->loc_Aenderung=memcmp(((unsigned long)(&((*(__inst__->ZeitfensterIn))))),((unsigned long)(&__inst__->MEM_ZeitfensterIn)),24));
if(((((signed long)__inst__->loc_Aenderung!=(signed long)0))|__inst__->loc_firstInitPause)){
(__inst__->loc_firstInitPause=0);
(__inst__->loc_StundeEndeZeitfTag=23);
(__inst__->loc_StundeEndeZeitfFolgetag=23);
__AS__MEMCPY(((unsigned long)(&__inst__->MEM_ZeitfensterIn)),((unsigned long)(&((*(__inst__->ZeitfensterIn))))),1);
}



(__inst__->loc_MinutenRestTag=(60-__inst__->AktuelleMinute));
for((__inst__->i=(__inst__->AktuelleStunde+1));__inst__->i<=__inst__->loc_StundeEndeZeitfTag;__inst__->i+=1){
if((((unsigned long)(unsigned char)(CheckReadAccess(__inst__->ZeitfensterIn),(*(__inst__->ZeitfensterIn))[CheckBounds(__inst__->i,0,23)])==(unsigned long)(unsigned char)0))){
(__inst__->loc_MinutenRestTag=(__inst__->loc_MinutenRestTag+60));
}else{
(__inst__->loc_StundeEndeZeitfTag=__inst__->i);
}
}imp1_endfor10_0:;


(__inst__->loc_MinutenRestFolgetag=0);
if((((unsigned long)(unsigned char)__inst__->loc_StundeEndeZeitfTag==(unsigned long)(unsigned char)23))){
for((__inst__->ii=0);__inst__->ii<=__inst__->loc_StundeEndeZeitfFolgetag;__inst__->ii+=1){
if((((unsigned long)(unsigned char)(CheckReadAccess(__inst__->ZeitfensterIn),(*(__inst__->ZeitfensterIn))[CheckBounds(__inst__->ii,0,23)])==(unsigned long)(unsigned char)0))){
(__inst__->loc_MinutenRestFolgetag=(__inst__->loc_MinutenRestFolgetag+60));
}else{
(__inst__->loc_StundeEndeZeitfFolgetag=__inst__->ii);
}
}imp1_endfor13_0:;
}else{
(__inst__->loc_MinutenRestFolgetag=0);
(__inst__->loc_StundeEndeZeitfFolgetag=23);
}



(__inst__->loc_MinutenRestGesamt=(__inst__->loc_MinutenRestTag+__inst__->loc_MinutenRestFolgetag));


(__inst__->loc_RestzeitStunden=(((unsigned long)(__inst__->loc_MinutenRestGesamt))/((unsigned long)(CheckDivUint(60)))));


if((((unsigned long)(unsigned short)__inst__->loc_RestzeitStunden<=(unsigned long)(unsigned short)24))){
(__inst__->RestzeitStundenOut=(__inst__->loc_RestzeitStunden));
(__inst__->RestzeitMinutenOut=(__inst__->loc_MinutenRestGesamt-(__inst__->RestzeitStundenOut*60)));
}else{
(__inst__->RestzeitStundenOut=65535);
(__inst__->RestzeitMinutenOut=65535);
}


(__inst__->loc_firstInitLauf=1);

}




}else{

(__inst__->loc_firstInitLauf=1);
(__inst__->loc_firstInitPause=1);
(__inst__->RestzeitMinutenOut=65535);
(__inst__->RestzeitStundenOut=65535);

}


}imp1_end0_0:;}
#line 141 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbRestzeit.nodebug"

void __AS__ImplInitfbRestzeit_st(void){}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoBoxen/fbRestzeit.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/LascoBoxen/fbRestzeit.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbRestzeit.st\\\"\\n\"");
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
