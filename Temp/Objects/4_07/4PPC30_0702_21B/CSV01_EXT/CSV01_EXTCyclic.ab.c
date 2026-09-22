#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_EXT/CSV01_EXTCyclicab.h"
#line 1 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/CSV01_EXT/CSV01_EXTCyclic.nodebug"
#line 4 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/CSV01_EXT/CSV01_EXTCyclic.ab"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){int __AS__Local0_00000;plcstring* __AS__Local3_00000;plcstring* __AS__Local4_00000;





(RTC_gettime_Status=RTC_gettime(((unsigned long)(&CSV_Uhr))));

(StdTick=0);
(MinTick=0);
(SekTick=0);
(TagTick=0);
(MonTick=0);
(JahrTick=0);
if((((unsigned long)(unsigned char)CSV_Uhr.hour!=(unsigned long)(unsigned char)CSV_Uhr_Sp.hour))){
(StdTick=1);
}
if((((unsigned long)(unsigned char)CSV_Uhr.minute!=(unsigned long)(unsigned char)CSV_Uhr_Sp.minute))){
(MinTick=1);
}
if((((unsigned long)(unsigned char)CSV_Uhr.second!=(unsigned long)(unsigned char)CSV_Uhr_Sp.second))){
(SekTick=1);
}
if((((unsigned long)(unsigned char)CSV_Uhr.day!=(unsigned long)(unsigned char)CSV_Uhr_Sp.day))){
(TagTick=1);
}
if((((unsigned long)(unsigned char)CSV_Uhr.month!=(unsigned long)(unsigned char)CSV_Uhr_Sp.month))){
(MonTick=1);
}
if((((unsigned long)(unsigned short)CSV_Uhr.year!=(unsigned long)(unsigned short)CSV_Uhr_Sp.year))){
(JahrTick=1);
}
__AS__MEMCPY(((unsigned long)(&CSV_Uhr_Sp)),((unsigned long)(&CSV_Uhr)),12);










(CSV01.SW.Gruebl_Reporting_T=1);
(CSV01.SW.QM_HeizW_T=0);



(CSV01.SW.SPERRE_T=0);



(hmiDatenaufzeichnung.AnzahlEintraegeInFile=CSV01.IW.RPS_FileWrite_OK_Z);
(hmiDatenaufzeichnung.AnzahlFiles=CSV01.IW.RPS_DirInfo_FileNum);
(hmiDatenaufzeichnung.CopyStepNr=CSV01.IW.RPS_CPYDEL_STEP_Nr);
(hmiDatenaufzeichnung.SaveStepNr=CSV01.IW.RPS_SAVE_STEP_Nr);



(CSV01.SW.EXT_DirCopy_HAND_T=hmiButtons.DatenaufzeichnungAufUsb);




if(((((unsigned long)(hmiButtons.QuitFehler|CSV01.SW.SPERRE_T|TagTick)==(unsigned long)(unsigned char)1))|(((unsigned long)(unsigned char)InitOK==(unsigned long)(unsigned char)0)))){
(CSV01.SW.F_Quitt_T=1);
}




if((((unsigned long)(unsigned char)CSV01.SW.SPERRE_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.KOPF_WRITE_T=0);
}else if(((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)CSV_Uhr.month==(unsigned long)(unsigned char)CSV01.SW.QM_HeizW_BetrJahr_Mon))&(((unsigned long)(unsigned char)MonTick==(unsigned long)(unsigned char)1)))){
(CSV01.SW.KOPF_WRITE_T=1);
}else if(((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)MonTick==(unsigned long)(unsigned char)1)))){
(CSV01.SW.KOPF_WRITE_T=1);
}




if((((unsigned long)(unsigned char)CSV01.SW.SPERRE_T==(unsigned long)(unsigned char)1))){
(CSV01.SW.DATA_WRITE_T=0);
}else if(((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)1))&((((unsigned long)(unsigned char)CSV_Uhr.month==(unsigned long)(unsigned char)1))|(((unsigned long)(unsigned char)CSV_Uhr.month==(unsigned long)(unsigned char)6)))&(((unsigned long)(unsigned char)MinTick==(unsigned long)(unsigned char)1)))){
(CSV01.SW.DATA_WRITE_T=1);
}else if(((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)1))&(((unsigned long)(unsigned char)StdTick==(unsigned long)(unsigned char)1)))){
(CSV01.SW.DATA_WRITE_T=1);
}else if(((((unsigned long)(unsigned char)CSV01.SW.QM_HeizW_T==(unsigned long)(unsigned char)0))&(((unsigned long)(unsigned char)MinTick==(unsigned long)(unsigned char)1)))){
(CSV01.SW.DATA_WRITE_T=1);
}












(CSV01.SW.RPS_COPY_AUTO_T=CSV01.SW.RPS_COPY_AUTO_T);






(CSV01.SW.RPS_MEMORY_AUTO_T=1);
(CSV01.SW.RPS_Mem_frei_przN=(3.00000000000000000000E+01));



(CSV01.SW.PC_DirCopy_HAND_T=CSV01.SW.PC_DirCopy_HAND_T);
(CSV01.SW.PC_FileCopy_alt_HAND_T=CSV01.SW.PC_FileCopy_alt_HAND_T);
(CSV01.SW.PC_FileCopy_neu_HAND_T=CSV01.SW.PC_FileCopy_neu_HAND_T);

(CSV01.SW.EXT_DirCopy_HAND_T=CSV01.SW.EXT_DirCopy_HAND_T);
(CSV01.SW.EXT_FileCopy_alt_HAND_T=CSV01.SW.EXT_FileCopy_alt_HAND_T);
(CSV01.SW.EXT_FileCopy_neu_HAND_T=CSV01.SW.EXT_FileCopy_neu_HAND_T);

(Fub0000100000.IN=hmiButtons.DatenaufzeichnungLoeschen);;(Fub0000100000.PT=200);;TON_10ms(&Fub0000100000);(M_DATA_CSV_CLEAR_ALL_T=Fub0000100000.Q);(ET=Fub0000100000.ET);
if((((unsigned long)(M_DATA_CSV_CLEAR_ALL_T&~Edge0000100000&1?((Edge0000100000=M_DATA_CSV_CLEAR_ALL_T&1),1):((Edge0000100000=M_DATA_CSV_CLEAR_ALL_T&1),0))==(unsigned long)(unsigned char)1))){
(CSV01.SW.RPS_DirDeleteEx_HAND_T=1);
}
(CSV01.SW.RPS_FileDelete_alt_HAND_T=CSV01.SW.RPS_FileDelete_alt_HAND_T);
(CSV01.SW.RPS_FileDelete_neu_HAND_T=CSV01.SW.RPS_FileDelete_neu_HAND_T);







(CSV01.FE=*(struct CSV_FE_typ*)&CSV01.FE);
(CSV01.WA=*(struct CSV_WA_typ*)&CSV01.WA);
(CSV01.IW.SFehler_Nr=CSV01.IW.SFehler_Nr);
(CSV01.IW.SFehler=CSV01.IW.SFehler);
(CSV01.IW.SWarnung_Nr=CSV01.IW.SWarnung_Nr);
(CSV01.IW.SWarnung=CSV01.IW.SWarnung);
(CSV01.IW.DatObj_Tag_ID_ZeileNr=CSV01.IW.DatObj_Tag_ID_ZeileNr);
(CSV01.IW.DatObj_Tag_Variable_ZeileNr=CSV01.IW.DatObj_Tag_Variable_ZeileNr);
(CSV01.IW.DatObj_Tag_Datentyp_ZeileNr=CSV01.IW.DatObj_Tag_Datentyp_ZeileNr);
(CSV01.IW.DatObj_Tag_MIN_ZeileNr=CSV01.IW.DatObj_Tag_MIN_ZeileNr);
(CSV01.IW.DatObj_Tag_MAX_ZeileNr=CSV01.IW.DatObj_Tag_MAX_ZeileNr);





__AS__Local3_00000=(plcstring*)CSV01.IW.File_Name; __AS__Local4_00000=(plcstring*)CSV01.IW.File_Name; for(__AS__Local0_00000=0; __AS__Local0_00000<100l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)CSV01.IW.RPS_File_Name; __AS__Local4_00000=(plcstring*)CSV01.IW.RPS_File_Name; for(__AS__Local0_00000=0; __AS__Local0_00000<200l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;

__AS__Local3_00000=(plcstring*)CSV01.IW.PC_Zielpfad; __AS__Local4_00000=(plcstring*)CSV01.IW.PC_Zielpfad; for(__AS__Local0_00000=0; __AS__Local0_00000<100l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)CSV01.IW.EXT_Zielpfad; __AS__Local4_00000=(plcstring*)CSV01.IW.EXT_Zielpfad; for(__AS__Local0_00000=0; __AS__Local0_00000<100l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)CSV01.IW.DirRead_FileName_neu; __AS__Local4_00000=(plcstring*)CSV01.IW.DirRead_FileName_neu; for(__AS__Local0_00000=0; __AS__Local0_00000<260l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;
__AS__Local3_00000=(plcstring*)CSV01.IW.DirRead_FileName_alt; __AS__Local4_00000=(plcstring*)CSV01.IW.DirRead_FileName_alt; for(__AS__Local0_00000=0; __AS__Local0_00000<260l && __AS__Local4_00000[__AS__Local0_00000]!=0; __AS__Local0_00000++) __AS__Local3_00000[__AS__Local0_00000] = __AS__Local4_00000[__AS__Local0_00000]; __AS__Local3_00000[__AS__Local0_00000] = 0;



(CSV01.IW.RPS_Mem_gesamt=CSV01.IW.RPS_Mem_gesamt);
(CSV01.IW.RPS_Mem_frei=CSV01.IW.RPS_Mem_frei);
(CSV01.IW.RPS_Mem_frei_prz=CSV01.IW.RPS_Mem_frei_prz);



(InitOK=1);

}
#line 174 "C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/CSV01_EXT/CSV01_EXTCyclic.nodebug"

void __AS__ImplInitCSV01_EXTCyclic_ab(void){}

unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length)
{memcpy((char*)pDest, (char*)pSrc, length); return pDest + length;}

__asm__(".section \".plc\"");
__asm__(".ascii \"iecfile \\\"Logical/Parameter.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Enumeration.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.typ\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnungen.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Alarmsystem/Alarmsys.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV01_EXT/CSV01_EXT.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_EXT/CSV01_EXTCyclic.ab.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/CSV01_EXT/CSV01_EXTCyclic.ab.c\\\" \\\"C:/SharedFolder/CControl_407_Gschneitner/Logical/CSV/CSV01_EXT/CSV01_EXTCyclic.ab\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Objects/4_07/4PPC30_0702_21B/CSV01_EXT/CSV01_EXTCyclic.ab.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'CSV_Uhr'\\n\"");
__asm__(".previous");
