/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_14_
#define _BUR_1790103064_14_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct CSV_IW_typ
{	unsigned short RPS_SAVE_STEP_Nr;
	unsigned short RPS_CPYDEL_STEP_Nr;
	plcstring RPS_SAVE_STEP_Text[81];
	plcstring RPS_CPYDEL_STEP_Text[81];
	plcbit SFehler;
	unsigned char SFehler_Nr;
	plcbit SWarnung;
	unsigned char SWarnung_Nr;
	plcbit KOPF_WRITE;
	plcbit DATA_WRITE;
	plcbit DATA_WRITE_BEREIT;
	unsigned long Zyklus_t_akt;
	unsigned long Zyklus_t_letzt;
	unsigned short DatObj_Zeilen_Anz;
	unsigned short DatObj_Tag_ID_ZeileNr;
	unsigned short DatObj_Tag_Variable_ZeileNr;
	unsigned short DatObj_Tag_Datentyp_ZeileNr;
	unsigned short DatObj_Tag_MIN_ZeileNr;
	unsigned short DatObj_Tag_MAX_ZeileNr;
	plcbit RPS_DirRead_Start_OK;
	plcbit RPS_COPY_AUTO_Start;
	plcstring DirRead_FileName_alt[261];
	plcstring DirRead_FileName_neu[261];
	plcstring PC_DevLink_Param[201];
	plcstring PC_Device[21];
	plcstring PC_Zielpfad[101];
	plcstring EXT_Device[21];
	plcstring EXT_Zielpfad[101];
	unsigned char RPS_Device[20];
	unsigned char RPS_Zielpfad[20];
	plcbit RPS_DirCreate_OK;
	plcbit RPS_FileCreate_OK;
	plcbit RPS_FileOpen_OK;
	plcbit RPS_FileWrite_OK;
	plcbit RPS_FileRead_OK;
	plcbit RPS_FileClose_OK;
	plcbit RPS_MemInfo_OK;
	plcbit RPS_DirInfo_OK;
	plcbit RPS_DirRead_OK;
	plcbit RPS_FileDelete_OK;
	plcbit RPS_DirDeleteEx_OK;
	plcbit PC_DevLink_OK;
	plcbit PC_DirCreate_OK;
	plcbit PC_FileCopy_OK;
	plcbit PC_DirCopy_OK;
	plcbit EXT_DirCreate_OK;
	plcbit EXT_FileCopy_OK;
	plcbit EXT_DirCopy_OK;
	unsigned short RPS_DirCreate_FehlerNr;
	unsigned short RPS_FileCreate_FehlerNr;
	unsigned short RPS_FileOpen_FehlerNr;
	unsigned short RPS_FileWrite_FehlerNr;
	unsigned short RPS_FileRead_FehlerNr;
	unsigned short RPS_FileClose_FehlerNr;
	unsigned short RPS_MemInfo_FehlerNr;
	unsigned short RPS_DirInfo_FehlerNr;
	unsigned short RPS_DirRead_FehlerNr;
	unsigned short RPS_FileDelete_FehlerNr;
	unsigned short RPS_DirCopy_FehlerNr;
	unsigned short RPS_DirDeleteEx_FehlerNr;
	unsigned short PC_DevLink_FehlerNr;
	unsigned short PC_DirCreate_FehlerNr;
	unsigned short PC_FileCopy_FehlerNr;
	unsigned short PC_DirCopy_FehlerNr;
	unsigned short EXT_DirCreate_FehlerNr;
	unsigned short EXT_FileCopy_FehlerNr;
	unsigned short EXT_DirCopy_FehlerNr;
	unsigned long RPS_DirCreate_OK_Z;
	unsigned long RPS_DirCreate_FEHLER_Z;
	unsigned long RPS_FileCreate_OK_Z;
	unsigned long RPS_FileCreate_FEHLER_Z;
	unsigned long RPS_FileOpen_OK_Z;
	unsigned long RPS_FileOpen_FEHLER_Z;
	unsigned long RPS_FileWrite_OK_Z;
	unsigned long RPS_FileWrite_FEHLER_Z;
	unsigned long RPS_FileRead_OK_Z;
	unsigned long RPS_FileRead_FEHLER_Z;
	unsigned long RPS_FileClose_OK_Z;
	unsigned long RPS_FileClose_FEHLER_Z;
	unsigned long RPS_MemInfo_OK_Z;
	unsigned long RPS_MemInfo_FEHLER_Z;
	unsigned long RPS_DirInfo_OK_Z;
	unsigned long RPS_DirInfo_FEHLER_Z;
	unsigned long RPS_DirRead_OK_Z;
	unsigned long RPS_DirRead_FEHLER_Z;
	unsigned long RPS_FileDelete_OK_Z;
	unsigned long RPS_FileDelete_FEHLER_Z;
	unsigned long RPS_DirDeleteEx_OK_Z;
	unsigned long RPS_DirDeleteEx_FEHLER_Z;
	unsigned long PC_DevLink_OK_Z;
	unsigned long PC_DevLink_FEHLER_Z;
	unsigned long PC_DirCreate_OK_Z;
	unsigned long PC_DirCreate_FEHLER_Z;
	unsigned long PC_FileCopy_OK_Z;
	unsigned long PC_FileCopy_FEHLER_Z;
	unsigned long PC_DirCopy_OK_Z;
	unsigned long PC_DirCopy_FEHLER_Z;
	unsigned long EXT_DirCreate_OK_Z;
	unsigned long EXT_DirCreate_FEHLER_Z;
	unsigned long EXT_FileCopy_OK_Z;
	unsigned long EXT_FileCopy_FEHLER_Z;
	unsigned long EXT_DirCopy_OK_Z;
	unsigned long EXT_DirCopy_FEHLER_Z;
	unsigned char Version[20];
	unsigned char Anlagename[20];
	plcstring File_Name[101];
	plcstring RPS_File_Name[201];
	unsigned long RPS_Mem_frei;
	float RPS_Mem_frei_prz;
	unsigned long RPS_Mem_gesamt;
	unsigned long RPS_DirInfo_FileNum;
	unsigned long RPS_DirInfo_DirNum;
	struct fiDIR_READ_DATA RPS_DirRead_Data;
	unsigned long Kopf_length;
	unsigned long Datensatz_length;
	unsigned char Datensatz_TimeStamp[25];
} CSV_IW_typ;

typedef struct CSV_SW_typ
{	plcbit SPERRE_T;
	plcbit KOPF_WRITE_T;
	plcbit DATA_WRITE_T;
	plcbit F_Quitt_T;
	plcbit Gruebl_Reporting_T;
	plcbit QM_HeizW_T;
	unsigned char QM_HeizW_BetrJahr_Mon;
	plcbit Kopf_Version_T;
	plcbit Kopf_Anlagenname_T;
	plcbit Kopf_ID_T;
	plcbit Kopf_Bezeichnung_T;
	plcbit Kopf_Einheit_T;
	plcbit Kopf_Datentyp_T;
	plcbit Kopf_MIN_MAX_T;
	plcbit Zeitstempel_lang_T;
	plcbit Begrenzung_MINMAX_T;
	float RPS_Mem_frei_przN;
	plcbit RPS_COPY_AUTO_T;
	plcbit RPS_MEMORY_AUTO_T;
	plcbit RPS_FileDelete_alt_HAND_T;
	plcbit RPS_FileDelete_neu_HAND_T;
	plcbit RPS_DirDeleteEx_HAND_T;
	plcbit PC_FileCopy_alt_HAND_T;
	plcbit PC_FileCopy_neu_HAND_T;
	plcbit PC_DirCopy_HAND_T;
	plcbit EXT_FileCopy_alt_HAND_T;
	plcbit EXT_FileCopy_neu_HAND_T;
	plcbit EXT_DirCopy_HAND_T;
} CSV_SW_typ;

typedef struct CSV_FE_typ
{	plcbit Datensatz_Fehler;
	plcbit DatObj_CFG;
	plcbit DatObj_CFG_length;
	plcbit DatObj_Tag_ID;
	plcbit DatObj_Tag_Variable;
	plcbit DatObj_Tag_Datentyp;
	plcbit DatObj_Tag_MIN;
	plcbit DatObj_Tag_MAX;
	plcbit DatObj_ZeilenMAX;
	plcbit RPS_kein_Speicherplatz;
	plcbit RPS_DirCreate;
	plcbit RPS_FileCreate;
	plcbit RPS_FileOpen;
	plcbit RPS_FileClose;
	plcbit RPS_FileWrite;
	plcbit RPS_FileRead;
	plcbit RPS_MemInfo;
	plcbit RPS_DirInfo;
	plcbit RPS_DirRead;
	plcbit RPS_FileDelete;
	plcbit RPS_DirDeleteEx;
	plcbit PC_DevLink;
	plcbit PC_DirCreate;
	plcbit PC_FileCopy;
	plcbit PC_DirCopy;
	plcbit EXT_DirCreate;
	plcbit EXT_FileCopy;
	plcbit EXT_DirCopy;
} CSV_FE_typ;

typedef struct CSV_WA_typ
{	plcbit RPS_Datei_alt_geloescht;
	plcbit File_not_found;
} CSV_WA_typ;

typedef struct CSV_typ
{	struct CSV_IW_typ IW;
	struct CSV_SW_typ SW;
	struct CSV_FE_typ FE;
	struct CSV_WA_typ WA;
} CSV_typ;

typedef struct CSV_DatObj1_typ
{	unsigned char Version[20];
	unsigned char Anlagename[20];
	unsigned char RPS_Device[20];
	unsigned char RPS_Zielpfad[20];
	unsigned char EXT_Device[20];
	unsigned char EXT_Zielpfad[20];
	unsigned char PC_IP_Adresse[20];
	unsigned char PC_Ordnerfreigabe[20];
	unsigned char PC_Username[20];
	unsigned char PC_Userpassword[20];
	unsigned char PC_Zielpfad[100];
} CSV_DatObj1_typ;

typedef struct CSV_DatObj2_typ
{	signed long Tag_ID;
	unsigned char Tag_Variablenname[48];
	unsigned char Tag_Bezeichnung[60];
	unsigned char Tag_Einheit[32];
	unsigned char Tag_MIN[16];
	unsigned char Tag_MAX[16];
} CSV_DatObj2_typ;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_14_ */

