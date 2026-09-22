

PROGRAM _INIT
	
	stateEntry			:= TRUE;
	nextModus			:= STILLSTAND;
	
END_PROGRAM
	

PROGRAM _CYCLIC
	

	//Zeitticks generieren
	zdxxSekunden(IN		:= Echtzeit.Sekunde);
	sekTick				:= zdxxSekunden.Q;
	zdxxMinuten(IN 		:= Echtzeit.Minute);
	minTick				:= zdxxMinuten.Q;
	zdxxStunden(IN		:= Echtzeit.Stunde);
	stdTick				:= zdxxStunden.Q;
	zdxxTage(IN			:= Echtzeit.Tag);
	TagTick				:= zdxxTage.Q;
	
	
	
	//Schrittschaltwerk Ablaufsteuerung
	//=================================
	
	gAktModus := nextModus;

	actionUpdateStatus;
	
	CASE gAktModus OF
		
		
		//********************************************************************************************************************************************************************************************************
		STILLSTAND:	
			
			//*** State entry ***
			IF (stateEntry) THEN
				stateEntry 					:= FALSE;
				Strombegrenzung.Freigabe	:= FALSE;
				Tarifabschaltung.Freigabe	:= FALSE;
			END_IF
				
			
			//*** State during	***	
			actionStillstand;
			
			
			//*** State exit ***
			 
			//Startsignal
			IF (gCmdAnlage.Start AND gCmdAnlage.Auto) THEN
				nextModus 	:= BETRIEB;
				stateEntry 	:= TRUE;		
			//Stromausfall im Betrieb
			ELSIF (Nutzungsdaten.Allgemein.LetzterModus = BETRIEB)  THEN
				nextModus 	:= BETRIEB;
				stateEntry 	:= TRUE;
			//Testbetrieb
			ELSIF (gCmdAnlage.Test AND NOT gCmdAnlage.Auto) THEN
				nextModus 	:= IOTEST;
				stateEntry 	:= TRUE;
			ELSE
				nextModus 	:= gAktModus;
			END_IF
				
		
		//********************************************************************************************************************************************************************************************************
		BETRIEB:	
			
			//*** State entry ***
			IF (stateEntry) THEN
				stateEntry 								:= FALSE;
				hmiNutzungsdaten.Allgemein.LetzterModus	:= BETRIEB;
			END_IF
				
			
			//*** State during	***	
			actionBetrieb; 
			
			//Funktionsbaustein Strombegrenzung
			Strombegrenzung.Freigabe	:= TRUE;
			Strombegrenzung.AktZeit		:= Echtzeit.StdMin;
			
			//Funktionsbaustein Tarifabschaltung
			Tarifabschaltung.Freigabe	:= TRUE;
			Tarifabschaltung.AktZeit	:= Echtzeit.StdMin;
			
		
			//*** State exit ***
				
			//Stopp
			IF (gCmdAnlage.Stop) THEN
				hmiNutzungsdaten.Allgemein.LetzterModus	:= STILLSTAND;
				nextModus		:= STILLSTAND;
				stateEntry		:= TRUE;
			ELSE
				nextModus		:= gAktModus;
			END_IF
		
		
			//********************************************************************************************************************************************************************************************************
		IOTEST:
			
			//*** State entry ***	
			IF (stateEntry) THEN
				stateEntry 		:= FALSE;
			END_IF
			

			//*** State during	***			
			gStatusAnlage.Aktor[AKTOR_SCHRITTKETTE] := STATUS_TESTBETRIEB;
			
			
			//*** State exit ***
			
			//Testbetrieb abgeschlossen
			IF (NOT gCmdAnlage.Test) THEN
				nextModus 	:= STILLSTAND;
				stateEntry 	:= TRUE;
			ELSE
				nextModus 	:= gAktModus;
			END_IF
		
	
	END_CASE
	

	
	//Funktionsbausteine aufrufen
	//***************************
	Boxen();
	Aktoren.Abluftklappe();
	Aktoren.Abluftventilator();
	Aktoren.Brandschutzklappe();
	Aktoren.Heizregister();
	Aktoren.EntfeuchterFremd();
	Aktoren.KompressorModul1();
	Aktoren.KompressorModul2();
	Aktoren.Notstromaggregat();
	Aktoren.OelsumpfheizungModul1();
	Aktoren.OelsumpfheizungModul2();
	Aktoren.Scheitholzofen();
	Aktoren.VentUndKlappen();
	Aktoren.Warmluftofen();

	fbSchlechtwetterBox1();
	fbSchlechtwetterBox2();
	fbSchlechtwetterBox3();
	fbSchlechtwetterBox4();
	fbSchlechtwetterBox5();
	fbSchlechtwetterBox6();
	
	//Umschaltung Dachluft/Umluft je nach Ausstattung
	fbEntfUmschaltung_0.Freigabe					:= Betriebsparameter.Ausstattung.Umschaltklappe1 OR Betriebsparameter.Ausstattung.Umschaltklappe2;
	fbEntfUmschaltung_0.AbluftTemp					:= gStatusAnlage.AbluftTemperatur;
	fbEntfUmschaltung_0.DachluftTemp				:= gStatusAnlage.DachluftTemperatur;
	fbEntfUmschaltung_0.FrischluftTemp				:= gStatusAnlage.FrischluftTemperatur;
	fbEntfUmschaltung_0.FrischlDachlTempUmschaltung	:= Betriebsparameter.Umschaltklappen.TemperaturUmschaltung;
	fbEntfUmschaltung_0.DifferenzTempUmschaltung	:= Betriebsparameter.Umschaltklappen.TempDifferenzUmschaltung;
	fbEntfUmschaltung_0.Hysterese					:= Betriebsparameter.Umschaltklappen.Hysterese;
	fbEntfUmschaltung_0.SensorAbluftVhd				:= Betriebsparameter.Ausstattung.SensorAbluft;
	fbEntfUmschaltung_0.SensorDachluftVhd			:= Betriebsparameter.Ausstattung.SensorDachluft;
	fbEntfUmschaltung_0.SensorFrischluftVhd			:= Betriebsparameter.Ausstattung.SensorFrischluft;
	fbEntfUmschaltung_0.StatusSensorAbluftOk		:= NOT alarmFehler[FEHLER_SENSOR_ABLUFT];
	fbEntfUmschaltung_0.StatusSensorDachluftOk		:= NOT alarmFehler[FEHLER_SENSOR_DACHLUFT];
	fbEntfUmschaltung_0.StatusSensorFrischluftOk	:= NOT alarmFehler[FEHLER_SENSOR_FRISCHLUFT];
	fbEntfUmschaltung_0.Umschaltverz				:= Betriebsparameter.Umschaltklappen.Umschaltverzoegerung;
	fbEntfUmschaltung_0();

	//Tarifabschaltung
	Tarifabschaltung.StartMin1	:= Betriebsparameter.Tarifabschaltung.Zeitfenster.StartMin;
	Tarifabschaltung.StartStd1	:= Betriebsparameter.Tarifabschaltung.Zeitfenster.StartStd;
	Tarifabschaltung.StoppMin1	:= Betriebsparameter.Tarifabschaltung.Zeitfenster.StoppMin;	
	Tarifabschaltung.StoppStd1	:= Betriebsparameter.Tarifabschaltung.Zeitfenster.StoppStd;	
	Tarifabschaltung.VorlaufzeitLuftaufbMin	:= Betriebsparameter.Tarifabschaltung.VorlaufzeitAbschaltungLuftaufb;
	Tarifabschaltung();
 	
	//Strombegrenzung	
	//Start- und Stoppzeiten in Format "hhmm" umrechnen
	loc_StrombegrStart1			:= (Betriebsparameter.Strombegrenzung.Zeitfenster.StartStd * 100) + Betriebsparameter.Strombegrenzung.Zeitfenster.StartMin;
	loc_StrombegrStopp1			:= (Betriebsparameter.Strombegrenzung.Zeitfenster.StoppStd * 100) + Betriebsparameter.Strombegrenzung.Zeitfenster.StoppMin;
	Strombegrenzung.StartZeit1	:= loc_StrombegrStart1;
	Strombegrenzung.StoppZeit1	:= loc_StrombegrStopp1;
	Strombegrenzung();

	
END_PROGRAM