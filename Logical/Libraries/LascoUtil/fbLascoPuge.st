(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoPuge.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Pulsgenerator *)
FUNCTION_BLOCK fbLascoPuge
	
	
	//Schrittschaltwerk Pulsgenerator
	//===============================
	  
	currStep	:= nextStep;
	
	
	CASE currStep OF
	
		//*******************************************************************************************************************************************************************************
		0://AUSWAHL
			
			//*** state during ***
			PulsQ			:= FALSE;
			PauseQ			:= FALSE;
				
			CounterPuls		:= 0;
			CounterPause	:= 0;
			RestzeitPause	:= 0;
			RestzeitPuls	:= 0;
			
			//*** state exit ***
			IF (StartMitPuls) AND (ZeitPuls <> 0) THEN
				nextStep	:= 2;
			ELSIF (StartMitPause) THEN
				nextStep	:= 1;
			END_IF
		
		
			
		//***********************************************************************************************************************************************************************************
		1://PAUSE
			
			//*** state during ***
			PulsQ	:= FALSE;
			PauseQ	:= TRUE;
			
			CounterPause	:= CounterPause + Tick;
			RestzeitPause	:= ZeitPause - CounterPause;
			RestzeitPuls	:= 0;
			
			
			//*** state exit *** 
			IF ((NOT StartMitPause AND NOT StartMitPuls)) OR (ZeitPuls = 0) THEN
				nextStep	:= 0;
			ELSIF (CounterPause >= ZeitPause) THEN
				CounterPause	:= 0;
				nextStep		:= 2;
			END_IF
			
		
		
		//************************************************************************************************************************************************************************************************
		2://PULS
			
			//*** state during ***
			PulsQ		:= TRUE;
			PauseQ		:= FALSE;
			
			CounterPuls		:= CounterPuls + Tick;
			RestzeitPause	:= 0;
			RestzeitPuls	:= ZeitPuls - CounterPuls;
			
			//*** state exit ***
			IF (CounterPuls >= ZeitPuls) OR (Reset) THEN
				CounterPuls	:= 0;
				nextStep	:= 1;
			END_IF
			
	END_CASE
	
	


	
	
END_FUNCTION_BLOCK