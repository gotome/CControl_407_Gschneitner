(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoZbFrg.st
 * Autor: Rudolf Lachner
 * Erstellt: 3. April 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Zeitfenster Freigabe *)
FUNCTION_BLOCK fbLascoZbFrg
	
	//Akutelle Uhrzeit auslesen
	EUhr(Freigabe := TRUE);
	AktZeit	:= INT_TO_REAL(EUhr.StdMin);
	
	IF (Freigabe = TRUE) THEN
	
		FreigZeitfenster	:= FALSE;
		IF (StartZeit > StoppZeit) THEN
			IF (AktZeit >= StartZeit) OR (AktZeit < StoppZeit) THEN
				FreigZeitfenster 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit) AND (AktZeit < StoppZeit) THEN
				FreigZeitfenster	:= TRUE;
			END_IF
		END_IF
		
	ELSE
		FreigZeitfenster	:= FALSE;
	END_IF
	
	
	
	
	
END_FUNCTION_BLOCK