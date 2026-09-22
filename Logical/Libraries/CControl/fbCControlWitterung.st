
(* Funktionsbaustein zur Generierung der Witterungsverhältnisse über Sättigungsdefizit und Trocknungslaufzeit *)
FUNCTION_BLOCK fbCControlWitterung
	
	
	IF Freigabe THEN
		
		//Aktuell gültige Stufe anhand der Trockengutfeuchte ermitteln
		StufeAktuell := 1;
		IF MaterialfeuchteIst <> 0 THEN
			FOR i := 1 TO 5 DO 
				IF MaterialfeuchteIst <= MaterialfeuchteStufe[i] THEN
					StufeAktuell := i + 1;
				END_IF
			END_FOR
		END_IF
		
			
		//Puls/Pausezeiten für die aktuelle Stufe an Bausteinausgänge übergeben
		SchlechtwetterPulszeit	:= SchlechtwetterPulszeitStufe[StufeAktuell];
		SchlechtwetterPausezeit	:= SchlechtwetterPausezeitStufe[StufeAktuell];
		
		//Bestimmung gültiger Sensor
		IF (AuswahlSensor = 0) AND SensorFrischluftVhd THEN
			SaettigungsdefizitIst := FrischluftSaettigungsdefizit;
		ELSIF (AuswahlSensor = 1) AND SensorDachluftVhd THEN
			SaettigungsdefizitIst := DachluftSaettigungsdefizit;
		ELSIF (AuswahlSensor = 2) AND SensorTrockenluftVhd THEN
			SaettigungsdefizitIst := TrockenluftSaettigungsdefizit;
		ELSIF SensorFrischluftVhd THEN
			SaettigungsdefizitIst := FrischluftSaettigungsdefizit; //Ausgewählter Sensor nicht vhd. -> Frischluft verwenden
		ELSE
			SaettigungsdefizitIst := 0.0; //Kein Sensor vhd.
		END_IF
		
		//Witterungsverhältnisse bestimmen
		IF SaettigungsdefizitIst <> 0 THEN
			
			loc_WetterIstGut		:= FALSE;
			loc_WetterIstSchlecht	:= FALSE;
			IF (SaettigungsdefizitIst >= (GrenzwertStufeAktuell + HystereseGrenzwert)) THEN
				loc_WetterIstGut := TRUE;
			ELSIF (SaettigungsdefizitIst <= (GrenzwertStufeAktuell - HystereseGrenzwert)) THEN
				loc_WetterIstSchlecht := TRUE;
			END_IF
		
			CASE curStep OF
				
				//INIT
				0:
					IF stateEntry THEN
						stateEntry := FALSE;
						TON_SchrittWitterung(IN:= FALSE);
					END_IF
					
					IF loc_WetterIstGut THEN
						curStep := 1;
					ELSE
						curStep := 2;
					END_IF
					
					//Wetter ist gut	
				1:
					IF stateEntry THEN
						stateEntry := FALSE;
						TON_SchrittWitterung(IN:= FALSE);
					END_IF
					
					WetterIstGut := TRUE;
					WetterIstSchlecht := FALSE;
					
					TON_SchrittWitterung(IN:= loc_WetterIstSchlecht, PT:= UDINT_TO_TIME(VerzWetterwechsel));
					
					IF TON_SchrittWitterung.Q THEN
						stateEntry := TRUE;
						curStep := 2;
					END_IF
					
					//Wetter ist schlecht
				2:
				
					IF stateEntry THEN
						stateEntry := FALSE;
						TON_SchrittWitterung(IN:= FALSE);
					END_IF
					
					WetterIstGut := FALSE;
					WetterIstSchlecht := TRUE;
					
					TON_SchrittWitterung(IN:= loc_WetterIstGut, PT:= UDINT_TO_TIME(VerzWetterwechsel));
					
					IF TON_SchrittWitterung.Q THEN
						stateEntry := TRUE;
						curStep := 1;
					END_IF
				
			END_CASE
		
		ELSE	
			loc_WetterIstGut		:= FALSE;
			loc_WetterIstSchlecht	:= FALSE;
			WetterIstGut			:= TRUE;
			WetterIstSchlecht 		:= FALSE;
			TON_SchrittWitterung(IN:= FALSE);
			stateEntry := TRUE;
			curStep := 0;
		END_IF
	
		
		//keine Freigabe des Bausteins	
	ELSE
		loc_WetterIstGut		:= FALSE;
		loc_WetterIstSchlecht	:= FALSE;
		WetterIstGut			:= FALSE;
		WetterIstSchlecht 		:= FALSE;
		TON_SchrittWitterung(IN:= FALSE);
		stateEntry := TRUE;
		curStep := 0;
		SaettigungsdefizitIst := 0.0;
		SchlechtwetterPulszeit := 0;
		SchlechtwetterPausezeit := 0;
		StufeAktuell := 1;
		
	END_IF
	
	
	
END_FUNCTION_BLOCK
