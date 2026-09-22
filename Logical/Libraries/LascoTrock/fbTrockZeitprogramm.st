(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockZeitprogramm.st
 * Autor: Rudolf Lachner
 * Erstellt: 10. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Generierung von Start- und Stoppsignalen aus Zeitprogramm *)
FUNCTION_BLOCK fbTrockZeitprogramm
	
	
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
		
		//Zeitfenster 4 ****************************************************************************************************************************
		FreigZeitfenster4	:= FALSE;
		IF (StartZeit4 > StoppZeit4) THEN
			IF (AktZeit >= StartZeit4) OR (AktZeit < StoppZeit4) THEN
				FreigZeitfenster4 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit4) AND (AktZeit < StoppZeit4) THEN
				FreigZeitfenster4	:= TRUE;
			END_IF
		END_IF
		
		//Zeitfenster 5 ****************************************************************************************************************************
		FreigZeitfenster5	:= FALSE;
		IF (StartZeit5 > StoppZeit5) THEN
			IF (AktZeit >= StartZeit5) OR (AktZeit < StoppZeit5) THEN
				FreigZeitfenster5 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit5) AND (AktZeit < StoppZeit5) THEN
				FreigZeitfenster5	:= TRUE;
			END_IF
		END_IF
	
		FreigabeZeitprogramm	:= FreigZeitfenster1 OR FreigZeitfenster2 OR FreigZeitfenster3 OR FreigZeitfenster4 OR FreigZeitfenster5;
		
	ELSE
		
		FreigZeitfenster1		:= FALSE;
		FreigZeitfenster2		:= FALSE;
		FreigZeitfenster3		:= FALSE;
		FreigZeitfenster4		:= FALSE;
		FreigZeitfenster5		:= FALSE;
		FreigabeZeitprogramm	:= FALSE;
		
	END_IF
	
	
END_FUNCTION_BLOCK