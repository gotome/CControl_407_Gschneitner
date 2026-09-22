(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoWlg.st
 * Autor: Rudolf Lachner
 * Erstellt: 15. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung für Warmluftgebläse ohne Drehzahlvorgabe *)
FUNCTION_BLOCK fbLascoWlg
	
	IF (Freigabe AND NOT Stoerung) THEN
		
		//Temperatur unter Min -> Stopp
		IF (IstTemp <= StopBeiTemp) THEN
			GeblaeseEin	:= FALSE;
			//Temperatur über Max -> Start
		ELSIF (IstTemp >= StartBeiTemp) AND (StartBeiTemp <> 0) THEN
			GeblaeseEin	:= TRUE;
		END_IF
		
	ELSE
	
		GeblaeseEin	:= FALSE;	
		
	END_IF
	
	
	IF (Stoerung) THEN
		Fehler		:= TRUE;
	ELSE
		Fehler		:= FALSE;
	END_IF
	
END_FUNCTION_BLOCK