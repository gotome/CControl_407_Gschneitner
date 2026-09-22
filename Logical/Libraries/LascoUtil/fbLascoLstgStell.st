(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Library: LascoUtil
 * Datei: fbLascoLstgStell.st
 * Autor: Rudolf Lachner
 * Erstellt: 28. März 2013
 ********************************************************************
 * Implementierung der Library LascoUtil
 ********************************************************************) 

(* Leistungssteller *)
FUNCTION_BLOCK fbLascoLstgStell
	
	IF (Enable) THEN
	
		//Soll-Drehzahl Saugzug bestimmen
		ScalDrehzSaugzug.x		:= GesLeistungSoll;
		ScalDrehzSaugzug.x1		:= GesLeistungMin;
		ScalDrehzSaugzug.x2		:= GesLeistungMax;
		ScalDrehzSaugzug.y1		:= SaugzugDrehzMin;
		ScalDrehzSaugzug.y2		:= SaugzugDrehzMax;
		ScalDrehzSaugzug();
		
		//Sollstellung Primärklappe
		ScalStellPrimaer.x		:= GesLeistungSoll;
		ScalStellPrimaer.x1		:= GesLeistungMin;
		ScalStellPrimaer.x2		:= GesLeistungMax;
		ScalStellPrimaer.y1		:= PrimaerStellMin;
		ScalStellPrimaer.y2		:= PrimaerStellMax;
		ScalStellPrimaer();
		
		//Sollstellung Sekundärklappe 
		ScalStellSekundaer.x	:= GesLeistungSoll;
		ScalStellSekundaer.x1	:= GesLeistungMin;
		ScalStellSekundaer.x2	:= GesLeistungMax;
		ScalStellSekundaer.y1	:= SekundaerStellMin;
		ScalStellSekundaer.y2	:= SekundaerStellMax;
		ScalStellSekundaer();
		
		//Sollstellung Reziklappe 
		ScalStellRezi.x			:= GesLeistungSoll;
		ScalStellRezi.x1		:= GesLeistungMin;
		ScalStellRezi.x2		:= GesLeistungMax;
		ScalStellRezi.y1		:= ReziStellMin;
		ScalStellRezi.y2		:= ReziStellMax;
		ScalStellRezi();
		
		//Pulszeit Einschub
		ScalPulsEinschub.x		:= GesLeistungSoll;
		ScalPulsEinschub.x1		:= GesLeistungMin;
		ScalPulsEinschub.x2		:= GesLeistungMax;
		ScalPulsEinschub.y1		:= EinschubPulsMin;
		ScalPulsEinschub.y2		:= EinschubPulsMax;
		ScalPulsEinschub();
		
		//Pausenzeit Einschub
		ScalPauseEinschub.x		:= GesLeistungSoll;
		ScalPauseEinschub.x1	:= GesLeistungMin;
		ScalPauseEinschub.x2	:= GesLeistungMax;
		ScalPauseEinschub.y1	:= EinschubPauseMin;
		ScalPauseEinschub.y2	:= EinschubPauseMax;
		ScalPauseEinschub();
		
		//Pulszeit Rost
		ScalPulsRost.x			:= GesLeistungSoll;
		ScalPulsRost.x1			:= GesLeistungMin;
		ScalPulsRost.x2			:= GesLeistungMax;
		ScalPulsRost.y1			:= RostPulsMin;
		ScalPulsRost.y2			:= RostPulsMax;
		ScalPulsRost();
		
		//Pausenzeit Rost
		ScalPauseRost.x			:= GesLeistungSoll;
		ScalPauseRost.x1		:= GesLeistungMin;
		ScalPauseRost.x2		:= GesLeistungMax;
		ScalPauseRost.y1		:= RostPauseMin;
		ScalPauseRost.y2		:= RostPauseMax;
		ScalPauseRost();
		
		//Ausgabe skalierter Sollwert
		SaugzugDrehzSoll		:= ScalDrehzSaugzug.y;
		PrimaerStellSoll		:= ScalStellPrimaer.y;
		SekundaerStellSoll		:= ScalStellSekundaer.y;
		ReziStellSoll			:= ScalStellRezi.y;
		EinschubPulsSoll		:= REAL_TO_UDINT(ScalPulsEinschub.y);
		EinschubPauseSoll		:= REAL_TO_UDINT(ScalPauseEinschub.y);
		RostPulsSoll			:= REAL_TO_UDINT(ScalPulsRost.y);
		RostPauseSoll			:= REAL_TO_UDINT(ScalPauseRost.y);
		
		
		
		
	ELSE

		SaugzugDrehzSoll		:= 0.0;
		PrimaerStellSoll		:= 0.0;
		SekundaerStellSoll		:= 0.0;
		ReziStellSoll			:= 0.0;
		EinschubPulsSoll		:= 0;
		EinschubPauseSoll		:= 0;
		RostPulsSoll			:= 0;
		RostPauseSoll			:= 0;
		
	END_IF
	
		
		
	
	
	
	
	
END_FUNCTION_BLOCK