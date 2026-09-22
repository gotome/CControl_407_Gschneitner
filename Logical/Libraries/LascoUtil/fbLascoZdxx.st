(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoZdxx.st
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Tickausgabe bei Zustandsänderung des Einganges *)
FUNCTION_BLOCK fbLascoZdxx
	
	IF (IN <> MEM) THEN
		MEM	:= IN;
		Q	:= TRUE;
	ELSE
		Q	:= FALSE;
	END_IF
	
	
END_FUNCTION_BLOCK