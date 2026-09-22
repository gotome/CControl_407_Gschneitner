
{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbCControlWitterung (*Funktionsbaustein zur Generierung der Witterungsverhältnisse über Sättigungsdefizit und Trocknungslaufzeit*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		MaterialfeuchteIst : {REDUND_UNREPLICABLE} UDINT;
		MaterialfeuchteStufe : {REDUND_UNREPLICABLE} ARRAY[1..6] OF UDINT;
		FrischluftSaettigungsdefizit : {REDUND_UNREPLICABLE} REAL;
		DachluftSaettigungsdefizit : {REDUND_UNREPLICABLE} REAL;
		TrockenluftSaettigungsdefizit : {REDUND_UNREPLICABLE} REAL;
		AuswahlSensor : {REDUND_UNREPLICABLE} USINT; (*0= Frischluft, 1= Dachluft, 2= Trockenluft*)
		SensorFrischluftVhd : {REDUND_UNREPLICABLE} BOOL;
		SensorDachluftVhd : {REDUND_UNREPLICABLE} BOOL;
		SensorTrockenluftVhd : {REDUND_UNREPLICABLE} BOOL;
		GrenzwertStufeAktuell : {REDUND_UNREPLICABLE} REAL;
		HystereseGrenzwert : {REDUND_UNREPLICABLE} REAL;
		VerzWetterwechsel : {REDUND_UNREPLICABLE} UDINT; (*Verzögerungszeit Wetterwechsel [ms]*)
		SchlechtwetterPulszeitStufe : {REDUND_UNREPLICABLE} ARRAY[1..6] OF UDINT;
		SchlechtwetterPausezeitStufe : {REDUND_UNREPLICABLE} ARRAY[1..6] OF UDINT;
	END_VAR
	VAR_OUTPUT
		StufeAktuell : {REDUND_UNREPLICABLE} USINT;
		WetterIstGut : {REDUND_UNREPLICABLE} BOOL;
		WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
		SchlechtwetterPulszeit : {REDUND_UNREPLICABLE} UDINT;
		SchlechtwetterPausezeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		i : {REDUND_UNREPLICABLE} USINT;
		SaettigungsdefizitIst : {REDUND_UNREPLICABLE} REAL;
		loc_WetterIstGut : {REDUND_UNREPLICABLE} BOOL;
		loc_WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
		TON_SchrittWitterung : {REDUND_UNREPLICABLE} TON;
		curStep : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK
