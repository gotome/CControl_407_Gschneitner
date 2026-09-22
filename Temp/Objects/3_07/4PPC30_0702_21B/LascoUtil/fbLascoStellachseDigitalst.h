#ifndef __AS__TYPE_
#define __AS__TYPE_
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

struct SysInfo
{	unsigned char init_reason;
	unsigned char init_count;
	unsigned long tick_count;
	unsigned long version;
	plcbit enable;
};
_BUR_PUBLIC void SysInfo(struct SysInfo* inst);
struct LCRContinServo
{	float x;
	float max_value;
	float min_value;
	float t_impulse;
	float t_change_up;
	float t_change_down;
	unsigned short status;
	float hysteresis_up;
	float hysteresis_down;
	unsigned short counter_state;
	unsigned long bootkey_old;
	unsigned long systicks_old;
	unsigned short musecs_old;
	signed long t_cnt_1;
	signed long t_cnt_2;
	signed long y_dbl_1;
	signed long y_dbl_2;
	struct SysInfo sysInfo_inst;
	plcbit enable;
	plcbit ref;
	plcbit up;
	plcbit down;
	plcbit refOk;
	plcbit enable_old;
	plcbit ref_old;
};
_BUR_PUBLIC void LCRContinServo(struct LCRContinServo* inst);
struct fbLascoStellachseDigital
{	float Sollstellung;
	float Oeffnungszeit;
	float Schliesszeit;
	float MinPosition;
	float MaxPosition;
	float MinImpulsdauer;
	float IstPosition;
	struct LCRContinServo LCRContinServo_0;
	float WegProZeitAuf;
	float WegProZeitZu;
	plcbit Freigabe;
	plcbit Referenz;
	plcbit Tick;
	plcbit ReferenzOk;
	plcbit MotorAuf;
	plcbit MotorZu;
	plcbit ReferenzAktiv;
	plcbit zzEdge00000;
	plcbit zzEdge00001;
	plcbit zzEdge00002;
	plcbit zzEdge00003;
};
_BUR_PUBLIC void fbLascoStellachseDigital(struct fbLascoStellachseDigital* inst);
_BUR_PUBLIC float CheckDivReal(float divisor);
