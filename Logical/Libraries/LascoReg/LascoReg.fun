(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoReg
 * Datei: LascoReg.fun
 * Autor: Rudolf Lachner
 * Erstellt: 16. Juli 2014
 ********************************************************************
 * Funktionen und Funktionsblöcke der Library LascoReg
 ********************************************************************)

FUNCTION_BLOCK fbRegPidReglerAllg (*Standard- PID- Regler*) (*$GROUP=Anwender*)
	VAR_INPUT
		Freigabe : BOOL;
		Hysterese : REAL;
		RampeMax : REAL;
		Invert : BOOL;
		WindupDaempfung : REAL;
		P_Anteil : REAL;
		AbschwaechungSollwert : REAL;
		D_Filterzeit : REAL;
		I_Anteil : REAL;
		D_Anteil : REAL;
		Aufschaltgroesse : REAL;
		Hold_I : BOOL;
		Mode : USINT;
		Sollwert : REAL;
		Istwert : REAL;
		StellgroesseManuell : REAL;
		StellgroesseMin : REAL;
		StellgroesseMax : REAL;
		RegelbereichMin : REAL;
		Fehlerverzoegerung : UDINT;
		RegelbereichMax : REAL;
	END_VAR
	VAR_OUTPUT
		Stellgroesse : REAL;
		Regelabweichung : REAL;
		FehlerRegelbereichMin : BOOL;
		FehlerRegelbereichMax : BOOL;
		WarnungRegelbereichMin : BOOL;
		WarnungRegelbereichMax : BOOL;
	END_VAR
	VAR
		PID_Para : LCRPIDpara;
		PID : LCRPID;
		TON_FehlerverzoegerungMin : TON;
		TON_FehlerverzoegerungMax : TON;
	END_VAR
	VAR_INPUT
		QuitFehler : BOOL;
	END_VAR
	VAR
		LCRLimScal_0 : LCRLimScal;
	END_VAR
END_FUNCTION_BLOCK
