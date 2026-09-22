
(* Ansteuerung Kompressor *)
FUNCTION_BLOCK fbEntfKompressor

	
	//Zeitticks erzeugen
	fbLascoEUhr_0(Freigabe := TRUE);
	fbLascoZdxx_0(IN := fbLascoEUhr_0.Sekunde);
	sekTick	:= fbLascoZdxx_0.Q;
		
	//Ausgang Störung Ein, wenn Sicherheitskreis nicht ok
	IF NOT SicherheitOk OR (fbFuKompressor.StoerungFU) THEN
		StoerungOut	:= TRUE;
	END_IF
	
	
	//Störung Laufzeit Pumpdown zurücksetzen, wenn Fehler quittiert
	IF QuitFehler THEN
		FehlerPumpdown	:= FALSE;
		StoerungOut		:= FALSE;
	END_IF

	//Funktionsbaustein FU Kompressor
	fbFuKompressor.AnsprechZeitFU	:= 5;
	fbFuKompressor.BetrMldg			:= BetriebsmldgKompressor;
	fbFuKompressor.MinDrehzahl		:= 0.0;
	fbFuKompressor.MaxDrehzahl		:= DrehzahlMax;
	fbFuKompressor.RampeUpSek		:= RampeUp;
	fbFuKompressor.RampeDownSek		:= RampeDown;
	fbFuKompressor.Reset			:= QuitFehler;
	fbFuKompressor.Tick				:= sekTick;
	fbFuKompressor();
	FreigabeKompressorOut			:= fbFuKompressor.BetriebFU;
	DrehzahlOut						:= fbFuKompressor.DrehzahlFU;
		
	//Schaltpunkte für Eintritt Feuchte generieren
	IF NOT Dauerbetrieb AND NOT Automatik THEN
		loc_StatusFeuchteOk := FALSE;
	ELSIF Dauerbetrieb THEN
		loc_StatusFeuchteOk	:= TRUE;
	ELSIF (EintrittFeuchte <= parFeuchteAus) AND loc_StatusFeuchteOk THEN
		loc_StatusFeuchteOk	:= FALSE;
	ELSIF (EintrittFeuchte >= parFeuchteEin) AND NOT loc_StatusFeuchteOk THEN
		loc_StatusFeuchteOk	:= TRUE;
	END_IF
		
	
	curStep	:= nextStep;
	
	CASE curStep OF
		
			
		//AUS **************************************************************************************************************************************
		0:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry					:= FALSE;
				fbFuKompressor.Freigabe		:= FALSE;
				fbFuKompressor.SollDrehzahl	:= 0.0;
				TON_EinschaltverzMagnetventil(IN:= FALSE, PT:= 0);
				TON_Kompressor(IN:= FALSE, PT:= 0);
				TON_Abtau(IN:= FALSE, PT:= 0);
				AbtauungAktiv				:= FALSE;
				MagnetventilOut				:= FALSE;
			END_IF
			
			//*** state during ***
			//Warten auf Freigabe
			
			
			//*** state exit ***
			//Automatik oder Dauerbetrieb, Sensoren OK, Sicherheitskreis geschlossen, Ventilator in Betrieb -> Kompressor Ein
			IF ((Automatik AND StatusSensorEintrittOk) OR Dauerbetrieb) AND Freigabe AND StatusSensorNiederdruckOk AND loc_StatusFeuchteOk
				AND SicherheitOk AND BetriebsmldgVentilator AND diHochdruckOk AND diNiederdruckOk THEN
				nextStep	:= 1;
				lastStep	:= curStep;
				stateEntry	:= TRUE;
			ELSE
				nextStep	:= curStep;
			END_IF
			

		
		//KOMPRESSOR EIN **************************************************************************************************************************************
		1:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				fbFuKompressor.Freigabe		:= FALSE;
				fbFuKompressor.SollDrehzahl	:= 0.0;
				MagnetventilOut				:= FALSE;
				AbtauungAktiv				:= FALSE;
			END_IF
			
			//*** state during ***
				
			//Einschaltverzögerung Kompressor starten
			TON_Kompressor(IN:= TRUE, PT := parEinschaltverzKompressor);
				
			fbFuKompressor.Freigabe		:= TON_Kompressor.Q;
			fbFuKompressor.SollDrehzahl	:= DrehzahlvorgabeFU;
			

			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Sicherheit nicht ok, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> AUS
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT StatusSensorEintrittOk AND Automatik) OR (NOT Freigabe) OR
				(NOT StatusSensorNiederdruckOk) OR (NOT SicherheitOk) OR (NOT BetriebsmldgVentilator) OR (NOT loc_StatusFeuchteOk) OR (NOT diHochdruckOk) OR (NOT diNiederdruckOk) THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 0;
			//Kompressor läuft -> Magnetventil Ein
			ELSIF fbFuKompressor.Freigabe THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 2;
			END_IF
				 
				
			
		//MAGNETVENTIL EIN **************************************************************************************************************************************
		2:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry	:= FALSE;
				TON_Kompressor(IN:= FALSE, PT:= 0);
				TON_EinschaltverzMagnetventil(IN:= FALSE, PT:= 0);
				MagnetventilOut				:= FALSE;
			END_IF
			
			//*** state during ***
				
			//Einschaltverzögerung Magnetventil
			TON_EinschaltverzMagnetventil(IN:= TRUE, PT:= parEinschaltverzMagnetventil);
			MagnetventilOut	:= (TON_EinschaltverzMagnetventil.Q) OR (parEinschaltverzMagnetventil = 0);
				
	
			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Sicherheit nicht ok, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> Magnetventil Aus
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT StatusSensorEintrittOk AND Automatik) OR (NOT Freigabe) OR
				(NOT StatusSensorNiederdruckOk) OR (NOT SicherheitOk) OR (NOT BetriebsmldgVentilator) OR (NOT diHochdruckOk) OR (NOT diNiederdruckOk)  THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				IF MagnetventilOut THEN
					nextStep	:= 4;
				ELSE
					nextStep	:= 0;
				END_IF
			//Magnetventil Ein -> Betrieb
			ELSIF MagnetventilOut THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 3;
			END_IF
				
					
					
		//BETRIEB **************************************************************************************************************************************
		3:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Abtau(IN:= FALSE, PT:= 0);
				AbtauungAktiv	:= FALSE;
				TON_Klappenumschaltung(IN:= FALSE, PT:= 0);
			END_IF
			
			//*** state during ***
			//Kompressor Drehzahlvorgabe
			fbFuKompressor.SollDrehzahl	:= DrehzahlvorgabeFU;
				
			//Verzöguerung Abtauung starten, wenn Niederdruck unter Min.
			TON_Abtau(IN:= (Niederdruck <= parNiederdruckMin), PT:= parEinschaltverzAbtau);
			
			//Wenn Hochdruck Max. überschritten & Klappenumschaltung aktiv -> Verzögerung starten für Standby
			TON_Klappenumschaltung(IN:= (Hochdruck > parHochdruckMax) AND KlappenumschaltungAkiv, PT:= parVerzStandbyBeiKlappenumsch);
				
			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Sicherheit nicht ok, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> Magnetventil Aus
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT StatusSensorEintrittOk AND Automatik) OR (NOT Freigabe) OR
				(NOT StatusSensorNiederdruckOk) OR (NOT SicherheitOk) OR (NOT BetriebsmldgVentilator) OR (NOT loc_StatusFeuchteOk) OR (NOT diHochdruckOk) OR (NOT diNiederdruckOk) THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 4;
			//Abtauung angesprochen -> Abtauung
			ELSIF TON_Abtau.Q THEN
				stateEntry		:= TRUE;
				AbtauungAktiv	:= TRUE;
				nextStep		:= 6;
				lastStep		:= curStep;	
			//Hochdruck Max. während Klappenumschaltung überschritten -> Standby
			ELSIF TON_Klappenumschaltung.Q THEN
				stateEntry		:= TRUE;
				nextStep		:= 7;
				lastStep		:= curStep;	
			ELSE
				nextStep		:= curStep;
			END_IF
			
			
		//MAGNETVENTIL AUS **************************************************************************************************************************************
		4:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Abtau(IN	:= FALSE, PT:= 0);
				AbtauungAktiv	:= FALSE;
				MagnetventilOut	:= FALSE;
				fbFuKompressor.SollDrehzahl	:= DrehzahlMin;
				TON_LaufzeitPumpdown(IN:= FALSE, PT:= 0);
			END_IF
			
			//*** state during ***
			
			//Laufzeit Pumpdown überwachen
			TON_LaufzeitPumpdown(IN:= TRUE, PT:= T#5m);
			
			
			//*** state exit ***
			//Automatik oder Dauerbetrieb, Sensoren und Sicherheit ok, Ventilator in Betrieb -> Betrieb
			IF ((Automatik AND StatusSensorEintrittOk) OR Dauerbetrieb) AND StatusSensorNiederdruckOk AND SicherheitOk AND Freigabe AND 
				BetriebsmldgVentilator AND loc_StatusFeuchteOk THEN
				MagnetventilOut	:= TRUE;
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 3;
			//Niederdruck < Pumpdown -> Kompressor Aus
			ELSIF (Niederdruck < parNiederdruckPumpdown) OR (NOT StatusSensorNiederdruckOk) OR fbFuKompressor.StoerungFU OR TON_LaufzeitPumpdown.Q OR (NOT diNiederdruckOk) OR (NOT diHochdruckOk) THEN
				stateEntry		:= TRUE;
				IF TON_LaufzeitPumpdown.Q THEN
					FehlerPumpdown	:= TRUE;
				END_IF
				TON_LaufzeitPumpdown(IN:= FALSE, PT:= 0);
				nextStep		:= 5;
				lastStep		:= curStep;
			ELSE
				nextStep		:= curStep;
			END_IF
			
				
		//KOMPRESSOR AUS **************************************************************************************************************************************
		5:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Abtau(IN:= FALSE, PT:= 0);
				AbtauungAktiv	:= FALSE;
			END_IF
			
			
			//*** state during ***
			fbFuKompressor.Freigabe		:= FALSE;
			fbFuKompressor.SollDrehzahl	:= 0.0;
			
			
			//*** state exit ***
			//Kompressor Aus -> STILLSTAND
			stateEntry	:= TRUE;
			lastStep	:= curStep;
			nextStep	:= 0;
			
				
		//ABTAUUNG **************************************************************************************************************************************
		6:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Abtau(IN:= FALSE, PT:= 0);
				AbtauungAktiv	:= TRUE;
				fbFuKompressor.SollDrehzahl	:= 0.0;
				MagnetventilOut	:= FALSE;
			END_IF
			
			//*** state during ***
			IF fbFuKompressor.DrehzahlFU = 0.0 THEN
				fbFuKompressor.Freigabe	:= FALSE;
			END_IF
			
			//Verzögerung Abtauung starten, wenn Niederdruck wieder über Min.
			TON_Abtau(IN:= (Niederdruck >= parNiederdruckMax), PT:= parAusschaltverzAbtau);

			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Sicherheit nicht ok, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> Stillstand
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT StatusSensorEintrittOk AND Automatik) OR (NOT Freigabe) OR
				(NOT StatusSensorNiederdruckOk) OR (NOT SicherheitOk) OR (NOT BetriebsmldgVentilator) OR (NOT loc_StatusFeuchteOk) OR (NOT diHochdruckOk) OR (NOT diNiederdruckOk) THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 0;
			//Abtauung ok -> Kompressor Ein
			ELSIF TON_Abtau.Q THEN
				stateEntry	:= TRUE;
				lastStep	:= curStep;
				nextStep	:= 1;
			END_IF
			
		
		//STANDBY KLAPPENUMSCHALTUNG **************************************************************************************************************************************
		7:
			
			//*** state entry ***
			IF stateEntry THEN
				stateEntry		:= FALSE;
				TON_Klappenumschaltung(IN:= FALSE, PT:= 0);
				StandbyKlappenumsch	:= TRUE;
				fbFuKompressor.SollDrehzahl	:= 0.0;
				MagnetventilOut	:= FALSE;
			END_IF
			
			//*** state during ***
			IF fbFuKompressor.DrehzahlFU = 0.0 THEN
				fbFuKompressor.Freigabe	:= FALSE;
			END_IF
			
			//Verzögerung Ende Standby, wenn Klappenumschaltung abgeschlossen
			TON_Klappenumschaltung(IN:= NOT KlappenumschaltungAkiv, PT:= parVerzStandbyBeiKlappenumsch);

			//*** state exit ***
			//Keine Automatik und kein Dauerbetrieb, Sicherheit nicht ok, keine Betriebsmeldung Ventilator
			//oder Status Sensoren nicht ok -> Stillstand
			IF (NOT Automatik AND NOT Dauerbetrieb) OR (NOT StatusSensorEintrittOk AND Automatik) OR (NOT Freigabe) OR
				(NOT StatusSensorNiederdruckOk) OR (NOT SicherheitOk) OR (NOT BetriebsmldgVentilator) OR (NOT loc_StatusFeuchteOk) OR (NOT diHochdruckOk) OR (NOT diNiederdruckOk) THEN
				stateEntry	:= TRUE;
				StandbyKlappenumsch	:= FALSE;
				lastStep	:= curStep;
				nextStep	:= 0;
			//Klappenumschaltung abgeschlossen -> Kompressor Ein
			ELSIF TON_Klappenumschaltung.Q THEN
				stateEntry	:= TRUE;
				StandbyKlappenumsch	:= FALSE;
				lastStep	:= curStep;
				nextStep	:= 1;
			END_IF
		
			
	END_CASE
		
END_FUNCTION_BLOCK
