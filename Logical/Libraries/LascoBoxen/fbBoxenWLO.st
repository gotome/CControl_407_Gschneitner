
(* Funktionsbaustein zur Ansteuerung Warmluftofen inkl. Solltemperatur-Vorgabe *)
FUNCTION_BLOCK fbBoxenWLO
	
	//Auskühlzeit Warmluftofen, wenn Option Betriebsmeldung nicht vorhanden
	TOF_Auskuehlzeit(IN:= FreigabeWarmluftofenOut, PT:= Auskuehlzeit);
		
	//Restlaufzeit Auskühlung berechnen (für Visu)
	RestAuskuehlzeit	:= Auskuehlzeit - TIME_TO_UDINT(TOF_Auskuehlzeit.ET);
		
	//Ausgang für Warmluftofen aktiv
	WarmluftofenAktiv	:= (TOF_Auskuehlzeit.Q AND NOT OptionBetriebsmldgVhd) OR (BetriebsmeldungWarmluftofen  AND OptionBetriebsmldgVhd) OR FreigabeWarmluftofenOut;
		
	//Fehlerquittierung
	IF QuitFehler THEN
		FehlerSensorAussenluftOut	:= FALSE;
		FehlerBetriebsmeldungOut	:= FALSE;
	END_IF
	
	
	IF Freigabe THEN
		
		
		CASE step OF
			
			//AUS *********************************************************************************************************************************************************
			0:
				
				IF stateEntry THEN
					stateEntry					:= FALSE;
					FreigabeWarmluftofenOut		:= FALSE;
					WarmlufttempSollOut			:= 0.0;
					TON_VerzBetriebsmeldung(IN	:= FALSE, PT:= 0);
				END_IF
			
				
				//Autmatikbetrieb aktiviert
				IF Automatikbetrieb AND NOT FehlerSensorAussenluftOut AND NOT FehlerBetriebsmeldungOut AND NOT FehlerSensorAussenluft THEN
					stateEntry	:= TRUE;
					step		:= 1;
				ELSIF Dauerbetrieb AND NOT FehlerSensorAussenluftOut AND NOT FehlerBetriebsmeldungOut THEN
					stateEntry	:= TRUE;
					step		:= 2;
				END_IF
			
				
				
				//AUTOMATIKBETRIEB *********************************************************************************************************************************************************
			1:
			
				IF stateEntry THEN
					stateEntry					:= FALSE;
					TON_VerzBetriebsmeldung(IN	:= FALSE, PT:= 0);
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
			
				//Freigabe Warmluftofen
				FreigabeWarmluftofenOut	:= loc_WetterIstSchlecht OR WetterIstSchlecht;
				WarmlufttempSollOut		:= WarmlufttemperaturVorgabe;
				
				//Verzögerung Überwachung Betriebsmeldung (Zündzeit)
				TON_VerzBetriebsmeldung(IN:= FreigabeWarmluftofenOut AND OptionBetriebsmldgVhd AND NOT BetriebsmeldungWarmluftofen, PT:= VerzBetriebsmeldung);
				
			
				//Fehler keine Betriebsmeldung
				IF TON_VerzBetriebsmeldung.Q THEN
					FehlerBetriebsmeldungOut := TRUE;
					stateEntry	:= TRUE;
					step		:= 0;
				//Fehler Sensor Frischluft
				ELSIF FehlerSensorAussenluft THEN
					FehlerSensorAussenluftOut := TRUE;
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
					stateEntry					:= FALSE;
					TON_VerzBetriebsmeldung(IN	:= FALSE, PT:= 0);
				END_IF
			
				//Freigabe Warmluftofen
				FreigabeWarmluftofenOut	:= TRUE;
				WarmlufttempSollOut		:= WarmlufttemperaturVorgabe;
				
				//Verzögerung Überwachung Betriebsmeldung (Zündzeit)
				TON_VerzBetriebsmeldung(IN:= FreigabeWarmluftofenOut AND OptionBetriebsmldgVhd AND NOT BetriebsmeldungWarmluftofen, PT:= VerzBetriebsmeldung);
			
				//Fehler
				IF TON_VerzBetriebsmeldung.Q THEN
					FehlerBetriebsmeldungOut := TRUE;
					stateEntry	:= TRUE;
					step		:= 0;
					//Automatikbetrieb Aktiv
				ELSIF Automatikbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 1;
					//Kein Dauerbetrieb 
				ELSIF NOT Dauerbetrieb THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
			
			
				
		END_CASE
		
		
	ELSE
		
		FreigabeWarmluftofenOut		:= FALSE;
		WarmlufttemperaturVorgabe	:= 0.0;
		step						:= 0;
		stateEntry					:= TRUE;
		FehlerSensorAussenluftOut	:= FALSE;
		FehlerBetriebsmeldungOut	:= FALSE;
		
	END_IF
	
	
	
END_FUNCTION_BLOCK
