(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoStdMin.st
 * Autor: Rudolf Lachner
 * Erstellt: 16. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Angehängte Betriebsdauer von Minuten in Stunden umwandeln *)
FUNCTION_BLOCK fbLascoStdMin
	
	IF (Minuten > 59) THEN
		Stunden		:= Stunden + 1;
		Minuten		:= 0;
	END_IF
	
	IF (Reset) THEN
		Stunden		:= 0;
		Minuten		:= 0;
	END_IF
	
END_FUNCTION_BLOCK