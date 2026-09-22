#ifndef __AS__TYPE_
#define __AS__TYPE_
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

#ifndef __AS__TYPE_enumStepsBskUeberw
#define __AS__TYPE_enumStepsBskUeberw
typedef enum enumStepsBskUeberw
{	BSK_WARTEN = 0,
	BSK_OEFFNEN = 1,
	BSK_OEFFNEN_FEHLER = 2,
	BSK_SCHLIESSEN = 3,
	BSK_SCHLIESSEN_FEHLER = 4,
	BSK_STOERUNG = 5,
} enumStepsBskUeberw;
#endif

struct TON
{	plctime PT;
	plctime ET;
	plctime StartTime;
	unsigned long Restart;
	plcbit IN;
	plcbit Q;
	plcbit M;
};
_BUR_PUBLIC void TON(struct TON* inst);
struct fbLascoBskUeberw
{	unsigned long MaxVersucheZu;
	unsigned long MaxVersucheAuf;
	unsigned long LaufzeitZu;
	unsigned long LaufzeitAuf;
	unsigned long ctVersucheAuf;
	unsigned long ctVersucheZu;
	struct TON TON_Laufzeit;
	enumStepsBskUeberw lastStep;
	enumStepsBskUeberw nextStep;
	enumStepsBskUeberw curStep;
	plcbit Freigabe;
	plcbit FreigabeOeffnen;
	plcbit FreigabeSchliessen;
	plcbit diKlappeGeschlossen;
	plcbit diKlappeGeoeffnet;
	plcbit Quit;
	plcbit doKlappeOeffnen;
	plcbit Stoerung;
	plcbit stateEntry;
	plcbit loc_KlappeIstOffen;
	plcbit loc_KlappeIstGeschlossen;
};
_BUR_PUBLIC void fbLascoBskUeberw(struct fbLascoBskUeberw* inst);
_BUR_PUBLIC signed long CheckRange(signed long value, signed long lower, signed long upper);
