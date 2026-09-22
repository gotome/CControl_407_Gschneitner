
(* Funktionsbaustein zur Ansteuerung Abluftklappe *)
FUNCTION_BLOCK fbBoxenAbluftkl
	
	IF Freigabe THEN
		
		
		CASE step OF
			
			
			//WARTEN ***************************************************************************************
			0:
				
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE, PT:= 0);
				END_IF
				
				IF Quit OR (Laufzeit = 0) THEN
					FehlerLaufzeit	:= FALSE;
				END_IF
				
				IF Automatik THEN
					//Abluft Ist > Soll -> KLAPPE ÖFFNEN
					IF ((AbluftFeuchteIst + Hysterese) >= AbluftFeuchteSoll) AND NOT FehlerLaufzeit AND ((NOT EndlageOffen) OR Laufzeit = 0) THEN
						stateEntry	:= TRUE;
						step		:= 1;
					//Abluft Ist < Soll -> KLAPPE SCHLIESSEN
					ELSIF ((AbluftFeuchteIst - Hysterese) <= AbluftFeuchteSoll) AND NOT FehlerLaufzeit AND ((NOT EndlageGeschl) OR (Laufzeit = 0)) THEN
						stateEntry	:= TRUE;
						step		:= 2;
					ELSE
						step		:= step;
					END_IF
				//Handbetrieb ÖFFNEN
				ELSIF Oeffnen AND ((NOT EndlageOffen) OR (Laufzeit = 0)) THEN
					stateEntry		:= TRUE;
					step			:= 1;
				//Handbetrieb SCHLIESSEN
				ELSIF Schliessen AND ((NOT EndlageGeschl) OR (Laufzeit = 0)) THEN
					stateEntry		:= TRUE;
					step			:= 2;
				END_IF
					
		
					
				
			//ÖFFNEN *****************************************************************************************
			1:
				
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE, PT:= 0);
					SchliessenOut	:= FALSE;
				END_IF
				
				TON_Laufzeit(IN:= OeffnenOut, PT:= Laufzeit);
				

				OeffnenOut		:= TRUE;
				
				
				IF (TON_Laufzeit.Q OR EndlageOffen) AND (Laufzeit <> 0) THEN
					IF TON_Laufzeit.Q THEN
						FehlerLaufzeit	:= TRUE;
					END_IF
					stateEntry		:= TRUE;
					step			:= 0;
				ELSIF ((((AbluftFeuchteIst - Hysterese) <= AbluftFeuchteSoll) AND Automatik) OR (Schliessen AND NOT Automatik)) AND (Laufzeit = 0) THEN
					stateEntry		:= TRUE;
					step			:= 0;
				ELSIF NOT Automatik AND NOT Oeffnen THEN
					stateEntry		:= TRUE;
					step			:= 0;
				END_IF
				
				
				//SCHLIESSEN *****************************************************************************************
			2:
				
				IF stateEntry THEN
					stateEntry		:= FALSE;
					OeffnenOut		:= FALSE;
					TON_Laufzeit(IN	:= FALSE, PT:= 0);
				END_IF
				
				TON_Laufzeit(IN:= SchliessenOut, PT:= Laufzeit);
				
				SchliessenOut	:= TRUE;

				
				IF (TON_Laufzeit.Q OR EndlageGeschl) AND (Laufzeit <> 0) THEN
					IF TON_Laufzeit.Q THEN
						FehlerLaufzeit	:= TRUE;
					END_IF
					stateEntry		:= TRUE;
					step			:= 0;
				ELSIF ((((AbluftFeuchteIst + Hysterese) >= AbluftFeuchteSoll) AND Automatik) OR (Oeffnen AND NOT Automatik)) AND (Laufzeit = 0) THEN
					stateEntry		:= TRUE;
					step			:= 0;
				ELSIF NOT Automatik AND NOT Schliessen THEN
					stateEntry		:= TRUE;
					step			:= 0;
				END_IF
					
		END_CASE	
		
	ELSE
		
		OeffnenOut		:= FALSE;
		SchliessenOut	:= FALSE;
		FehlerLaufzeit	:= FALSE;
		stateEntry		:= TRUE;
		step			:= 0;
		
	END_IF
	
	
	
	
	
END_FUNCTION_BLOCK
