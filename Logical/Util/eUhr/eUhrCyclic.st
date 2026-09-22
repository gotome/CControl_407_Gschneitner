

PROGRAM _CYCLIC

	
	//Funktionsbaustein Echtzeituhr
	//=============================
	
	//Echtzeituhr auslesen
	RTC_gettime(ADR(Echtzeit));
	
	//Datum und Uhrzeit auslesen
	DTGetTime_0.enable	:= TRUE;
	DTGetTime_0();
	DateTime			:= DTGetTime_0.DT1;
	
	
	//Zeit als Word bilden
	Echtzeit.StdMin		:= (Echtzeit.Stunde * 100) + Echtzeit.Minute;


END_PROGRAM
