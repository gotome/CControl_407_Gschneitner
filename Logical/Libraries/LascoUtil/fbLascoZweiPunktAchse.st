(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoZweiPunktAchse.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung Zweipunktachse *)
FUNCTION_BLOCK fbLascoZweiPunktAchse
	
	IF (Freigabe AND NOT Stoerung) THEN
		
		//Minimale Ansprechzeit Anforderung Bewegung Vorwärts
		TON_Ansprechzeit(IN := Vor, Zeit := AnsprechZeit, Tick := Tick);
		
		//Minimale Laufzeit Aktor Vorwärts
		TOF_Laufzeit(IN := TON_Ansprechzeit.Q, Zeit := MinLaufZeit, Tick := Tick);
		
		loc_Vor := TOF_Laufzeit.Q;		
		
		//Minimale Ansprechzeit Anforderung Bewegung Rückwärts
		TON_AnsprechzeitZurueck(IN := Zurueck, Zeit := AnsprechZeit, Tick := Tick);
		
		//Minimale Laufzeit Aktor Rückwärts
		TOF_LaufzeitZurueck(IN := TON_AnsprechzeitZurueck.Q, Zeit := MinLaufZeit, Tick := Tick);
		
		loc_Zurueck := TOF_LaufzeitZurueck.Q;
		
		
		//Vorwärtsbewegung
		IF (loc_Vor AND NOT ESVor AND NOT Stoerung AND NOT loc_Zurueck) THEN
			Motor_Vor 		:= TRUE;
			Motor_Zurueck 	:= FALSE;
			
		//Rückwärtsbewegung
		ELSIF (loc_Zurueck AND NOT ESZurueck AND NOT Stoerung AND NOT loc_Vor) THEN
			Motor_Vor 		:= FALSE;
			Motor_Zurueck 	:= TRUE;
		
		//Stillstand
		ELSIF (loc_Zurueck AND NOT ESVor AND NOT Stoerung AND NOT loc_Zurueck) THEN
			Motor_Vor		:= FALSE;
			Motor_Zurueck	:= FALSE;
			loc_Vor			:= FALSE;
			loc_Zurueck		:= FALSE;
			
			
			
		//Stillstand
		ELSE
			Motor_Vor 		:= FALSE;
			Motor_Zurueck 	:= FALSE;
		END_IF
	
		//Verriegelung 
		IF (loc_Vor AND loc_Zurueck) THEN
			Motor_Vor 		:= FALSE;
			Motor_Zurueck 	:= FALSE;
		END_IF
	
	//Keine Freigabe oder Fehler
	ELSE
		Motor_Vor 		:= FALSE;
		Motor_Zurueck 	:= FALSE;
		
	END_IF
	
	//Fehler 
	IF ((ESVor AND ESZurueck) OR (Stoerung)) THEN
		Motor_Vor 		:= FALSE;
		Motor_Zurueck 	:= FALSE;
		Fehler 			:= TRUE;
		
	ELSE
		Fehler 			:= FALSE;	
	END_IF
	
	
END_FUNCTION_BLOCK