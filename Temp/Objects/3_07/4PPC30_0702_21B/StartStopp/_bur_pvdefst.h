struct fbLascoZdxx
{	float IN;
	float MEM;
	plcbit Q;
};
_BUR_PUBLIC void fbLascoZdxx(struct fbLascoZdxx* inst);
struct fbLascoPuge
{	float ZeitPuls;
	float ZeitPause;
	float RestzeitPuls;
	float RestzeitPause;
	unsigned char currStep;
	float CounterPuls;
	float CounterPause;
	unsigned char nextStep;
	plcbit StartMitPuls;
	plcbit StartMitPause;
	plcbit Tick;
	plcbit Reset;
	plcbit PulsQ;
	plcbit PauseQ;
};
_BUR_PUBLIC void fbLascoPuge(struct fbLascoPuge* inst);
_BUR_LOCAL struct fbLascoZdxx fbLascoZdxx_0;
_BUR_LOCAL plcbit hmilliTick;
_BUR_LOCAL struct fbLascoPuge fbLascoPuge_0;
_BUR_LOCAL plcbit hmiBlink;
