(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoFehl.st
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Fehlerverzögerung und Quittierungsverhalten *)
FUNCTION_BLOCK fbLascoFehl
	
	//Fehlerdominant + Selbsthaltung
	IF (Mode = 0) THEN
		
		IF (Quit AND NOT FehlerIn) OR (NOT FehlerIn AND NOT FehlerOut) THEN
			Counter		:= 0;
			FehlerOut	:= FALSE;
		ELSIF (Counter < VerzZeit) AND (NOT FehlerOut) THEN
			Counter		:= Counter + Tick;
		ELSE
			FehlerOut	:= TRUE;
		END_IF
			
	//Quittierdominant + Selbsthaltung
	ELSIF (Mode = 1) THEN
		
		IF (Quit) OR (NOT FehlerIn AND NOT FehlerOut) THEN
			Counter		:= 0;
			FehlerOut	:= FALSE;
		ELSIF (Counter < VerzZeit) AND (NOT FehlerOut) THEN
			Counter		:= Counter + Tick;
		ELSE
			FehlerOut	:= TRUE;
		END_IF
		
		
	//Quittierdominamt, keine Selbsthaltung
	ELSIF (Mode = 2) THEN
		
		IF (Quit) OR (NOT FehlerIn) THEN
			Counter		:= 0;
			FehlerOut	:= FALSE;
		ELSIF (Counter < VerzZeit) AND (NOT FehlerOut) THEN
			Counter		:= Counter + Tick;
		ELSE
			FehlerOut	:= TRUE;
		END_IF
		
	//Keine Quittierung, keine Selbsthaltung
	ELSIF (Mode = 3) THEN
	
		IF (NOT FehlerIn) THEN
			Counter		:= 0;
			FehlerOut	:= FALSE;
		ELSIF (Counter < VerzZeit) AND (NOT FehlerOut) THEN
			Counter		:= Counter + Tick;
		ELSE
			FehlerOut	:= TRUE;
		END_IF
		
	//Fehlerdominant, Selbstquittierung
	ELSIF (Mode = 4) THEN
	
		IF (Quit AND FehlerOut) OR (NOT FehlerIn) THEN
			Counter		:= 0;
			FehlerOut	:= FALSE;
		ELSIF (Counter < VerzZeit) AND (NOT FehlerOut) THEN
			Counter		:= Counter + Tick;
		ELSE
			FehlerOut	:= TRUE;
		END_IF
		
	END_IF
	
			
									 
			
									 
	
	
	
	
END_FUNCTION_BLOCK