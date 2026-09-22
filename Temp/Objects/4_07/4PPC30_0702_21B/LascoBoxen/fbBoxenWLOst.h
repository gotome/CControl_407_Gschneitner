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
struct TOF
{	plctime PT;
	plctime ET;
	plctime StartTime;
	unsigned long Restart;
	plcbit IN;
	plcbit Q;
	plcbit M;
};
_BUR_PUBLIC void TOF(struct TOF* inst);
struct fbBoxenWLO
{	float FrischluftSattDefizitIst;
	float FrischluftSattDefizitSoll;
	float Hysterese;
	unsigned long UmschaltverzWitterung;
	float WarmlufttemperaturVorgabe;
	unsigned long VerzBetriebsmeldung;
	unsigned long Auskuehlzeit;
	float WarmlufttempSollOut;
	unsigned long RestAuskuehlzeit;
	unsigned char step;
	struct TON TON_VerzBetriebsmeldung;
	struct TOF TOF_Auskuehlzeit;
	struct TON TON_WetterIstGut;
	struct TON TON_WetterIstSchlecht;
	plcbit Freigabe;
	plcbit Automatikbetrieb;
	plcbit Dauerbetrieb;
	plcbit FehlerSensorAussenluft;
	plcbit OptionBetriebsmldgVhd;
	plcbit BetriebsmeldungWarmluftofen;
	plcbit QuitFehler;
	plcbit WetterIstSchlecht;
	plcbit FreigabeWarmluftofenOut;
	plcbit FehlerBetriebsmeldungOut;
	plcbit FehlerSensorAussenluftOut;
	plcbit WarmluftofenAktiv;
	plcbit stateEntry;
	plcbit loc_WetterIstSchlecht;
	plcbit loc_WetterIstGut;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
};
_BUR_PUBLIC void fbBoxenWLO(struct fbBoxenWLO* inst);
