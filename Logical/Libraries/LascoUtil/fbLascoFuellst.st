(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoFuellst.st
 * Autor: Rudolf Lachner
 * Erstellt: 13. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Überwachung von Fuellstandssensoren *)
FUNCTION_BLOCK fbLascoFuellst
	
	IF (EDGE(Fuellstand)) THEN
		cKeineFlankeFs	:= 0;
	ELSIF (EinschubEin) AND (NOT Fehler) THEN
		cKeineFlankeFs	:= cKeineFlankeFs + Tick;
	END_IF
	
	IF (Quit) THEN
		Fehler			:= FALSE;
		cKeineFlankeFs	:= 0;
	ELSIF (cKeineFlankeFs >= VerzZeit) AND (VerzZeit > 0) THEN
		Fehler			:= TRUE;
	END_IF
	
END_FUNCTION_BLOCK