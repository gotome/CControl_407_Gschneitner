(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbStellachseAnalog.st
 * Autor: Rudolf Lachner
 * Erstellt: 29. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung von analogen Stellachsen *)
FUNCTION_BLOCK fbLascoStellachseAnalog
	
	IF (Freigabe AND NOT Stoerung) THEN
		
		//Achse verfahren
		IF (SollStellung < IstStellung - Hysterese AND NOT EsVor) THEN
			MotorStellung := SollStellung;	
		ELSIF (SollStellung > IstStellung + Hysterese AND NOT EsZurueck) THEN
			MotorStellung := SollStellung;
			
		//Achse Stillstand
		ELSE
			MotorStellung 	:= IstStellung;
		END_IF
	ELSE
		MotorStellung 		:= IstStellung;
	END_IF

	
	//Fehler
	IF ((EsVor AND EsZurueck) OR Stoerung) THEN
		MotorStellung 	:= IstStellung;
		Fehler 			:= TRUE;
	ELSE
		Fehler 			:= FALSE;	
	END_IF
	
	
END_FUNCTION_BLOCK