(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoEUhr.st
 * Autor: Rudolf Lachner
 * Erstellt: 2. April 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Echtzeituhr auslesen *)
FUNCTION_BLOCK fbLascoEUhr
	
	IF (Freigabe = TRUE) THEN
		
		//Echtzeituhr auslesen
		RTC_gettime(ADR(Echtzeit));
	
		//Datum und Uhrzeit auslesen
		DTGetTime_0.enable	:= TRUE;
		DTGetTime_0();
		DateTime			:= DTGetTime_0.DT1;
		
		//Zeit als Word bilden
		StdMin		:= (Echtzeit.Stunde * 100) + Echtzeit.Minute;
		
		//Zeit ausgeben
		Jahr		:= Echtzeit.Jahr;
		Monat		:= Echtzeit.Monat;
		Tag			:= Echtzeit.Tag;
		WoTag		:= Echtzeit.WoTag;
		Stunde		:= Echtzeit.Stunde;
		Minute		:= Echtzeit.Minute;
		Sekunde		:= Echtzeit.Sekunde;
		Milli		:= Echtzeit.Milli;
		Mikro		:= Echtzeit.Mikro;
		
		
	ELSE
		
		Jahr		:= 0;
		Monat		:= 0;
		Tag			:= 0;
		WoTag		:= 0;
		Stunde		:= 0;
		Minute		:= 0;
		Sekunde		:= 0;
		Milli		:= 0;
		Mikro		:= 0;
		StdMin		:= 0;
		
	END_IF
	
END_FUNCTION_BLOCK