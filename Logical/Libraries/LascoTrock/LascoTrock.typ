(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechik GmbH
 ********************************************************************
 * Library: LascoTrock
 * Datei: LascoTrock.typ
 * Autor: Rudolf Lachner
 * Erstellt: 10. März 2014
 ********************************************************************
 * Datentypen der Library LascoTrock
 ********************************************************************)

TYPE
	enumStepTrockVent : 
		(
		WARTEN_FBTROCK := 0,
		VENT_EIN_FBTROCK := 1,
		VENT_AUS_FBTROCK := 2,
		KLAPPEN_AUF_FBTROCK := 3,
		KLAPPEN_ZU_FBTROCK := 4,
		LA_EIN_VORBEREITUNG_FBTROCK := 5,
		LA_EIN_FBTROCK := 6,
		LA_AUS_VORBEREITUNG_FBTROCK := 7,
		MESSUNG_FBTROCK := 8,
		TARIFABSCHALTUNG_FBTROCK := 9
		);
END_TYPE
