(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockNachtrock.st
 * Autor: Rudolf Lachner
 * Erstellt: 18. März 2014
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Funktionsbaustein Nachtrocknung *)
FUNCTION_BLOCK fbTrockNachtrock
	

	IF (Freigabe = TRUE) THEN
		
	
		//Zeitfenster 1 ****************************************************************************************************************************
		FreigZeitfenster1	:= FALSE;
		IF (StartZeit1 > StoppZeit1) THEN
			IF (AktZeit >= StartZeit1) OR (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit1) AND (AktZeit < StoppZeit1) THEN
				FreigZeitfenster1	:= TRUE;
			END_IF
		END_IF
		
		//Zeitfenster 2 ****************************************************************************************************************************
		FreigZeitfenster2	:= FALSE;
		IF (StartZeit2 > StoppZeit2) THEN
			IF (AktZeit >= StartZeit2) OR (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit2) AND (AktZeit < StoppZeit2) THEN
				FreigZeitfenster2	:= TRUE;
			END_IF
		END_IF
		
		//Zeitfenster 3 ****************************************************************************************************************************
		FreigZeitfenster3	:= FALSE;
		IF (StartZeit3 > StoppZeit3) THEN
			IF (AktZeit >= StartZeit3) OR (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3 	:= TRUE;
			END_IF
		ELSE
			IF (AktZeit >= StartZeit3) AND (AktZeit < StoppZeit3) THEN
				FreigZeitfenster3	:= TRUE;
			END_IF
		END_IF
		
		//Dauer Nachtrocknung mitzählen
		IF (TagTick) THEN
			TageNachtrocknungAktiv	:= TageNachtrocknungAktiv + 1;
			ZyklusTageIst			:= ZyklusTageIst + 1;
			AktTagFreigabe			:= FALSE;
		END_IF
		
		IF StdTick THEN
			StdNachtrocknung		:= StdNachtrocknung + 1;
		END_IF
		
		
		//Wenn Zyklus Nachtrocknung erreicht -> Freigabe
		IF (ZyklusTageIst >= ZyklusTageSoll) THEN
			AktTagFreigabe			:= TRUE;
			ZyklusTageIst			:= 0;
		END_IF
		
		//Meldung Nachtrocknung Fertig
		IF (TageNachtrocknungAktiv >= DauerNachtrocknungTage) THEN
			NachtrocknungFertig		:= TRUE;
		ELSE
			NachtrocknungFertig		:= FALSE;
		END_IF
		
	
		FreigabeNachtrocknung	:= (FreigZeitfenster1 OR FreigZeitfenster2 OR FreigZeitfenster3) AND ((AktTagFreigabe) OR (TageNachtrocknungAktiv = 0)) ;
		
	ELSE
		
		FreigZeitfenster1		:= FALSE;
		FreigZeitfenster2		:= FALSE;
		FreigZeitfenster3		:= FALSE;
		FreigabeNachtrocknung	:= FALSE;
		AktTagFreigabe			:= FALSE;
		NachtrocknungFertig		:= FALSE;
		ZyklusTageIst			:= 0;
		TageNachtrocknungAktiv	:= 0;
		StdNachtrocknung		:= 0;
		
	END_IF
	
	
	
	
END_FUNCTION_BLOCK