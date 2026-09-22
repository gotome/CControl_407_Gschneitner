(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoTOF.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ausschaltverzögerung *)
FUNCTION_BLOCK fbLascoTOF

	IF (Reset) THEN
		Q		:= FALSE;
		Elapsed	:= 0;
		
	ELSIF (IN) THEN
		Q		:= TRUE;
		Elapsed	:= 0;
		
	ELSIF (Q AND NOT IN) THEN
		
		IF (Elapsed < Zeit) THEN
			Elapsed	:= Elapsed + Tick;
		ELSE
			Q		:= FALSE;
			Elapsed	:= 0;
		END_IF
		
	END_IF
		
END_FUNCTION_BLOCK