(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockLaufPause.st
 * Autor: Rudolf Lachner
 * Erstellt: 18. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Lauf- und Pausenprogramm *)
FUNCTION_BLOCK fbTrockLaufPause
	
		
	//Schrittschaltwerk Pulsgenerator
	//===============================
	  
	currStep	:= nextStep;
	
	
	CASE currStep OF
	
		//*******************************************************************************************************************************************************************************
		0://WARTEN
			
			//*** state during ***
			FreigabeLpPrg	:= FALSE;
				
			CounterLauf		:= 0;
			CounterPause	:= 0;
			RestzeitPause	:= 0;
			RestzeitLauf	:= 0;
			
			//*** state exit ***
			IF (Freigabe) AND (ZeitLauf <> 0) AND (ZeitLauf >= ZeitLaufMin) AND NOT (Reset) THEN
				nextStep	:= 2;
			ELSE
				nextStep	:= currStep;
			END_IF
		
			
		//***********************************************************************************************************************************************************************************
		1://PAUSE
			
			//*** state during ***
			FreigabeLpPrg	:= FALSE;
			
			IF (EDGEPOS(Tick)) THEN
				CounterPause	:= CounterPause + 1;
			END_IF
		
			RestzeitPause	:= ZeitPause - CounterPause;
			RestzeitLauf	:= 0;
			
			
			//*** state exit *** 
			IF (NOT Freigabe) OR (ZeitLauf = 0) OR (ZeitLauf < ZeitLaufMin) OR (Reset) THEN
				nextStep	:= 0;
			ELSIF (CounterPause >= ZeitPause) THEN
				CounterPause	:= 0;
				nextStep		:= 2;
			END_IF
			
		
		
		//************************************************************************************************************************************************************************************************
		2://LAUF
			
			//*** state during ***
			FreigabeLpPrg	:= TRUE;
			
			IF (EDGEPOS(Tick)) THEN
				CounterLauf		:= CounterLauf + 1;
			END_IF
			
			RestzeitPause	:= 0;
			RestzeitLauf	:= ZeitLauf - CounterLauf;
			
			//*** state exit ***
			IF (NOT Freigabe) OR (ZeitLauf < ZeitLaufMin) OR (Reset) THEN
				nextStep	:= 0;
			ELSIF (CounterLauf >= ZeitLauf) THEN
				CounterLauf	:= 0;
				nextStep	:= 1;
			END_IF
			
	END_CASE
	
	
	
END_FUNCTION_BLOCK