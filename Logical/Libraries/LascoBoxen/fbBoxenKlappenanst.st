
(* Funktionsbaustein zur Ansteuerung von Klappen mit nur einem Wechsler-Relais (nicht angesteuert = Richtung A, angesteuert = Richtung B) *)
FUNCTION_BLOCK fbBoxenKlappenanst
	
	IF (NOT Stoerung) THEN
		
		//Fehlerquittierung Laufzeitüberwachung
		IF QuitFehler OR (LaufzeitOeffnen = 0) OR (NOT EndlagenVhd) THEN
			FehlerLaufzeitOeffnen		:= FALSE;
		END_IF
				
		IF QuitFehler OR (LaufzeitSchliessen = 0) OR (NOT EndlagenVhd) THEN
			FehlerLaufzeitSchliessen	:= FALSE;
		END_IF
		
		
		
		CASE step OF
			
			//WARTEN *****************************************************************************
			0:
			
				//*** state entry ***
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE);
					TON_AnzVerz(IN	:= FALSE);
				END_IF
			
				//*** state during ***
				IF QuitFehler OR (LaufzeitOeffnen = 0) OR (NOT EndlagenVhd) THEN
					FehlerLaufzeitOeffnen		:= FALSE;
				END_IF
				
				IF QuitFehler OR (LaufzeitSchliessen = 0) OR (NOT EndlagenVhd) THEN
					FehlerLaufzeitSchliessen	:= FALSE;
				END_IF
				
				
				//*** state exit *** 
				IF EndlagenVhd OR (LaufzeitOeffnen = 0) THEN
					IF Oeffnen AND NOT FehlerLaufzeitOeffnen THEN
						stateEntry	:= TRUE;
						step		:= 1;
					END_IF
				ELSE
					IF Oeffnen AND NOT KlappeIstOffenOut THEN
						stateEntry	:= TRUE;
						step		:= 1;
					END_IF
				END_IF
				
				IF EndlagenVhd OR (LaufzeitSchliessen = 0) THEN
					IF Schliessen AND NOT FehlerLaufzeitSchliessen THEN
						stateEntry	:= TRUE;
						step		:= 2;
					END_IF
				ELSE
					IF Schliessen AND NOT KlappeIstGeschlOut THEN
						stateEntry	:= TRUE;
						step		:= 2;
					END_IF
				END_IF
			
				
			//ÖFFNEN *****************************************************************************
			1:
			
				//*** state entry ***
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE);
					TON_AnzVerz(IN	:= FALSE);
					FehlerLaufzeitOeffnen := FALSE;
					FehlerLaufzeitSchliessen := FALSE;
					SchliessenOut	:= FALSE;
					KlappeIstGeschlOut := FALSE;
					KlappeIstOffenOut := FALSE;
				END_IF
			
				//*** state during ***				
				TON_Laufzeit(IN	:= OeffnenOut AND NOT EndlageOffen, PT:= LaufzeitOeffnen);
				TON_AnzVerz(IN := TRUE, PT := T#40ms); //V2.1.3: 40ms Anzugsverzoegerung - somit ist das andere Relaise sicher abgefallen
				OeffnenOut		:= TON_AnzVerz.Q;
				
				//*** state exit *** 
				IF (NOT Oeffnen) OR Schliessen OR (TON_Laufzeit.Q AND (LaufzeitOeffnen <> 0)) THEN
					IF (TON_Laufzeit.Q AND (LaufzeitOeffnen <> 0) AND NOT EndlagenVhd) THEN
						KlappeIstOffenOut := TRUE;
					ELSIF (TON_Laufzeit.Q AND (LaufzeitOeffnen <> 0)) THEN
						FehlerLaufzeitOeffnen := TRUE;
					END_IF
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
			
				
				//SCHLIESSEN *****************************************************************************
			2:
			
				//*** state entry ***
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE);
					TON_AnzVerz(IN	:= FALSE);
					FehlerLaufzeitOeffnen := FALSE;
					FehlerLaufzeitSchliessen := FALSE;
					OeffnenOut		:= FALSE;
					KlappeIstGeschlOut := FALSE;
					KlappeIstOffenOut := FALSE;
				END_IF
			
				//*** state during ***				
				TON_Laufzeit(IN:= SchliessenOut AND NOT EndlageGeschl, PT:= LaufzeitSchliessen);
				TON_AnzVerz(IN := TRUE, PT := T#40ms); //V2.1.3: 40ms Anzugsverzoegerung - somit ist das andere Relaise sicher abgefallen
				SchliessenOut		:= TON_AnzVerz.Q;
				
				
				//*** state exit *** 
				IF (NOT Schliessen) OR Oeffnen OR (TON_Laufzeit.Q AND (LaufzeitSchliessen <> 0)) THEN
					IF (TON_Laufzeit.Q AND (LaufzeitSchliessen <> 0) AND NOT EndlagenVhd) THEN
						KlappeIstGeschlOut := TRUE;
					ELSIF (TON_Laufzeit.Q AND (LaufzeitSchliessen <> 0)) THEN
						FehlerLaufzeitSchliessen := TRUE;
					END_IF
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
			
				
		END_CASE
		
		
	ELSE
		
		OeffnenOut					:= FALSE;
		SchliessenOut				:= FALSE;
		stateEntry					:= TRUE;
		FehlerLaufzeitOeffnen		:= FALSE;
		FehlerLaufzeitSchliessen	:= FALSE;
		KlappeIstGeschlOut 			:= FALSE;
		KlappeIstOffenOut 			:= FALSE;
		step						:= 0;
		
	END_IF
	

	
END_FUNCTION_BLOCK
