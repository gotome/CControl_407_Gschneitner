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
_BUR_LOCAL modBR7300 brModul01;
_BUR_LOCAL modCM8281 cmModul02;
_BUR_LOCAL modCM8281 cmModul03;
_BUR_LOCAL modCM8281 cmModul04;
_BUR_LOCAL modCM8281 cmModul05;
_BUR_LOCAL modCM8281 cmModul06;
_BUR_LOCAL modCM8281 cmModul07;
_BUR_LOCAL modCM8281 cmModul08;
_BUR_LOCAL modCM8281 cmModul09;
_BUR_LOCAL modCM8281 cmModul10;
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
_BUR_LOCAL struct LCRLimScal LCRLimScal_0;
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
_BUR_LOCAL plcbit loc_Erforderl_Mod12;
_BUR_LOCAL struct fbLascoFehl fbLascoFehl_0;
