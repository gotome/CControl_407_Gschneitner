(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoZund.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Funktionsblock Zündgebläse *)
FUNCTION_BLOCK fbLascoZund

	//Max. Zündzeit Zählen
	TON_Zuendzeit(IN := Freigabe, Zeit := Zuendzeit, Tick := Tick);
	
	IF (Freigabe = TRUE) THEN	
		
		//Zündtemperatur erreicht
		IF (IstTemp > SollTemp) THEN
			Zuendspule 		:= FALSE;
			ZuendungOK 		:= TRUE;
			ZuendungFehler 	:= FALSE;
			
		//Zündzeit abgelaufen und Temperatur nicht erreicht
		ELSIF (IstTemp < SollTemp AND TON_Zuendzeit.Q) THEN
			Zuendspule 		:= FALSE;
			ZuendungOK 		:= FALSE;
			ZuendungFehler 	:= TRUE;	
			
		//Zündung EIN
		ELSE
			Zuendspule 		:= TRUE;
			ZuendungOK 		:= FALSE;
			ZuendungFehler 	:= FALSE;
		END_IF

		//Nachlaufzeit Zündgebläse
		TOF_Nachlaufzeit(IN := Zuendspule , Zeit := Nachlaufzeit, Tick := Tick);
		
		Zuendgeblaese := TOF_Nachlaufzeit.Q;

	//Keine Freigabe
	ELSE
		
		IF (Zuendspule = TRUE) THEN
			Zuendspule := FALSE;
		END_IF
		
		ZuendungOK 		:= FALSE;
		ZuendungFehler 	:= FALSE;
		
		//Gebläse läuft auch ohne Freigabe nach
		TOF_Nachlaufzeit(IN := Zuendspule , Zeit := Nachlaufzeit, Tick := Tick);
		Zuendgeblaese := TOF_Nachlaufzeit.Q;
		
	END_IF

	
END_FUNCTION_BLOCK