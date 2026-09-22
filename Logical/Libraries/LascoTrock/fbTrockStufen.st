(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockStufen.st
 * Autor: Rudolf Lachner
 * Erstellt: 19. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Umschaltung der Trockenstufen *)
FUNCTION_BLOCK fbTrockStufen
	
	
	//Freigabe, Automatik ***************************************************************************************************************
	IF (Freigabe = TRUE) AND (FreigabeAuto = TRUE) AND (AktuelleRezeptNr <> 0) THEN
		
		//Bei Trocknungsstart auf Stufe Startfeuchte setzen
		//*************************************************
		IF (FeuchteStart > 0) AND (RezeptStufeIst = 0) THEN
			FOR i := 1 TO 6 DO
				IF (FeuchteStart <= FeuchteStufen[i]) THEN
					RezeptStufeSoll	:= i;
					RezeptStufeIst	:= i;
				END_IF
				IF (FeuchteStart > FeuchteStufen[1]) THEN
					RezeptStufeIst		:= 1;
					RezeptStufeSoll		:= 1;
				END_IF
			END_FOR
		END_IF
	
	
		//Passende Stufe ermitteln
		FOR i := 1 TO 6 DO
			IF (FeuchteAktuell <= FeuchteStufen[i]) THEN
				RezeptStufeSoll	:= i;
			END_IF	
		END_FOR	
		IF (FeuchteAktuell > FeuchteStufen[1]) THEN
			RezeptStufeSoll		:= 1;
		END_IF
		
	
		//Tick bei Änderung der Sollstufe
		fbLascoZdxx_0(IN 	:= RezeptStufeSoll);
		TickStufe			:= fbLascoZdxx_0.Q;
	
	
		//Zeitverzögerung Übernahme Änderung Stufe (Stufe 1 bis 5)
		IF (RezeptStufeSoll <= 5) THEN
		
			Stufe6_ok	:= FALSE;
		
			TON_AenderungStufeAuto.IN	:= (RezeptStufeSoll <> RezeptStufeIst) AND NOT TickStufe;
			TON_AenderungStufeAuto.PT	:= UDINT_TO_TIME(VerzStufenwechsel);
			TON_AenderungStufeAuto();
		
			IF (TON_AenderungStufeAuto.Q) THEN
				RezeptStufeIst := RezeptStufeSoll;
			END_IF
		END_IF
	
		
		//Bestätigung für das Umschalten von Stufe 5 auf 6 notwendig
		IF (RezeptStufeSoll = 6) AND NOT (Stufe6_ok) THEN
			MldgBestaetigungErforderl	:= TRUE;
			IF (Bestaetigung) THEN
				RezeptStufeIst := RezeptStufeSoll;
				Stufe6_ok		:= TRUE;
			END_IF
		ELSE
			MldgBestaetigungErforderl	:= FALSE;
		END_IF
	
		//Stufe bei Trocknungsende ermitteln
		FOR i := 1 TO 6 DO
			IF (FeuchteEnde <= FeuchteStufen[i]) AND (FeuchteEnde > 0) THEN
				RezeptStufeBeiEnde	:= i;
			ELSIF (FeuchteEnde > 0) AND (FeuchteStufen[i] <= FeuchteEnde) AND NOT (FeuchteEnde > FeuchteStufen[i]) THEN
				RezeptStufeBeiEnde	:= i;
			END_IF
		END_FOR
		
		//Meldung Trocknung Fertig ausgeben
		//*********************************
		
		MeldungFertig	:= FALSE;
		
		IF (RezeptStufeBeiEnde < 6) THEN
			IF (RezeptStufeIst >= RezeptStufeBeiEnde) THEN
				MeldungFertig	:= TRUE;
			END_IF
		ELSIF (RezeptStufeBeiEnde >= 6) THEN
			IF (NachtrocknungFertig) THEN
				MeldungFertig	:= TRUE;
			END_IF
		END_IF
		
		
		
		
	//Freigabe ********************************************************************************************************************************
	ELSIF (Freigabe = TRUE) AND (AktuelleRezeptNr <> 0) THEN
		
		
		//Bei Trocknungsstart auf Stufe Startfeuchte setzen
		//*************************************************
		IF (FeuchteStart > 0) AND (RezeptStufeIst = 0) THEN
			FOR i := 1 TO 6 DO
				IF (FeuchteStart <= FeuchteStufen[i]) THEN
					RezeptStufeSoll	:= i;
					RezeptStufeIst	:= i;
				END_IF
				IF (FeuchteStart > FeuchteStufen[1]) THEN
					RezeptStufeIst		:= 1;
					RezeptStufeSoll		:= 1;
				END_IF
			END_FOR
		END_IF
	
	
		//Passende Stufe ermitteln
		FOR i := 1 TO 6 DO
			IF (FeuchteAktuell <= FeuchteStufen[i]) THEN
				RezeptStufeSoll	:= i;
			END_IF	
		END_FOR	
		IF (FeuchteAktuell > FeuchteStufen[1]) THEN
			RezeptStufeSoll		:= 1;
		END_IF
	
		//Tick bei Änderung der Sollstufe
		fbLascoZdxx_0(IN 	:= RezeptStufeSoll);
		TickStufe			:= fbLascoZdxx_0.Q;
	
		
		//Zeitverzögerung Übernahme Änderung Stufe (Stufe 1 bis 6) -> keine Nachtrocknung
		IF (RezeptStufeSoll <= 6) THEN
			Stufe6_ok	:= FALSE;
		
			TON_AenderungStufeAuto.IN	:= (RezeptStufeSoll <> RezeptStufeIst) AND NOT TickStufe;
			TON_AenderungStufeAuto.PT	:= UDINT_TO_TIME(VerzStufenwechsel);
			TON_AenderungStufeAuto();
		
			IF (TON_AenderungStufeAuto.Q) THEN
				RezeptStufeIst := RezeptStufeSoll;
			END_IF
		END_IF

	
		//Stufe bei Trocknungsende ermitteln
		FOR i := 1 TO 6 DO
			IF (FeuchteEnde <= FeuchteStufen[i]) AND (FeuchteEnde > 0) THEN
				RezeptStufeBeiEnde	:= i;
			ELSIF (FeuchteEnde > 0) AND (FeuchteStufen[i] <= FeuchteEnde) AND NOT (FeuchteEnde > FeuchteStufen[i]) THEN
				RezeptStufeBeiEnde	:= i;
			END_IF
		END_FOR
		
		//Meldung Trocknung Fertig ausgeben
		//*********************************
		MeldungFertig	:= FALSE;
		IF (RezeptStufeIst >= RezeptStufeBeiEnde) THEN
			MeldungFertig	:= TRUE;
		END_IF
		
		MldgBestaetigungErforderl	:= FALSE;
		
	ELSE
		
		MeldungFertig				:= FALSE;
		MldgBestaetigungErforderl	:= FALSE;
		RezeptStufeIst				:= 0;
		RezeptStufeBeiEnde			:= 0;
		RezeptStufeSoll				:= 0;
		
	END_IF
	
	
	
END_FUNCTION_BLOCK