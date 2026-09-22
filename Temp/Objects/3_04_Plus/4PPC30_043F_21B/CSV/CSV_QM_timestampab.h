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

_BUR_PUBLIC unsigned long memset(unsigned long pDest, unsigned char value, unsigned long length);
_BUR_PUBLIC unsigned long memcpy(unsigned long pDest, unsigned long pSrc, unsigned long length);
_BUR_PUBLIC unsigned long strcat(unsigned long pDest, unsigned long pSrc);
_BUR_PUBLIC unsigned long strcpy(unsigned long pDest, unsigned long pSrc);
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
