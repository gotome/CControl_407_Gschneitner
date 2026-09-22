#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV/CSV_GRP_timeab.h"
#line 1 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/Library/CSV/CSV_GRP_time.nodebug"
#line 26 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/Library/CSV/CSV_GRP_time.ab"
void CSV_GRP_time(struct CSV_GRP_time* inst){struct CSV_GRP_time* __inst__=inst;

__AS__MEMSET(((unsigned long)(&__inst__->M_TIME)),0,9);

if((((unsigned long)__inst__->Ausg_time_len>=(unsigned long)9))){

(__inst__->zzCSV_itoa00000.Eing_DINT=__inst__->Eing_Stunde);;(__inst__->zzCSV_itoa00000.Eing_Anz_VK=2);;(__inst__->zzCSV_itoa00000.Eing_Anz_NK=0);;(__inst__->zzCSV_itoa00000.Eing_Vorz_Plus=0);;(__inst__->zzCSV_itoa00000.Eing_Komma_Punkt=0);;(__inst__->zzCSV_itoa00000.Ausg_ASCII_adr=((unsigned long)(&__inst__->Str_Stunde)));;(__inst__->zzCSV_itoa00000.Ausg_ASCII_len=12);;CSV_itoa(&__inst__->zzCSV_itoa00000);(__inst__->M_Fehler=__inst__->zzCSV_itoa00000.Ausg_Fehler);
(__inst__->zzCSV_itoa00001.Eing_DINT=__inst__->Eing_Minute);;(__inst__->zzCSV_itoa00001.Eing_Anz_VK=2);;(__inst__->zzCSV_itoa00001.Eing_Anz_NK=0);;(__inst__->zzCSV_itoa00001.Eing_Vorz_Plus=0);;(__inst__->zzCSV_itoa00001.Eing_Komma_Punkt=0);;(__inst__->zzCSV_itoa00001.Ausg_ASCII_adr=((unsigned long)(&__inst__->Str_Minute)));;(__inst__->zzCSV_itoa00001.Ausg_ASCII_len=12);;CSV_itoa(&__inst__->zzCSV_itoa00001);(__inst__->M_Fehler=__inst__->zzCSV_itoa00001.Ausg_Fehler);
(__inst__->zzCSV_itoa00002.Eing_DINT=__inst__->Eing_Sekunde);;(__inst__->zzCSV_itoa00002.Eing_Anz_VK=2);;(__inst__->zzCSV_itoa00002.Eing_Anz_NK=0);;(__inst__->zzCSV_itoa00002.Eing_Vorz_Plus=0);;(__inst__->zzCSV_itoa00002.Eing_Komma_Punkt=0);;(__inst__->zzCSV_itoa00002.Ausg_ASCII_adr=((unsigned long)(&__inst__->Str_Sekunde)));;(__inst__->zzCSV_itoa00002.Ausg_ASCII_len=12);;CSV_itoa(&__inst__->zzCSV_itoa00002);(__inst__->M_Fehler=__inst__->zzCSV_itoa00002.Ausg_Fehler);

__AS__STRCPY(((unsigned long)(&__inst__->M_TIME)),((unsigned long)(&__inst__->Str_Stunde)));
__AS__STRCAT(((unsigned long)(&__inst__->M_TIME)),((unsigned long)(&":")));
__AS__STRCAT(((unsigned long)(&__inst__->M_TIME)),((unsigned long)(&__inst__->Str_Minute)));
__AS__STRCAT(((unsigned long)(&__inst__->M_TIME)),((unsigned long)(&":")));
__AS__STRCAT(((unsigned long)(&__inst__->M_TIME)),((unsigned long)(&__inst__->Str_Sekunde)));

__AS__MEMCPY(__inst__->Ausg_time_adr,((unsigned long)(&__inst__->M_TIME)),__inst__->Ausg_time_len);

}else{

__AS__MEMCPY(__inst__->Ausg_time_adr,((unsigned long)(&__inst__->M_TIME)),9);
(__inst__->Ausg_Fehler=1);

}

imp1_end0_0:;}
#line 51 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/Library/CSV/CSV_GRP_time.nodebug"

void __AS__ImplInitCSV_GRP_time_ab(void){}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length)
{memset((char*)pDest, value, length); return pDest + length;}

unsigned long __AS__STRCAT(unsigned long pDest, unsigned long pSrc)
{strcat((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

unsigned long __AS__STRCPY(unsigned long pDest, unsigned long pSrc)
{strcpy((char*)pDest, (char*)pSrc); return pDest + strlen((char*)pDest);}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV/CSV_GRP_time.ab.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV/CSV_GRP_time.ab.c\\\" \\\"C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/Library/CSV/CSV_GRP_time.ab\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_Tick\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_itoa\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_GRP_date\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_GRP_time\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_GRP_timestamp\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_QM_timestamp\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_atoLREAL\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"CSV_UDINTtoa\\\" FUB\\n\"");
__asm__(".previous");
