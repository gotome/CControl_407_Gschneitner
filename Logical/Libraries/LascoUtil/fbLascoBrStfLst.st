(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoBrStfLst.st
 * Autor: Rudolf Lachner
 * Erstellt: 11. Dezember 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Berechnung der Brennstoffleistung *)
FUNCTION_BLOCK fbLascoBrStfLst
	
	
	IF (sekTick) THEN
		
		LeistungSek		:= LeistungAkt / 3600;
		Leistung_kWh	:= Leistung_kWh + LeistungSek;
		
		IF (Leistung_kWh >= 10) THEN
			Leistung_kWh	:= Leistung_kWh - 10;
			Leistung_MWh	:= Leistung_MWh + 1;
		END_IF
	END_IF
	
	IF (Reset) THEN
		Leistung_kWh	:= 0;
		Leistung_MWh	:= 0;
	END_IF
	
	
END_FUNCTION_BLOCK