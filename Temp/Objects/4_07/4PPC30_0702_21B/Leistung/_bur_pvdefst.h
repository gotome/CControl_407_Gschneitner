#ifndef __AS__TYPE_typBoxenLuftmengenIn
#define __AS__TYPE_typBoxenLuftmengenIn
typedef struct typBoxenLuftmengenIn
{	float GrundflaecheBox;
	plcbit BoxIstAktiv;
	plcbit Ventilator1;
	plcbit Ventilator2;
} typBoxenLuftmengenIn;
#endif

struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbBoxenLuftmengen
{	typBoxenLuftmengenIn Box1;
	typBoxenLuftmengenIn Box2;
	typBoxenLuftmengenIn Box3;
	typBoxenLuftmengenIn Box4;
	typBoxenLuftmengenIn Box5;
	typBoxenLuftmengenIn Box6;
	float LuftmengeSollProM2FrischlVent1;
	float LuftmengeSollProM2FrischlVent2;
	float LuftmengeSollProM2UmluftVent1;
	float LuftmengeSollProM2UmluftVent2;
	float RegisterflaecheEntfeuchter;
	float LuftgeschwEntfeuchterMin;
	float LuftgeschwEntfeuchterMax;
	float LuftmengeSollVent1Out;
	float LuftmengeSollVent2Out;
	float loc_LuftmengeSollVent1;
	float loc_LuftmengeSollVent2;
	float loc_MinLuftmengeMitEntfeuchter;
	float loc_MaxLuftmengeMitEntfeuchter;
	plcbit FrischluftbetriebAktiv;
	plcbit UmluftbetriebAktiv;
	plcbit EntfeuchterInBetrieb;
};
_BUR_PUBLIC void fbBoxenLuftmengen(struct fbBoxenLuftmengen* inst);
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_1;
_BUR_LOCAL plcbit sekTick;
_BUR_LOCAL plcbit minTick;
_BUR_LOCAL float loc_LuftgeschwSollVent1;
_BUR_LOCAL float loc_LuftgeschwSollVent2;
_BUR_LOCAL struct fbBoxenLuftmengen fbBoxenLuftmengen_0;
_BUR_LOCAL float loc_Ansaugflaeche;
_BUR_LOCAL float loc_LuftmengeSollKaltVent1;
_BUR_LOCAL float loc_LuftmengeSollKaltVent2;
_BUR_LOCAL float loc_LuftmengeSollWarmVent1;
_BUR_LOCAL float loc_LuftmengeSollWarmVent2;
