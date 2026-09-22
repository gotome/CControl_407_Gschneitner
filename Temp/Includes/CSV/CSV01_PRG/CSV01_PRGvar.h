/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1781697446_41_
#define _BUR_1781697446_41_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_BUR_LOCAL unsigned long ZyklTime;
_BUR_LOCAL plcbit Zeile_Fertig;
_BUR_LOCAL unsigned char Wert_USINT;
_BUR_LOCAL unsigned short Wert_UINT;
_BUR_LOCAL unsigned long Wert_UDINT;
_BUR_LOCAL unsigned char Wert_STRING[25];
_BUR_LOCAL signed char Wert_SINT;
_BUR_LOCAL float Wert_REAL;
_BUR_LOCAL signed short Wert_INT;
_BUR_LOCAL signed long Wert_DINT;
_BUR_LOCAL plcbit *Wert_BOOL;
_BUR_LOCAL signed char task_class;
_BUR_LOCAL unsigned char Tag_Nachkomma;
_BUR_LOCAL unsigned char Tag_MIN_Stellen;
_BUR_LOCAL unsigned char Tag_MIN_Nachkomma;
_BUR_LOCAL unsigned char Tag_MIN_Komma;
_BUR_LOCAL unsigned char Tag_MAX_Stellen;
_BUR_LOCAL unsigned char Tag_MAX_Nachkomma;
_BUR_LOCAL unsigned char Tag_MAX_Komma;
_BUR_LOCAL unsigned char StrWork[31];
_BUR_LOCAL unsigned char StrCRLF[4];
_BUR_LOCAL unsigned char Str_Ziel_File_Name[301];
_BUR_LOCAL plcstring Str_timestamp[24];
_BUR_LOCAL unsigned char Str_Stellen[12];
_BUR_LOCAL unsigned char Str_Std[12];
_BUR_LOCAL unsigned char Str_Sek[12];
_BUR_LOCAL unsigned char Str_RPS_File_Name[301];
_BUR_LOCAL plcstring Str_QM_timestamp[15];
_BUR_LOCAL unsigned char Str_Nachkomma[12];
_BUR_LOCAL unsigned char Str_Min[12];
_BUR_LOCAL unsigned char Str_ID[12];
_BUR_LOCAL plcstring Str_date[11];
_BUR_LOCAL unsigned short status_ninfo;
_BUR_LOCAL unsigned short status_adr;
_BUR_LOCAL unsigned short RTC_gettime_Status;
_BUR_LOCAL unsigned short RT_Status;
_BUR_LOCAL unsigned long pv_adr;
_BUR_LOCAL plcbit *P_Warnung;
_BUR_LOCAL plcbit *P_Fehler;
_BUR_LOCAL unsigned long Offset_Ende;
_BUR_LOCAL unsigned long nxt_adr;
_BUR_LOCAL plcbit M_UDINT_Fehler;
_BUR_LOCAL plcbit M_timestamp_QM_Fehler;
_BUR_LOCAL plcbit M_timestamp_Fehler;
_BUR_LOCAL double M_Tag_MIN;
_BUR_LOCAL double M_Tag_MAX;
_BUR_LOCAL plcbit M_Tag_ID[10000];
_BUR_LOCAL plcbit M_MIN_Fehler;
_BUR_LOCAL plcbit M_MAX_Fehler;
_BUR_LOCAL plcbit M_InitOK;
_BUR_LOCAL plcbit M_File_neu;
_BUR_LOCAL plcbit M_Fehler;
_BUR_LOCAL plcdt M_DatObj_ChangDate;
_BUR_LOCAL plcbit M_date_Fehler;
_BUR_LOCAL unsigned char LF;
_BUR_LOCAL plcbit InitOK;
_BUR_LOCAL signed char init_reason;
_BUR_LOCAL unsigned short ii;
_BUR_LOCAL unsigned short i;
_BUR_LOCAL struct FileWrite FileWrite_0;
_BUR_LOCAL struct FileRead FileRead_0;
_BUR_LOCAL struct FileOpen FileOpen_0;
_BUR_LOCAL unsigned long FileLength;
_BUR_LOCAL unsigned long FileIdent;
_BUR_LOCAL struct FileDelete FileDelete_0;
_BUR_LOCAL struct FileCreate FileCreate_0;
_BUR_LOCAL struct FileCopy FileCopy_0;
_BUR_LOCAL struct FileClose FileClose_0;
_BUR_LOCAL unsigned long ET;
_BUR_LOCAL unsigned long DirRead_Nr;
_BUR_LOCAL unsigned long DirRead_neu_entry;
_BUR_LOCAL plcdt DirRead_neu_Date;
_BUR_LOCAL unsigned long DirRead_entry;
_BUR_LOCAL unsigned long DirRead_alt_entry;
_BUR_LOCAL plcdt DirRead_alt_Date;
_BUR_LOCAL struct DirRead DirRead_0;
_BUR_LOCAL struct DirInfo DirInfo_0;
_BUR_LOCAL struct DirDeleteEx DirDeleteEx_0;
_BUR_LOCAL struct DirCreate DirCreate_0;
_BUR_LOCAL struct DirCopy DirCopy_0;
_BUR_LOCAL unsigned short dimension;
_BUR_LOCAL struct DevMemInfo DevMemInfo_0;
_BUR_LOCAL struct DevLink DevLink_0;
_BUR_LOCAL unsigned char DatObjInfo_01_Name[16];
_BUR_LOCAL struct DatObjInfo DatObjInfo_01;
_BUR_LOCAL unsigned long DatObj2_Size;
_BUR_LOCAL unsigned long DatObj1_Size;
_BUR_LOCAL unsigned long DatObj_Offset;
_BUR_LOCAL unsigned char Datensatz[60001];
_BUR_LOCAL unsigned char Datei_Ende[2];
_BUR_LOCAL unsigned long data_typ;
_BUR_LOCAL unsigned long data_len2;
_BUR_LOCAL unsigned long data_len;
_BUR_LOCAL struct CSV_DatObj2_typ CSV_DatObj2;
_BUR_LOCAL struct CSV_DatObj1_typ CSV_DatObj1;
_BUR_LOCAL unsigned char CR;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV01_PRG/CSV01_PRG.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1781697446_41_ */

