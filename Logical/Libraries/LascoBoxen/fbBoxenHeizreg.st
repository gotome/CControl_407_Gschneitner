
(* Funktionsbaustein zur Ansteuerung eines Heizregisters inkl. Drehzahlvorgabe Heizungspumpe *)
FUNCTION_BLOCK fbBoxenHeizreg
	
	IF Freigabe THEN
		
		//Fehlerquittierung
		IF QuitFehler THEN
			FehlerOut	:= FALSE;
		END_IF
		
		
		
		CASE step OF
			
			//AUS *********************************************************************************************************************************************************
			0:
				
				IF stateEntry THEN
					stateEntry					:= FALSE;
					FreigabeHeizregisterOut		:= FALSE;
					DrehzahlHeizregisterOut		:= 0.0;
				END_IF
			
				
				//Autmatikbetrieb aktiviert
				IF Automatikbetrieb AND NOT FehlerOut AND NOT FehlerSensorAussenluft THEN
					stateEntry	:= TRUE;
					step		:= 1;
				ELSIF Dauerbetrieb AND NOT FehlerOut THEN
					stateEntry	:= TRUE;
					step		:= 2;
				END_IF
			
				
				
			//AUTOMATIKBETRIEB *********************************************************************************************************************************************************
			1:
			
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
			
				//Bei Neustart (Wetter nicht gut oder schlecht) ohne Verzögerung umschalten
				IF NOT loc_WetterIstSchlecht AND NOT loc_WetterIstGut THEN
					IF (FrischluftSattDefizitIst < FrischluftSattDefizitSoll) THEN
						loc_WetterIstSchlecht	:= TRUE;
					ELSIF (FrischluftSattDefizitIst >= FrischluftSattDefizitSoll) THEN
						loc_WetterIstGut	:= TRUE;
					END_IF
				END_IF
			
				//Umschaltverzögerung gutes Wetter/ schlechtes Wetter
				TON_WetterIstGut(IN:= loc_WetterIstSchlecht AND (FrischluftSattDefizitIst >= (FrischluftSattDefizitSoll + Hysterese)), PT:= UmschaltverzWitterung);
				TON_WetterIstSchlecht(IN:= loc_WetterIstGut AND (FrischluftSattDefizitIst < (FrischluftSattDefizitSoll - Hysterese)), PT:= UmschaltverzWitterung);
			
				IF EDGEPOS(TON_WetterIstGut.Q) THEN
					loc_WetterIstGut		:= TRUE;
					loc_WetterIstSchlecht	:= FALSE;
				ELSIF EDGEPOS(TON_WetterIstSchlecht.Q) THEN
					loc_WetterIstGut		:= FALSE;
					loc_WetterIstSchlecht	:= TRUE;
				END_IF
			
				//Freigabe Heizregister
				FreigabeHeizregisterOut		:= loc_WetterIstSchlecht OR WetterIstSchlecht;
				DrehzahlHeizregisterOut		:= DrehzahlHeizregisterSoll;
				
			
				//Fehler
				IF FehlerSensorAussenluft THEN
					FehlerOut	:= TRUE;
					stateEntry	:= TRUE;
					step		:= 0;
				//Dauerbetrieb Aktiv
				ELSIF Dauerbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 2;
					//Kein Automatikbetrieb 
				ELSIF NOT Automatikbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
				
	
				//DAUERBETRIEB *********************************************************************************************************************************************************
			2:
			
				IF stateEntry THEN
					stateEntry		:= FALSE;
				END_IF
			
				//Freigabe Heizregister
				FreigabeHeizregisterOut		:= TRUE;
				DrehzahlHeizregisterOut		:= DrehzahlHeizregisterSoll;
				
			
				//Automatikbetrieb Aktiv
				IF Automatikbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 1;
				//Kein Dauerbetrieb 
				ELSIF NOT Dauerbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
			
			
				
		END_CASE
		
		
	ELSE
		
		FreigabeHeizregisterOut		:= FALSE;
		DrehzahlHeizregisterOut		:= 0.0;
		step						:= 0;
		stateEntry					:= TRUE;
		FehlerOut					:= FALSE;
		
	END_IF
	
	
	
END_FUNCTION_BLOCK
