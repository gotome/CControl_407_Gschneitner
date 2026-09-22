(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoReg
 * Datei: fbRegPidReglerAllg.st
 * Autor: Rudolf Lachner
 * Erstellt: 16. Juli 2014
 ********************************************************************
 * Implementierung der Library LascoReg
 ********************************************************************) 

(* Standard- PID- Regler *)
FUNCTION_BLOCK fbRegPidReglerAllg
	
	IF (Freigabe) THEN
		
		//Parametrierungsbaustein des Reglers
		PID_Para.enable			:= Freigabe;
		PID_Para.enter			:= Freigabe;
		PID_Para.deadband		:= Hysterese;
		PID_Para.deadband_mode	:= LCRPID_DEADBAND_MODE_STANDARD;
		PID_Para.dY_max			:= RampeMax;
		PID_Para.d_mode			:= LCRPID_D_MODE_E;
		PID_Para.fbk_mode		:= LCRPID_FBK_MODE_INTERN;
		PID_Para.invert			:= Invert;
		PID_Para.Kfbk			:= WindupDaempfung;
		PID_Para.Kp				:= P_Anteil;
		PID_Para.Kw				:= AbschwaechungSollwert;
		PID_Para.Tf				:= D_Filterzeit;
		PID_Para.Tn				:= I_Anteil;
		PID_Para.Tv				:= D_Anteil;
		PID_Para.WX_min			:= 0.0;
		PID_Para.WX_max			:= 100.0;
	
		
		//PID- Reglerbaustein
		PID.enable				:= Freigabe;
		PID.A					:= Aufschaltgroesse;
		PID.hold_I				:= Hold_I;
		PID.ident				:= PID_Para.ident;
		PID.mode				:= Mode;
		PID.W					:= Sollwert;
		PID.X					:= Istwert;
		PID.Y_fbk				:= 0.0;
		PID.Y_man				:= StellgroesseManuell;
		PID.Y_min				:= 0.0;
		PID.Y_max				:= 100.0;
		
		//Min-Max des Reglers von 0-100% auf Stellgröße skalieren
		LCRLimScal_0(x := PID.Y, x1 := 0, y1 := StellgroesseMin, x2 := 100, y2 := StellgroesseMax);
		
		Stellgroesse			:= LCRLimScal_0.y;
		Regelabweichung			:= PID.e;

		//Warnungs- und Fehlergenerierung bei Erreichen des Min/Max- Regelbereiches
		TON_FehlerverzoegerungMin.IN	:= (Istwert < RegelbereichMin) AND Freigabe AND NOT QuitFehler;
		TON_FehlerverzoegerungMin.PT	:= UDINT_TO_TIME(Fehlerverzoegerung);
	
		TON_FehlerverzoegerungMax.IN	:= (Istwert > RegelbereichMax) AND Freigabe AND NOT QuitFehler;
		TON_FehlerverzoegerungMax.PT	:= UDINT_TO_TIME(Fehlerverzoegerung);
	
		WarnungRegelbereichMin			:= TON_FehlerverzoegerungMin.IN;
		WarnungRegelbereichMax			:= TON_FehlerverzoegerungMax.IN;
	
		FehlerRegelbereichMin			:= TON_FehlerverzoegerungMin.Q;
		FehlerRegelbereichMax			:= TON_FehlerverzoegerungMax.Q;
	
	
		//Funktionsbausteine aufrufen
		PID_Para();
		PID();
		TON_FehlerverzoegerungMax();
		TON_FehlerverzoegerungMin();
		
	ELSE
		
		Stellgroesse			:= 0.0;
		Regelabweichung			:= 0.0;
		WarnungRegelbereichMax	:= FALSE;
		WarnungRegelbereichMin	:= FALSE;
		FehlerRegelbereichMax	:= FALSE;
		FehlerRegelbereichMin	:= FALSE;
		
	END_IF
	
	
END_FUNCTION_BLOCK