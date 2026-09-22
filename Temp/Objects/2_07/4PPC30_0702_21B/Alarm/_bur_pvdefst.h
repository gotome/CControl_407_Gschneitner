#ifndef __AS__TYPE_Zeit_type
#define __AS__TYPE_Zeit_type
typedef struct Zeit_type
{	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
} Zeit_type;
#endif

struct DTGetTime
{	unsigned short status;
	plcdt DT1;
	plcbit enable;
};
_BUR_PUBLIC void DTGetTime(struct DTGetTime* inst);
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
struct fbLascoEUhr
{	signed short StdMin;
	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
	Zeit_type Echtzeit;
	struct DTGetTime DTGetTime_0;
	plcdt DateTime;
	plcbit Freigabe;
};
_BUR_PUBLIC void fbLascoEUhr(struct fbLascoEUhr* inst);
struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbLascoFehl
{	float VerzZeit;
	unsigned char Mode;
	float Counter;
	plcbit FehlerIn;
	plcbit Quit;
	plcbit Tick;
	plcbit FehlerOut;
};
_BUR_PUBLIC void fbLascoFehl(struct fbLascoFehl* inst);
_BUR_LOCAL struct fbLascoEUhr eUhr;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL struct TON TON_Fehlerquittierung;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_0;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_1;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_2;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_3;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_4;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_5;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_6;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_7;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_8;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_9;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_10;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_11;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_12;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_13;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_14;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_15;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_16;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_17;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_18;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_19;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_20;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_21;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_22;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_23;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_24;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_25;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_26;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_27;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_28;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_29;
_BUR_LOCAL plcbit init;
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL unsigned char ilen;
_BUR_LOCAL unsigned char i;
_BUR_LOCAL unsigned long CONST_VERZ_STOERUNG_ENTF_FREMD;
_BUR_LOCAL unsigned long CONST_VERZ_QUIT;
