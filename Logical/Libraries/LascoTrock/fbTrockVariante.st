(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: fbTrockVariante.st
 * Autor: Rudolf Lachner
 * Erstellt: 12. Februar 2015
 ********************************************************************
 * Implementierung der Library LascoTrock
 ********************************************************************) 

(* Auswertung der Anlagenkonfiguration mit Ausgabe einer Nummer und eines Textes *)
FUNCTION_BLOCK fbTrockVariante
	
	IF Freigabe THEN
		
		IF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 1;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 2;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 3;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 4;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 5;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 6;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 7;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 8;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 9;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 10;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 11;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 12;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 13;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 14;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 15;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 16;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 17;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 18;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 19;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 20;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 21;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 22;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 23;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 24;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 25;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 26;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 27;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 28;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 29;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 30;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 31;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 32;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 33;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 34;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 35;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 36;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 37;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 38;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 39;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 40;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 41;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 42;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 43;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 44;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 45;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 46;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 47;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 48;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 49;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 50;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 51;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 52;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 53;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 54;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 55;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 56;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 57;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 58;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 59;
		ELSIF (Ventilator1 AND NOT Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 60;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 61;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 62;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 63;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 64;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 65;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 66;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 67;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 68;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 69;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 70;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 71;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 72;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 73;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 74;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 75;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 76;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 77;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 78;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 79;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 80;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 81;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 82;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 83;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 84;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 85;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 86;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 87;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 88;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 89;
		ELSIF (Ventilator1 AND Ventilator2 AND NOT Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 90;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 91;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 92;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 93;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 94;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 95;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 96;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 97;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 98;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 99;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 100;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 101;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 102;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 103;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND NOT Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 104;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 105;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 106;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 107;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 108;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 109;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 110;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 111;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND NOT BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 112;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 113;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 114;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 115;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND NOT BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 116;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 117;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND NOT Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 118;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND NOT Umschaltklappe) THEN
			VarianteNr 	:= 119;
		ELSIF (Ventilator1 AND Ventilator2 AND Luftentfeuchter AND Warmluftofen AND BetriebsmldgWarmluftofen AND BetriebsmldgScheitholzofen AND Brandschutzklappe AND Umschaltklappe) THEN
			VarianteNr 	:= 120;
		ELSE
			VarianteNr	:= 0;
		END_IF
		
		
	//	VarianteName	:= TROCK_VARIANTEN_NAMEN[VarianteNr];
		
	ELSE
		
		VarianteNr		:= 0;
	//	VarianteName	:= TROCK_VARIANTEN_NAMEN[VarianteNr];
		
	END_IF

	
END_FUNCTION_BLOCK