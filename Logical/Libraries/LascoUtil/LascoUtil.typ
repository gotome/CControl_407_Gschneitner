(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: LascoUtil.typ
 * Autor: Rudolf Lachner
 * Erstellt: 27. März 2013
 ********************************************************************
 * Datentypen der Library LascoUtil
 ********************************************************************)

TYPE
	WoPrg_type : 	STRUCT 
		HZ1_Enable : BOOL;
		HZ2_Enable : BOOL;
		HZ1_Std_Ein : REAL;
		HZ1_Min_Ein : REAL;
		HZ1_Std_Aus : REAL;
		HZ1_Min_Aus : REAL;
		HZ2_Std_Ein : REAL;
		HZ2_Min_Ein : REAL;
		HZ2_Std_Aus : REAL;
		HZ2_Min_Aus : REAL;
	END_STRUCT;
	Zeit_type : 	STRUCT 
		Jahr : UINT;
		Monat : USINT;
		Tag : USINT;
		WoTag : USINT;
		Stunde : USINT;
		Minute : USINT;
		Sekunde : USINT;
		Milli : UINT;
		Mikro : UINT;
	END_STRUCT;
	enumStepsBskUeberw : 
		(
		BSK_WARTEN := 0,
		BSK_OEFFNEN := 1,
		BSK_OEFFNEN_FEHLER := 2,
		BSK_SCHLIESSEN := 3,
		BSK_SCHLIESSEN_FEHLER := 4,
		BSK_STOERUNG := 5
		);
END_TYPE
