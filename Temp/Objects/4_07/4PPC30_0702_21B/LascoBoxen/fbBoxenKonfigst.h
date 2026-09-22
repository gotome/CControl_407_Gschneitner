#ifndef __AS__TYPE_
#define __AS__TYPE_
static unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length);
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

#ifndef __AS__TYPE_typKonfigurationBoxenOut
#define __AS__TYPE_typKonfigurationBoxenOut
typedef struct typKonfigurationBoxenOut
{	unsigned long RestzeitSchlechtwetterPuls;
	unsigned long RestzeitSchlechtwetterPause;
	plcbit BoxBereit;
	plcbit BoxAktiv;
	plcbit DauerbetriebSperre;
	plcbit IntervallbetriebSperre;
	plcbit IntervallbetriebZeitenGesperrt[24];
	plcbit NachtrocknungZeitenGesperrt[24];
} typKonfigurationBoxenOut;
#endif

#ifndef __AS__TYPE_enumStellungKlappenBoxen
#define __AS__TYPE_enumStellungKlappenBoxen
typedef enum enumStellungKlappenBoxen
{	FBBOX_NICHT_VERWENDET = 0,
	FBBOX_GESCHLOSSEN = 1,
	FBBOX_GEOEFFNET = 2,
} enumStellungKlappenBoxen;
#endif

#ifndef __AS__TYPE_typKonfigurationBoxenIn
#define __AS__TYPE_typKonfigurationBoxenIn
typedef struct typKonfigurationBoxenIn
{	plcbit Ventilator1;
	plcbit Ventilator2;
	plcbit Luftentfeuchter;
	plcbit Warmluftofen;
	plcbit Heizregister;
	plcbit Scheitholzofen;
	enumStellungKlappenBoxen StellungKlappe1;
	enumStellungKlappenBoxen StellungKlappe2;
	enumStellungKlappenBoxen StellungKlappe3;
	enumStellungKlappenBoxen StellungKlappe4;
	enumStellungKlappenBoxen StellungKlappe5;
	enumStellungKlappenBoxen StellungKlappe6;
	plcbit DauerbetriebEin;
	plcbit WetterIstSchlecht;
	plcbit LuftaufbIstVerfuegbar;
	plcbit IntervallbetriebEin;
	plcbit NachtrocknungEin;
	plcbit IntervallbetriebZeiten[24];
	plcbit NachtrocknungZeiten[24];
	unsigned long SchlechtwetterPulszeit;
	unsigned long SchlechtwetterPausezeit;
} typKonfigurationBoxenIn;
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
struct fbLascoPugeV2
{	unsigned long ZeitPuls;
	unsigned long ZeitPause;
	unsigned long RestzeitPause;
	unsigned long RestzeitPuls;
	unsigned char curStep;
	unsigned char nextStep;
	struct TON TON_Schrittzeit;
	plcbit StartMitPuls;
	plcbit StartMitPause;
	plcbit PulsOut;
	plcbit PauseOut;
	plcbit stateEntry;
};
_BUR_PUBLIC void fbLascoPugeV2(struct fbLascoPugeV2* inst);
struct fbBoxenKonfig
{	unsigned char StundeAktuell;
	typKonfigurationBoxenIn Box1In;
	typKonfigurationBoxenIn Box2In;
	typKonfigurationBoxenIn Box3In;
	typKonfigurationBoxenIn Box4In;
	typKonfigurationBoxenIn Box5In;
	typKonfigurationBoxenIn Box6In;
	typKonfigurationBoxenOut Box1Out;
	typKonfigurationBoxenOut Box2Out;
	typKonfigurationBoxenOut Box3Out;
	typKonfigurationBoxenOut Box4Out;
	typKonfigurationBoxenOut Box5Out;
	typKonfigurationBoxenOut Box6Out;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox1;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox2;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox3;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox4;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox5;
	struct fbLascoPugeV2 fbPugeSchlechtwetterBox6;
	signed short i;
	plcbit ScheitholzofenNochAktiv;
	plcbit EntfeuchterNochAktiv;
	plcbit BypassklVonBeidenVentAbhaengig;
	plcbit BoxenklVonBeidenVentAbhaengig;
	plcbit WarmluftofenNochAktiv;
	plcbit AlleKlappenSchliessenWennAus;
	plcbit MehrereBoxenBelueftbar;
	plcbit EntfeuchterInselbetrieb;
	plcbit TasteEntfeuchterEinInselbetrieb;
	plcbit AnfEntfeuchterExtern;
	plcbit FreigabeKlappe1Out;
	plcbit FreigabeKlappe2Out;
	plcbit FreigabeKlappe3Out;
	plcbit FreigabeKlappe4Out;
	plcbit FreigabeKlappe5Out;
	plcbit FreigabeKlappe6Out;
	plcbit FreigabeVentilator1;
	plcbit FreigabeVentilator2;
	plcbit FreigabeLuftentfeuchter;
	plcbit FreigabeWarmluftofen;
	plcbit FreigabeHeizregister;
	plcbit FreigabeScheitholzofen;
	plcbit EntfeuchterVonVent1Abhaengig;
	plcbit EntfeuchterVonVent2Abhaengig;
	plcbit WarmluftofenVonVent1Abhaengig;
	plcbit WarmluftofenVonVent2Abhaengig;
	plcbit HeizregisterVonVent1Abhaengig;
	plcbit HeizregisterVonVent2Abhaengig;
	plcbit ScheitholzofenVonVent1Abhaengig;
	plcbit ScheitholzofenVonVent2Abhaengig;
	plcbit NotbetriebBox1;
	plcbit NotbetriebBox2;
	plcbit NotbetriebBox3;
	plcbit NotbetriebBox4;
	plcbit NotbetriebBox5;
	plcbit NotbetriebBox6;
	plcbit NotbetriebVentilator1;
	plcbit NotbetriebVentilator2;
	plcbit Boxenkl1VonVent1Abhaengig;
	plcbit Boxenkl1VonVent2Abhaengig;
	plcbit Boxenkl2VonVent1Abhaengig;
	plcbit Boxenkl2VonVent2Abhaengig;
	plcbit Boxenkl3VonVent1Abhaengig;
	plcbit Boxenkl3VonVent2Abhaengig;
	plcbit Boxenkl4VonVent1Abhaengig;
	plcbit Boxenkl4VonVent2Abhaengig;
	plcbit Boxenkl5VonVent1Abhaengig;
	plcbit Boxenkl5VonVent2Abhaengig;
	plcbit Boxenkl6VonVent1Abhaengig;
	plcbit Boxenkl6VonVent2Abhaengig;
	plcbit BypassklVonVent1Abhaengig;
	plcbit BypassklVonVent2Abhaengig;
	plcbit FreigabeEntfeuchterInselbetrieb;
	plcbit EntfeuchterInselbetrAktivOut;
	plcbit loc_Box1GleicherLuefterkreis;
	plcbit loc_Box2GleicherLuefterkreis;
	plcbit loc_Box3GleicherLuefterkreis;
	plcbit loc_Box4GleicherLuefterkreis;
	plcbit loc_Box5GleicherLuefterkreis;
	plcbit loc_Box6GleicherLuefterkreis;
	plcbit loc_Entf_NotbetriebBox1;
	plcbit loc_Entf_NotbetriebBox2;
	plcbit loc_Entf_NotbetriebBox3;
	plcbit loc_Entf_NotbetriebBox4;
	plcbit loc_Entf_NotbetriebBox5;
	plcbit loc_Entf_NotbetriebBox6;
	plcbit loc_Sho_NotbetriebBox1;
	plcbit loc_Sho_NotbetriebBox2;
	plcbit loc_Sho_NotbetriebBox3;
	plcbit loc_Sho_NotbetriebBox4;
	plcbit loc_Sho_NotbetriebBox5;
	plcbit loc_Sho_NotbetriebBox6;
	plcbit loc_Wlo_NotbetriebBox1;
	plcbit loc_Wlo_NotbetriebBox2;
	plcbit loc_Wlo_NotbetriebBox3;
	plcbit loc_Wlo_NotbetriebBox4;
	plcbit loc_Wlo_NotbetriebBox5;
	plcbit loc_Wlo_NotbetriebBox6;
};
_BUR_PUBLIC void fbBoxenKonfig(struct fbBoxenKonfig* inst);
_BUR_PUBLIC unsigned long memset(unsigned long pDest, unsigned char value, unsigned long length);
_BUR_PUBLIC signed long CheckBounds(signed long index, signed long lower, signed long upper);
