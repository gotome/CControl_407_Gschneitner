/* Automation Studio generated header file */
/* Do not edit ! */
/* CSV 1.00.0 */

#ifndef _CSV_
#define _CSV_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _CSV_VERSION
#define _CSV_VERSION 1.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef struct CSV_Tick
{
	/* VAR_INPUT (analog) */
	float Wert;
	/* VAR (analog) */
	float SpWert;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg;
} CSV_Tick_typ;

typedef struct CSV_itoa
{
	/* VAR_INPUT (analog) */
	signed long Eing_DINT;
	unsigned char Eing_Anz_VK;
	unsigned char Eing_Anz_NK;
	unsigned long Ausg_ASCII_adr;
	unsigned long Ausg_ASCII_len;
	/* VAR (analog) */
	signed long Eing_DINT_VK;
	signed long Eing_DINT_NK;
	unsigned short Str_VK_len;
	unsigned short Str_NK_len;
	unsigned short Str_Ges_len;
	unsigned char Str_VK[12];
	unsigned char Str_NK[12];
	unsigned char M_ASCII[25];
	unsigned char i;
	/* VAR_INPUT (digital) */
	plcbit Eing_Vorz_Plus;
	plcbit Eing_Komma_Punkt;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
} CSV_itoa_typ;

typedef struct CSV_GRP_date
{
	/* VAR_INPUT (analog) */
	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned long Ausg_date_adr;
	unsigned long Ausg_date_len;
	/* VAR (analog) */
	unsigned char M_DATE[11];
	unsigned char Str_Jahr[12];
	unsigned char Str_Mon[12];
	unsigned char Str_Tag[12];
	struct CSV_itoa zzCSV_itoa00000;
	struct CSV_itoa zzCSV_itoa00001;
	struct CSV_itoa zzCSV_itoa00002;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Fehler;
} CSV_GRP_date_typ;

typedef struct CSV_GRP_time
{
	/* VAR_INPUT (analog) */
	unsigned char Eing_Stunde;
	unsigned char Eing_Minute;
	unsigned char Eing_Sekunde;
	unsigned long Ausg_time_adr;
	unsigned long Ausg_time_len;
	/* VAR (analog) */
	unsigned char M_TIME[9];
	unsigned char Str_Stunde[12];
	unsigned char Str_Minute[12];
	unsigned char Str_Sekunde[12];
	struct CSV_itoa zzCSV_itoa00000;
	struct CSV_itoa zzCSV_itoa00001;
	struct CSV_itoa zzCSV_itoa00002;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Fehler;
} CSV_GRP_time_typ;

typedef struct CSV_GRP_timestamp
{
	/* VAR_INPUT (analog) */
	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned char Eing_Stunde;
	unsigned char Eing_Minute;
	unsigned char Eing_Sekunde;
	unsigned short Eing_MilliSek;
	unsigned long Ausg_timestamp_adr;
	unsigned long Ausg_timestamp_len;
	/* VAR (analog) */
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
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Fehler;
} CSV_GRP_timestamp_typ;

typedef struct CSV_QM_timestamp
{
	/* VAR_INPUT (analog) */
	unsigned char Eing_Tag;
	unsigned char Eing_Monat;
	unsigned short Eing_Jahr;
	unsigned char Eing_Stunde;
	unsigned char Eing_Minute;
	unsigned long Ausg_timestamp_adr;
	unsigned long Ausg_timestamp_len;
	/* VAR (analog) */
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
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Fehler;
} CSV_QM_timestamp_typ;

typedef struct CSV_atoLREAL
{
	/* VAR_INPUT (analog) */
	unsigned long Eing_ASCII_adr;
	unsigned long Eing_ASCII_len;
	/* VAR_OUTPUT (analog) */
	double Ausg_LREAL;
	/* VAR (analog) */
	unsigned char M_ASCII[41];
	unsigned char ii;
	signed char M_Stellen;
	signed char M_Vorkomma;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Komma;
} CSV_atoLREAL_typ;

typedef struct CSV_UDINTtoa
{
	/* VAR_INPUT (analog) */
	unsigned long Eing_UDINT;
	unsigned long Ausg_ASCII_adr;
	unsigned long Ausg_ASCII_len;
	/* VAR (analog) */
	unsigned char Ausg_ASCII[11];
	signed char i;
	signed char ii;
	/* VAR_OUTPUT (digital) */
	plcbit Ausg_Fehler;
	/* VAR (digital) */
	plcbit M_Start;
} CSV_UDINTtoa_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CSV_Tick(struct CSV_Tick* inst);
_BUR_PUBLIC void CSV_itoa(struct CSV_itoa* inst);
_BUR_PUBLIC void CSV_GRP_date(struct CSV_GRP_date* inst);
_BUR_PUBLIC void CSV_GRP_time(struct CSV_GRP_time* inst);
_BUR_PUBLIC void CSV_GRP_timestamp(struct CSV_GRP_timestamp* inst);
_BUR_PUBLIC void CSV_QM_timestamp(struct CSV_QM_timestamp* inst);
_BUR_PUBLIC void CSV_atoLREAL(struct CSV_atoLREAL* inst);
_BUR_PUBLIC void CSV_UDINTtoa(struct CSV_UDINTtoa* inst);


#ifdef __cplusplus
};
#endif
#endif /* _CSV_ */

