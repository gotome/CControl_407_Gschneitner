(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoTimerHand.st
 * Autor: Rudolf Lachner
 * Erstellt: 9. Dezember 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Timer mit Hand-Funktionen *)
FUNCTION_BLOCK fbLascoTimerHand
	
	
	IF (NOT Freigabe) THEN
		Elapsed	:= 0;
		Q		:= FALSE;
	ELSIF (HandEin) THEN
		Q		:= TRUE;
	ELSIF (HandAus) THEN
		Q		:= FALSE;
	ELSIF (Elapsed >= Zeit) THEN
		Q		:= FALSE;
	ELSE
		Elapsed	:= Elapsed + Tick;
		Q		:= TRUE;
	END_IF
	
END_FUNCTION_BLOCK