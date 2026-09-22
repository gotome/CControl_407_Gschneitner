#ifndef __AS__TYPE_enumBetriebsmodus
#define __AS__TYPE_enumBetriebsmodus
typedef enum enumBetriebsmodus
{	STILLSTAND = 0,
	BETRIEB = 1,
	IOTEST = 2,
} enumBetriebsmodus;
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
struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbBoxenUmschaltung
{	float AbluftTemp;
	float FrischluftTemp;
	float DachluftTemp;
	float DifferenzTempUmschaltung;
	float FrischlDachlTempUmschaltung;
	unsigned long Umschaltverz;
	float Hysterese;
	unsigned char step;
	struct TON TON_Umluft;
	struct TON TON_Frischluft;
	plcbit SensorFrischluftVhd;
	plcbit SensorDachluftVhd;
	plcbit SensorAbluftVhd;
	plcbit StatusSensorDachluftOk;
	plcbit StatusSensorFrischluftOk;
	plcbit StatusSensorAbluftOk;
	plcbit Freigabe;
	plcbit FrischluftbetriebOut;
	plcbit UmluftbetriebOut;
	plcbit stateEntry;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit zzEdge00003;
	plcbit zzEdge00004;
	plcbit zzEdge00005;
	plcbit zzEdge00006;
	plcbit zzEdge00007;
};
_BUR_PUBLIC void fbBoxenUmschaltung(struct fbBoxenUmschaltung* inst);
_BUR_LOCAL struct fbLascoZdxx zdxxSekunden;
_BUR_LOCAL struct fbLascoZdxx zdxxMinuten;
_BUR_LOCAL struct fbLascoZdxx zdxxTage;
_BUR_LOCAL struct fbLascoZdxx zdxxStunden;
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL plcbit minTick;
_BUR_LOCAL plcbit stdTick;
_BUR_LOCAL plcbit TagTick;
_BUR_LOCAL enumBetriebsmodus nextModus;
_BUR_LOCAL plcbit stateEntry;
_BUR_LOCAL struct fbBoxenUmschaltung fbEntfUmschaltung_0;
_BUR_LOCAL unsigned short loc_StrombegrStart1;
_BUR_LOCAL unsigned short loc_StrombegrStopp1;
