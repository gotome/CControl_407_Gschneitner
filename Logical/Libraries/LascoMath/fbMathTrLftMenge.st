(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathTrLftMenge.st
 * Autor: Rudolf Lachner
 * Erstellt: 5. März 2014
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Berechnungen mit Luftmengenmessung *)
FUNCTION_BLOCK fbMathTrLftMenge
	
	IF (Freigabe = TRUE) THEN
		
		//******************************************************************************************************************************************************************
		//Berechnung Luftmenge Aktuell [m³/h]
		//******************************************************************************************************************************************************************
		
		//Ventilator 1 + 2 in Betrieb
		IF (Ventilator1Betrieb AND Ventilator2Betrieb AND (DrehzRegelungAktiv OR Ventilator12FixDrehzahl) AND NOT 
			ZweiBoxenSystem) THEN
			
			//Ventilator 2 Manuell -> AUS
			IF (Ventilator2Manuell = TRUE) THEN
				LuftmengeAktuell	:= (Luftgeschw * 3600 * LuftkanalQuerschnitt);
			ELSE
				LuftmengeAktuell	:= (Luftgeschw * 3600 * LuftkanalQuerschnitt) * 2;
			END_IF
			
			//Ventilator 1 + 2 mit unterschiedlichen Drehzahlen
		ELSIF (Ventilator1Betrieb AND Ventilator2Betrieb AND NOT Ventilator2Manuell AND NOT ZweiBoxenSystem) THEN
			
			//Drehzahlverhältnis zw. Ventilator 1 und 2 berechnen
			IF (DrehzVent1 > DrehzVent2) THEN
				IF (DrehzVent1 <> 0) THEN
					loc_DrehzVerhaeltnis	:= (1 + DrehzVent2 / DrehzVent1);
				END_IF
			ELSE
				IF (DrehzVent2 <> 0) THEN
					loc_DrehzVerhaeltnis		:= (1 + DrehzVent1 / DrehzVent2);
				END_IF
			END_IF
			
			LuftmengeAktuell	:= (Luftgeschw * 3600 * LuftkanalQuerschnitt * loc_DrehzVerhaeltnis);
		
		//Nur Ventilator 1 in Betrieb ODER Zwei-Boxen-System mit 2 Lüftern
		ELSIF (LuftkanalQuerschnitt > 0) AND (Ventilator1Betrieb OR Ventilator2Betrieb) THEN
			LuftmengeAktuell	:= (Luftgeschw * 3600 * LuftkanalQuerschnitt);
		ELSE
			LuftmengeAktuell	:= CONST_MATH_MAX_VALUE;
		END_IF
		

	


		
		//*****************************************************************************************************************************************************************************
		//Berechnung Wasserentzug [kg/h]
		//*****************************************************************************************************************************************************************************

		IF (ZuluftSattDefizit < CONST_MATH_MAX_VALUE) AND (LuftmengeAktuell < CONST_MATH_MAX_VALUE) THEN
			WasserentzugProStunde		:= ((ZuluftSattDefizit * LuftmengeAktuell) / 1000) * OffsetWasserentzug;
		ELSE
			WasserentzugProStunde		:= CONST_MATH_MAX_VALUE;
		END_IF
		
	ELSE
		
		LuftmengeAktuell			:= CONST_MATH_MAX_VALUE;
		WasserentzugProStunde		:= CONST_MATH_MAX_VALUE;
			
	END_IF
	

	
	
END_FUNCTION_BLOCK