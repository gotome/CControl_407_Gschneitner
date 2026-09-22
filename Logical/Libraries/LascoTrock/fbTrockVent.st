(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockVent.st
 * Autor: Rudolf Lachner
 * Erstellt: 2. April 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Ansteuerung, Ventilatoren, Luftentfeuchter und Klappen *)
FUNCTION_BLOCK fbTrockVent
	
	IF (Freigabe = TRUE) THEN
		
		curStep	:= nextStep;
		
		CASE curStep OF
			
			
			//******************************************************************************************************************************************************************************************************************
			WARTEN_FBTROCK:
			
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
					FreigabeKlappen		:= FALSE;
					FreigabeLuftentf	:= FALSE;
					FreigabeVent1		:= FALSE;
					FreigabeVent2		:= FALSE;
					SollDrehzVent1		:= 30.0;
					SollDrehzVent2		:= 30.0;
				END_IF
			
				//*** state during ***
				//Warten auf Freigabe ...
				
			
				//*** state exit ***
				IF (Tarifabschaltung) THEN
					stateEntry	:= TRUE;
					nextStep	:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF ((AnfVent1 OR AnfVent2) AND NOT AnfLuftentf) THEN
					stateEntry	:= TRUE;
					nextStep	:= KLAPPEN_ZU_FBTROCK;
				ELSIF ((AnfVent1 OR AnfVent2) AND AnfLuftentf) THEN
					stateEntry	:= TRUE;
					nextStep	:= KLAPPEN_AUF_FBTROCK;
				ELSE
					nextStep	:= curStep;
				END_IF
				
			
			
			
			//******************************************************************************************************************************************************************************************************************
			VENT_EIN_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				//*** state during ***
				TON_AnlaufverzVent2.IN	:= FreigabeVent1;
				TON_AnlaufverzVent2.PT	:= UDINT_TO_TIME(AnlaufverzVent2);
				
				FreigabeVent1			:= TRUE;
				FreigabeVent2			:= AnfVent2 AND (TON_AnlaufverzVent2.Q);
				
				IF (Strombegrenzung AND (DrehzahlVent1Leistung >= DrehzahlBeiStrombegrenzung)) THEN
					SollDrehzVent1			:= DrehzahlBeiStrombegrenzung;
					SollDrehzVent2			:= DrehzahlBeiStrombegrenzung;
				ELSE
					SollDrehzVent1			:= DrehzahlVent1Leistung;
					SollDrehzVent2			:= DrehzahlVent2Leistung;
				END_IF
				
				
				//*** state exit ***
				IF (Tarifabschaltung) THEN
					stateEntry				:= TRUE;
					nextStep				:= TARIFABSCHALTUNG_FBTROCK;
					TON_AnlaufverzVent2.IN	:= FALSE;
				ELSIF (NOT AnfVent1 AND NOT AnfVent2) THEN
					stateEntry				:= TRUE;
					nextStep				:= VENT_AUS_FBTROCK;
					TON_AnlaufverzVent2.IN	:= FALSE;
				ELSIF (AnfLuftentf AND NOT FreigabeLuftentf) THEN
					stateEntry				:= TRUE;
					nextStep				:= KLAPPEN_AUF_FBTROCK;
					TON_AnlaufverzVent2.IN	:= FreigabeVent1;
				ELSIF (FreigabeLuftentf AND NOT AnfLuftentf) THEN
					stateEntry				:= TRUE;
					nextStep				:= LA_AUS_VORBEREITUNG_FBTROCK;
				ELSE
					nextStep				:= curStep;
				END_IF
			
			
			
			
			//******************************************************************************************************************************************************************************************************************
			VENT_AUS_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry 			:= FALSE;
					FreigabeLuftentf	:= FALSE;
				END_IF
			
				// *** State during	***	
				SollDrehzVent1	:= 30.0;
				SollDrehzVent2	:= 30.0;
				
				IF (IstDrehzahlVent1 = SollDrehzVent1) THEN
					FreigabeVent1	:= FALSE;
				END_IF
			
				IF (IstDrehzahlVent2 = SollDrehzVent2) THEN
					FreigabeVent2	:= FALSE;
				END_IF
			
		
				// *** State exit ***
				IF (Tarifabschaltung) THEN
					stateEntry	:= TRUE;
					nextStep	:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (AnfVent1 OR AnfVent2)  THEN
					stateEntry	:= TRUE;
					nextStep	:= WARTEN_FBTROCK;
				ELSIF (FreigabeKlappen AND NOT FreigabeVent1 AND NOT FreigabeVent2) THEN
					stateEntry	:= TRUE;
					nextStep	:= KLAPPEN_ZU_FBTROCK;
				ELSIF (NOT FreigabeVent1 AND NOT FreigabeVent2) THEN
					stateEntry	:= TRUE;
					nextStep	:= WARTEN_FBTROCK;
				ELSE
					nextStep	:= curStep;
				END_IF
			
			
			
			//******************************************************************************************************************************************************************************************************************
			KLAPPEN_AUF_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***	
				SollDrehzVent1	:= 30.0;
				SollDrehzVent2	:= 30.0;
				
				IF (IstDrehzahlVent1 = SollDrehzVent1) THEN
					FreigabeVent1	:= FALSE;
				END_IF
			
				IF (IstDrehzahlVent2 = SollDrehzVent2) THEN
					FreigabeVent2	:= FALSE;
				END_IF
			
				TON_LaufzeitKlappen.IN	:= NOT FreigabeVent1 AND NOT FreigabeVent2;
				TON_LaufzeitKlappen.PT	:= UDINT_TO_TIME(LaufzeitKlappen);
			
				FreigabeKlappen			:= TON_LaufzeitKlappen.IN;
		
			
				// *** State exit ***
				IF (Tarifabschaltung) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (NOT AnfLuftentf) OR (NOT (AnfVent1 OR AnfVent2)) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= KLAPPEN_ZU_FBTROCK;
				ELSIF (TON_LaufzeitKlappen.Q) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= LA_EIN_VORBEREITUNG_FBTROCK;
				ELSE
					nextStep				:= curStep;
				END_IF
			
			
			
			//******************************************************************************************************************************************************************************************************************
			KLAPPEN_ZU_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***	
				SollDrehzVent1	:= 30.0;
				SollDrehzVent2	:= 30.0;
				
				IF (IstDrehzahlVent1 = SollDrehzVent1) THEN
					FreigabeVent1	:= FALSE;
				END_IF
			
				IF (IstDrehzahlVent2 = SollDrehzVent2) THEN
					FreigabeVent2	:= FALSE;
				END_IF
			
				TON_LaufzeitKlappen.IN	:= NOT FreigabeVent1 AND NOT FreigabeVent2;
				TON_LaufzeitKlappen.PT	:= UDINT_TO_TIME(LaufzeitKlappen);
			
				FreigabeKlappen			:= NOT TON_LaufzeitKlappen.IN;
		
			
		
				// *** State exit ***
				IF (Tarifabschaltung) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (AnfLuftentf) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= KLAPPEN_AUF_FBTROCK;
				ELSIF (TON_LaufzeitKlappen.Q) AND (AnfVent1 OR AnfVent2) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= VENT_EIN_FBTROCK;
				ELSIF (TON_LaufzeitKlappen.Q AND NOT AnfVent1 AND NOT AnfVent2) THEN
					stateEntry				:= TRUE;
					TON_LaufzeitKlappen.IN	:= FALSE;
					nextStep				:= WARTEN_FBTROCK;
				ELSE
					nextStep				:= curStep;
				END_IF
			
			//******************************************************************************************************************************************************************************************************************
			LA_EIN_VORBEREITUNG_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***	
				TON_AnlaufverzVent2.IN		:= FreigabeVent1;
				TON_AnlaufverzVent2.PT		:= UDINT_TO_TIME(AnlaufverzVent2);
			
				TON_LuftentfVorbereitung.IN	:= FreigabeVent1;
				TON_LuftentfVorbereitung.PT	:= UDINT_TO_TIME(EinschaltverzLuftentf);
				
				FreigabeVent1			:= TRUE;
				FreigabeVent2			:= AnfVent2 AND (TON_AnlaufverzVent2.Q);
			
				
				IF (Strombegrenzung AND (DrehzahlVent1Leistung >= DrehzahlBeiStrombegrenzung)) THEN
					SollDrehzVent1			:= DrehzahlBeiStrombegrenzung;
					SollDrehzVent2			:= DrehzahlBeiStrombegrenzung;
				ELSE
					SollDrehzVent1			:= DrehzahlVent1Leistung;
					SollDrehzVent2			:= DrehzahlVent2Leistung;
				END_IF
			
		
				// *** State exit ***
				IF (Tarifabschaltung) THEN
					stateEntry					:= TRUE;
					TON_LuftentfVorbereitung.IN	:= FALSE;
					nextStep					:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (NOT AnfLuftentf) THEN
					stateEntry					:= TRUE;
					TON_LuftentfVorbereitung.IN	:= FALSE;
					nextStep					:= KLAPPEN_ZU_FBTROCK;
				ELSIF (TON_LuftentfVorbereitung.Q) THEN
					stateEntry					:= TRUE;
					TON_LuftentfVorbereitung.IN	:= FALSE;
					nextStep					:= LA_EIN_FBTROCK;
				ELSE
					nextStep	:= curStep;
				END_IF
		
			
			
			//******************************************************************************************************************************************************************************************************************
			LA_EIN_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***	
				FreigabeLuftentf	:= TRUE;
			

				// *** State exit ***
				nextStep			:= VENT_EIN_FBTROCK;
			
			
			
			//******************************************************************************************************************************************************************************************************************
			LA_AUS_VORBEREITUNG_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***	
				TON_AuslaufzeitLuftentf.IN	:= NOT KeineKlappenAmLuftentf;
				TON_AuslaufzeitLuftentf.PT	:= UDINT_TO_TIME(AuslaufzeitLuftentfeuchter);
		
				FreigabeLuftentf			:= FALSE;
			
				IF (Strombegrenzung AND (DrehzahlVent1Leistung >= DrehzahlBeiStrombegrenzung)) THEN
					SollDrehzVent1			:= DrehzahlBeiStrombegrenzung;
					SollDrehzVent2			:= DrehzahlBeiStrombegrenzung;
				ELSE
					SollDrehzVent1			:= DrehzahlVent1Leistung;
					SollDrehzVent2			:= DrehzahlVent2Leistung;
				END_IF 
		
				// *** State exit ***
				IF (Tarifabschaltung AND NOT BetriebsmldgLuftentf) THEN
					stateEntry					:= TRUE;
					TON_AuslaufzeitLuftentf.IN	:= FALSE;
					nextStep					:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (NOT AnfVent1 AND NOT AnfVent2 AND NOT BetriebsmldgLuftentf) THEN
					stateEntry					:= TRUE;
					TON_AuslaufzeitLuftentf.IN	:= FALSE;
					nextStep					:= VENT_AUS_FBTROCK;
				ELSIF (AnfLuftentf) THEN
					stateEntry					:= TRUE;
					TON_AuslaufzeitLuftentf.IN	:= FALSE;
					nextStep					:= LA_EIN_FBTROCK;
				ELSIF ((TON_AuslaufzeitLuftentf.Q OR KeineKlappenAmLuftentf) AND NOT BetriebsmldgLuftentf) THEN
					stateEntry					:= TRUE;
					TON_AuslaufzeitLuftentf.IN	:= FALSE;
					nextStep					:= MESSUNG_FBTROCK;
				ELSE
					nextStep					:= curStep;
				END_IF
			
			//******************************************************************************************************************************************************************************************************************
			MESSUNG_FBTROCK:
				
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***
				TON_AnlaufverzVent2.IN	:= FreigabeVent1;
				TON_AnlaufverzVent2.PT	:= UDINT_TO_TIME(AnlaufverzVent2);
			
				FreigabeVent1			:= TRUE;
				FreigabeVent2			:= AnfVent2 AND (TON_AnlaufverzVent2.Q);
			
				
				IF (Strombegrenzung AND (DrehzahlVent1Leistung >= DrehzahlBeiStrombegrenzung)) THEN
					SollDrehzVent1			:= DrehzahlBeiStrombegrenzung;
					SollDrehzVent2			:= DrehzahlBeiStrombegrenzung;
				ELSE
					SollDrehzVent1			:= DrehzahlVent1Max;
					IF (IstDrehzahlVent1 = SollDrehzVent1) THEN
						SollDrehzVent2			:= DrehzahlVent2Max;
					END_IF
				END_IF
			
				TON_Messung.IN		:= (IstDrehzahlVent1 = DrehzahlVent1Max) AND ((IstDrehzahlVent2 = DrehzahlVent2Max) OR (NOT AnfVent2));
				TON_Messung.PT		:= UDINT_TO_TIME(MessdauerLuftgeschw);
				MessungAktiv		:= TON_Messung.IN;
		
 		
				// *** State exit ***
				IF (Tarifabschaltung) THEN
					stateEntry					:= TRUE;
					MessungAktiv				:= FALSE;
					TON_Messung.IN				:= FALSE;
					TON_AnlaufverzVent2.IN		:= FALSE;
					nextStep					:= TARIFABSCHALTUNG_FBTROCK;
				ELSIF (NOT AnfVent1 AND NOT AnfVent2) THEN
					stateEntry					:= TRUE;
					MessungAktiv				:= FALSE;
					TON_Messung.IN				:= FALSE;
					TON_AnlaufverzVent2.IN		:= FALSE;
					nextStep					:= VENT_AUS_FBTROCK;
				ELSIF (TON_Messung.Q OR Strombegrenzung OR KeineKlappenAmLuftentf) THEN
					IF (NOT Strombegrenzung) THEN
						IF (AnfVent1 AND NOT AnfVent2) AND TON_Messung.Q THEN
							LuftgeschwBeiMaxDrehzahl1Vent	:= Mittelwertbildung.y;
						ELSIF (TON_Messung.Q) THEN
							LuftgeschwBeiMaxDrehzahl2Vent	:= Mittelwertbildung.y;
						END_IF
					END_IF
					stateEntry					:= TRUE;
					MessungAktiv				:= FALSE;
					TON_Messung.IN				:= FALSE;
					TON_AnlaufverzVent2.IN		:= FALSE;
					nextStep					:= KLAPPEN_ZU_FBTROCK;
				ELSIF (AnfLuftentf) THEN
					stateEntry					:= TRUE;
					MessungAktiv				:= FALSE;
					TON_Messung.IN				:= FALSE;
					TON_AnlaufverzVent2.IN		:= FALSE;
					nextStep					:= LA_EIN_FBTROCK;
				ELSE
					nextStep					:= curStep;
				END_IF
			
			
			
			//******************************************************************************************************************************************************************************************************************
			TARIFABSCHALTUNG_FBTROCK:
					
				//*** state entry ***
				IF (stateEntry) THEN
					stateEntry := FALSE;
				END_IF
			
				// *** State during	***
				SollDrehzVent1	:= 30.0;
				SollDrehzVent2	:= 30.0;
			
				FreigabeLuftentf		:= FALSE;
				
				IF (IstDrehzahlVent1 = SollDrehzVent1) THEN
					FreigabeVent1		:= FALSE;
				END_IF
			
				IF (IstDrehzahlVent2 = SollDrehzVent2) THEN
					FreigabeVent2		:= FALSE;
				END_IF
			
				FreigabeKlappen			:= FreigabeVent1 OR FreigabeVent2;
				
			
				// *** State exit ***
				IF (NOT Tarifabschaltung) THEN
					stateEntry	:= TRUE;
					nextStep	:= WARTEN_FBTROCK;
				ELSE
					nextStep	:= curStep;
				END_IF
			
		END_CASE
		
		//Mittelwert Luftmenge berechnen
		IF (sekTick AND MessungAktiv) THEN
			Mittelwertbildung.enable	:= MessungAktiv;
			Mittelwertbildung.x			:= LuftgeschwAktuell;
			Mittelwertbildung.base		:= 30;
			Mittelwertbildung();
		END_IF				
		
		//Funktionsblöcke aufrufen
		TON_AnlaufverzVent2();
		TON_AuslaufzeitLuftentf();
		TON_LaufzeitKlappen();
		TON_LuftentfVorbereitung();
		TON_Messung();

	ELSE
		
		
		FreigabeKlappen				:= FALSE;
		FreigabeLuftentf			:= FALSE;
		FreigabeVent1				:= FALSE;
		FreigabeVent2				:= FALSE;
		MessungAktiv				:= FALSE;
		SollDrehzVent1				:= 0.0;
		SollDrehzVent2				:= 0.0;
		TON_AnlaufverzVent2.IN		:= FALSE;
		TON_AuslaufzeitLuftentf.IN	:= FALSE;
		TON_LaufzeitKlappen.IN		:= FALSE;
		TON_Messung.IN				:= FALSE;
		TON_LuftentfVorbereitung.IN	:= FALSE;
		curStep						:= WARTEN_FBTROCK;
		nextStep					:= WARTEN_FBTROCK;
		
	END_IF

END_FUNCTION_BLOCK