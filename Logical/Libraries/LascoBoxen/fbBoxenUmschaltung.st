
(* Funktionsbaustein für Umschaltung Frischluft/Umluft *)
FUNCTION_BLOCK fbBoxenUmschaltung
	
	IF Freigabe THEN
		
	
		CASE step OF
	
			
			//WARTEN ****************************************************************************************************************************
			0:
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
		
				//*** state during ***
				//Fehler Frischluft- und Dachluftsensor -> UMLUFT
				IF NOT StatusSensorDachluftOk AND NOT StatusSensorFrischluftOk THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				//Frischluft- und Dachluftsensor nicht vorhanden -> UMLUFT
				ELSIF NOT SensorDachluftVhd AND NOT SensorFrischluftVhd THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				//Fehler Frischluftsensor und Dachluftsensor nicht vorhanden -> UMLUFT
				ELSIF SensorFrischluftVhd AND NOT StatusSensorFrischluftOk AND NOT SensorDachluftVhd THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				//Fehler Dachluftsensor und Frischluftsensor nicht vorhanden -> UMLUFT
				ELSIF SensorDachluftVhd AND NOT StatusSensorDachluftOk AND NOT SensorFrischluftVhd THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				//Frischluft- und Dachluftsensor vorhanden, beide Sensoren Fehler -> UMLUFT
				ELSIF SensorDachluftVhd AND SensorFrischluftVhd AND NOT StatusSensorDachluftOk AND NOT StatusSensorFrischluftOk THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				END_IF
				
			
		
				//*** state exit ***
				//Abluft- und Dachluftsensor vorhanden -> Umschaltung nach Differenz Abluft/Dachluft
				IF SensorAbluftVhd AND SensorDachluftVhd AND StatusSensorAbluftOk AND StatusSensorDachluftOk THEN
					stateEntry	:= TRUE;
					step		:= 1;
				//Abluft- und Frischluftsensor vorhanden -> Umschaltung nach Differenz Abluft/Frischluft
				ELSIF SensorAbluftVhd AND SensorFrischluftVhd AND StatusSensorAbluftOk AND StatusSensorFrischluftOk THEN
					stateEntry	:= TRUE;
					step		:= 2;
				//Dachluftsensor vorhanden -> Umschaltung nach fixem Temperaturwert Dach
				ELSIF (SensorDachluftVhd AND StatusSensorDachluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 3;
				//Nur Frischluftsensor vorhanden -> Umschaltung nach fixem Temperaturwert Frischluft
				ELSIF (SensorFrischluftVhd AND StatusSensorFrischluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 4;
				END_IF
				

		
				
			//SENSOR ABLUFT UND DACHLUFT VORHANDEN ****************************************************************************************************************************
			1:
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
		
			
				//*** state during ***
			
				//Bei Neustart (Kein Frischluftbetrieb, kein Umluftbetrieb) ohne Verzögerung umschalten
				IF NOT FrischluftbetriebOut AND NOT UmluftbetriebOut THEN
					IF (DachluftTemp <= AbluftTemp) THEN
						UmluftbetriebOut	:= TRUE;
					ELSIF ((DachluftTemp + DifferenzTempUmschaltung) >= AbluftTemp) THEN
						FrischluftbetriebOut	:= TRUE;
					ELSE
						UmluftbetriebOut	:= TRUE;
					END_IF
				END_IF
			
				//Umschaltverzögerung Frischluft/Umluft
				TON_Umluft(IN:= FrischluftbetriebOut AND (DachluftTemp <= AbluftTemp), PT:= Umschaltverz);
				TON_Frischluft(IN:= UmluftbetriebOut AND (DachluftTemp > (AbluftTemp + DifferenzTempUmschaltung)), PT:= Umschaltverz);
			
				IF EDGEPOS(TON_Umluft.Q) THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				ELSIF EDGEPOS(TON_Frischluft.Q) THEN
					UmluftbetriebOut		:= FALSE;
					FrischluftbetriebOut	:= TRUE;
				END_IF

			
				//*** state exit ***
				IF (NOT SensorAbluftVhd) OR (NOT SensorDachluftVhd) OR (NOT StatusSensorDachluftOk) OR (NOT StatusSensorAbluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
				
				
			//SENSOR ABLUFT UND FRISCHLUFT VORHANDEN ****************************************************************************************************************************
			2:
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
		
			
				//*** state during ***
			
				//Bei Neustart (Kein Frischluftbetrieb, kein Umluftbetrieb) ohne Verzögerung umschalten
				IF NOT FrischluftbetriebOut AND NOT UmluftbetriebOut THEN
					IF (FrischluftTemp <= AbluftTemp) THEN
						UmluftbetriebOut	:= TRUE;
					ELSIF ((FrischluftTemp + DifferenzTempUmschaltung) >= AbluftTemp) THEN
						FrischluftbetriebOut	:= TRUE;
					ELSE
						UmluftbetriebOut	:= TRUE;
					END_IF
				END_IF
			
				//Umschaltverzögerung Frischluft/Umluft
				TON_Umluft(IN:= FrischluftbetriebOut AND (FrischluftTemp <= AbluftTemp), PT:= Umschaltverz);
				TON_Frischluft(IN:= UmluftbetriebOut AND (FrischluftTemp > (AbluftTemp + DifferenzTempUmschaltung)), PT:= Umschaltverz);
			
				IF EDGEPOS(TON_Umluft.Q) THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				ELSIF EDGEPOS(TON_Frischluft.Q) THEN
					UmluftbetriebOut		:= FALSE;
					FrischluftbetriebOut	:= TRUE;
				END_IF

			
				//*** state exit ***
				IF (NOT SensorAbluftVhd) OR (NOT SensorFrischluftVhd) OR (NOT StatusSensorFrischluftOk) OR (NOT StatusSensorAbluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
			
				
			
			
			//SENSOR DACHLUFT VORHANDEN ****************************************************************************************************************************
			3:
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
		
			
				//*** state during ***
			
				//Bei Neustart (Kein Frischluftbetrieb, kein Umluftbetrieb) ohne Verzögerung umschalten
				IF NOT FrischluftbetriebOut AND NOT UmluftbetriebOut THEN
					IF (DachluftTemp <= FrischlDachlTempUmschaltung) THEN
						UmluftbetriebOut	:= TRUE;
					ELSIF (DachluftTemp >= FrischlDachlTempUmschaltung) THEN
						FrischluftbetriebOut	:= TRUE;
					ELSE
						UmluftbetriebOut	:= TRUE;
					END_IF
				END_IF
			
				//Umschaltverzögerung Frischluft/Umluft
				TON_Umluft(IN:= FrischluftbetriebOut AND (DachluftTemp <= (FrischlDachlTempUmschaltung - Hysterese)), PT:= Umschaltverz);
				TON_Frischluft(IN:= UmluftbetriebOut AND (DachluftTemp > FrischlDachlTempUmschaltung), PT:= Umschaltverz);

				IF EDGEPOS(TON_Umluft.Q) THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				ELSIF EDGEPOS(TON_Frischluft.Q) THEN
					UmluftbetriebOut		:= FALSE;
					FrischluftbetriebOut	:= TRUE;
				END_IF

				//*** state exit ***
				IF (NOT SensorDachluftVhd) OR (NOT StatusSensorDachluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF


			//NUR SENSOR FRISCHLUFT VORHANDEN ****************************************************************************************************************************
			4:
				//*** state entry ***
				IF stateEntry THEN
					stateEntry	:= FALSE;
				END_IF
		
			
				//*** state during ***
			
				//Bei Neustart (Kein Frischluftbetrieb, kein Umluftbetrieb) ohne Verzögerung umschalten
				IF NOT FrischluftbetriebOut AND NOT UmluftbetriebOut THEN
					IF (FrischluftTemp <= FrischlDachlTempUmschaltung) THEN
						UmluftbetriebOut	:= TRUE;
					ELSIF (FrischluftTemp >= FrischlDachlTempUmschaltung) THEN
						FrischluftbetriebOut	:= TRUE;
					END_IF
				END_IF
			
				//Umschaltverzögerung Frischluft/Umluft
				TON_Umluft(IN:= FrischluftbetriebOut AND (FrischluftTemp <= (FrischlDachlTempUmschaltung - Hysterese)), PT:= Umschaltverz);
				TON_Frischluft(IN:= UmluftbetriebOut AND (FrischluftTemp > FrischlDachlTempUmschaltung), PT:= Umschaltverz);

				IF EDGEPOS(TON_Umluft.Q) THEN
					UmluftbetriebOut		:= TRUE;
					FrischluftbetriebOut	:= FALSE;
				ELSIF EDGEPOS(TON_Frischluft.Q) THEN
					UmluftbetriebOut		:= FALSE;
					FrischluftbetriebOut	:= TRUE;
				END_IF

				//*** state exit ***
				IF (NOT SensorFrischluftVhd) OR (NOT StatusSensorFrischluftOk) THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
		
		
		END_CASE
	
	
	ELSE
		
		stateEntry				:= TRUE;
		step					:= 0;
		FrischluftbetriebOut	:= TRUE;
		UmluftbetriebOut		:= FALSE;
		
	END_IF
	
	
END_FUNCTION_BLOCK
