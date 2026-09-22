
{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbEntfOelsumpfheiz (*Funktionsbaustein für Ansteuerung Ölsumpfheizung*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		EintrittTemp : {REDUND_UNREPLICABLE} REAL;
		parTempOelsumpfheizungAus : {REDUND_UNREPLICABLE} REAL;
		parTempOelsumpfheizungEin : {REDUND_UNREPLICABLE} REAL;
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		StatusSensorEintrittOk : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		OelsumpfheizungEin : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbEntfKompressor (*Funktionsbaustein für Ansteuerung Kompressor*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		EintrittFeuchte : {REDUND_UNREPLICABLE} REAL;
		SicherheitOk : {REDUND_UNREPLICABLE} BOOL;
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmldgVentilator : {REDUND_UNREPLICABLE} BOOL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		Dauerbetrieb : {REDUND_UNREPLICABLE} BOOL;
		parFeuchteEin : {REDUND_UNREPLICABLE} REAL;
		parFeuchteAus : {REDUND_UNREPLICABLE} REAL;
		parEinschaltverzAbtau : {REDUND_UNREPLICABLE} UDINT;
		parAusschaltverzAbtau : {REDUND_UNREPLICABLE} UDINT;
		parEinschaltverzKompressor : {REDUND_UNREPLICABLE} UDINT;
		Hochdruck : {REDUND_UNREPLICABLE} REAL;
		Niederdruck : {REDUND_UNREPLICABLE} REAL;
		parNiederdruckMin : {REDUND_UNREPLICABLE} REAL;
		parHochdruckMax : {REDUND_UNREPLICABLE} REAL;
		parNiederdruckMax : {REDUND_UNREPLICABLE} REAL;
		StatusSensorNiederdruckOk : {REDUND_UNREPLICABLE} BOOL;
		StatusSensorEintrittOk : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlvorgabeFU : {REDUND_UNREPLICABLE} REAL;
		BetriebsmldgKompressor : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlMin : {REDUND_UNREPLICABLE} REAL;
		DrehzahlMax : {REDUND_UNREPLICABLE} REAL;
		RampeUp : {REDUND_UNREPLICABLE} REAL;
		RampeDown : {REDUND_UNREPLICABLE} REAL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		parEinschaltverzMagnetventil : {REDUND_UNREPLICABLE} UDINT;
		parNiederdruckPumpdown : {REDUND_UNREPLICABLE} REAL;
		diNiederdruckOk : {REDUND_UNREPLICABLE} BOOL;
		diHochdruckOk : {REDUND_UNREPLICABLE} BOOL;
		KlappenumschaltungAkiv : {REDUND_UNREPLICABLE} BOOL;
		parVerzStandbyBeiKlappenumsch : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_OUTPUT
		FreigabeKompressorOut : {REDUND_UNREPLICABLE} BOOL;
		StoerungOut : {REDUND_UNREPLICABLE} BOOL;
		AbtauungAktiv : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlOut : {REDUND_UNREPLICABLE} REAL;
		MagnetventilOut : {REDUND_UNREPLICABLE} BOOL;
		curStep : {REDUND_UNREPLICABLE} USINT;
		loc_StatusFeuchteOk : {REDUND_UNREPLICABLE} BOOL;
		FehlerPumpdown : {REDUND_UNREPLICABLE} BOOL;
		StandbyKlappenumsch : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		TON_Abtau : {REDUND_UNREPLICABLE} TON;
		TON_Kompressor : {REDUND_UNREPLICABLE} TON;
		lastStep : {REDUND_UNREPLICABLE} USINT;
		nextStep : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		fbFuKompressor : {REDUND_UNREPLICABLE} fbLascoFU;
		sekTick : {REDUND_UNREPLICABLE} BOOL;
		fbLascoEUhr_0 : {REDUND_UNREPLICABLE} fbLascoEUhr;
		fbLascoZdxx_0 : {REDUND_UNREPLICABLE} fbLascoZdxx;
		TON_EinschaltverzMagnetventil : {REDUND_UNREPLICABLE} TON;
		TON_LaufzeitPumpdown : {REDUND_UNREPLICABLE} TON;
		TON_Klappenumschaltung : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbEntfFremd (*Funktionsbaustein zur Ansteuerung von Entfeuchtern (Fremdgeräte)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		StoerungIn : {REDUND_UNREPLICABLE} BOOL;
		parVerzStoerung : {REDUND_UNREPLICABLE} UDINT;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		Dauerbetrieb : {REDUND_UNREPLICABLE} BOOL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmldgVentilator : {REDUND_UNREPLICABLE} BOOL;
		parEinschaltverzKompressor : {REDUND_UNREPLICABLE} UDINT;
		BetriebsmldgEntfeuchter : {REDUND_UNREPLICABLE} BOOL;
		WitterungIstSchlecht : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, wird der Entfeuchter im Automatikbetrieb freigegeben*)
		parVerzBetriebEntfeuchter : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_OUTPUT
		StoerungOut : {REDUND_UNREPLICABLE} BOOL;
		FehlerBetriebsmldg : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKompressorOut : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		TON_Stoerung : {REDUND_UNREPLICABLE} TON;
		TON_VerzBetriebsmeldung : {REDUND_UNREPLICABLE} TON;
		curStep : {REDUND_UNREPLICABLE} USINT;
		nextStep : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		TON_Kompressor : {REDUND_UNREPLICABLE} TON;
		lastStep : {REDUND_UNREPLICABLE} USINT;
	END_VAR
END_FUNCTION_BLOCK
