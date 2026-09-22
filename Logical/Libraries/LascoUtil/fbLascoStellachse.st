(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoStellachse.st
 * Autor: Rudolf Lachner
 * Erstellt: 29. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung Stellachsen *)
FUNCTION_BLOCK fbLascoStellachse
	
	IF (Freigabe AND NOT Stoerung) THEN
		
		//Stellachse zu fahren
		IF (SollStellung < IstStellung - Hysterese AND NOT EsVor) THEN
			MotorVor 		:= FALSE;
			MotorZurueck 	:= TRUE;
			
		//Stellsachse auf fahren
		ELSIF (SollStellung > IstStellung + Hysterese AND NOT EsZurueck) THEN
			MotorVor 		:= TRUE;
			MotorZurueck 	:= FALSE;
		
		//Stellachse Aus
		ELSE
			MotorVor 		:= FALSE;
			MotorZurueck 	:= FALSE;
		END_IF
	ELSE
		MotorVor 			:= FALSE;
		MotorZurueck 		:= FALSE;
	END_IF

	
	//Fehler
	IF ((EsVor AND EsZurueck) OR Stoerung) THEN
		MotorVor 		:= FALSE;
		MotorZurueck 	:= FALSE;
		Fehler 			:= TRUE;
	ELSE
		Fehler 			:= FALSE;
	END_IF
	
	
	
	
	
END_FUNCTION_BLOCK