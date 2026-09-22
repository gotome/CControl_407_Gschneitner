(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockStrombegr.st
 * Autor: Rudolf Lachner
 * Erstellt: 18. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Strombegrenzung in bestimmten Zeitfenstern *)
FUNCTION_BLOCK fbTrockStrombegr
	
		
	
	IF (Freigabe = TRUE) THEN
		
	
		//Zeitfenster 1 ****************************************************************************************************************************
		FreigZeitfenster1	:= FALSE;
		IF (StartZeit1 > StoppZeit1) THEN
			IF (AktZeit >= StartZeit1) OR (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit1) AND (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1	:= TRUE;
			END_IF
		END_IF
		
		//Zeitfenster 2 ****************************************************************************************************************************
		FreigZeitfenster2	:= FALSE;
		IF (StartZeit2 > StoppZeit2) THEN
			IF (AktZeit >= StartZeit2) OR (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit2) AND (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2	:= TRUE;
			END_IF
		END_IF
		
		//Zeitfenster 3 ****************************************************************************************************************************
		FreigZeitfenster3	:= FALSE;
		IF (StartZeit3 > StoppZeit3) THEN
			IF (AktZeit >= StartZeit3) OR (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit3) AND (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3	:= TRUE;
			END_IF
		END_IF
		
		
		//Drehzahlbegrenzungen 1 - 3
		//**************************
		IF (FreigZeitfenster1) THEN
			DrehzahlBegrenzung	:= DrehzahlBegrenzung1;
		ELSIF (FreigZeitfenster2) THEN
			DrehzahlBegrenzung	:= DrehzahlBegrenzung2;
		ELSIF (FreigZeitfenster3) THEN
			DrehzahlBegrenzung	:= DrehzahlBegrenzung3;
		ELSE
			DrehzahlBegrenzung	:= 0.0;
		END_IF
		
		
		StrombegrenzungEin		:= FreigZeitfenster1 OR FreigZeitfenster2 OR FreigZeitfenster3;
		
	ELSE
		
		FreigZeitfenster1		:= FALSE;
		FreigZeitfenster2		:= FALSE;
		FreigZeitfenster3		:= FALSE;
		StrombegrenzungEin		:= FALSE;
		DrehzahlBegrenzung		:= 0.0;
		
	END_IF
	
		
		
		
	
	
	
	
END_FUNCTION_BLOCK