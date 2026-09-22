(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: funLascoMinss.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Wert in Minuten und Sekunden umwandeln*)
FUNCTION funLascoMinss
	
	//Eine Eingabe von 5.30 m.ss ergibt dadurch 5 Minunten und 30 Sekunden;
	
	funLascoMinss := ((IN / 100) * 60) + (IN - (IN / 100) * 100);
	
	
END_FUNCTION