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

#ifndef __AS__TYPE_enumStepTrockVent
#define __AS__TYPE_enumStepTrockVent
typedef enum enumStepTrockVent
{	WARTEN_FBTROCK = 0,
	VENT_EIN_FBTROCK = 1,
	VENT_AUS_FBTROCK = 2,
	KLAPPEN_AUF_FBTROCK = 3,
	KLAPPEN_ZU_FBTROCK = 4,
	LA_EIN_VORBEREITUNG_FBTROCK = 5,
	LA_EIN_FBTROCK = 6,
	LA_AUS_VORBEREITUNG_FBTROCK = 7,
	MESSUNG_FBTROCK = 8,
	TARIFABSCHALTUNG_FBTROCK = 9,
} enumStepTrockVent;
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
struct LCRMovAvgFlt
{	float x;
	unsigned short base;
	unsigned short status;
	float y;
	signed long sum_old_dbl_1;
	signed long sum_old_dbl_2;
	unsigned long p_xold;
	unsigned short i_xold;
	unsigned short base_old;
	unsigned long bootkey_old;
	plcbit enable;
	plcbit enable_old;
};
_BUR_PUBLIC void LCRMovAvgFlt(struct LCRMovAvgFlt* inst);
struct fbTrockVent
{	float IstDrehzahlVent1;
	float IstDrehzahlVent2;
	float DrehzahlVent1Max;
	float DrehzahlVent2Max;
	float DrehzahlVent1Leistung;
	float DrehzahlVent2Leistung;
	float DrehzahlBeiStrombegrenzung;
	unsigned long AnlaufverzVent2;
	unsigned long LaufzeitKlappen;
	unsigned long AuslaufzeitLuftentfeuchter;
	unsigned long MessdauerLuftgeschw;
	float(* LuftgeschwBeiMaxDrehzahl1Vent);
	float(* LuftgeschwBeiMaxDrehzahl2Vent);
	float LuftgeschwAktuell;
	unsigned long EinschaltverzLuftentf;
	enumStepTrockVent curStep;
	struct TON TON_AnlaufverzVent2;
	struct TON TON_LaufzeitKlappen;
	float SollDrehzVent1;
	float SollDrehzVent2;
	struct TON TON_AuslaufzeitLuftentf;
	struct TON TON_Messung;
	struct TON TON_LuftentfVorbereitung;
	enumStepTrockVent nextStep;
	struct LCRMovAvgFlt Mittelwertbildung;
	plcbit Freigabe;
	plcbit AnfVent1;
	plcbit AnfVent2;
	plcbit AnfLuftentf;
	plcbit Tarifabschaltung;
	plcbit Strombegrenzung;
	plcbit sekTick;
	plcbit KeineKlappenAmLuftentf;
	plcbit BetriebsmldgLuftentf;
	plcbit FreigabeKlappen;
	plcbit FreigabeLuftentf;
	plcbit FreigabeVent1;
	plcbit FreigabeVent2;
	plcbit MessungAktiv;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbTrockVent(struct fbTrockVent* inst);
_BUR_PUBLIC signed long CheckRange(signed long value, signed long lower, signed long upper);
_BUR_PUBLIC unsigned long CheckWriteAccess(unsigned long address);
