(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoStellachseDigital.st
 * Autor: Rudolf Lachner
 * Erstellt: 7. Januar 2014
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Ansteuerung von Stellachsen ohne Positionsrückmeldung *)
FUNCTION_BLOCK fbLascoStellachseDigital
	
	//Eingänge
	LCRContinServo_0.enable			:= Freigabe;
	LCRContinServo_0.ref			:= Referenz;
	LCRContinServo_0.min_value		:= MinPosition;
	LCRContinServo_0.max_value		:= MaxPosition;
	LCRContinServo_0.t_change_up	:= Oeffnungszeit;
	LCRContinServo_0.t_change_down	:= Schliesszeit;
	LCRContinServo_0.t_impulse		:= MinImpulsdauer;
	LCRContinServo_0.x				:= Sollstellung;
	LCRContinServo_0();
	 
	//Ausgänge
	MotorAuf		:= LCRContinServo_0.up;
	MotorZu			:= LCRContinServo_0.down;
	ReferenzAktiv	:= Referenz AND NOT ReferenzOk;
	
	
	IF (EDGEPOS(LCRContinServo_0.refOk)) THEN
		ReferenzOk		:= TRUE;
	ELSIF (NOT Freigabe) THEN
		ReferenzOk		:= FALSE;
	END_IF
	
	//Weg pro Sekunde/10 errechnen
	//****************************
	IF (Oeffnungszeit <> 0) THEN
		WegProZeitAuf	:= ((MaxPosition - MinPosition) / Oeffnungszeit) / 10;
	END_IF
	IF (Schliesszeit <> 0) THEN
		WegProZeitZu	:= ((MaxPosition - MinPosition) / Schliesszeit) / 10;
	END_IF
	
	//Ist- Position Klappe errechnen
	IF (ReferenzAktiv) THEN
		IstPosition		:= MinPosition;
	ELSIF (EDGEPOS(ReferenzOk)) THEN
		IstPosition		:= MinPosition;
	ELSIF (IstPosition < MinPosition) THEN
		IstPosition		:= MinPosition;
	ELSIF (IstPosition > MaxPosition) THEN
		IstPosition		:= MaxPosition;
	ELSIF (MotorAuf AND Tick AND ReferenzOk AND (IstPosition < MaxPosition)) THEN
		IstPosition		:= IstPosition + WegProZeitAuf;
	ELSIF (MotorZu AND Tick AND ReferenzOk AND (IstPosition > MinPosition)) THEN
		IstPosition		:= IstPosition - WegProZeitZu;
	END_IF
	
	
END_FUNCTION_BLOCK