#ifndef __AS__TYPE_modAP3131
#define __AS__TYPE_modAP3131
typedef struct modAP3131
{	signed short PmeanT;
	signed short QmeanT;
	signed short SmeanT;
	signed short PFmeanT;
	signed long AenergyT;
	signed long RenergyT;
	unsigned long SAenergyT;
	plcbit TrigDFT;
	plcbit EnabEnergy;
	plcbit ClearEnergy;
	plcbit ForceEnergy;
	plcbit RBClearEnergy;
	plcbit ModulOk;
} modAP3131;
#endif

struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
_BUR_LOCAL modAP3131 apModulEnergie;
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_1;
_BUR_LOCAL plcbit minTick;
_BUR_LOCAL float loc_EnergieMinute;
_BUR_LOCAL float MEM_EnergieGesamt;
_BUR_LOCAL float loc_LeistungAkt;
_BUR_LOCAL float loc_EnergieSchein;
_BUR_LOCAL float loc_EnergieGesamt;
