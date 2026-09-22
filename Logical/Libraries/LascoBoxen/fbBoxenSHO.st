
(* Funktionsbaustein Ansteuerung Scheitholzofen (Auskühlzeit) *)
FUNCTION_BLOCK fbBoxenSHO
	
	IF Freigabe THEN
		
		TOF_Auskuehlzeit(IN:= Betriebsmeldung, PT:= Auskuehlzeit);
		
		//Restlaufzeit Auskühlung berechnen (für Visu)
		RestAuskuehlzeit	:= Auskuehlzeit - TIME_TO_UDINT(TOF_Auskuehlzeit.ET);
		
		ScheitholzofenAktiv	:= TOF_Auskuehlzeit.Q;
		
	ELSE
	
		TOF_Auskuehlzeit(IN:= FALSE, PT:= 0);
		ScheitholzofenAktiv	:= FALSE;
		
	END_IF
	
		
END_FUNCTION_BLOCK
