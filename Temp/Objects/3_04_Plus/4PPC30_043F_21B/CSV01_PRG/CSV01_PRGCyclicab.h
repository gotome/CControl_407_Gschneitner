#ifndef __AS__TYPE_
#define __AS__TYPE_
static unsigned long __AS__MEMCPY(unsigned long pDest, unsigned long pSrc, unsigned long length);
static unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length);
static unsigned long __AS__STRCAT(unsigned long pDest, unsigned long pSrc);
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

#ifndef __AS__TYPE_typHmiButtonsKlappenBoxen
#define __AS__TYPE_typHmiButtonsKlappenBoxen
typedef struct typHmiButtonsKlappenBoxen
{	plcbit Klappe1;
	plcbit Klappe2;
	plcbit Klappe3;
	plcbit Klappe4;
	plcbit Klappe5;
	plcbit Klappe6;
} typHmiButtonsKlappenBoxen;
#endif

#ifndef __AS__TYPE_typHmiButtons
#define __AS__TYPE_typHmiButtons
typedef struct typHmiButtons
{	plcbit IntervallEinstellenBoxAktuell;
	plcbit NachtrocknEinstellenAktuell;
	plcbit hideDetailansichtBox;
	plcbit hideZeitfenster;
	plcbit showBox1;
	plcbit showBox2;
	plcbit showBox3;
	plcbit showBox4;
	plcbit showBox5;
	plcbit showBox6;
	plcbit showVentilatoren;
	plcbit showEntfeuchterFremd;
	plcbit showEntfeuchter;
	plcbit showOfen;
	plcbit showHeizregister;
	plcbit showKlappen;
	plcbit showSensoren;
	plcbit QuitFehler;
	plcbit TestbetriebEin;
	plcbit TestbetriebAbbrechen;
	plcbit TestbetriebAbschliessen;
	plcbit IpParameterSetzen;
	plcbit DatenaufzeichnungAufUsb;
	plcbit DatenaufzeichnungLoeschen;
	plcbit Logout;
	plcbit TouchKalibrieren;
	plcbit SicherheitshinweisOk;
	plcbit ResetEnergieverbrTag;
	plcbit ResetServiceUhrzeit;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox1;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox2;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox3;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox4;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox5;
	typHmiButtonsKlappenBoxen ButtonsKlappeBox6;
	plcbit changeBetrArtBypassklappe;
	plcbit changeBetrArtAbluftvent;
	plcbit changeBetrArtAbluftklappe;
	plcbit changeBetrArtUmluftklappen;
	plcbit ParameterVonUsbLaden;
	plcbit ParameterAufUsbKopieren;
	plcbit TrocknungsbilanzOk;
	plcbit changeTrockengutBox1;
	plcbit changeTrockengutBox2;
	plcbit changeTrockengutBox3;
	plcbit changeTrockengutBox4;
	plcbit changeTrockengutBox5;
	plcbit changeTrockengutBox6;
} typHmiButtons;
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

#ifndef __AS__TYPE_CSV_DatObj1_typ
#define __AS__TYPE_CSV_DatObj1_typ
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
#endif

#ifndef __AS__TYPE_CSV_DatObj2_typ
#define __AS__TYPE_CSV_DatObj2_typ
typedef struct CSV_DatObj2_typ
{	signed long Tag_ID;
	unsigned char Tag_Variablenname[48];
	unsigned char Tag_Bezeichnung[60];
	unsigned char Tag_Einheit[32];
	unsigned char Tag_MIN[16];
	unsigned char Tag_MAX[16];
} CSV_DatObj2_typ;
#endif

#ifndef __AS__TYPE_DTStructure
#define __AS__TYPE_DTStructure
typedef struct DTStructure
{	unsigned short year;
	unsigned char month;
	unsigned char day;
	unsigned char wday;
	unsigned char hour;
	unsigned char minute;
	unsigned char second;
	unsigned short millisec;
	unsigned short microsec;
} DTStructure;
#endif

_BUR_PUBLIC double RealExpt(double x, double y);
_BUR_PUBLIC unsigned long DiffDT(plcdt DT2, plcdt DT1);
struct TON_10ms
{	unsigned long PT;
	unsigned long ET;
	unsigned long StartTime;
	plcbit IN;
	plcbit Q;
	plcbit M;
};
_BUR_PUBLIC void TON_10ms(struct TON_10ms* inst);
_BUR_PUBLIC unsigned short RTC_gettime(unsigned long RTCtime_struct);
_BUR_PUBLIC unsigned short PV_ninfo(unsigned long pv_name, unsigned long data_typ_p, unsigned long data_len_p, unsigned long dimension_p);
_BUR_PUBLIC unsigned short PV_xgetadr(unsigned long pv_name_p, unsigned long pv_adresse, unsigned long data_len);
_BUR_PUBLIC unsigned short ftoa(float value, unsigned long pString);
_BUR_PUBLIC unsigned short itoa(signed long value, unsigned long pString);
_BUR_PUBLIC unsigned long memset(unsigned long pDest, unsigned char value, unsigned long length);
_BUR_PUBLIC unsigned long memcpy(unsigned long pDest, unsigned long pSrc, unsigned long length);
_BUR_PUBLIC unsigned long strcat(unsigned long pDest, unsigned long pSrc);
_BUR_PUBLIC unsigned short strlen(unsigned long pString);
_BUR_PUBLIC unsigned long strcpy(unsigned long pDest, unsigned long pSrc);
struct FileCreate
{	unsigned long pDevice;
	unsigned long pFile;
	unsigned short status;
	unsigned long ident;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileCreate(struct FileCreate* inst);
struct FileOpen
{	unsigned long pDevice;
	unsigned long pFile;
	unsigned char mode;
	unsigned short status;
	unsigned long ident;
	unsigned long filelen;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileOpen(struct FileOpen* inst);
struct FileClose
{	unsigned long ident;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileClose(struct FileClose* inst);
struct FileRead
{	unsigned long ident;
	unsigned long offset;
	unsigned long pDest;
	unsigned long len;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileRead(struct FileRead* inst);
struct FileWrite
{	unsigned long ident;
	unsigned long offset;
	unsigned long pSrc;
	unsigned long len;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileWrite(struct FileWrite* inst);
struct FileCopy
{	unsigned long pSrcDev;
	unsigned long pSrc;
	unsigned long pDestDev;
	unsigned long pDest;
	unsigned char option;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileCopy(struct FileCopy* inst);
struct FileDelete
{	unsigned long pDevice;
	unsigned long pName;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void FileDelete(struct FileDelete* inst);
struct DirCreate
{	unsigned long pDevice;
	unsigned long pName;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DirCreate(struct DirCreate* inst);
struct DirRead
{	unsigned long pDevice;
	unsigned long pPath;
	unsigned long entry;
	unsigned char option;
	unsigned long pData;
	unsigned long data_len;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DirRead(struct DirRead* inst);
struct DirInfo
{	unsigned long pDevice;
	unsigned long pPath;
	unsigned short status;
	unsigned long dirnum;
	unsigned long filenum;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DirInfo(struct DirInfo* inst);
struct DirCopy
{	unsigned long pSrcDev;
	unsigned long pSrcDir;
	unsigned long pDestDev;
	unsigned long pDestDir;
	unsigned char option;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DirCopy(struct DirCopy* inst);
struct DirDeleteEx
{	unsigned long pDevice;
	unsigned long pName;
	unsigned short status;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DirDeleteEx(struct DirDeleteEx* inst);
struct DevMemInfo
{	unsigned long pDevice;
	unsigned short status;
	unsigned long freemem;
	unsigned long memsize;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DevMemInfo(struct DevMemInfo* inst);
struct DevLink
{	unsigned long pDevice;
	unsigned long pParam;
	unsigned short status;
	unsigned long handle;
	unsigned short i_state;
	unsigned short i_result;
	unsigned long i_tmp;
	plcbit enable;
};
_BUR_PUBLIC void DevLink(struct DevLink* inst);
struct DatObjInfo
{	unsigned long pName;
	unsigned short status;
	unsigned long ident;
	unsigned long pDatObjMem;
	unsigned long len;
	unsigned char MemType;
	unsigned long Option;
	plcdt ChangeDate;
	plcbit enable;
};
_BUR_PUBLIC void DatObjInfo(struct DatObjInfo* inst);
_BUR_PUBLIC unsigned long CheckDivUdint(unsigned long divisor);
_BUR_PUBLIC float CheckDivReal(float divisor);
_BUR_PUBLIC signed long CheckBounds(signed long index, signed long lower, signed long upper);
_BUR_PUBLIC unsigned long CheckReadAccess(unsigned long address);
struct CSV_itoa
{	signed long Eing_DINT;
	unsigned char Eing_Anz_VK;
	unsigned char Eing_Anz_NK;
	unsigned long Ausg_ASCII_adr;
	unsigned long Ausg_ASCII_len;
	signed long Eing_DINT_VK;
	signed long Eing_DINT_NK;
	unsigned short Str_VK_len;
	unsigned short Str_NK_len;
	unsigned short Str_Ges_len;
	unsigned char Str_VK[12];
	unsigned char Str_NK[12];
	unsigned char M_ASCII[25];
	unsigned char i;
	plcbit Eing_Vorz_Plus;
	plcbit Eing_Komma_Punkt;
	plcbit Ausg_Fehler;
};
_BUR_PUBLIC void CSV_itoa(struct CSV_itoa* inst);
struct CSV_GRP_date
{	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned long Ausg_date_adr;
	unsigned long Ausg_date_len;
	unsigned char M_DATE[11];
	unsigned char Str_Jahr[12];
	unsigned char Str_Mon[12];
	unsigned char Str_Tag[12];
	struct CSV_itoa zzCSV_itoa00000;
	struct CSV_itoa zzCSV_itoa00001;
	struct CSV_itoa zzCSV_itoa00002;
	plcbit Ausg_Fehler;
	plcbit M_Fehler;
};
_BUR_PUBLIC void CSV_GRP_date(struct CSV_GRP_date* inst);
struct CSV_GRP_timestamp
{	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned char Eing_Stunde;
	unsigned char Eing_Minute;
	unsigned char Eing_Sekunde;
	unsigned short Eing_MilliSek;
	unsigned long Ausg_timestamp_adr;
	unsigned long Ausg_timestamp_len;
	unsigned char M_TIMESTAMP[24];
	unsigned char Str_Jahr[12];
	unsigned char Str_Mon[12];
	unsigned char Str_Tag[12];
	unsigned char Str_Stunde[12];
	unsigned char Str_Minute[12];
	unsigned char Str_Sekunde[12];
	unsigned char Str_MilliSek[12];
	struct CSV_itoa zzCSV_itoa00000;
	struct CSV_itoa zzCSV_itoa00001;
	struct CSV_itoa zzCSV_itoa00002;
	struct CSV_itoa zzCSV_itoa00003;
	struct CSV_itoa zzCSV_itoa00004;
	struct CSV_itoa zzCSV_itoa00005;
	struct CSV_itoa zzCSV_itoa00006;
	plcbit Ausg_Fehler;
	plcbit M_Fehler;
};
_BUR_PUBLIC void CSV_GRP_timestamp(struct CSV_GRP_timestamp* inst);
struct CSV_QM_timestamp
{	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned char Eing_Stunde;
	unsigned char Eing_Minute;
	unsigned long Ausg_timestamp_adr;
	unsigned long Ausg_timestamp_len;
	unsigned char M_TIMESTAMP[15];
	unsigned char Str_Tag[12];
	unsigned char Str_Mon[12];
	unsigned char Str_Jahr[12];
	unsigned char Str_Stunde[12];
	unsigned char Str_Minute[12];
	struct CSV_itoa zzCSV_itoa00000;
	struct CSV_itoa zzCSV_itoa00001;
	struct CSV_itoa zzCSV_itoa00002;
	struct CSV_itoa zzCSV_itoa00003;
	struct CSV_itoa zzCSV_itoa00004;
	plcbit Ausg_Fehler;
	plcbit M_Fehler;
};
_BUR_PUBLIC void CSV_QM_timestamp(struct CSV_QM_timestamp* inst);
struct CSV_atoLREAL
{	unsigned long Eing_ASCII_adr;
	unsigned long Eing_ASCII_len;
	double Ausg_LREAL;
	unsigned char M_ASCII[41];
	unsigned char ii;
	signed char M_Stellen;
	signed char M_Vorkomma;
	plcbit Ausg_Fehler;
	plcbit M_Komma;
};
_BUR_PUBLIC void CSV_atoLREAL(struct CSV_atoLREAL* inst);
struct CSV_UDINTtoa
{	unsigned long Eing_UDINT;
	unsigned long Ausg_ASCII_adr;
	unsigned long Ausg_ASCII_len;
	unsigned char Ausg_ASCII[11];
	signed char i;
	signed char ii;
	plcbit Ausg_Fehler;
	plcbit M_Start;
};
_BUR_PUBLIC void CSV_UDINTtoa(struct CSV_UDINTtoa* inst);
_BUR_LOCAL unsigned char CR;
_BUR_LOCAL CSV_DatObj1_typ CSV_DatObj1;
_BUR_LOCAL CSV_DatObj2_typ CSV_DatObj2;
_BUR_LOCAL unsigned long data_len;
_BUR_LOCAL unsigned long data_len2;
_BUR_LOCAL unsigned long data_typ;
_BUR_LOCAL unsigned char Datei_Ende[2];
_BUR_LOCAL unsigned char Datensatz[60001];
_BUR_LOCAL unsigned long DatObj_Offset;
_BUR_LOCAL unsigned long DatObj1_Size;
_BUR_LOCAL unsigned long DatObj2_Size;
_BUR_LOCAL struct DatObjInfo DatObjInfo_01;
_BUR_LOCAL unsigned char DatObjInfo_01_Name[16];
_BUR_LOCAL struct DevLink DevLink_0;
_BUR_LOCAL struct DevMemInfo DevMemInfo_0;
_BUR_LOCAL unsigned short dimension;
_BUR_LOCAL struct DirCopy DirCopy_0;
_BUR_LOCAL struct DirCreate DirCreate_0;
_BUR_LOCAL struct DirDeleteEx DirDeleteEx_0;
_BUR_LOCAL struct DirInfo DirInfo_0;
_BUR_LOCAL struct DirRead DirRead_0;
_BUR_LOCAL plcdt DirRead_alt_Date;
_BUR_LOCAL unsigned long DirRead_alt_entry;
_BUR_LOCAL unsigned long DirRead_entry;
_BUR_LOCAL plcdt DirRead_neu_Date;
_BUR_LOCAL unsigned long DirRead_neu_entry;
_BUR_LOCAL unsigned long DirRead_Nr;
_BUR_LOCAL unsigned long ET;
_BUR_LOCAL struct FileClose FileClose_0;
_BUR_LOCAL struct FileCopy FileCopy_0;
_BUR_LOCAL struct FileCreate FileCreate_0;
_BUR_LOCAL struct FileDelete FileDelete_0;
_BUR_LOCAL unsigned long FileIdent;
_BUR_LOCAL unsigned long FileLength;
_BUR_LOCAL struct FileOpen FileOpen_0;
_BUR_LOCAL struct FileRead FileRead_0;
_BUR_LOCAL struct FileWrite FileWrite_0;
_BUR_LOCAL unsigned short i;
_BUR_LOCAL unsigned short ii;
_BUR_LOCAL plcbit InitOK;
_BUR_LOCAL unsigned char LF;
_BUR_LOCAL plcbit M_date_Fehler;
_BUR_LOCAL plcdt M_DatObj_ChangDate;
_BUR_LOCAL plcbit M_Fehler;
_BUR_LOCAL plcbit M_File_neu;
_BUR_LOCAL plcbit M_InitOK;
_BUR_LOCAL plcbit M_MAX_Fehler;
_BUR_LOCAL plcbit M_MIN_Fehler;
_BUR_LOCAL plcbit M_Tag_ID[10000];
_BUR_LOCAL double M_Tag_MAX;
_BUR_LOCAL double M_Tag_MIN;
_BUR_LOCAL plcbit M_timestamp_Fehler;
_BUR_LOCAL plcbit M_timestamp_QM_Fehler;
_BUR_LOCAL plcbit M_UDINT_Fehler;
_BUR_LOCAL unsigned long nxt_adr;
_BUR_LOCAL unsigned long Offset_Ende;
_BUR_LOCAL plcbit(* P_Fehler);
_BUR_LOCAL plcbit(* P_Warnung);
_BUR_LOCAL unsigned long pv_adr;
_BUR_LOCAL unsigned short RTC_gettime_Status;
_BUR_LOCAL unsigned short status_adr;
_BUR_LOCAL unsigned short status_ninfo;
_BUR_LOCAL plcstring Str_date[11];
_BUR_LOCAL unsigned char Str_ID[12];
_BUR_LOCAL unsigned char Str_Min[12];
_BUR_LOCAL unsigned char Str_Nachkomma[12];
_BUR_LOCAL plcstring Str_QM_timestamp[15];
_BUR_LOCAL unsigned char Str_RPS_File_Name[301];
_BUR_LOCAL unsigned char Str_Sek[12];
_BUR_LOCAL unsigned char Str_Std[12];
_BUR_LOCAL unsigned char Str_Stellen[12];
_BUR_LOCAL plcstring Str_timestamp[24];
_BUR_LOCAL unsigned char Str_Ziel_File_Name[301];
_BUR_LOCAL unsigned char StrCRLF[4];
_BUR_LOCAL unsigned char StrWork[31];
_BUR_LOCAL unsigned char Tag_MAX_Komma;
_BUR_LOCAL unsigned char Tag_MAX_Nachkomma;
_BUR_LOCAL unsigned char Tag_MAX_Stellen;
_BUR_LOCAL unsigned char Tag_MIN_Komma;
_BUR_LOCAL unsigned char Tag_MIN_Nachkomma;
_BUR_LOCAL unsigned char Tag_MIN_Stellen;
_BUR_LOCAL unsigned char Tag_Nachkomma;
_BUR_LOCAL plcbit(* Wert_BOOL);
_BUR_LOCAL signed long Wert_DINT;
_BUR_LOCAL signed short Wert_INT;
_BUR_LOCAL float Wert_REAL;
_BUR_LOCAL signed char Wert_SINT;
_BUR_LOCAL unsigned char Wert_STRING[25];
_BUR_LOCAL unsigned long Wert_UDINT;
_BUR_LOCAL unsigned short Wert_UINT;
_BUR_LOCAL unsigned char Wert_USINT;
_BUR_LOCAL plcbit Zeile_Fertig;
_BUR_LOCAL unsigned long ZyklTime;
_GLOBAL typHmiButtons hmiButtons;
_GLOBAL_RETAIN CSV_typ CSV01;
_GLOBAL_RETAIN DTStructure CSV_Uhr;
_GLOBAL unsigned char fiRECURSIVE;
_GLOBAL unsigned char fiOVERWRITE;
_GLOBAL unsigned char fiREAD_WRITE;
_GLOBAL unsigned char fiFILE;
_LOCAL struct TON_10ms Fub0000100000;
_LOCAL plcbit Edge0000100000;
_LOCAL struct CSV_GRP_date Fub0000100001;
_LOCAL struct CSV_itoa Fub0000100002;
_LOCAL struct CSV_itoa Fub0000100003;
_LOCAL struct CSV_itoa Fub0000100004;
_LOCAL struct CSV_GRP_timestamp Fub0000100005;
_LOCAL struct CSV_QM_timestamp Fub0000100006;
_LOCAL struct CSV_atoLREAL Fub0000100007;
_LOCAL struct CSV_atoLREAL Fub0000100008;
_LOCAL struct CSV_UDINTtoa Fub0000100009;
