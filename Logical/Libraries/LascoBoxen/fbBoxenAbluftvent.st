
(* Funktionsbaustein zur Ansteuerung Abluftventilator, optional mit Drehzahlvorgabe *)
FUNCTION_BLOCK fbBoxenAbluftvent
	
	IF Freigabe THEN
		
		//Zeitticks erzeugen
		fbLascoEUhr_0(Freigabe := TRUE);
		fbLascoZdxx_0(IN := fbLascoEUhr_0.Sekunde);
		sekTick	:= fbLascoZdxx_0.Q;
		
		//Funktionsbaustein Ansteuerung FU Abluftventilator
		fbFuAbluftventilator.AnsprechZeitFU		:= 15;
		fbFuAbluftventilator.BetrMldg			:= VentilatorInBetrieb;
		fbFuAbluftventilator.MinDrehzahl		:= DrehzahlMin;
		fbFuAbluftventilator.MaxDrehzahl		:= DrehzahlMax;
		fbFuAbluftventilator.RampeUpSek			:= RampeUp;
		fbFuAbluftventilator.RampeDownSek		:= RampeDown;
		fbFuAbluftventilator.Reset				:= QuitFehler;
		fbFuAbluftventilator.Tick				:= sekTick;
		fbFuAbluftventilator();
		FreigabeVentilatorOut					:= fbFuAbluftventilator.BetriebFU;
		DrehzahlVentilatorOut					:= fbFuAbluftventilator.DrehzahlFU;
		FehlerOut								:= fbFuAbluftventilator.StoerungFU;
		

		
		CASE step OF
			
			
			//AUS ***************************************************************************************
			0:
				
				IF stateEntry THEN
					stateEntry							:= FALSE;
					fbFuAbluftventilator.Freigabe		:= FALSE;
					fbFuAbluftventilator.SollDrehzahl	:= DrehzahlMin;
				END_IF
				
				IF QuitFehler THEN
					FehlerOut	:= FALSE;
				END_IF
				
				//Automatikbetrieb
				IF Automatik THEN
					stateEntry	:= TRUE;
					step		:= 1;
				//Handbetrieb EIN
				ELSIF Ein THEN
					stateEntry	:= TRUE;
					step		:= 2;
				END_IF
				
		
					
				
			//AUTOMATIKBETRIEB *****************************************************************************************
			1:
				
				IF stateEntry THEN
					stateEntry		:= FALSE;
				END_IF
				
				
				//Abluftfeuchte-Ist > Vorgabe -> VENTILATOR EIN
				IF ((AbluftFeuchteIst + Hysterese) >= AbluftFeuchteSoll) THEN
					fbFuAbluftventilator.Freigabe		:= TRUE;
					fbFuAbluftventilator.SollDrehzahl	:= DrehzahlSoll;
				//Abluftfeuchte-Ist < Vorgabe -> VENTILATOR AUS
				ELSIF ((AbluftFeuchteIst - Hysterese) <= AbluftFeuchteSoll) THEN
					fbFuAbluftventilator.Freigabe		:= FALSE;
					fbFuAbluftventilator.SollDrehzahl	:= DrehzahlMin;
				END_IF
		
				//Fehler -> AUS
				IF FehlerOut THEN
					stateEntry	:= TRUE;
					step		:= 0;
				//Handbetrieb aktiviert
				ELSIF Ein THEN
					stateEntry	:= TRUE;
					step		:= 2;
				//Keine Automatik -> AUS
				ELSIF NOT Automatik THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
					
				
			//HANDBETRIEB (EIN) *****************************************************************************************
			2:
				
				IF stateEntry THEN
					stateEntry		:= FALSE;
				END_IF
				
				fbFuAbluftventilator.Freigabe		:= TRUE;
				fbFuAbluftventilator.SollDrehzahl	:= DrehzahlSoll;
		
				//Fehler -> AUS
				IF FehlerOut THEN
					stateEntry	:= TRUE;
					step		:= 0;
				//Automatik aktiviert
				ELSIF Automatik THEN
					stateEntry	:= TRUE;
					step		:= 1;
				//Kein Handbetrieb -> AUS
				ELSIF NOT Ein THEN
					stateEntry	:= TRUE;
					step		:= 0;
				END_IF
					
		END_CASE	
		
	ELSE
		
		FreigabeVentilatorOut		:= FALSE;
		DrehzahlVentilatorOut		:= 0.0;
		FehlerOut					:= FALSE;
		stateEntry					:= TRUE;
		step						:= 0;
		
	END_IF
	
	
END_FUNCTION_BLOCK
