(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoSrvcInterv.st
 * Autor: Rudolf Lachner
 * Erstellt: 16. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Funktionsbaustein für Serviceintervalle *)
FUNCTION_BLOCK fbLascoSrvcInterv
	
	//Service rücksetzen
	IF (EDGEPOS(SrvcReset)) THEN
		ZeitBisSrvc	:= SrvcIntervall;
	END_IF
	
	//Restzeit Countdown
	IF (Aktiv AND Tick) AND (ZeitBisSrvc > 0) THEN
		ZeitBisSrvc	:= ZeitBisSrvc - 1;
	END_IF
	
	//Service erforderlich
	IF (ZeitBisSrvc = 0) THEN
		SrvcErforderl	:= TRUE;
	ELSE
		SrvcErforderl	:= FALSE;
	END_IF
	
END_FUNCTION_BLOCK