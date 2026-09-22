
(* Funktionsbaustein für Ansteuerung Oelsumpfheizung *)
FUNCTION_BLOCK fbEntfOelsumpfheiz
	
	
	//Ansteuerung Ölsumpfheizung
	//==========================
	
	IF Freigabe THEN
		
		OelsumpfheizungEin	:= TRUE;
		
	ELSE
		OelsumpfheizungEin	:= FALSE;
	END_IF
	
	
END_FUNCTION_BLOCK
