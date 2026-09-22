struct DTGetTime
{	unsigned short status;
	plcdt DT1;
	plcbit enable;
};
_BUR_PUBLIC void DTGetTime(struct DTGetTime* inst);
_BUR_LOCAL struct DTGetTime DTGetTime_0;
