
(* Funktionsbaustein zur Ansteuerung von Entfeuchtern (Fremdgeräte) *)
FUNCTION_BLOCK fbEntfFremd
	
	//Ausgang Störung Ein, wenn Störmeldung von Entfeuchter
	TON_Stoerung(IN:= StoerungIn, PT:= parVerzStoerung);
	
	//Störungseingang oder keine Betriebsmeldung Entfeuchter nach Freigabe -> Störung generieren
	IF TON_Stoerung.Q OR TON_VerzBetriebsmeldung.Q THEN
		StoerungOut	:= TRUE;
	END_IF
	
	//Eigenen Fehlerausgang, wenn keine Betriebsmeldung von Entfeuchter (für Alarme)
	IF TON_VerzBetriebsmeldung.Q THEN
		FehlerBetriebsmldg := TRUE;
	END_IF
	
	
	//Störung zurücksetzen, wenn Fehler quittiert
	IF QuitFehler AND NOT StoerungIn THEN
		StoerungOut		:= FALSE;
		FehlerBetriebsmldg := FALSE;
	END_IF
		
		
	
	curStep	:= nextStep;
	
	CASE curStep OF
		
			
		//AUS **************************************************************************************************************************************
		0:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry					:= FALSE;
				FreigabeKompressorOut		:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				TON_VerzBetriebsmeldung(IN:= FALSE, PT:= 0);
			END_IF
			
			//*** state during ***
			//Warten auf Freigabe
			
			
			//*** state exit ***
			//Automatik oder Dauerbetrieb, Sensoren OK, keine Stoerung, Ventilator in Betrieb -> Kompressor Ein
			IF ((Automatik AND WitterungIstSchlecht) OR Dauerbetrieb) AND Freigabe AND BetriebsmldgVentilator AND NOT StoerungOut THEN
				nextStep	:= 1;
				lastStep	:= curStep;
				stateEntry	:= TRUE;
			ELSE
				nextStep	:= curStep;
			END_IF
			

		
			//ENTFEUCHTER EINSCHALTVERZÖGERUNG **************************************************************************************************************************************
		1:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				FreigabeKompressorOut		:= FALSE;
			END_IF
			
			//*** state during ***
				
			//Einschaltverzögerung Kompressor starten
			TON_Kompressor(IN:= TRUE, PT := parEinschaltverzKompressor);
			
			
			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Störung, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> AUS
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT WitterungIstSchlecht AND Automatik) OR (NOT Freigabe) OR
				(StoerungOut) OR (NOT BetriebsmldgVentilator) THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 0;
				//Einschaltverzögerung abgelaufen -> Betrieb
			ELSIF TON_Kompressor.Q THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 2;
			END_IF
				 
				
			
			//ENTFEUCHTER BETRIEB **************************************************************************************************************************************
		2:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				TON_VerzBetriebsmeldung(IN:= FALSE, PT:= 0);
			END_IF
			
			//*** state during ***
			
			//Entfeuchter freigeben
			FreigabeKompressorOut := TRUE;
			
			//Betriebsmeldung Entfeuchter verzögert abfragen
			TON_VerzBetriebsmeldung(IN:= FreigabeKompressorOut AND NOT BetriebsmldgEntfeuchter, PT:= parVerzBetriebEntfeuchter);
			
				
			//*** state exit ***
			//Keine Freigabe, Störung oder keine Betriebsmeldung Ventilator -> AUS
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT Freigabe) OR 
				(NOT WitterungIstSchlecht AND Automatik) OR (StoerungOut) OR (NOT BetriebsmldgVentilator) THEN
				stateEntry := TRUE;
				lastStep := curStep;
				nextStep := 3;
			ELSE
				nextStep := curStep;
			END_IF
			
				
					
					
			//ENTFEUCHTER AUS **************************************************************************************************************************************
		3:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				TON_VerzBetriebsmeldung(IN:= FALSE, PT:= 0);
				FreigabeKompressorOut := FALSE;
			END_IF
	
			//*** state exit ***
			stateEntry := TRUE;
			lastStep := curStep;
			nextStep := 0;
			
		
			
	END_CASE
	
	
	
	
END_FUNCTION_BLOCK
