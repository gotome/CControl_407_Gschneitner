/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_9_
#define _BUR_1790103064_9_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
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

typedef struct modBR7300
{	plcbit ModulOk;
} modBR7300;

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

typedef struct modAO2622
{	signed short ao01;
	signed short ao02;
	plcbit ModulOk;
} modAO2622;

typedef struct modAI4622
{	signed short ai01;
	signed short ai02;
	signed short ai03;
	signed short ai04;
	unsigned char StatusInput01;
	plcbit ModulOk;
} modAI4622;

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

typedef struct modDO8322
{	plcbit do01;
	plcbit do02;
	plcbit do03;
	plcbit do04;
	plcbit do05;
	plcbit do06;
	plcbit do07;
	plcbit do08;
	plcbit ModulOk;
} modDO8322;

typedef struct modDI9371
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
	plcbit ModulOk;
} modDI9371;

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

typedef struct modAT2222
{	signed short at01;
	signed short at02;
	unsigned char StatusInput01;
	plcbit ModulOk;
} modAT2222;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_9_ */

