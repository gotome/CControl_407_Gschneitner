(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoTOG.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Toggle- Funktion *)
FUNCTION_BLOCK fbLascoTOG
	
	IF Reset THEN
		Q     	:= FALSE;
		ToggImp := FALSE;

	ELSIF (NOT IN) THEN
		ToggImp := FALSE;
		
	ELSIF (IN AND NOT ToggImp AND NOT Q) THEN
		Q     	:= TRUE;
		ToggImp := TRUE;
		
	ELSIF (IN AND NOT ToggImp AND Q) THEN
		Q     	:= FALSE;
		ToggImp := TRUE;
	END_IF
	
		
	
	
	
	
END_FUNCTION_BLOCK