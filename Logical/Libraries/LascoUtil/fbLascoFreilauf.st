(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoFreilauf.st
 * Autor: Rudolf Lachner
 * Erstellt: 30. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Freilauffunktion für blockierende Motoren *)
FUNCTION_BLOCK fbLascoFreilauf
	
	
	IF (Freigabe) THEN
		
		//Drehbewegung überwachen
		DRZWaechter.Motor	:= MotorVor;
		DRZWaechter.Impuls	:= Impuls;
		DRZWaechter.Tick	:= Tick;
		DRZWaechter.Zeit	:= Stehzeit;
		DRZWaechter.Quit	:= NOT MotorVor;
	
	
		curStep		:= nextStep;
	
	
		//Schrittschaltwerk Freilauffunktion
		//==================================
	
		CASE curStep OF
		
		
			//******************************************************************************************************************************************************************
			0://NORMAL
			
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					CounterVersuche		:= CounterVersuche + 1;
					stateEntry			:= FALSE;
					TON_ResetCounter.IN	:= TRUE;
				END_IF
			
				//*** state during ***
				MotorVor		:= TRUE;
				MotorZurueck	:= FALSE;
				
				//Zähler rücksetzen
				IF (TON_ResetCounter.Q = TRUE) THEN
					CounterVersuche	:= 0;
				END_IF
			
				//*** state exit ***
				IF (DRZWaechter.Fehler = TRUE) AND (CounterVersuche < MaxVersuche) THEN
					stateEntry			:= TRUE;
					TON_ResetCounter.IN	:= FALSE;
					nextStep			:= 1;
				ELSIF (DRZWaechter.Fehler = TRUE) THEN
					stateEntry			:= TRUE;
					TON_ResetCounter.IN	:= FALSE;
					nextStep			:= 4;
				ELSE
					nextStep	:= curStep;
				END_IF	
			
			
			//******************************************************************************************************************************************************************************
			1://VERZÖGERUNG FREILAUF
			
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry		:= FALSE;
					TON_VerzRW.IN	:= TRUE;
				END_IF
			
				//*** state during ***
				MotorVor		:= FALSE;
				MotorZurueck	:= FALSE;
				
				//... Verzögerung abwarten	
		
				//*** state exit ***
				IF (TON_VerzRW.Q = TRUE) THEN
					stateEntry		:= TRUE;
					TON_VerzRW.IN	:= FALSE;
					nextStep		:= 2;
				ELSE
					nextStep		:= curStep;
				END_IF
			
					
			
			//**********************************************************************************************************************************************************************************
			2://FREILAUF
			
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry			:= FALSE;
					TON_Freilaufzeit.IN	:= TRUE;
				END_IF
			
				//*** state during ***
				MotorVor		:= FALSE;
				MotorZurueck	:= TRUE;
			
				//... Freilaufzeit abwarten
			
				//*** state exit ***
				IF (TON_Freilaufzeit.Q	= TRUE) THEN
					stateEntry			:= TRUE;
					TON_Freilaufzeit.IN	:= FALSE;
					nextStep			:= 3;
				ELSE
					nextStep			:= curStep;
				END_IF
			
			
			
			//********************************************************************************************************************************************************************************************
			3://VERZÖGERUNG NACH FREILAUF
			
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry		:= FALSE;
					TON_VerzRW.IN	:= TRUE;
				END_IF
			
				//*** state during ***
				MotorVor		:= FALSE;
				MotorZurueck	:= FALSE;
			
				//... Verzögerung abwarten
			
				//*** state exit ***
				IF (TON_VerzRW.Q = TRUE) THEN
					stateEntry		:= TRUE;
					TON_VerzRW.IN	:= FALSE;
					nextStep		:= 0;
				ELSE
					nextStep		:= curStep;
				END_IF
			
			
			//***********************************************************************************************************************************************************************************************
			4://FEHLER
			
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					Fehler			:= TRUE;
					CounterVersuche	:= 0;
					stateEntry		:= FALSE;
				END_IF
			
				//*** state during ***
				MotorVor		:= FALSE;
				MotorZurueck	:= FALSE;
				
				//... Quittierung abwarten
			
				//*** state exit ***
				IF (Quit = TRUE) THEN
					Fehler		:= FALSE;
					nextStep	:= 0;
				ELSE
					nextStep	:= curStep;
				END_IF
			
		END_CASE
		
	//Keine Freigabe
	ELSE
		
		MotorVor			:= FALSE;
		MotorZurueck		:= FALSE;
		TON_VerzRW.IN		:= FALSE;
		TON_Freilaufzeit.IN	:= FALSE;
		TON_ResetCounter.IN	:= FALSE;
		CounterVersuche		:= 0;
		Fehler				:= FALSE;
		nextStep			:= 0;
		curStep				:= 0;
	END_IF
	
			
		//Funtionsblöcke aufrufen
		//=======================
		
		//Drehzahlüberwachung
		DRZWaechter();
		
		//TON Verzögerung Richtungswechsel
		TON_VerzRW.Tick	:= Tick;
		TON_VerzRW.Zeit	:= VerzFreilauf;
		TON_VerzRW();
		
		//TON Freilaufzeit
		TON_Freilaufzeit.Tick	:= Tick;
		TON_Freilaufzeit.Zeit	:= Freilaufzeit;
		TON_Freilaufzeit();
		
		//TON Quittierung Zähler
		TON_ResetCounter.Tick	:= Tick;
		TON_ResetCounter.Zeit	:= 60.0;
		TON_ResetCounter();
		
	
	
END_FUNCTION_BLOCK