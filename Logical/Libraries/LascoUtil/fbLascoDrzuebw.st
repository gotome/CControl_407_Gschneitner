(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoDrzuebw.st
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Drehzahlüberwachung eines Motors *)
FUNCTION_BLOCK fbLascoDrzuebw
	
	
	//Schrittschaltwerk Impulsüberwachung
	//===================================
	
	curStep	:= nextStep;
	
	CASE curStep OF
		
		//**************************************************************************************************************************************************************************************
		0://MOTOR AUS
			
			//*** state during ***
			Fehler := FALSE;
			
			
			//*** state exit ***
			
			//Motor ein, kein Impuls
			IF (Motor) AND (NOT Impuls) THEN
				nextStep	:= 1;
				
			//Motor ein, Impuls
			ELSIF (Motor) AND (Impuls) THEN
				nextStep	:= 2;
			END_IF
		
		
		//*********************************************************************************************************************************************************
		1://KEIN IMPULS
		
			//*** state during ***
			Fehler 		:= FALSE;
			ElapsedTime	:= ElapsedTime + Tick;
			
			//*** state exit ***
			
			//Überwachungszeit abgelaufen
			IF (ElapsedTime >= Zeit) THEN
				nextStep	:= 255;
				
			//Impuls
			ELSIF (Impuls) THEN
				ElapsedTime	:= 0;
				nextStep	:= 2;
			
			//Motor AUS
			ELSIF (NOT Motor) THEN
				ElapsedTime	:= 0;
				nextStep	:= 0;
			END_IF
			
		
		//*******************************************************************************************************************************************************
		2://IMPULS
			
			//*** state during ***
			Fehler 		:= FALSE;
			ElapsedTime	:= ElapsedTime + Tick;
			
			
			
			//*** state exit ***
			
			//Überwachungszeit abgelaufen
			IF (ElapsedTime >= Zeit) THEN
				nextStep	:= 255;
				
			//Kein Impuls
			ELSIF (NOT Impuls) THEN
				ElapsedTime	:= 0;
				nextStep	:= 1;
			
			//Motor AUS
			ELSIF (NOT Motor) THEN
				ElapsedTime	:= 0;
				nextStep	:= 0;
			END_IF
	
		
		
		
		//*******************************************************************************************************************************************************************
		255://FEHLER
			
			//*** state during ***
			Fehler 		:= TRUE;
			ElapsedTime	:= 0;
			
			
			//*** state exit ***
			
			//Fehler quittiert
			IF (Quit) THEN
				nextStep	:= 0;
			END_IF
					
	END_CASE
	
	
END_FUNCTION_BLOCK