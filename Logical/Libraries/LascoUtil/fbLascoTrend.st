(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoTrend.st
 * Autor: Rudolf Lachner
 * Erstellt: 3. Dezember 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Trenderkennung eines Eingangswertes innerhalb einer Zeitspanne (steigend/fallend) *)
FUNCTION_BLOCK fbLascoTrend
	
	
	IF (Freigabe AND (Zeitspanne <> 0)) THEN
		
		//Mittelwert neu berechnen
		IF (ctZeitspanne >= Zeitspanne) THEN
			
			Mittelwert	:= ((LREAL_TO_REAL(SummeWert)) / ctZeitspanne);
			
			//Berechnung der Abweichung
			IF Mittelwert - MittelwertMEM <> 0 THEN
				Abweichung := (((Mittelwert - MittelwertMEM) * 100 ) / ctZeitspanne);
			ELSE
				Abweichung := 0.0;
			END_IF
	
			//Steigende Tendenz erkannt
			IF MittelwertMEM < (Mittelwert - MinAbweichung) THEN
				TendenzSteigend := TRUE;
			ELSE
				TendenzSteigend := FALSE;
			END_IF
		
			//Fallende Tendenz erkannt
			IF MittelwertMEM > (Mittelwert + MinAbweichung) THEN
				TendenzFallend := TRUE;
			ELSE
				TendenzFallend := FALSE;
			END_IF
		
	        
			MittelwertMEM	:= Mittelwert;
			ctZeitspanne	:= 0.0;
			SummeWert		:= 0.0;
			
		ELSIF Tick THEN
	
			SummeWert 		:=  SummeWert + Eingangswert;
			ctZeitspanne 	:= ctZeitspanne + 1;
			
		END_IF
		
	ELSE
	
		Abweichung		:= 0.0;
		ctZeitspanne	:= 0.0;
		Mittelwert		:= 0.0;
		MittelwertMEM	:= 0.0;
		SummeWert		:= 0.0;
		TendenzSteigend	:= FALSE;
		TendenzFallend	:= FALSE;
		
	END_IF
	
	
END_FUNCTION_BLOCK