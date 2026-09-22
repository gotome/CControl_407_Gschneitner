#ifndef __AS__TYPE_modBR7300
#define __AS__TYPE_modBR7300
typedef struct modBR7300
{	plcbit ModulOk;
} modBR7300;
#endif

#ifndef __AS__TYPE_modCM8281
#define __AS__TYPE_modCM8281
typedef struct modCM8281
{	plcbit di01;
	plcbit di02;
	plcbit di03;
	plcbit di04;
	plcbit do01;
	plcbit do02;
	signed short ai01;
	signed short ao01;
	unsigned char StatusInput01;
	plcbit ModulOk;
} modCM8281;
#endif

#ifndef __AS__TYPE_modAI8321
#define __AS__TYPE_modAI8321
typedef struct modAI8321
{	signed short ai01;
	signed short ai02;
	signed short ai03;
	signed short ai04;
	signed short ai05;
	signed short ai06;
	signed short ai07;
	signed short ai08;
	unsigned char StatusInput01;
	unsigned char StatusInput02;
	plcbit ModulOk;
} modAI8321;
#endif

#ifndef __AS__TYPE_modDO9322
#define __AS__TYPE_modDO9322
typedef struct modDO9322
{	plcbit do01;
	plcbit do02;
	plcbit do03;
	plcbit do04;
	plcbit do05;
	plcbit do06;
	plcbit do07;
	plcbit do08;
	plcbit do09;
	plcbit do10;
	plcbit do11;
	plcbit do12;
	plcbit ModulOk;
} modDO9322;
#endif

#ifndef __AS__TYPE_modDIF371
#define __AS__TYPE_modDIF371
typedef struct modDIF371
{	plcbit di01;
	plcbit di02;
	plcbit di03;
	plcbit di04;
	plcbit di05;
	plcbit di06;
	plcbit di07;
	plcbit di08;
	plcbit di09;
	plcbit di10;
	plcbit di11;
	plcbit di12;
	plcbit di13;
	plcbit di14;
	plcbit di15;
	plcbit di16;
	plcbit ModulOk;
} modDIF371;
#endif

#ifndef __AS__TYPE_modAT2222
#define __AS__TYPE_modAT2222
typedef struct modAT2222
{	signed short at01;
	signed short at02;
	unsigned char StatusInput01;
	plcbit ModulOk;
} modAT2222;
#endif

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
struct LCRLimScal
{	float x;
	float x1;
	float y1;
	float x2;
	float y2;
	float y;
};
_BUR_PUBLIC void LCRLimScal(struct LCRLimScal* inst);
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
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL float loc_OeltempModul01;
_BUR_LOCAL float loc_OeltempModul02;
_BUR_LOCAL modDIF371 diModul02;
_BUR_LOCAL modDO9322 doModul03;
_BUR_LOCAL modAI8321 aiModul04;
_BUR_LOCAL modCM8281 cmModul05;
_BUR_LOCAL modCM8281 cmModul06;
_BUR_LOCAL modCM8281 cmModul07;
_BUR_LOCAL modAT2222 atModul08;
_BUR_LOCAL modCM8281 cmModul10;
_BUR_LOCAL modBR7300 brModul01;
_BUR_LOCAL modCM8281 cmModul12;
_BUR_LOCAL modCM8281 cmModul11;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_0;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_1;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_2;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_3;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_4;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_5;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_6;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_7;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_8;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_9;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_10;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_11;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_12;
_BUR_LOCAL struct LCRMovAvgFlt LCRMovAvgFlt_13;
_BUR_LOCAL struct LCRLimScal LCRLimScal_0;
_BUR_LOCAL struct LCRLimScal LCRLimScal_1;
_BUR_LOCAL struct LCRLimScal LCRLimScal_2;
_BUR_LOCAL struct LCRLimScal LCRLimScal_3;
_BUR_LOCAL struct LCRLimScal LCRLimScal_4;
_BUR_LOCAL struct LCRLimScal LCRLimScal_5;
_BUR_LOCAL struct LCRLimScal LCRLimScal_6;
_BUR_LOCAL struct LCRLimScal LCRLimScal_7;
_BUR_LOCAL struct LCRLimScal LCRLimScal_8;
_BUR_LOCAL struct LCRLimScal LCRLimScal_9;
_BUR_LOCAL struct LCRLimScal LCRLimScal_10;
_BUR_LOCAL struct LCRLimScal LCRLimScal_11;
_BUR_LOCAL struct LCRLimScal LCRLimScal_12;
_BUR_LOCAL struct LCRLimScal LCRLimScal_13;
_BUR_LOCAL struct LCRLimScal LCRLimScal_14;
_BUR_LOCAL struct LCRLimScal LCRLimScal_15;
_BUR_LOCAL struct LCRLimScal LCRLimScal_16;
_BUR_LOCAL struct LCRLimScal LCRLimScal_17;
_BUR_LOCAL plcbit loc_Erforderl_Mod1;
_BUR_LOCAL plcbit loc_Erforderl_Mod2;
_BUR_LOCAL plcbit loc_Erforderl_Mod3;
_BUR_LOCAL plcbit loc_Erforderl_Mod4;
_BUR_LOCAL plcbit loc_Erforderl_Mod5;
_BUR_LOCAL plcbit loc_Erforderl_Mod6;
_BUR_LOCAL plcbit loc_Erforderl_Mod7;
_BUR_LOCAL plcbit loc_Erforderl_Mod8;
_BUR_LOCAL plcbit loc_Erforderl_Mod9;
_BUR_LOCAL plcbit loc_Erforderl_Mod10;
_BUR_LOCAL plcbit loc_Erforderl_Mod11;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_0;
