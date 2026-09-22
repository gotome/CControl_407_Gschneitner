(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathTrLftDruck.st
 * Autor: Rudolf Lachner
 * Erstellt: 5. März 2014
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Berechnungen mit Drucksensor *)
FUNCTION_BLOCK fbMathTrLftDruck
	
	IF (Freigabe = TRUE) THEN
		
		LuftDruck_mmWS	:= TrockenluftDruck * 0.102;
		LuftDruck_mbar	:= TrockenluftDruck / 100.0;
		LuftDruck_bar	:= TrockenluftDruck / 100000.0;
		
	ELSE
		
		LuftDruck_bar	:= CONST_MATH_MAX_VALUE;
		LuftDruck_mbar	:= CONST_MATH_MAX_VALUE;
		LuftDruck_mmWS	:= CONST_MATH_MAX_VALUE;
		
	END_IF
	
	
	
	
END_FUNCTION_BLOCK