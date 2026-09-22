(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoBsk.st
 * Autor: rlachner
 * Erstellt: 25. November 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Funktionsbaustein zur Ansteuerung von federrückgestellten Klappenantrieben *)
FUNCTION_BLOCK fbLascoBsk
	
	
	IF Freigabe THEN

		//Fahrzeiten überwachen
		TON_FahrzeitAuf(IN:= KlappeAuf AND NOT KlappeIstOffen AND NOT QuitFehler, PT:= FahrzeitAuf);
		TON_FahrzeitZu(IN:= NOT KlappeAuf AND NOT KlappeIstGeschlossen AND NOT QuitFehler, PT:= FahrzeitZu);
		
		FehlerFahrzeitAuf	:= TON_FahrzeitAuf.Q;
		FehlerFahrzeitZu	:= TON_FahrzeitZu.Q;
		
		//Stoerung Absicherung oder Endlagen
		IF (Stoerung) OR (KlappeIstOffen AND KlappeIstGeschlossen) THEN
			Fehler	:= TRUE;
		ELSE
			Fehler	:= FALSE;
		END_IF
		
		//Fehler rücksetzen
		IF (QuitFehler) THEN
			Fehler				:= FALSE;
		END_IF
		
		//Ansteuerung Klappe
		KlappeAuf	:= Oeffnen AND NOT Fehler;
		
	ELSE
		
		KlappeAuf			:= FALSE;
		Fehler				:= FALSE;
		FehlerFahrzeitAuf	:= FALSE;
		FehlerFahrzeitZu	:= FALSE;
		TON_FahrzeitAuf		(IN:= FALSE);
		TON_FahrzeitZu		(IN:= FALSE);
		
	END_IF
	
	
END_FUNCTION_BLOCK