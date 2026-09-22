
(* Funktionsbaustein zur Berechnung der Restzeit Lauf/Pause aus 24h Zeitfenstern (BOOL [24]) *)
FUNCTION_BLOCK fbRestzeit
	
	IF Freigabe THEN
		
		//Variable setzen, wenn Zeitfenster aktiv
		ZeitfensterAktiv	:= ZeitfensterIn[AktuelleStunde];
		
		
		//Zeitfenster ist aktiv -> Restzeit Lauf berechnen *********************************************************
		IF ZeitfensterAktiv THEN
			
			//Änderung von Struktur Zeitfenster erkennen
			loc_Aenderung := memcmp(ADR(ZeitfensterIn), ADR(MEM_ZeitfensterIn), SIZEOF(ZeitfensterIn));
			IF loc_Aenderung <> 0 OR loc_firstInitLauf THEN
				loc_firstInitLauf := FALSE;
				loc_StundeEndeZeitfTag := 23;
				loc_StundeEndeZeitfFolgetag := 23;
				memcpy(ADR(MEM_ZeitfensterIn), ADR(ZeitfensterIn), SIZEOF(MEM_ZeitfensterIn));
			END_IF	
		
			
			//Minuten Rest aktueller Tag berechnen
			loc_MinutenRestTag	:= 60 - AktuelleMinute;
			FOR i:= AktuelleStunde + 1 TO loc_StundeEndeZeitfTag DO
				IF ZeitfensterIn[i] = TRUE THEN
					loc_MinutenRestTag	:= loc_MinutenRestTag + 60;
				ELSE
					loc_StundeEndeZeitfTag := i;
				END_IF
			END_FOR

			//Minuten Rest Folgetag berechnen, wenn aktuelles Zeitfenster bis zum Ende des Tages aktiv ist
			loc_MinutenRestFolgetag := 0;
			IF loc_StundeEndeZeitfTag = 23 THEN
				FOR ii:= 0 TO loc_StundeEndeZeitfFolgetag DO
					IF ZeitfensterIn[ii] = TRUE THEN
						loc_MinutenRestFolgetag	:= loc_MinutenRestFolgetag + 60;
					ELSE
						loc_StundeEndeZeitfFolgetag := ii;
					END_IF
				END_FOR
			ELSE
				loc_MinutenRestFolgetag := 0;
				loc_StundeEndeZeitfFolgetag := 23;
			END_IF
		
			
			//Gesamtzeit Minuten Tag + Folgetag
			loc_MinutenRestGesamt := loc_MinutenRestTag + loc_MinutenRestFolgetag;
		
			//Ausgabe Restzeit in Stunden und Minuten
			loc_RestzeitStunden		:= loc_MinutenRestGesamt / 60;
			//Wenn Restzeit Stunden > 24h, Ausgabe Stunden = 255 (keine Anzeige in Visu)
			IF loc_RestzeitStunden <= 24 THEN
				RestzeitStundenOut		:= ABS(loc_RestzeitStunden);
				RestzeitMinutenOut		:= loc_MinutenRestGesamt - (RestzeitStundenOut * 60);
			ELSE
				RestzeitStundenOut		:= 65535;
				RestzeitMinutenOut		:= 65535;
			END_IF
			
			
			
			loc_firstInitPause := TRUE;
		
			
		//Zeitfenster nicht aktiv -> Restzeit Pause berechnen *********************************************************
		ELSE
			
			//Änderung von Struktur Zeitfenster erkennen
			loc_Aenderung := memcmp(ADR(ZeitfensterIn), ADR(MEM_ZeitfensterIn), SIZEOF(ZeitfensterIn));
			IF loc_Aenderung <> 0 OR loc_firstInitPause THEN
				loc_firstInitPause := FALSE;
				loc_StundeEndeZeitfTag := 23;
				loc_StundeEndeZeitfFolgetag := 23;
				memcpy(ADR(MEM_ZeitfensterIn), ADR(ZeitfensterIn), SIZEOF(MEM_ZeitfensterIn));
			END_IF	
		
			
			//Minuten Rest aktueller Tag berechnen
			loc_MinutenRestTag	:= 60 - AktuelleMinute;
			FOR i:= AktuelleStunde + 1 TO loc_StundeEndeZeitfTag DO
				IF ZeitfensterIn[i] = FALSE THEN
					loc_MinutenRestTag	:= loc_MinutenRestTag + 60;
				ELSE
					loc_StundeEndeZeitfTag := i;
				END_IF
			END_FOR

			//Minuten Rest Folgetag berechnen, wenn aktuelles Zeitfenster bis zum Ende des Tages inaktiv ist
			loc_MinutenRestFolgetag := 0;
			IF loc_StundeEndeZeitfTag = 23 THEN
				FOR ii:= 0 TO loc_StundeEndeZeitfFolgetag DO
					IF ZeitfensterIn[ii] = FALSE THEN
						loc_MinutenRestFolgetag	:= loc_MinutenRestFolgetag + 60;
					ELSE
						loc_StundeEndeZeitfFolgetag := ii;
					END_IF
				END_FOR
			ELSE
				loc_MinutenRestFolgetag := 0;
				loc_StundeEndeZeitfFolgetag := 23;
			END_IF
		
			
			//Gesamtzeit Minuten Tag + Folgetag
			loc_MinutenRestGesamt := loc_MinutenRestTag + loc_MinutenRestFolgetag;
		
			//Ausgabe Restzeit in Stunden und Minuten
			loc_RestzeitStunden		:= loc_MinutenRestGesamt / 60;
			
			//Wenn Restzeit Stunden > 24h, Ausgabe Stunden = 65535 (keine Anzeige in Visu)
			IF loc_RestzeitStunden <= 24 THEN
				RestzeitStundenOut		:= ABS(loc_RestzeitStunden);
				RestzeitMinutenOut		:= loc_MinutenRestGesamt - (RestzeitStundenOut * 60);
			ELSE
				RestzeitStundenOut		:= 65535;
				RestzeitMinutenOut		:= 65535;
			END_IF
			
			
			loc_firstInitLauf := TRUE;
			
		END_IF
		
		
		
	//Keine Freigabe Baustein	
	ELSE
		
		loc_firstInitLauf	:= TRUE;
		loc_firstInitPause	:= TRUE;
		RestzeitMinutenOut	:= 65535;
		RestzeitStundenOut	:= 65535;
		
	END_IF
	
	
END_FUNCTION_BLOCK
