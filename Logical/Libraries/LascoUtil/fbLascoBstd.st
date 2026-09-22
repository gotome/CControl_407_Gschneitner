(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoBstd.st
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Betriebsstundenzähler auf Minutenbasis *)
FUNCTION_BLOCK fbLascoBstd
	
	IF (Aktiv AND minTick) THEN
		
		IF Minuten < 59 THEN
			Minuten	:= Minuten + 1;
		ELSE
			Stunden	:= Stunden + 1;
			Minuten	:= 0;
		END_IF
		
	END_IF
		
	
	IF (Reset) THEN
		Minuten	:= 0;
		Stunden	:= 0;
	END_IF
	
	
END_FUNCTION_BLOCK