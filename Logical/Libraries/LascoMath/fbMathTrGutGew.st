(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathTrGutGew.st
 * Autor: Rudolf Lachner
 * Erstellt: 5. März 2014
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Berechnungen des Trockengutes (spez. Gewicht, Wasserentzug, Gewicht Start, Gewicht Ende...) *)
FUNCTION_BLOCK fbMathTrGutGew
	
	IF (Freigabe = TRUE) THEN
		
		//Boxentrocknung**************************************************************************************************************************************************
		IF (Anlagentyp = FALSE) THEN
			
			
			//Spez. Gewicht des Trockengutes [kg/m³]
			//**************************************
			
			//Heu
			IF (Trocknungsgut = 0) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN
				TrockengutSpezGewicht		:= (0.0237 * FeuchteBeiStart * FeuchteBeiStart - 0.395 * FeuchteBeiStart + 60.5) * 1.1;
				//Fichte
			ELSIF (Trocknungsgut = 1) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN
				TrockengutSpezGewicht 		:= (0.0313 * FeuchteBeiStart * FeuchteBeiStart + 1.2245 * FeuchteBeiStart + 151.32);
				//Buche
			ELSIF (Trocknungsgut = 2) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN	
				TrockengutSpezGewicht 		:= (0.0462 * FeuchteBeiStart * FeuchteBeiStart + 1.7883 * FeuchteBeiStart + 222.47);
				//Mais
			ELSIF (Trocknungsgut = 3) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN	
				TrockengutSpezGewicht 		:= (730 + 476 * (FeuchteBeiStart / (100 - FeuchteBeiStart)));
				//Weizen
			ELSIF (Trocknungsgut = 4) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN
				TrockengutSpezGewicht 		:= (680 + 476 * (FeuchteBeiStart / (100 - FeuchteBeiStart)));
			ELSIF (Trocknungsgut = 5) AND (SpezGewichtUser <> 0) AND (FeuchteBeiStart <> 0) AND (FeuchteBeiStart < 100) THEN
				TrockengutSpezGewicht		:= ((SpezGewichtUser - 476) + 476 * (FeuchteBeiStart / (100 - FeuchteBeiStart)));
			ELSE
				TrockengutSpezGewicht		:= CONST_MATH_MAX_VALUE;
			END_IF
			
			
			//Trockengut Gewicht bei Trocknungsstart [kg]
			//*******************************************
			IF (TrockengutSpezGewicht <> 0) AND (TrockengutSpezGewicht < CONST_MATH_MAX_VALUE) AND (FuellhoeheTrockengut > 0) AND
				(Boxenflaeche > 0) THEN
				TrockengutGewichtStart		:= Boxenflaeche * FuellhoeheTrockengut * TrockengutSpezGewicht;
			ELSE
				TrockengutGewichtStart		:= 0;
			END_IF
			
			
			//Rundballentrocknung***************************************************************************************************************************************************
		ELSE
			
			//Trockengut Gewicht bei Trocknungsstart [kg]
			//*******************************************
			IF (GewichtProBallen > 0) AND (AnzahlBallen > 0) THEN
				TrockengutGewichtStart		:= GewichtProBallen * AnzahlBallen;
			ELSE
				TrockengutGewichtStart		:= 0;
			END_IF
			
		END_IF
		
			
		//Trockengut Gewicht Substanz [kg]
		//********************************
		IF (TrockengutGewichtStart <> 0) AND (FeuchteBeiStart > 0) THEN
			TrockengutGewichtSubstanz	:= TrockengutGewichtStart - (TrockengutGewichtStart * FeuchteBeiStart / 100);
		ELSE
			TrockengutGewichtSubstanz	:= 0;
		END_IF

		IF (TrockengutGewichtSubstanz < 0) THEN
			TrockengutGewichtSubstanz	:= 0;
		END_IF
			
		
		//Trockengut Gewicht Ende [kg]
		//****************************
		IF (TrockengutGewichtSubstanz <> 0) AND (FeuchteEnde > 0) THEN
			loc_TrockengutGewichtEnde	:= ((100 - FeuchteEnde) / 100);
			IF (loc_TrockengutGewichtEnde <> 0) THEN
				TrockengutGewichtEnde	:= TrockengutGewichtSubstanz / loc_TrockengutGewichtEnde;
			ELSE
				TrockengutGewichtEnde	:= 0;
			END_IF
		ELSE
			TrockengutGewichtEnde		:= 0;
		END_IF
			
		IF (TrockengutGewichtEnde < 0) THEN
			TrockengutGewichtEnde	:= 0;
		END_IF
			
			
		//Trockengut Gewicht Wasserentzug [kg]
		//************************************
		IF (TrockengutGewichtStart > 0) AND (TrockengutGewichtEnde > 0) THEN
			TrockengutWasserentzug	:= TrockengutGewichtStart - TrockengutGewichtEnde;
		ELSE
			TrockengutWasserentzug	:= 0;
		END_IF
		
		
		//Wasserentzug Seit Start [kg]
		//****************************
		IF (VentilatorInBetrieb) AND (WasserentzugProStunde < CONST_MATH_MAX_VALUE) AND (sekTick) THEN
			WasserentzugSeitStart	:= WasserentzugSeitStart + WasserentzugProStunde / 3600;
		END_IF
		
		
		//Aktuelles Trockengut- Gewicht [kg]
		//**********************************
		TrockengutGewichtAktuell	:= TrockengutGewichtStart - WasserentzugSeitStart;
		
		
		//Noch abzutrocknendes Wasser [kg]
		//********************************
		RestgewichtWasser			:= TrockengutWasserentzug - WasserentzugSeitStart;
		
		
		//Aktuelle Trockengut- Feuchte [%]
		//********************************
		
		IF (EDGEPOS(CmdKorrekturFeuchte)) THEN
			loc_cmdKorrekturFeuchte	:= TRUE;
		END_IF
	
		
		IF TrockengutGewichtEnde > 0 THEN  
	
			//Korrektur durch Bediener ********************************************************************************************************
			IF (FeuchteAktuell <> KorrekturWertFeuchte) AND (EDGEPOS(loc_cmdKorrekturFeuchte)) THEN 
				
				//Check Div0
				temp2		:= (FeuchteEnde - FeuchteBeiStart);
				IF (temp2 = 0) THEN
					temp2	:= temp2 + 0.01;
				END_IF
				
				temp1 		:= (TrockengutGewichtEnde - TrockengutGewichtStart);
				IF (temp1 = 0) THEN
					temp1	:= temp1 + 0.01;
				END_IF
				
				//Check Div0
				IF ((KorrekturWertFeuchte - FeuchteBeiStart) = 0) THEN
					KorrekturWertFeuchte	:= KorrekturWertFeuchte + 0.01;
				END_IF
					
				
				//Aktuelles Trockengutgewicht neu berechnen
				IF (temp2 <> 0) THEN
					TrockengutGewichtAktuell 	:=  TrockengutGewichtStart + (TrockengutGewichtEnde - TrockengutGewichtStart) / temp2 * (KorrekturWertFeuchte - FeuchteBeiStart);
					WasserentzugSeitStart		:= (TrockengutGewichtStart - TrockengutGewichtAktuell);
				END_IF
			
				//Check Div0
				IF ((TrockengutGewichtAktuell - TrockengutGewichtStart) = 0) THEN
					TrockengutGewichtAktuell	:= TrockengutGewichtAktuell + 0.01;
				END_IF
				
				
				//Aktuelle Trockengut- Feuchte berechnen
				IF (temp1 <> 0) THEN
					FeuchteAktuell := FeuchteBeiStart + (FeuchteEnde - FeuchteBeiStart) / temp1 * (TrockengutGewichtAktuell - TrockengutGewichtStart);
				END_IF

				loc_cmdKorrekturFeuchte		:= FALSE;
				KorrekturWertFeuchte		:= 0.0;
			
				
			//Korrektur durch Tabellenprogramm **********************************************************************************************************
			ELSIF (FeuchteAktuell <> KorrekturWertFeuchteRicht) AND (EDGEPOS(CmdKorrekturFeuchteRicht)) THEN
				
				//Check Div0
				temp1 		:= (TrockengutGewichtEnde - TrockengutGewichtStart);
				IF (temp1 = 0) THEN
					temp1	:= temp1 + 0.01;
				END_IF
				
				temp2		:= (FeuchteEnde - FeuchteBeiStart);
				IF (temp2 = 0) THEN
					temp2	:= temp2 + 0.01;
				END_IF
				
				//Check Div0
				IF ((KorrekturWertFeuchteRicht - FeuchteBeiStart) = 0) THEN
					KorrekturWertFeuchteRicht	:= KorrekturWertFeuchteRicht + 0.01;
				END_IF
				
				//Aktuelles Trockengutgewicht neu berechnen
				IF (temp2 <> 0) THEN
					TrockengutGewichtAktuell 	:= TrockengutGewichtStart + (TrockengutGewichtEnde - TrockengutGewichtStart) / temp2 * (KorrekturWertFeuchteRicht - FeuchteBeiStart);
					WasserentzugSeitStart		:= (TrockengutGewichtStart - TrockengutGewichtAktuell);
				END_IF
				
				//Check Div0
				IF ((TrockengutGewichtAktuell - TrockengutGewichtStart) = 0) THEN
					TrockengutGewichtAktuell	:= TrockengutGewichtAktuell	+ 0.01;
				END_IF
				
				//Aktuelle Trockengut- Feuchte berechnen
				IF (temp1 <> 0) THEN
					FeuchteAktuell 	:= FeuchteBeiStart + (FeuchteEnde - FeuchteBeiStart) / temp1 * (TrockengutGewichtAktuell - TrockengutGewichtStart);
				END_IF
				
				CmdKorrekturFeuchteRicht	:= FALSE;
				KorrekturWertFeuchteRicht	:= 0.0;
			
				
			//Automatische Berechnung *******************************************************************************************************************************************************
			ELSIF (KeinStroemungsfuehler = FALSE) THEN
			
				temp1 := (TrockengutGewichtEnde - TrockengutGewichtStart);
				IF (temp1 = 0) THEN
					temp1	:= temp1 + 0.01;
				END_IF
				
				//Check Div0
				IF ((TrockengutGewichtAktuell - TrockengutGewichtStart) = 0) THEN
					TrockengutGewichtAktuell	:= TrockengutGewichtAktuell	+ 0.01;
				END_IF
				
				IF (temp1 <> 0) THEN
					FeuchteAktuell := FeuchteBeiStart + (FeuchteEnde - FeuchteBeiStart) / temp1 * (TrockengutGewichtAktuell - TrockengutGewichtStart);
				END_IF
			END_IF
		ELSE
			FeuchteAktuell	:= 0;
		END_IF
	
				
		
		//Wenn kein Strömungsfühler vorhanden -> Auswertung über Tabellenprogramm
		IF (KeinStroemungsfuehler) AND (Automatikbetrieb) AND (Freigabe)  AND (VentilatorInBetrieb) THEN
			
			IF (EDGEPOS(Freigabe) OR FeuchteBeiStart <> FeuchteBeiStartMEM) THEN
				firstInit			:= TRUE;
				FeuchteBeiStartMEM	:= FeuchteBeiStart;
			END_IF
		
			//Richtzeit aktuelle Stufe in Stunden umwandeln
			RichtzeitAktStufeStunden		:= RichtzeitAktStufeTage * 24;
			
			//Teilung Feuchtigkeit neu berechnen
			IF ((firstInit) OR (CmdKorrekturFeuchteRicht)) AND (RichtzeitAktStufeStunden <> 0) THEN
				TeilungFeuchteRicht			:= FeuchteAktuell / RichtzeitAktStufeStunden;
				firstInit					:= FALSE;
				CmdKorrekturFeuchteRicht	:= FALSE;
			END_IF
		
			//Mittelwert Feuchteentzug pro Stunde
			IF (stdTick) THEN
				CmdKorrekturFeuchteRicht	:= TRUE;
				KorrekturWertFeuchteRicht	:= FeuchteAktuell - TeilungFeuchteRicht;
			END_IF
			
			
		//Kein Automatikbetrieb (oder kein Ventilator in Betrieb)
		ELSIF (KeinStroemungsfuehler) AND (Freigabe) THEN
			
			//Check Div0
			temp1 := (TrockengutGewichtEnde - TrockengutGewichtStart);
			IF temp1 = 0 THEN
				temp1	:= temp1 + 0.01;
			END_IF
			
			//Check Div0
			IF ((TrockengutGewichtAktuell - TrockengutGewichtStart) = 0) THEN
				TrockengutGewichtAktuell	:= TrockengutGewichtAktuell	+ 0.01;
			END_IF
				
			IF (temp1 <> 0) THEN
				FeuchteAktuell := FeuchteBeiStart + (FeuchteEnde - FeuchteBeiStart) / temp1 * (TrockengutGewichtAktuell - TrockengutGewichtStart);
			END_IF
			
		END_IF
		
		
	//keine Freigabe ***************************************************************************************************************************************************************************
	ELSE
		
		TrockengutSpezGewicht		:= 0;
		TrockengutGewichtStart		:= 0;
		TrockengutGewichtEnde		:= 0;
		TrockengutGewichtSubstanz	:= 0;
		TrockengutWasserentzug		:= 0;
		TrockengutGewichtAktuell	:= 0;
		WasserentzugSeitStart		:= 0;
		loc_TrockengutGewichtEnde	:= 0;
		
	END_IF
	

	
END_FUNCTION_BLOCK