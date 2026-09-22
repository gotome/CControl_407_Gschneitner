(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathLuft.st
 * Autor: Rudolf Lachner
 * Erstellt: 3. M酺z 2014
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Berechnungen aus Temperatur, Feuchtigkeit und Meeresh鐬e (S酹tigungsdefizit, Luftdruck, Taupunkttemperatur, etc...) *)
FUNCTION_BLOCK fbMathLuft
	
	
	IF (Freigabe = TRUE) THEN
		
		
		//Luftdruck [hPa]  
		LuftdruckUmgebung	:= CONST_MATH_DRUCK_MEERESHOEHE * EXPT(1 - 0.0065 * MeterUeberAdria / 288.15, 5.255);
		
		//Luftdichte [kg/m設
		IF (LuftTemperatur <> -273.15) THEN
			LuftDichte	:= (LuftdruckUmgebung * 100) / (287.058 * (273.15 + LuftTemperatur));
		ELSE
			LuftDichte	:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft absolute Feuchte ges酹tigt [g/m設
		IF (LuftTemperatur <> -237.3) AND (LuftTemperatur <> -273.15) THEN
			LuftAbsoluteFeuchteSatt		:= 216.67 * ((6.1078 * EXPT(10 , (7.5 * LuftTemperatur / (237.3 + LuftTemperatur)))) / (LuftTemperatur + 273.15));
		ELSE
			LuftAbsoluteFeuchteSatt		:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft absolute Feuchte [g/m設
		IF (LuftAbsoluteFeuchteSatt < CONST_MATH_MAX_VALUE) THEN
			LuftAbsoluteFeuchte_g_m3	:= (LuftRelFeuchte / 100) * LuftAbsoluteFeuchteSatt;
		ELSE
			LuftAbsoluteFeuchte_g_m3 	:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft S酹tigungsdefizit [g/m設
		IF (LuftAbsoluteFeuchte_g_m3 < CONST_MATH_MAX_VALUE) THEN
			LuftSaettigungsdefizit		:= LuftAbsoluteFeuchteSatt - LuftAbsoluteFeuchte_g_m3;
		ELSE
			LuftSaettigungsdefizit		:= CONST_MATH_MAX_VALUE;
		END_IF
		
		
		//Umgebungsluft absolute Feuchte [g/kg]
		IF (LuftAbsoluteFeuchte_g_m3 < CONST_MATH_MAX_VALUE) AND (LuftDichte < CONST_MATH_MAX_VALUE) AND (LuftDichte <> 0) THEN
			LuftAbsoluteFeuchte_g_kg	:= LuftAbsoluteFeuchte_g_m3 / LuftDichte;
		ELSE
			LuftAbsoluteFeuchte_g_kg	:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft S酹tigungsdampfdruck [mbar]
		IF (LuftTemperatur <> 237.3) THEN
			LuftDampfdruckSatt		:= 6.09 * EXPT(10, ((7.5 * LuftTemperatur) / (237.3 + LuftTemperatur)));
		ELSE
			LuftDampfdruckSatt		:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft Wasserdampfdruck [mbar]
		IF (LuftDampfdruckSatt < CONST_MATH_MAX_VALUE) THEN
			LuftDampfdruckH2O		:= LuftDampfdruckSatt * (LuftRelFeuchte / 100);
		ELSE
			LuftDampfdruckH2O		:= CONST_MATH_MAX_VALUE;
		END_IF
		
		//Umgebungsluft Taupunkttemperatur [蚓]
		IF (LuftDampfdruckH2O < CONST_MATH_MAX_VALUE) AND (LuftDampfdruckH2O <> 0) THEN
			loc_Taupunkttemp	:= LOG(LuftDampfdruckH2O);
			IF (loc_Taupunkttemp <> 8.233) THEN
				TaupunktTemp	:= (234.67 * loc_Taupunkttemp - 184.2) / (8.233 - loc_Taupunkttemp);
			ELSE
				TaupunktTemp	:= CONST_MATH_MAX_VALUE;
			END_IF
		ELSE
			TaupunktTemp		:= CONST_MATH_MAX_VALUE;
		END_IF
			
		
	ELSE
		
		LuftdruckUmgebung			:= CONST_MATH_MAX_VALUE;
		LuftAbsoluteFeuchteSatt		:= CONST_MATH_MAX_VALUE;
		LuftAbsoluteFeuchte_g_kg	:= CONST_MATH_MAX_VALUE;
		LuftAbsoluteFeuchte_g_m3	:= CONST_MATH_MAX_VALUE;
		LuftDichte					:= CONST_MATH_MAX_VALUE;
		TaupunktTemp				:= CONST_MATH_MAX_VALUE;
		LuftDampfdruckH2O			:= CONST_MATH_MAX_VALUE;
		LuftDampfdruckSatt			:= CONST_MATH_MAX_VALUE;
		LuftSaettigungsdefizit		:= CONST_MATH_MAX_VALUE;
		
		
	END_IF
	
END_FUNCTION_BLOCK