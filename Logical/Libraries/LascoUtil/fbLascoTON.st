(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoTON.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Einschaltverzögerung *)
FUNCTION_BLOCK fbLascoTON
	
	IF (NOT IN) THEN
		Elapsed	:= 0;
		Q		:= FALSE;
	ELSIF (Elapsed	>= Zeit) THEN
		Q		:= TRUE;
	ELSE
		Elapsed	:= Elapsed + Tick;
		Q		:= FALSE;
	END_IF
	
	
END_FUNCTION_BLOCK