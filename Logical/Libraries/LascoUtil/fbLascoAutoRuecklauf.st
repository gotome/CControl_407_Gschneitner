(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoAutoRuecklauf.st
 * Autor: rlachner
 * Erstellt: 24. Februar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Automatische Rücklauffunktion für Motoren *)
FUNCTION_BLOCK fbLascoAutoRuecklauf
	
	
	IF Freigabe THEN
	
	
		CASE loc_curStep OF
		
	
			//AUS ********************************************************************************************************
			0:
		
				IF stateEntry THEN
					stateEntry := FALSE;
				END_IF
		
				MotorVor	:= FALSE;
				MotorRueck	:= FALSE;
			
		
				IF Zuendphase THEN
					stateEntry		:= TRUE;
					loc_curStep		:= 1;
				ELSIF Heizphase THEN
					stateEntry		:= TRUE;
					loc_curStep		:= 3;
				END_IF
		
		
			//ZUENDPHASE ***************************************************************************************************
			1:
				
				IF stateEntry THEN
					stateEntry 				:= FALSE;
					ctLaufzeitEinschub1		:= 0;
					ctLaufzeitEinschubVor	:= 0;
				END_IF
	
				MotorVor				:= (LaufzeitEinschubZuendung >= ctLaufzeitEinschub1);
		
				//Gesamtlaufzeit Motor Vor
				IF (ctLaufzeitEinschub1 <= LaufzeitEinschubZuendung) THEN
					ctLaufzeitEinschub1	:= ctLaufzeitEinschub1 + sekTick;
				END_IF
				
		
				//Laufzeit Vor am Stück
				IF MotorVor THEN
					ctLaufzeitEinschubVor	:= ctLaufzeitEinschubVor + sekTick;
				END_IF
				
		
				//Rücklauf erforderlich
				IF (ctLaufzeitEinschubVor >= MaxLaufzeitVor) AND (ctLaufzeitEinschub1 < LaufzeitEinschubZuendung) THEN
					loc_RuecklaufErforderlich	:= TRUE;
				END_IF
		
		
				//*** state exit ***
				IF (NOT Zuendphase) THEN
					stateEntry	:= TRUE;
					loc_curStep	:= 0;
				ELSIF loc_RuecklaufErforderlich THEN
					ctLaufzeitEinschubVor	:= 0;
					stateEntry	:= TRUE;
					loc_curStep	:= 2;
				END_IF
		
		
			//Zuendphase= Motor zurück ************************************************************************************************************
			2:
		
				IF stateEntry THEN
					stateEntry 				:= FALSE;
					MotorVor				:= FALSE;
					TON_Umschaltverz.IN		:= TRUE;
				END_IF
	
				TON_Umschaltverz.PT			:= VerzUmschaltung;
				TON_Umschaltverz();
				
				TOF_Ruecklauf.IN			:= TON_Umschaltverz.Q AND loc_RuecklaufErforderlich;
				TOF_Ruecklauf.PT			:= Ruecklaufzeit;
				TOF_Ruecklauf();
			
				MotorRueck					:= TOF_Ruecklauf.Q;

				IF MotorRueck THEN
					loc_RuecklaufErforderlich	:= FALSE;
				END_IF
				
				IF EDGENEG(MotorRueck) THEN
					loc_RueckwaertsOk	:= TRUE;
					TON_Umschaltverz(IN:= FALSE);
					TON_Umschaltverz.IN	:= TRUE;
				END_IF
				
				
			
				IF TON_Umschaltverz.Q AND loc_RueckwaertsOk THEN
					loc_RueckwaertsOk	:= FALSE;
					loc_curStep	:= 1;
					TON_Umschaltverz(IN:= FALSE);
					TOF_Ruecklauf(IN:= FALSE);
				ELSIF NOT Zuendphase THEN
					loc_curStep	:= 0;
					stateEntry	:= TRUE;
				END_IF
		
				
			
			//Heizphase ************************************************************************************************************		
			3:
		
		
				//Vorwärts- Impulse mitzählen
				IF (EDGEPOS(ImpulsVor)) THEN
					ctEinschuebeSeitRuecklauf	:= ctEinschuebeSeitRuecklauf + 1;
				ELSIF (MotorRueck) THEN
					ctEinschuebeSeitRuecklauf	:= 0;
				END_IF
		
				//Kommando Rückwärtsfahrt erforderlich
				IF (ctEinschuebeSeitRuecklauf >= ImpulseVorBisRueck) AND NOT (ImpulsVor) THEN
					loc_RuecklaufErforderlich	:= TRUE;
				ELSIF (MotorRueck) THEN
					loc_RuecklaufErforderlich	:= FALSE;
				END_IF
		
				//Umschaltverzögerung
				IF (EDGENEG(ImpulsVor)) AND (loc_RuecklaufErforderlich) THEN
					TON_Umschaltverz.IN			:= TRUE;
				ELSIF (EDGEPOS(ImpulsVor)) THEN
					TON_Umschaltverz.IN			:= FALSE;
				END_IF
		
				//Rücklaufzeit 
				TOF_Ruecklauf.IN	:= loc_RuecklaufErforderlich AND TON_Umschaltverz.Q;
		
				//Kommando "Motor Rückwärts"
				MotorRueck			:= TOF_Ruecklauf.Q;
		
				//Timer aufrufen
				TON_Umschaltverz.PT	:= UDINT_TO_TIME(VerzUmschaltung);
				TON_Umschaltverz();
		
				TOF_Ruecklauf.PT	:= UDINT_TO_TIME(Ruecklaufzeit);
				TOF_Ruecklauf();
		
				IF (NOT Heizphase) THEN
					loc_curStep	:= 0;
					stateEntry	:= TRUE;
				END_IF
		
		
		END_CASE
	
	
	ELSE

		stateEntry					:= TRUE;
		loc_curStep					:= 0;
		ctLaufzeitEinschub1			:= 0;
		ctLaufzeitEinschubVor		:= 0;
		MotorVor					:= FALSE;
		MotorRueck					:= FALSE;
		loc_RuecklaufErforderlich	:= FALSE;
		loc_RueckwaertsOk			:= FALSE;
		ctEinschuebeSeitRuecklauf	:= 0;
		TON_Umschaltverz.IN			:= FALSE;
		TOF_Ruecklauf.IN			:= FALSE;
		
		
	END_IF


END_FUNCTION_BLOCK