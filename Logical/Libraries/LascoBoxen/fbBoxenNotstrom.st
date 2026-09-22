
(* Funktionsbaustein zur Ansteuerung eines Notstromaggregates inkl. Vorlaufzeit und Abfrage Betriebsmeldung *)
FUNCTION_BLOCK fbBoxenNotstrom
	
	IF Freigabe THEN
	
		//Verzögerung Abfrage Betriebsmeldung Notstromaggregat, Fehler bilden wenn Zeit abgelaufen
		TON_VerzBetriebsmeldung(IN:= NotstromaggregatAngefordert AND (VerzBetriebsmeldung <> 0) AND NOT BetriebsmldgNotstromaggregat AND NOT QuitFehler, PT:= VerzBetriebsmeldung);
		FehlerOut	:= TON_VerzBetriebsmeldung.Q;
		
		//Nachlaufzeit Notstromaggregat
		TOF_Nachlaufzeit(IN:= FreigabeNotstromaggregatOut, PT:= Nachlaufzeit);
		
		//Freigabe Notstromaggregat, wenn Angefordert und Laufzeitüberwachung Betriebsmeldung nicht ausgelöst
		FreigabeNotstromaggregatOut	:= NotstromaggregatAngefordert AND NOT FehlerOut;
		
		//Ausgabe Notstrom bereit, wenn Vorlaufzeit abgelaufen
		TON_Vorlaufzeit(IN:= FreigabeNotstromaggregatOut AND (BetriebsmldgNotstromaggregat OR (VerzBetriebsmeldung = 0)), PT:= Vorlaufzeit);
		NotstromBereitOut	:= TON_Vorlaufzeit.Q AND (BetriebsmldgNotstromaggregat OR (VerzBetriebsmeldung = 0));
		
		//Rest Vorlaufzeit & Nachlaufzeit Notstromaggregat (für Visu)
		RestVorlaufzeit := Vorlaufzeit - TIME_TO_UDINT(TON_Vorlaufzeit.ET);
		RestNachlaufzeit := Nachlaufzeit - TIME_TO_UDINT(TOF_Nachlaufzeit.ET);
		
		
	ELSE
		
		FreigabeNotstromaggregatOut	:= FALSE;
		FehlerOut					:= FALSE;
		NotstromBereitOut			:= FALSE;
		TON_VerzBetriebsmeldung(IN	:= FALSE, PT:= 0);
		TON_Vorlaufzeit(IN			:= FALSE, PT:= 0);
		
	END_IF
	
	
END_FUNCTION_BLOCK
