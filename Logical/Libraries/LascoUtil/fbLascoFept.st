(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoFept.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Fehlergenerierung PT100- Eingang *)
FUNCTION_BLOCK fbLascoFept
	

	//Wert im normalen Bereich UND Quittierung
	IF (Quit) AND (IN < 750) AND (IN > -50) THEN
		Q		:= FALSE;
		Counter	:= 0;
	
	//Fehler anstehend, Quittierung oder keine Freigabe
	ELSIF (Quit AND Q) OR (NOT Enable) THEN
		Q		:= FALSE;
		Counter	:= 0;
	
	//Zeit überschritten
	ELSIF (Counter >= VerzZeit) THEN
		Q		:= TRUE;
	
	//Wert außerhalb des normalen Bereiches
	ELSIF (IN > 750) OR (IN < -50) THEN
		Counter	:= Counter + Tick;
	ELSE
		Counter := 0;
	END_IF
	
	
	
END_FUNCTION_BLOCK