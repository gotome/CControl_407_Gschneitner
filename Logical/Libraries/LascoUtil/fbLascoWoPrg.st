(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoWoPrg.st
 * Autor: Rudolf Lachner
 * Erstellt: 2. April 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Wochenprogramm *)
FUNCTION_BLOCK fbLascoWoPrg
	
	
	//Akutelle Uhrzeit auslesen
	EUhr(Freigabe := TRUE);
	WoTag	:= EUhr.WoTag;
	AktZeit	:= INT_TO_REAL(EUhr.StdMin);
	
	
	//Zeitfenster auswerten
	//=====================
	
	//Heizzeit 1
	StartZeit_1	:= (WoPrg[WoTag].HZ1_Std_Ein * 100) + WoPrg[WoTag].HZ1_Min_Ein;
	StopZeit_1	:= (WoPrg[WoTag].HZ1_Std_Aus * 100) + WoPrg[WoTag].HZ1_Min_Aus;

	FreigabeZeit_1	:= FALSE;
	IF (StartZeit_1 > StopZeit_1) THEN
		IF (AktZeit >= StartZeit_1) OR (AktZeit < StopZeit_1) THEN
			FreigabeZeit_1 	:= TRUE;
		END_IF
	ELSE
		IF (AktZeit >= StartZeit_1) AND (AktZeit < StopZeit_1) THEN
			FreigabeZeit_1	:= TRUE;
		END_IF
	END_IF
		
	
	//Heizzeit 2
	StartZeit_2	:= (WoPrg[WoTag].HZ2_Std_Ein * 100) + WoPrg[WoTag].HZ2_Min_Ein;
	StopZeit_2	:= (WoPrg[WoTag].HZ2_Std_Aus * 100) + WoPrg[WoTag].HZ2_Min_Aus;
	
	FreigabeZeit_2	:= FALSE;
	IF (StartZeit_2 > StopZeit_2) THEN
		IF (AktZeit >= StartZeit_2) OR (AktZeit < StopZeit_2) THEN
			FreigabeZeit_2 	:= TRUE;
		END_IF
	ELSE
		IF (AktZeit >= StartZeit_2) AND (AktZeit < StopZeit_2) THEN
			FreigabeZeit_2	:= TRUE;
		END_IF
	END_IF
	
	
	//Freigabe generieren
	IF (Freigabe= TRUE) THEN
		
		WoPrgFreigabe	:= (FreigabeZeit_1 AND WoPrg[WoTag].HZ1_Enable) OR (FreigabeZeit_2 AND WoPrg[WoTag].HZ2_Enable);	
	ELSE
		
		WoPrgFreigabe	:= FALSE;
		
	END_IF
	
END_FUNCTION_BLOCK