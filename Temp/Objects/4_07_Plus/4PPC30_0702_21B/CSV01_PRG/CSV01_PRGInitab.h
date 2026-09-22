#ifndef __AS__TYPE_
#define __AS__TYPE_
static unsigned long __AS__STRCPY(unsigned long pDest, unsigned long pSrc);
typedef struct {
	unsigned char bit0  : 1;
	unsigned char bit1  : 1;
	unsigned char bit2  : 1;
	unsigned char bit3  : 1;
	unsigned char bit4  : 1;
	unsigned char bit5  : 1;
	unsigned char bit6  : 1;
	unsigned char bit7  : 1;
} _1byte_bit_field_;

typedef struct {
	unsigned short bit0  : 1;
	unsigned short bit1  : 1;
	unsigned short bit2  : 1;
	unsigned short bit3  : 1;
	unsigned short bit4  : 1;
	unsigned short bit5  : 1;
	unsigned short bit6  : 1;
	unsigned short bit7  : 1;
	unsigned short bit8  : 1;
	unsigned short bit9  : 1;
	unsigned short bit10 : 1;
	unsigned short bit11 : 1;
	unsigned short bit12 : 1;
	unsigned short bit13 : 1;
	unsigned short bit14 : 1;
	unsigned short bit15 : 1;
} _2byte_bit_field_;

typedef struct {
	unsigned long bit0  : 1;
	unsigned long bit1  : 1;
	unsigned long bit2  : 1;
	unsigned long bit3  : 1;
	unsigned long bit4  : 1;
	unsigned long bit5  : 1;
	unsigned long bit6  : 1;
	unsigned long bit7  : 1;
	unsigned long bit8  : 1;
	unsigned long bit9  : 1;
	unsigned long bit10 : 1;
	unsigned long bit11 : 1;
	unsigned long bit12 : 1;
	unsigned long bit13 : 1;
	unsigned long bit14 : 1;
	unsigned long bit15 : 1;
	unsigned long bit16 : 1;
	unsigned long bit17 : 1;
	unsigned long bit18 : 1;
	unsigned long bit19 : 1;
	unsigned long bit20 : 1;
	unsigned long bit21 : 1;
	unsigned long bit22 : 1;
	unsigned long bit23 : 1;
	unsigned long bit24 : 1;
	unsigned long bit25 : 1;
	unsigned long bit26 : 1;
	unsigned long bit27 : 1;
	unsigned long bit28 : 1;
	unsigned long bit29 : 1;
	unsigned long bit30 : 1;
	unsigned long bit31 : 1;
} _4byte_bit_field_;
#endif

#ifndef __AS__TYPE_fiDIR_READ_DATA
#define __AS__TYPE_fiDIR_READ_DATA
typedef struct fiDIR_READ_DATA
{	unsigned char Filename[260];
	plcdt Date;
	unsigned long Filelength;
} fiDIR_READ_DATA;
#endif

#ifndef __AS__TYPE_CSV_IW_typ
#define __AS__TYPE_CSV_IW_typ
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
	fiDIR_READ_DATA RPS_DirRead_Data;
	unsigned long Kopf_length;
	unsigned long Datensatz_length;
	unsigned char Datensatz_TimeStamp[25];
} CSV_IW_typ;
#endif

#ifndef __AS__TYPE_CSV_SW_typ
#define __AS__TYPE_CSV_SW_typ
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
#endif

#ifndef __AS__TYPE_CSV_FE_typ
#define __AS__TYPE_CSV_FE_typ
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
#endif

#ifndef __AS__TYPE_CSV_WA_typ
#define __AS__TYPE_CSV_WA_typ
typedef struct CSV_WA_typ
{	plcbit RPS_Datei_alt_geloescht;
	plcbit File_not_found;
} CSV_WA_typ;
#endif

#ifndef __AS__TYPE_CSV_typ
#define __AS__TYPE_CSV_typ
typedef struct CSV_typ
{	CSV_IW_typ IW;
	CSV_SW_typ SW;
	CSV_FE_typ FE;
	CSV_WA_typ WA;
} CSV_typ;
#endif

struct RTInfo
{	unsigned short status;
	unsigned long cycle_time;
	signed char init_reason;
	signed char task_class;
	plcbit enable;
};
_BUR_PUBLIC void RTInfo(struct RTInfo* inst);
_BUR_PUBLIC unsigned long strcpy(unsigned long pDest, unsigned long pSrc);
_BUR_PUBLIC unsigned long CheckDivUdint(unsigned long divisor);
_BUR_PUBLIC signed long CheckBounds(signed long index, signed long lower, signed long upper);
_BUR_LOCAL unsigned char CR;
_BUR_LOCAL unsigned char DatObjInfo_01_Name[16];
_BUR_LOCAL signed char init_reason;
_BUR_LOCAL plcbit InitOK;
_BUR_LOCAL unsigned char LF;
_BUR_LOCAL plcdt M_DatObj_ChangDate;
_BUR_LOCAL unsigned short RT_Status;
_BUR_LOCAL unsigned char StrCRLF[4];
_BUR_LOCAL signed char task_class;
_BUR_LOCAL unsigned long ZyklTime;
_GLOBAL_RETAIN CSV_typ CSV01;
_LOCAL struct RTInfo Fub3276900000;
