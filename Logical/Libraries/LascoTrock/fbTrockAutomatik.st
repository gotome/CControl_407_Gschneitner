(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockAutomatik.st
 * Autor: Rudolf Lachner
 * Erstellt: 18. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Trocknung im Automatikbetrieb *)
FUNCTION_BLOCK fbTrockAutomatik
	
	IF (Freigabe = TRUE) THEN
		
		IF (WetterIstGut OR LuftaufberVhd) THEN
			Intervallbetrieb		:= FALSE;
			FreigabeAutomatik		:= TRUE;
			fbLaufPause.Freigabe	:= FALSE;
			fbLaufPause.Reset		:= TRUE;
		ELSE
			Intervallbetrieb		:= TRUE;
			fbLaufPause.Freigabe	:= TRUE;
			fbLaufPause.Tick		:= Tick;
			fbLaufPause.Reset		:= FALSE;
			fbLaufPause.ZeitLauf	:= LaufzeitSchlecht;
			fbLaufPause.ZeitLaufMin	:= LaufzeitSchlechtMin;
			fbLaufPause.ZeitPause	:= PausenzeitSchlecht;
			fbLaufPause();
			FreigabeAutomatik		:= fbLaufPause.FreigabeLpPrg;
		END_IF		
	ELSE
		Intervallbetrieb		:= FALSE;
		FreigabeAutomatik		:= FALSE;
		fbLaufPause.Freigabe	:= FALSE;
		fbLaufPause.Reset		:= TRUE;
		fbLaufPause();
	END_IF

END_FUNCTION_BLOCK