(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoFU.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung Frequenzumrichter *)
FUNCTION_BLOCK fbLascoFU
	
	//Betriebsmeldung abwarten
	TON_Betriebsmeldung(IN := (Freigabe AND NOT BetrMldg AND NOT Reset AND (SollDrehzahl > 0)), Zeit := AnsprechZeitFU, Tick := Tick);
	
	//Erster Aufruf
	IF (NOT InitDone) OR Reset THEN
		ResetDone	:= TRUE;
		InitDone	:= TRUE;
	END_IF
	
	//Keine Betriebsmeldung
	IF (TON_Betriebsmeldung.Q) THEN
		StoerungFU 	:= TRUE;
	END_IF

	//Umrichter Betrieb
	IF (Freigabe AND ResetDone) THEN
		
		BetriebFU := DrehzahlFU <> 0;	
		
		//Zeit in Millisekunden umrechnen
		RampDownMillis 	:= REAL_TO_DINT(RampeDownSek * 1000);
		RampUpMillis 	:= REAL_TO_DINT(RampeUpSek * 1000);
		
		//Rampenfunktion
		LCRRamp_0.enable  := Freigabe;
		LCRRamp_0.y_max   := MaxDrehzahl;
		LCRRamp_0.y_min   := MinDrehzahl;
		LCRRamp_0.y_set   := IstDrehzahl;
		LCRRamp_0.set     := EDGEPOS(Init);
		LCRRamp_0.x		  := SollDrehzahl;

		IF (RampUpMillis > 0) THEN
			LCRRamp_0.dy_up   := (MaxDrehzahl - MinDrehzahl)*1000/DINT_TO_REAL(RampUpMillis);
		ELSE			
			LCRRamp_0.dy_up   := 999999999;
		END_IF

		IF (RampDownMillis > 0) THEN			
			LCRRamp_0.dy_down := (MaxDrehzahl - MinDrehzahl)*1000/DINT_TO_REAL(RampDownMillis);
		ELSE
			LCRRamp_0.dy_down  := 999999999;
		END_IF

		LCRRamp_0();

		IF (LCRRamp_0.dy_down = 999999999 OR LCRRamp_0.dy_up = 999999999) THEN
			DrehzahlFU := SollDrehzahl;
		ELSE
			DrehzahlFU :=	LCRRamp_0.y;
		END_IF
		
	ELSE
		
		LCRRamp_0.x		  	:= 0;
		LCRRamp_0.dy_down  	:= 999999999;
		LCRRamp_0();

		BetriebFU 			:= FALSE;
		DrehzahlFU 			:= 0;
	END_IF

	
	//Störung Reset
	IF (EDGENEG(Freigabe) OR (NOT Freigabe AND NOT BetrMldg) OR Reset OR BetrMldg) THEN
		ResetDone 	:= TRUE;
		StoerungFU 	:= FALSE;
	END_IF
	
	
	
END_FUNCTION_BLOCK