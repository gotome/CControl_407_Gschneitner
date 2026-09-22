(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoBmin.st
 * Autor: Rudolf Lachner
 * Erstellt: 16. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Betriebsdauer in Minuten zählen *)
FUNCTION_BLOCK fbLascoBmin
	
	IF (Aktiv AND sekTick) THEN
		IF (Sekunden < 59) THEN
			Sekunden	:= Sekunden + 1;
		ELSE
			Minuten		:= Minuten + 1;
			Sekunden	:= 0;
		END_IF
	END_IF
	
	
	IF (Reset) THEN
		Sekunden	:= 0;
		Minuten		:= 0;
	END_IF
	

END_FUNCTION_BLOCK