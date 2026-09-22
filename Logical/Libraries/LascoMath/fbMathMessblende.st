(********************************************************************
 * COPYRIGHT --  
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathMessblende.st
 * Autor: rlachner
 * Erstellt: 6. März 2018
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Berechnungen für Messkanäle mit Messblende *)
FUNCTION_BLOCK fbMathMessblende
	
	IF Enable THEN

		//Volumenstrom aus Luftdichte [AKTUELL]
		//*************************************
		
		//Luftdichte in Abhängigkeit der Temperatur
		IF (CONST_MATH_GASKONSTANTE * (273 + TemperaturAktuell)) <> 0 THEN
			LuftdichteAktuell	:= CONST_MATH_LUFTDRUCK / (CONST_MATH_GASKONSTANTE * (273 + TemperaturAktuell));
		ELSE
			LuftdichteAktuell	:= CONST_MATH_MAX_VALUE;
		END_IF
	

		//Luftgeschwindigkeit aus Differenzdruck
		IF (LuftdichteAktuell <> 0) AND (LuftdichteAktuell <> CONST_MATH_MAX_VALUE) THEN
			LuftgeschwindigkeitAktuell	:= CONST_MATH_FAKTOR_DEBIMO * SQRT((2 * DifferenzdruckMessblende) / LuftdichteAktuell);
		ELSE
			LuftgeschwindigkeitAktuell	:= CONST_MATH_MAX_VALUE;
		END_IF
	
		//Volumenstrom aus Luftgeschwindigkeit
		VolumenstromAktuell := LuftgeschwindigkeitAktuell * Kanalquerschnitt * 3600;
		
		
	
		
		//Volumenstrom aus Luftdichte [NORM]
		//**********************************
		
		//Normluftdichte bei 21°C
		LuftdichteNorm	:= CONST_MATH_LUFTDRUCK / (CONST_MATH_GASKONSTANTE * (273 + CONST_MATH_TEMP_NORM));

		//Luftgeschwindigkeit aus Differenzdruck
		LuftgeschwindigkeitNorm		:= CONST_MATH_FAKTOR_DEBIMO * SQRT((2 * DifferenzdruckMessblende) / LuftdichteNorm);
	
		//Volumenstrom aus Luftgeschwindigkeit
		VolumenstromNorm := LuftgeschwindigkeitNorm * Kanalquerschnitt * 3600;
		
		
		
		//Vergleichsmessung mit Strömungsfühler
		VolumenstromVergleich	:= LuftgeschwindigkeitSensor * Kanalquerschnitt * 3600;
		
		
	ELSE
		
		LuftdichteAktuell			:= 0.0;
		LuftdichteNorm				:= 0.0;
		LuftgeschwindigkeitAktuell	:= 0.0;
		LuftgeschwindigkeitNorm		:= 0.0;
		VolumenstromAktuell			:= 0.0;
		VolumenstromNorm			:= 0.0;
		VolumenstromVergleich		:= 0.0;
		
	END_IF
	

	
END_FUNCTION_BLOCK