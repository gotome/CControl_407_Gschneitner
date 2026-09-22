(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoWarmluftsteller.st
 * Autor: Rudolf Lachner
 * Erstellt: 29. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung Warmluftgebläse mit Kühlreduzierung *)
FUNCTION_BLOCK fbLascoWarmluftsteller
	
	
	IF (Freigabe) THEN
		
		//Schrittschaltwerk Kühlreduzierung
		//=================================
		
		curState	:= nextState;
		
		CASE curState OF
			
			//****************************************************************************************************************************************************************************
			0://NORMAL
				
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry := FALSE;
				END_IF
				
				//*** state during ***
				locDrehzahl1 	:= WLG1SollDRZ;
				locDrehzahl2 	:= WLG2SollDRZ;
				WLG1DRZStell 	:= locDrehzahl1;
				WLG2DRZStell  	:= locDrehzahl2;
				
				//*** state exit ***
				IF (IstTemperatur < GrenzTemperatur) THEN
					nextState 	:= 1;
					stateEntry 	:= TRUE;
				ELSE
					nextState := curState;
				END_IF
				
			
			//********************************************************************************************************************************************************************************************
			1://DREHZAHL MINDERUNG
				
				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry := FALSE;
					IF (((locDrehzahl1 - MinderungDRZ) > WLG1MinDRZ) AND ((locDrehzahl2 - MinderungDRZ) > WLG2MinDRZ)) THEN
						locDrehzahl1 := locDrehzahl1 - MinderungDRZ;
						locDrehzahl2 := locDrehzahl2 - MinderungDRZ;
					ELSE
						locDrehzahl1 := WLG1MinDRZ;
						locDrehzahl2 := WLG2MinDRZ;
					END_IF
					TON_WarmluftSteller.IN		:= TRUE;
					TON_WarmluftSteller.Zeit	:= Bezugszeit;
				END_IF
				
				//*** state during ***
				
				//Zeit starten	
				TON_WarmluftSteller.Tick	:= Tick;
				
				IF ((WLG1SollDRZ < locDrehzahl1) AND (WLG2SollDRZ < locDrehzahl2)) THEN
					locDrehzahl1 := WLG1SollDRZ;
					locDrehzahl2 := WLG2SollDRZ;
				END_IF
				
				WLG1DRZStell := locDrehzahl1;
				WLG2DRZStell := locDrehzahl2;
				
				
				//*** state exit ***
				
				//Bezugszeit abgelaufen, weiter reduzieren
				IF ((TON_WarmluftSteller.Q) AND (IstTemperatur <= GrenzTemperatur)) THEN
					nextState 				:= 1;
					stateEntry 				:= TRUE;
					TON_WarmluftSteller.IN 	:= FALSE;
					
					//Bezugszeit abgelaufen, wieder erhöhen
				ELSIF ((TON_WarmluftSteller.Q) AND (IstTemperatur > GrenzTemperatur)) THEN
					nextState 				:= 2;
					stateEntry 				:= TRUE;
					TON_WarmluftSteller.IN 	:= FALSE;
				ELSE
					nextState := curState;
				END_IF
			
			
			
			//****************************************************************************************************************************************************************************************************************
			2://DREHZAHL ERHÖHEN

				//*** state entry ***
				IF (stateEntry = TRUE) THEN
					stateEntry := FALSE;
					IF ((locDrehzahl1 < WLG1MinDRZ) AND (locDrehzahl2 < WLG2MinDRZ))THEN
						locDrehzahl1 := WLG1MinDRZ;
						locDrehzahl2 := WLG2MinDRZ;
					END_IF
					IF (((locDrehzahl1 + MinderungDRZ) < WLG1SollDRZ) AND
						((locDrehzahl2 + MinderungDRZ) < WLG2SollDRZ)) THEN
						locDrehzahl1 := locDrehzahl1 + MinderungDRZ;
						locDrehzahl2 := locDrehzahl2 + MinderungDRZ;
					ELSE
						locDrehzahl1 := WLG1SollDRZ;
						locDrehzahl2 := WLG2SollDRZ;
					END_IF
					TON_WarmluftSteller.IN 		:= TRUE;
					TON_WarmluftSteller.Zeit 	:= Bezugszeit;
				END_IF
				
				//*** state during ***
				TON_WarmluftSteller.Tick	:= Tick;
				WLG1DRZStell				:= locDrehzahl1;
				WLG2DRZStell				:= locDrehzahl2;
				
				//*** state exit ***
				IF ((locDrehzahl1 >= WLG1SollDRZ) AND (locDrehzahl2 >= WLG2SollDRZ)) THEN
					nextState 				:= 0;
					stateEntry 				:= TRUE;
					TON_WarmluftSteller.IN 	:= FALSE;
					
				ELSIF ((TON_WarmluftSteller.Q = TRUE) AND (IstTemperatur <= GrenzTemperatur)) THEN
					nextState 				:= 1;
					stateEntry 				:= TRUE;
					TON_WarmluftSteller.IN 	:= FALSE;
					
				ELSIF ((TON_WarmluftSteller.Q = TRUE) AND (IstTemperatur > GrenzTemperatur)) THEN
					nextState 				:= 2;
					stateEntry 				:= TRUE;
					TON_WarmluftSteller.IN 	:= FALSE;
					
				ELSE
					nextState := curState;
				END_IF
				
		END_CASE
		
	ELSE
		
		nextState 				:= 0;
		locDrehzahl1 			:= 0.0;
		locDrehzahl2 			:= 0.0;
		WLG1DRZStell 			:= 0.0;
		WLG2DRZStell 			:= 0.0;
		TON_WarmluftSteller.IN 	:= FALSE;
		
	END_IF
	
	TON_WarmluftSteller();
	

END_FUNCTION_BLOCK