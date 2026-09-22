
(* Puls/Pause-Generator mit Standard-Timern *)
FUNCTION_BLOCK fbLascoPugeV2
	
	  
	curStep	:= nextStep;
	
	
	CASE curStep OF
	
		//*******************************************************************************************************************************************************************************
		0://WARTEN
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry := FALSE;
				PulsOut := FALSE;
				PauseOut := FALSE;
				TON_Schrittzeit(IN:= FALSE);
				RestzeitPause	:= 0;
				RestzeitPuls	:= 0;
			END_IF
			
			//*** state during ***
			
			//*** state exit ***
			IF (StartMitPuls) AND (ZeitPuls <> 0) THEN
				stateEntry := TRUE;
				nextStep	:= 2;
			ELSIF (StartMitPause) THEN
				stateEntry := TRUE;
				nextStep	:= 1;
			END_IF
		
		
			
			//***********************************************************************************************************************************************************************************
		1://PAUSE
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry := FALSE;
				PulsOut := FALSE;
				PauseOut := TRUE;
				TON_Schrittzeit(IN:= FALSE);
				RestzeitPause	:= 0;
				RestzeitPuls	:= 0;
			END_IF
			
			
			//*** state during ***
			TON_Schrittzeit(IN:= TRUE, PT:= UDINT_TO_TIME(ZeitPause));
			RestzeitPause := ZeitPause - TIME_TO_UDINT(TON_Schrittzeit.ET);
			
			//*** state exit *** 
			IF (NOT StartMitPause AND NOT StartMitPuls) OR (ZeitPuls = 0) THEN
				stateEntry := TRUE;
				nextStep := 0;
			ELSIF TON_Schrittzeit.Q THEN
				stateEntry := TRUE;
				nextStep := 2;
			END_IF
		
		
			//************************************************************************************************************************************************************************************************
		2://PULS
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry := FALSE;
				PulsOut := TRUE;
				PauseOut := FALSE;
				TON_Schrittzeit(IN:= FALSE);
				RestzeitPause	:= 0;
				RestzeitPuls	:= 0;
			END_IF
			
			//*** state during ***
			TON_Schrittzeit(IN:= TRUE, PT:= UDINT_TO_TIME(ZeitPuls));
			RestzeitPuls := ZeitPuls - TIME_TO_UDINT(TON_Schrittzeit.ET);
			
			//*** state exit *** 
			IF (NOT StartMitPause AND NOT StartMitPuls) OR (ZeitPuls = 0) THEN
				stateEntry := TRUE;
				nextStep := 0;
			ELSIF TON_Schrittzeit.Q THEN
				stateEntry := TRUE;
				nextStep := 1;
			END_IF
			
	END_CASE
	
	
	
	
	
	
END_FUNCTION_BLOCK
