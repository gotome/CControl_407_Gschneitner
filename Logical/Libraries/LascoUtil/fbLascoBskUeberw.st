(********************************************************************
 * COPYRIGHT -- Lasco Heutechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoBskUeberw.st
 * Autor: Rudolf Lachner
 * Erstellt: 20. Juli 2017
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung Brandschutzklappe mit Laufzeitüberwachung und Freiräumung *)
FUNCTION_BLOCK fbLascoBskUeberw
	
	//Freigabe
	IF Freigabe THEN
		
		
		curStep	:= nextStep;
	

		//Schrittschaltwerk Überwachung Brandschutzklappe
		//***********************************************
		
		CASE curStep OF
		
		
			//*************************************************************************************************************************************************************************************************************************************
			BSK_WARTEN: 
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
					TON_Laufzeit(IN	:= FALSE, PT := T#0s);
				END_IF
		
		
		
				//*** state during ***
				//Warten auf Anforderung öffnen oder schließen
		
				//Fehlerquittierung
				IF Quit THEN
					ctVersucheAuf	:= 0;
					ctVersucheZu	:= 0;
				END_IF
				
		
				//*** state exit ***
				//Anforderung Öffnen
				IF FreigabeOeffnen AND NOT loc_KlappeIstOffen THEN
					stateEntry			:= TRUE;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
					lastStep			:= curStep;
					nextStep			:= BSK_OEFFNEN;
				//Anforderung Schließen
				ELSIF FreigabeSchliessen AND NOT loc_KlappeIstGeschlossen THEN
					stateEntry			:= TRUE;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
					lastStep			:= curStep;
					nextStep			:= BSK_SCHLIESSEN;
				END_IF
				
			
			//*************************************************************************************************************************************************************************************************************************************
			BSK_OEFFNEN:
		
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry					:= FALSE;
					TON_Laufzeit(IN				:= FALSE, PT := T#0s);
					loc_KlappeIstGeschlossen	:= FALSE;
					loc_KlappeIstOffen			:= FALSE;
					doKlappeOeffnen				:= TRUE;
				END_IF
			
				//*** state during ***
			
				//Laufzeit überwachen
				TON_Laufzeit(IN:= TRUE, PT := LaufzeitAuf);
		
		
				//*** state exit ***
			
				//Klappe ist offen
				IF diKlappeGeoeffnet AND NOT TON_Laufzeit.Q THEN
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
					ctVersucheAuf		:= 0;
					stateEntry			:= TRUE;
					lastStep			:= curStep;
					nextStep			:= BSK_WARTEN;
					loc_KlappeIstOffen	:= TRUE;
					
				//Laufzeitüberwachung ausggelöst
				ELSIF TON_Laufzeit.Q THEN 
					//Max. Versuche überschritten -> Fehler
					IF ctVersucheAuf >= MaxVersucheAuf THEN
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheAuf		:= 0;
						lastStep			:= curStep;
						doKlappeOeffnen		:= FALSE;
						nextStep			:= BSK_STOERUNG;
					//Nächsten Versuch starten
					ELSE
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheAuf		:= ctVersucheAuf + 1;
						lastStep			:= curStep;
						doKlappeOeffnen		:= FALSE;
						nextStep			:= BSK_OEFFNEN_FEHLER;
					END_IF
				//Keine Anforderung
				ELSIF NOT FreigabeOeffnen THEN
					TON_Laufzeit(IN			:= FALSE, PT := T#0s);
					ctVersucheAuf			:= 0;
					stateEntry				:= TRUE;
					lastStep				:= curStep;
					nextStep				:= BSK_WARTEN;
				END_IF
		
				
		
			//*************************************************************************************************************************************************************************************************************************************
			BSK_OEFFNEN_FEHLER:
		
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry			:= FALSE;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
				END_IF
		
		
		
				//*** state during ***
			
				//Laufzeit überwachen
				TON_Laufzeit(IN:= TRUE, PT := LaufzeitZu);
		
		
				//*** state exit ***	
				//Klappe geschlossen -> Versuch öffnen
				IF diKlappeGeschlossen AND FreigabeOeffnen THEN
					stateEntry			:= TRUE;
					ctVersucheZu		:= 0;
					lastStep			:= curStep;
					nextStep			:= BSK_OEFFNEN;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
				//Laufzeit überschritten
				ELSIF TON_Laufzeit.Q THEN
					//Max. Versuche überschritten -> Fehler
					IF ctVersucheZu >= MaxVersucheZu THEN
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheZu		:= 0;
						lastStep			:= curStep;
						doKlappeOeffnen		:= FALSE;
						nextStep			:= BSK_STOERUNG;
					//Nächsten Versuch starten
					ELSE
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheZu		:= ctVersucheZu + 1;
						lastStep			:= curStep;
						nextStep			:= BSK_OEFFNEN;
					END_IF
				//Keine Freigabe Öffnen
				ELSIF NOT FreigabeOeffnen THEN
					stateEntry				:= TRUE;
					TON_Laufzeit(IN			:= FALSE, PT := T#0s);
					lastStep				:= curStep;
					ctVersucheAuf			:= 0;
					nextStep				:= BSK_WARTEN;
				END_IF
		
		
			//*************************************************************************************************************************************************************************************************************************************
			BSK_SCHLIESSEN:
		
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry					:= FALSE;
					TON_Laufzeit(IN				:= FALSE, PT := T#0s);
					loc_KlappeIstGeschlossen	:= FALSE;
					loc_KlappeIstOffen			:= FALSE;
					doKlappeOeffnen				:= FALSE;
				END_IF
			
				//*** state during ***
			
				//Laufzeit überwachen
				TON_Laufzeit(IN:= TRUE, PT := LaufzeitZu);
		
		
				//*** state exit ***
			
				//Klappe ist geschlossen
				IF diKlappeGeschlossen AND NOT TON_Laufzeit.Q THEN
					TON_Laufzeit(IN				:= FALSE, PT := T#0s);
					ctVersucheZu				:= 0;
					stateEntry					:= TRUE;
					lastStep					:= curStep;
					nextStep					:= BSK_WARTEN;
					loc_KlappeIstGeschlossen	:= TRUE;
					
					//Laufzeitüberwachung ausgelöst
				ELSIF TON_Laufzeit.Q THEN 
					//Max. Versuche überschritten -> Fehler
					IF ctVersucheZu >= MaxVersucheZu THEN
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheZu		:= 0;
						lastStep			:= curStep;
						doKlappeOeffnen		:= FALSE;
						nextStep			:= BSK_STOERUNG;
					//Nächsten Versuch starten
					ELSE
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheZu		:= ctVersucheZu + 1;
						lastStep			:= curStep;
						nextStep			:= BSK_SCHLIESSEN_FEHLER;
					END_IF
				//Anforderung Oeffnen
				ELSIF  FreigabeOeffnen THEN
					TON_Laufzeit(IN			:= FALSE, PT := T#0s);
					ctVersucheZu			:= 0;
					stateEntry				:= TRUE;
					lastStep				:= curStep;
					nextStep				:= BSK_WARTEN;
				END_IF
		
				

			
			//*************************************************************************************************************************************************************************************************************************************
			BSK_SCHLIESSEN_FEHLER:
		
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry			:= FALSE;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
					doKlappeOeffnen		:= TRUE;
				END_IF
		
		
		
				//*** state during ***
			
				//Laufzeit überwachen
				TON_Laufzeit(IN:= TRUE, PT := LaufzeitAuf);
		
		
				//*** state exit ***	
				//Klappe offen -> Versuch schließen
				IF diKlappeGeoeffnet AND FreigabeSchliessen THEN
					stateEntry			:= TRUE;
					ctVersucheAuf		:= 0;
					lastStep			:= curStep;
					nextStep			:= BSK_SCHLIESSEN;
					TON_Laufzeit(IN		:= FALSE, PT := T#0s);
				//Laufzeit überschritten
				ELSIF TON_Laufzeit.Q THEN
					//Max. Versuche überschritten -> Fehler
					IF ctVersucheAuf >= MaxVersucheAuf THEN
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheAuf		:= 0;
						lastStep			:= curStep;
						doKlappeOeffnen		:= FALSE;
						nextStep			:= BSK_STOERUNG;
						//Nächsten Versuch starten
					ELSE
						TON_Laufzeit(IN		:= FALSE, PT := T#0s);
						stateEntry			:= TRUE;
						ctVersucheAuf		:= ctVersucheAuf + 1;
						lastStep			:= curStep;
						nextStep			:= BSK_SCHLIESSEN;
					END_IF
					//Freigabe Öffnen
				ELSIF FreigabeOeffnen THEN
					stateEntry				:= TRUE;
					TON_Laufzeit(IN			:= FALSE, PT := T#0s);
					lastStep				:= curStep;
					ctVersucheZu			:= 0;
					nextStep				:= BSK_WARTEN;
				END_IF

		
		
			//*************************************************************************************************************************************************************************************************************************************
			BSK_STOERUNG:
		
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry		:= FALSE;
					TON_Laufzeit(IN	:= FALSE, PT := T#0s);
					Stoerung		:= TRUE;
				END_IF
		
		
		
				//*** state during ***
				//Warten auf Quittierung
		
				//*** state exit ***
				IF Quit THEN
					stateEntry	:= TRUE;
					Stoerung	:= FALSE;
					lastStep	:= curStep;
					nextStep	:= BSK_WARTEN;
				END_IF
		
				
		
		END_CASE
	
		
	//Keine Freigabe Funktionsbaustein
	ELSE
		
		//Alle Parameter zurücksetzen
		doKlappeOeffnen	:= FALSE;
		ctVersucheAuf	:= 0;
		ctVersucheZu	:= 0;
		Stoerung		:= FALSE;
		TON_Laufzeit(IN	:= FALSE, PT := T#0s);
		stateEntry		:= TRUE;
		curStep			:= BSK_WARTEN;
		nextStep		:= BSK_WARTEN;
		lastStep		:= BSK_WARTEN;
		
	END_IF
	
	


	
END_FUNCTION_BLOCK