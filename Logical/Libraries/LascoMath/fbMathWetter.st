(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoMath
 * Datei: fbMathWetter.st
 * Autor: Rudolf Lachner
 * Erstellt: 6. März 2014
 ********************************************************************
 * Implementierung der Library LascoMath
 ********************************************************************) 

(* Auswertung des aktuellen Wetters anhand Rezept und Sättigungsdefizit *)
FUNCTION_BLOCK fbMathWetter
	
	IF (Freigabe = TRUE) THEN
		
		loc_WetterGut		:= FALSE;
		loc_WetterSchlecht	:= FALSE;
		
		IF (SattDefizitAktuell >= (SattDefizitRezept + HystereseUmschaltung)) THEN
			loc_WetterGut		:= TRUE;
		ELSIF (SattDefizitAktuell <= (SattDefizitRezept - HystereseUmschaltung)) THEN
			loc_WetterSchlecht	:= TRUE;
		END_IF
		
			
		TON_WetterGut.IN		:= loc_WetterGut;
		TON_WetterGut.PT		:= UDINT_TO_TIME(ZeitVerzUmschaltung);
		TON_WetterGut();
		
		TOF_WetterGut.IN		:= TON_WetterGut.Q;
		TOF_WetterGut.PT		:= UDINT_TO_TIME(ZeitVerzUmschaltung);
		TOF_WetterGut();	
		WetterGut				:= TOF_WetterGut.Q;
		
		TON_WetterSchlecht.IN	:= loc_WetterSchlecht AND NOT WetterGut;
		TON_WetterSchlecht.PT	:= UDINT_TO_TIME(ZeitVerzUmschaltung);
		TON_WetterSchlecht();
		WetterSchlecht			:= TON_WetterSchlecht.Q;
		
		WetterMittel			:= NOT WetterGut AND NOT WetterSchlecht;
		
	ELSE
		
		WetterGut		:= FALSE;
		WetterMittel	:= FALSE;
		WetterSchlecht	:= FALSE;
		
	END_IF
	
END_FUNCTION_BLOCK