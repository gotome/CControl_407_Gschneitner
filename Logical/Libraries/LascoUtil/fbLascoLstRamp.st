(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoLstRamp.st
 * Autor: Rudolf Lachner
 * Erstellt: 21. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Rampenfunktion, Leistungsanstieg pro Minute *)
FUNCTION_BLOCK fbLascoLstRamp
	
	
	IF (EDGE(Enable)) THEN
		Fertig			:= FALSE;
		LeistungOut		:= LeistungStart;
		
	ELSIF (Enable AND sekTick) THEN
		
		AnstiegProSekunde	:= AnstiegProMinute / 60;
		
		IF ((LeistungOut + AnstiegProSekunde) <= LeistungSoll) AND NOT Pause THEN
			LeistungOut		:= LeistungOut + AnstiegProSekunde;
		ELSIF ((LeistungOut + AnstiegProSekunde) >= LeistungSoll) AND NOT Pause THEN
			IF LeistungSoll > LeistungStart THEN
				LeistungOut		:= LeistungSoll;
			ELSE
				LeistungOut		:= LeistungStart;
			END_IF
			Fertig 			:= TRUE;
		END_IF
	END_IF
	
	
END_FUNCTION_BLOCK