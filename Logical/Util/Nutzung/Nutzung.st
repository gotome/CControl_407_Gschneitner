

PROGRAM _INIT
	
	initOk		:= FALSE;
	stateEntry	:= TRUE;
	
END_PROGRAM
	


PROGRAM _CYCLIC


	//Nutzungsdaten auswerten
	//=======================


	//Ticks erstellen
	//***************
	fbLascoZdxx_0(IN 	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_0.Q;
	
	fbLascoZdxx_1(IN 	:= Echtzeit.Minute);
	minTick				:= fbLascoZdxx_1.Q;
	
	fbLascoZdxx_2(IN	:= Echtzeit.Tag);
	tagTick				:= fbLascoZdxx_2.Q;
	
	fbLascoZdxx_3(IN	:= Echtzeit.Monat);
	monatTick			:= fbLascoZdxx_3.Q;
	
	fbLascoZdxx_4(IN	:= Echtzeit.Jahr);
	jahrTick			:= fbLascoZdxx_4.Q;
	
	
	//======================================================================================================================================================
	//Laufzeit Ölsumpfheizung überwachen
	//======================================================================================================================================================
	
	IF initOk AND stateEntry THEN
		stateEntry	:= FALSE;
		
		loc_UhrzeitAktuellUdint	:= DT_TO_UDINT(DTGetTime_0.DT1);
		loc_UhrzeitMEM_Udint	:= DT_TO_UDINT(hmiNutzungsdaten.Allgemein.DatumLetzterBetrieb);
		loc_ZeitStromausfall	:= (loc_UhrzeitAktuellUdint - loc_UhrzeitMEM_Udint) * 1000;
		
		//Wenn Max. Zeit Stromlos überschritten -> Neustart Mindestlaufzeit Ölsumpfheizung
		IF loc_ZeitStromausfall > Betriebsparameter.Entfeuchter.MaxZeitStromlos THEN
			gMindestlaufzOelsumpfOk	:= FALSE;
			loc_MinLaufzeitOelsumpf	:= Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf;
		ELSIF NOT gMindestlaufzOelsumpfOk THEN
			//Doppelte Zeit Stromausfall + Restlaufzeit kleiner Mindestlaufzeit -> Restzeit + Zeit Stromausfall *2
			IF (Betriebsparameter.Entfeuchter.RestzeitLaufzOelsumpf + (loc_ZeitStromausfall * 2)) <
				Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf THEN
				loc_MinLaufzeitOelsumpf	:= Betriebsparameter.Entfeuchter.RestzeitLaufzOelsumpf + (loc_ZeitStromausfall * 2);
			ELSE
				loc_MinLaufzeitOelsumpf	:= Betriebsparameter.Entfeuchter.MindestlaufzeitOelsumpf;
			END_IF
		ELSE
			loc_MinLaufzeitOelsumpf	:= 0;
		END_IF
	END_IF
	
	//Mindestlaufzeit Ölsumpfheizung starten, wenn Ölsumpfheizung aktiv
	TON_MinLaufzeitOelsumpfh(IN:= doOelsumpfheizungEinModul1 AND initOk AND NOT stateEntry, PT:= loc_MinLaufzeitOelsumpf);
	IF TON_MinLaufzeitOelsumpfh.Q THEN
		gMindestlaufzOelsumpfOk	:= TRUE;
	END_IF
	
	//Aktuelle Uhrzeit und Restlaufzeit minütlich speichern
	DTGetTime_0(enable := TRUE);
	IF minTick AND initOk AND NOT stateEntry THEN
		hmiNutzungsdaten.Allgemein.DatumLetzterBetrieb			:= DTGetTime_0.DT1;
		hmiParameter.Entfeuchter.RestzeitLaufzOelsumpf		:= loc_MinLaufzeitOelsumpf - TIME_TO_UDINT(TON_MinLaufzeitOelsumpfh.ET);
	END_IF
	
	
	//======================================================================================================================================================
	//Betriebsstunden (nicht rückstellbar)
	//======================================================================================================================================================

	//Ventilator 1
	//************
	fbMinutenVentilator1Ges.Aktiv		:= diVentilator1InBetrieb AND doVentilator1Ein;
	fbMinutenVentilator1Ges.sekTick		:= sekTick;
	fbMinutenVentilator1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Ventilator1Min);
	fbMinutenVentilator1Ges();
	
	fbStundenVentilator1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Ventilator1Min);
	fbStundenVentilator1Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Ventilator1Std);
	fbStundenVentilator1Ges();
	
	//Ventilator 2
	//************
	fbMinutenVentilator2Ges.Aktiv		:= diVentilator2InBetrieb AND doVentilator2Ein;
	fbMinutenVentilator2Ges.sekTick		:= sekTick;
	fbMinutenVentilator2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Ventilator2Min);
	fbMinutenVentilator2Ges();
	
	fbStundenVentilator2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Ventilator2Min);
	fbStundenVentilator2Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Ventilator2Std);
	fbStundenVentilator2Ges();
	
	//Ölsumpfheizung 
	//**************
	fbMinutenOelsumpfhGes.Aktiv			:= doOelsumpfheizungEinModul1;
	fbMinutenOelsumpfhGes.sekTick		:= sekTick;
	fbMinutenOelsumpfhGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.OelsumpfheizungMin);
	fbMinutenOelsumpfhGes();
	
	fbStundenOelsumpfhGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.OelsumpfheizungMin);
	fbStundenOelsumpfhGes.Stunden		:= ADR(hmiNutzungsdaten.BstGes.OelsumpfheizungStd);
	fbStundenOelsumpfhGes();
	
	//Kompressor 1
	//************
	fbMinutenKompressor1Ges.Aktiv		:= doKompressorEinModul1 OR doEntfFremdFreigabe; //ab V2.0.0
	fbMinutenKompressor1Ges.sekTick		:= sekTick;
	fbMinutenKompressor1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Kompressor1Min);
	fbMinutenKompressor1Ges();
	
	fbStundenKompressor1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Kompressor1Min);
	fbStundenKompressor1Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Kompressor1Std);
	fbStundenKompressor1Ges();
	
	//Kompressor 2
	//************
	fbMinutenKompressor2Ges.Aktiv		:= doKompressorEinModul2;
	fbMinutenKompressor2Ges.sekTick		:= sekTick;
	fbMinutenKompressor2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Kompressor2Min);
	fbMinutenKompressor2Ges();
	
	fbStundenKompressor2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Kompressor2Min);
	fbStundenKompressor2Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Kompressor2Std);
	fbStundenKompressor2Ges();
	
	//Warmluftofen
	//************
	fbMinutenWarmluftofenGes.Aktiv		:= Aktoren.Warmluftofen.WarmluftofenAktiv;
	fbMinutenWarmluftofenGes.sekTick	:= sekTick;
	fbMinutenWarmluftofenGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.WarmluftofenMin);
	fbMinutenWarmluftofenGes();
	
	fbStundenWarmluftofenGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.WarmluftofenMin);
	fbStundenWarmluftofenGes.Stunden	:= ADR(hmiNutzungsdaten.BstGes.WarmluftofenStd);
	fbStundenWarmluftofenGes();
	
	//Heizregister
	//************
	fbMinutenHeizregisterGes.Aktiv		:= doHeizregisterEin;
	fbMinutenHeizregisterGes.sekTick	:= sekTick;
	fbMinutenHeizregisterGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.HeizregisterMin);
	fbMinutenHeizregisterGes();
	
	fbStundenHeizregisterGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.HeizregisterMin);
	fbStundenHeizregisterGes.Stunden	:= ADR(hmiNutzungsdaten.BstGes.HeizregisterStd);
	fbStundenHeizregisterGes();
	
	//Scheitholzofen
	//**************
	fbMinutenScheitholzofenGes.Aktiv	:= Aktoren.Scheitholzofen.ScheitholzofenAktiv;
	fbMinutenScheitholzofenGes.sekTick	:= sekTick;
	fbMinutenScheitholzofenGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.ScheitholzofenMin);
	fbMinutenScheitholzofenGes();
	
	fbStundenScheitholzofenGes.Minuten	:= ADR(hmiNutzungsdaten.BstGes.ScheitholzofenMin);
	fbStundenScheitholzofenGes.Stunden	:= ADR(hmiNutzungsdaten.BstGes.ScheitholzofenStd);
	fbStundenScheitholzofenGes();
	
	//Abtauung Modul 1
	//****************
	fbMinutenAbtauung1Ges.Aktiv			:= Aktoren.KompressorModul1.AbtauungAktiv;
	fbMinutenAbtauung1Ges.sekTick		:= sekTick;
	fbMinutenAbtauung1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Abtauung1Min);
	fbMinutenAbtauung1Ges();
	
	fbStundenAbtauung1Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Abtauung1Min);
	fbStundenAbtauung1Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Abtauung1Std);
	fbStundenAbtauung1Ges();
	
	//Abtauung Modul 2
	//****************
	fbMinutenAbtauung2Ges.Aktiv			:= Aktoren.KompressorModul2.AbtauungAktiv;
	fbMinutenAbtauung2Ges.sekTick		:= sekTick;
	fbMinutenAbtauung2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Abtauung2Min);
	fbMinutenAbtauung2Ges();
	
	fbStundenAbtauung2Ges.Minuten		:= ADR(hmiNutzungsdaten.BstGes.Abtauung2Min);
	fbStundenAbtauung2Ges.Stunden		:= ADR(hmiNutzungsdaten.BstGes.Abtauung2Std);
	fbStundenAbtauung2Ges();
	
	//Abluftventilator
	//****************
	fbMinutenAbluftventGes.Aktiv		:= Betriebsparameter.Ausstattung.Abluftventilator AND diAbluftventInBetrieb;
	fbMinutenAbluftventGes.sekTick		:= sekTick;
	fbMinutenAbluftventGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.AbluftventMin);
	fbMinutenAbluftventGes();
	
	fbStundenAbluftventGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.AbluftventMin);
	fbStundenAbluftventGes.Stunden		:= ADR(hmiNutzungsdaten.BstGes.AbluftventStd);
	fbStundenAbluftventGes();
	
	//Frischluftbetrieb
	//*****************
	fbMinutenFrischluftbetrGes.Aktiv		:= gStatusAnlage.FrischluftbetriebAktiv AND (gAktModus = BETRIEB);
	fbMinutenFrischluftbetrGes.sekTick		:= sekTick;
	fbMinutenFrischluftbetrGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.FrischluftbetrMin);
	fbMinutenFrischluftbetrGes();
	
	fbStundenFrischluftbetrGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.FrischluftbetrMin);
	fbStundenFrischluftbetrGes.Stunden		:= ADR(hmiNutzungsdaten.BstGes.FrischluftbetrStd);
	fbStundenFrischluftbetrGes();
	
	//Umluftbetrieb
	//*************
	fbMinutenUmluftbetrGes.Aktiv		:= gStatusAnlage.UmluftbetriebAktiv AND (gAktModus = BETRIEB);
	fbMinutenUmluftbetrGes.sekTick		:= sekTick;
	fbMinutenUmluftbetrGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.UmluftbetrMin);
	fbMinutenUmluftbetrGes();
	
	fbStundenUmluftbetrGes.Minuten		:= ADR(hmiNutzungsdaten.BstGes.UmluftbetrMin);
	fbStundenUmluftbetrGes.Stunden		:= ADR(hmiNutzungsdaten.BstGes.UmluftbetrStd);
	fbStundenUmluftbetrGes();
	
	//Box 1
	//*****
	fbMinutenBox1Ges.Aktiv		:= Boxen.Box1Out.BoxBereit;
	fbMinutenBox1Ges.sekTick	:= sekTick;
	fbMinutenBox1Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box1Min);
	fbMinutenBox1Ges();
	
	fbStundenBox1Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box1Min);
	fbStundenBox1Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box1Std);
	fbStundenBox1Ges();
	
	//Box 2
	//*****
	fbMinutenBox2Ges.Aktiv		:= Boxen.Box2Out.BoxBereit;
	fbMinutenBox2Ges.sekTick	:= sekTick;
	fbMinutenBox2Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box2Min);
	fbMinutenBox2Ges();
	
	fbStundenBox2Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box2Min);
	fbStundenBox2Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box2Std);
	fbStundenBox2Ges();
	
	//Box 3
	//*****
	fbMinutenBox3Ges.Aktiv		:= Boxen.Box3Out.BoxBereit;
	fbMinutenBox3Ges.sekTick	:= sekTick;
	fbMinutenBox3Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box3Min);
	fbMinutenBox3Ges();
	
	fbStundenBox3Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box3Min);
	fbStundenBox3Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box3Std);
	fbStundenBox3Ges();
	
	//Box 4
	//*****
	fbMinutenBox4Ges.Aktiv		:= Boxen.Box4Out.BoxBereit;
	fbMinutenBox4Ges.sekTick	:= sekTick;
	fbMinutenBox4Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box4Min);
	fbMinutenBox4Ges();
	
	fbStundenBox4Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box4Min);
	fbStundenBox4Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box4Std);
	fbStundenBox4Ges();
	
	//Box 5
	//*****
	fbMinutenBox5Ges.Aktiv		:= Boxen.Box5Out.BoxBereit;
	fbMinutenBox5Ges.sekTick	:= sekTick;
	fbMinutenBox5Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box5Min);
	fbMinutenBox5Ges();
	
	fbStundenBox5Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box5Min);
	fbStundenBox5Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box5Std);
	fbStundenBox5Ges();
	
	//Box 6
	//*****
	fbMinutenBox6Ges.Aktiv		:= Boxen.Box6Out.BoxBereit;
	fbMinutenBox6Ges.sekTick	:= sekTick;
	fbMinutenBox6Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box6Min);
	fbMinutenBox6Ges();
	
	fbStundenBox6Ges.Minuten	:= ADR(hmiNutzungsdaten.BstGes.Box6Min);
	fbStundenBox6Ges.Stunden	:= ADR(hmiNutzungsdaten.BstGes.Box6Std);
	fbStundenBox6Ges();
	
	
	//======================================================================================================================================================
	//Betriebsstunden (rückstellbar)
	//======================================================================================================================================================

	//Ventilator 1
	//************
	fbMinutenVentilator1.Aktiv		:= diVentilator1InBetrieb AND doVentilator1Ein;
	fbMinutenVentilator1.sekTick	:= sekTick;
	fbMinutenVentilator1.Minuten	:= ADR(hmiNutzungsdaten.Bst.Ventilator1Min);
	fbMinutenVentilator1();
	
	fbStundenVentilator1.Minuten	:= ADR(hmiNutzungsdaten.Bst.Ventilator1Min);
	fbStundenVentilator1.Stunden	:= ADR(hmiNutzungsdaten.Bst.Ventilator1Std);
	fbStundenVentilator1();
	
	//Ventilator 2
	//************
	fbMinutenVentilator2.Aktiv		:= diVentilator2InBetrieb AND doVentilator2Ein;
	fbMinutenVentilator2.sekTick	:= sekTick;
	fbMinutenVentilator2.Minuten	:= ADR(hmiNutzungsdaten.Bst.Ventilator2Min);
	fbMinutenVentilator2();
	
	fbStundenVentilator2.Minuten	:= ADR(hmiNutzungsdaten.Bst.Ventilator2Min);
	fbStundenVentilator2.Stunden	:= ADR(hmiNutzungsdaten.Bst.Ventilator2Std);
	fbStundenVentilator2();
	
	//Ölsumpfheizung 
	//**************
	fbMinutenOelsumpfh.Aktiv		:= doOelsumpfheizungEinModul1;
	fbMinutenOelsumpfh.sekTick		:= sekTick;
	fbMinutenOelsumpfh.Minuten		:= ADR(hmiNutzungsdaten.Bst.OelsumpfheizungMin);
	fbMinutenOelsumpfh();
	
	fbStundenOelsumpfh.Minuten		:= ADR(hmiNutzungsdaten.Bst.OelsumpfheizungMin);
	fbStundenOelsumpfh.Stunden		:= ADR(hmiNutzungsdaten.Bst.OelsumpfheizungStd);
	fbStundenOelsumpfh();	
	
	//Kompressor 1
	//************
	fbMinutenKompressor1.Aktiv			:= doKompressorEinModul1 OR doEntfFremdFreigabe; //ab V2.0.0
	fbMinutenKompressor1.sekTick		:= sekTick;
	fbMinutenKompressor1.Minuten		:= ADR(hmiNutzungsdaten.Bst.Kompressor1Min);
	fbMinutenKompressor1();
	
	fbStundenKompressor1.Minuten		:= ADR(hmiNutzungsdaten.Bst.Kompressor1Min);
	fbStundenKompressor1.Stunden		:= ADR(hmiNutzungsdaten.Bst.Kompressor1Std);
	fbStundenKompressor1();
	
	//Kompressor 2
	//************
	fbMinutenKompressor2.Aktiv			:= doKompressorEinModul2;
	fbMinutenKompressor2.sekTick		:= sekTick;
	fbMinutenKompressor2.Minuten		:= ADR(hmiNutzungsdaten.Bst.Kompressor2Min);
	fbMinutenKompressor2();
	
	fbStundenKompressor2.Minuten		:= ADR(hmiNutzungsdaten.Bst.Kompressor2Min);
	fbStundenKompressor2.Stunden		:= ADR(hmiNutzungsdaten.Bst.Kompressor2Std);
	fbStundenKompressor2();
	
	//Warmluftofen
	//************
	fbMinutenWarmluftofen.Aktiv		:= Aktoren.Warmluftofen.WarmluftofenAktiv;
	fbMinutenWarmluftofen.sekTick	:= sekTick;
	fbMinutenWarmluftofen.Minuten	:= ADR(hmiNutzungsdaten.Bst.WarmluftofenMin);
	fbMinutenWarmluftofen();
	
	fbStundenWarmluftofen.Minuten	:= ADR(hmiNutzungsdaten.Bst.WarmluftofenMin);
	fbStundenWarmluftofen.Stunden	:= ADR(hmiNutzungsdaten.Bst.WarmluftofenStd);
	fbStundenWarmluftofen();
	
	//Heizregister
	//************
	fbMinutenHeizregister.Aktiv		:= doHeizregisterEin;
	fbMinutenHeizregister.sekTick	:= sekTick;
	fbMinutenHeizregister.Minuten	:= ADR(hmiNutzungsdaten.Bst.HeizregisterMin);
	fbMinutenHeizregister();
	
	fbStundenHeizregister.Minuten	:= ADR(hmiNutzungsdaten.Bst.HeizregisterMin);
	fbStundenHeizregister.Stunden	:= ADR(hmiNutzungsdaten.Bst.HeizregisterStd);
	fbStundenHeizregister();
	
	//Scheitholzofen
	//**************
	fbMinutenScheitholzofen.Aktiv	:= Aktoren.Scheitholzofen.ScheitholzofenAktiv;
	fbMinutenScheitholzofen.sekTick	:= sekTick;
	fbMinutenScheitholzofen.Minuten	:= ADR(hmiNutzungsdaten.Bst.ScheitholzofenMin);
	fbMinutenScheitholzofen();
	
	fbStundenScheitholzofen.Minuten	:= ADR(hmiNutzungsdaten.Bst.ScheitholzofenMin);
	fbStundenScheitholzofen.Stunden	:= ADR(hmiNutzungsdaten.Bst.ScheitholzofenStd);
	fbStundenScheitholzofen();
	
	//Abtauung Modul 1
	//****************
	fbMinutenAbtauung1.Aktiv		:= Aktoren.KompressorModul1.AbtauungAktiv;
	fbMinutenAbtauung1.sekTick		:= sekTick;
	fbMinutenAbtauung1.Minuten		:= ADR(hmiNutzungsdaten.Bst.Abtauung1Min);
	fbMinutenAbtauung1();
	
	fbStundenAbtauung1.Minuten		:= ADR(hmiNutzungsdaten.Bst.Abtauung1Min);
	fbStundenAbtauung1.Stunden		:= ADR(hmiNutzungsdaten.Bst.Abtauung1Std);
	fbStundenAbtauung1();
	
	//Abtauung Modul 2
	//****************
	fbMinutenAbtauung2.Aktiv		:= Aktoren.KompressorModul2.AbtauungAktiv;
	fbMinutenAbtauung2.sekTick		:= sekTick;
	fbMinutenAbtauung2.Minuten		:= ADR(hmiNutzungsdaten.Bst.Abtauung2Min);
	fbMinutenAbtauung2();
	
	fbStundenAbtauung2.Minuten		:= ADR(hmiNutzungsdaten.Bst.Abtauung2Min);
	fbStundenAbtauung2.Stunden		:= ADR(hmiNutzungsdaten.Bst.Abtauung2Std);
	fbStundenAbtauung2();
	
	//Abluftventilator
	//****************
	fbMinutenAbluftvent.Aktiv		:= Betriebsparameter.Ausstattung.Abluftventilator AND diAbluftventInBetrieb;
	fbMinutenAbluftvent.sekTick		:= sekTick;
	fbMinutenAbluftvent.Minuten		:= ADR(hmiNutzungsdaten.Bst.AbluftventMin);
	fbMinutenAbluftvent();
	
	fbStundenAbluftvent.Minuten		:= ADR(hmiNutzungsdaten.Bst.AbluftventMin);
	fbStundenAbluftvent.Stunden		:= ADR(hmiNutzungsdaten.Bst.AbluftventStd);
	fbStundenAbluftvent();
	
	//Frischluftbetrieb
	//*****************
	fbMinutenFrischluftbetr.Aktiv		:= gStatusAnlage.FrischluftbetriebAktiv AND (gAktModus = BETRIEB);
	fbMinutenFrischluftbetr.sekTick		:= sekTick;
	fbMinutenFrischluftbetr.Minuten		:= ADR(hmiNutzungsdaten.Bst.FrischluftbetrMin);
	fbMinutenFrischluftbetr();
	
	fbStundenFrischluftbetr.Minuten		:= ADR(hmiNutzungsdaten.Bst.FrischluftbetrMin);
	fbStundenFrischluftbetr.Stunden		:= ADR(hmiNutzungsdaten.Bst.FrischluftbetrStd);
	fbStundenFrischluftbetr();
	
	//Umluftbetrieb
	//*************
	fbMinutenUmluftbetr.Aktiv		:= gStatusAnlage.UmluftbetriebAktiv AND (gAktModus = BETRIEB);
	fbMinutenUmluftbetr.sekTick		:= sekTick;
	fbMinutenUmluftbetr.Minuten		:= ADR(hmiNutzungsdaten.Bst.UmluftbetrMin);
	fbMinutenUmluftbetr();
	
	fbStundenUmluftbetr.Minuten		:= ADR(hmiNutzungsdaten.Bst.UmluftbetrMin);
	fbStundenUmluftbetr.Stunden		:= ADR(hmiNutzungsdaten.Bst.UmluftbetrStd);
	fbStundenUmluftbetr();
	
	
	
	//======================================================================================================================================================
	//Stundenaufzeichnung für Trocknungsbilanzen (Gesamtstunden, Ventilatorbetrieb, Betrieb mit Luftaufbereitung)
	//======================================================================================================================================================
	
	//Box 1
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox1.Aktiv		:= Boxen.Box1Out.BoxBereit;
	fbMinutenBox1.sekTick	:= sekTick;
	fbMinutenBox1.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box1Min);
	fbMinutenBox1();
	
	fbStundenBox1.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box1Min);
	fbStundenBox1.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box1Std);
	fbStundenBox1();
	
	//Ventilatorbetrieb
	fbMinutenVentBox1.Aktiv := Boxen.Box1Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[1].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[1].Ventilator2));
	fbMinutenVentBox1.sekTick := sekTick;
	fbMinutenVentBox1.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1);
	fbMinutenVentBox1();
	
	fbStundenVentBox1.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1);
	fbStundenVentBox1.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1);
	fbStundenVentBox1();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox1.Aktiv := Boxen.Box1Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb) AND Betriebsparameter.Boxen[1].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[1].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[1].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[1].Warmluftofen));
	fbMinutenLuftaufbBox1.sekTick := sekTick;
	fbMinutenLuftaufbBox1.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1);
	fbMinutenLuftaufbBox1();
	
	fbStundenLuftaufbBox1.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1);
	fbStundenLuftaufbBox1.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1);
	fbStundenLuftaufbBox1();
	
	
	//Box 2
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox2.Aktiv		:= Boxen.Box2Out.BoxBereit;
	fbMinutenBox2.sekTick	:= sekTick;
	fbMinutenBox2.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box2Min);
	fbMinutenBox2();
	
	fbStundenBox2.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box2Min);
	fbStundenBox2.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box2Std);
	fbStundenBox2();
	
	//Ventilatorbetrieb
	fbMinutenVentBox2.Aktiv := Boxen.Box2Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[2].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[2].Ventilator2));
	fbMinutenVentBox2.sekTick := sekTick;
	fbMinutenVentBox2.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2);
	fbMinutenVentBox2();
	
	fbStundenVentBox2.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2);
	fbStundenVentBox2.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2);
	fbStundenVentBox2();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox2.Aktiv := Boxen.Box2Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb)  AND Betriebsparameter.Boxen[2].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[2].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[2].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[2].Warmluftofen)) ;
	fbMinutenLuftaufbBox2.sekTick := sekTick;
	fbMinutenLuftaufbBox2.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2);
	fbMinutenLuftaufbBox2();
	
	fbStundenLuftaufbBox2.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2);
	fbStundenLuftaufbBox2.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2);
	fbStundenLuftaufbBox2();
	
	//Box 3
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox3.Aktiv		:= Boxen.Box3Out.BoxBereit;
	fbMinutenBox3.sekTick	:= sekTick;
	fbMinutenBox3.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box3Min);
	fbMinutenBox3();
	
	fbStundenBox3.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box3Min);
	fbStundenBox3.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box3Std);
	fbStundenBox3();
	
	//Ventilatorbetrieb
	fbMinutenVentBox3.Aktiv := Boxen.Box3Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[3].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[3].Ventilator2));
	fbMinutenVentBox3.sekTick := sekTick;
	fbMinutenVentBox3.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3);
	fbMinutenVentBox3();
	
	fbStundenVentBox3.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3);
	fbStundenVentBox3.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3);
	fbStundenVentBox3();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox3.Aktiv := Boxen.Box3Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb)  AND Betriebsparameter.Boxen[3].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[3].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[3].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[3].Warmluftofen)) ;
	fbMinutenLuftaufbBox3.sekTick := sekTick;
	fbMinutenLuftaufbBox3.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3);
	fbMinutenLuftaufbBox3();
	
	fbStundenLuftaufbBox3.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3);
	fbStundenLuftaufbBox3.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3);
	fbStundenLuftaufbBox3();
	
	//Box 4
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox4.Aktiv		:= Boxen.Box4Out.BoxBereit;
	fbMinutenBox4.sekTick	:= sekTick;
	fbMinutenBox4.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box4Min);
	fbMinutenBox4();
	
	fbStundenBox4.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box4Min);
	fbStundenBox4.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box4Std);
	fbStundenBox4();
	
	//Ventilatorbetrieb
	fbMinutenVentBox4.Aktiv := Boxen.Box4Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[4].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[4].Ventilator2));
	fbMinutenVentBox4.sekTick := sekTick;
	fbMinutenVentBox4.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4);
	fbMinutenVentBox4();
	
	fbStundenVentBox4.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4);
	fbStundenVentBox4.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4);
	fbStundenVentBox4();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox4.Aktiv := Boxen.Box4Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb)  AND Betriebsparameter.Boxen[4].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[4].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[4].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[4].Warmluftofen)) ;
	fbMinutenLuftaufbBox4.sekTick := sekTick;
	fbMinutenLuftaufbBox4.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4);
	fbMinutenLuftaufbBox4();
	
	fbStundenLuftaufbBox4.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4);
	fbStundenLuftaufbBox4.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4);
	fbStundenLuftaufbBox4();
	
	
	//Box 5
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox5.Aktiv		:= Boxen.Box5Out.BoxBereit;
	fbMinutenBox5.sekTick	:= sekTick;
	fbMinutenBox5.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box5Min);
	fbMinutenBox5();
	
	fbStundenBox5.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box5Min);
	fbStundenBox5.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box5Std);
	fbStundenBox5();
	
	//Ventilatorbetrieb
	fbMinutenVentBox5.Aktiv := Boxen.Box5Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[5].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[5].Ventilator2));
	fbMinutenVentBox5.sekTick := sekTick;
	fbMinutenVentBox5.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5);
	fbMinutenVentBox5();
	
	fbStundenVentBox5.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5);
	fbStundenVentBox5.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5);
	fbStundenVentBox5();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox5.Aktiv := Boxen.Box5Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb)  AND Betriebsparameter.Boxen[5].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[5].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[5].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[5].Warmluftofen)) ;
	fbMinutenLuftaufbBox5.sekTick := sekTick;
	fbMinutenLuftaufbBox5.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5);
	fbMinutenLuftaufbBox5();
	
	fbStundenLuftaufbBox5.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5);
	fbStundenLuftaufbBox5.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5);
	fbStundenLuftaufbBox5();
	
	
	//Box 6
	//*******************************************************************************************************************************
	
	//Gesamt
	fbMinutenBox6.Aktiv		:= Boxen.Box6Out.BoxBereit;
	fbMinutenBox6.sekTick	:= sekTick;
	fbMinutenBox6.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box6Min);
	fbMinutenBox6();
	
	fbStundenBox6.Minuten	:= ADR(hmiNutzungsdaten.Bst.Box6Min);
	fbStundenBox6.Stunden	:= ADR(hmiNutzungsdaten.Bst.Box6Std);
	fbStundenBox6();
	
	//Ventilatorbetrieb
	fbMinutenVentBox6.Aktiv := Boxen.Box6Out.BoxBereit AND ((diVentilator1InBetrieb AND Betriebsparameter.Boxen[6].Ventilator1) OR
	(diVentilator2InBetrieb AND Betriebsparameter.Boxen[6].Ventilator2));
	fbMinutenVentBox6.sekTick := sekTick;
	fbMinutenVentBox6.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6);
	fbMinutenVentBox6();
	
	fbStundenVentBox6.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6);
	fbStundenVentBox6.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6);
	fbStundenVentBox6();
	
	//Betrieb mit Luftaufbereitung
	fbMinutenLuftaufbBox6.Aktiv := Boxen.Box6Out.BoxBereit AND (((diBetriebsmldgKompressorModul1 OR diEntfeuchterFremdInBetrieb)  AND Betriebsparameter.Boxen[6].Luftentfeuchter) OR
	(diScheitholzofenInBetrieb AND Betriebsparameter.Boxen[6].Scheitholzofen) OR (doHeizregisterEin AND Betriebsparameter.Boxen[6].Heizregister) OR
	(Aktoren.Warmluftofen.WarmluftofenAktiv AND Betriebsparameter.Boxen[6].Warmluftofen)) ;
	fbMinutenLuftaufbBox6.sekTick := sekTick;
	fbMinutenLuftaufbBox6.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6);
	fbMinutenLuftaufbBox6();
	
	fbStundenLuftaufbBox6.Minuten := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6);
	fbStundenLuftaufbBox6.Stunden := ADR(hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6);
	fbStundenLuftaufbBox6();
	
	
	//======================================================================================================================================================
	//Restlaufzeiten von Boxen im Intervall- oder Nachtrocknungsbetrieb ermitteln
	//======================================================================================================================================================
	
	//Restzeiten Box 1
	fbRestzeitBox1.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox1.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox1.Freigabe			:= Betriebsparameter.Boxen[1].IntervallbetriebEin OR Betriebsparameter.Boxen[1].NachtrocknungEin;
	IF Betriebsparameter.Boxen[1].IntervallbetriebEin THEN
		fbRestzeitBox1.ZeitfensterIn := ADR(Betriebsparameter.Boxen[1].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox1.ZeitfensterIn := ADR(Betriebsparameter.Boxen[1].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox1();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box1Minuten	:= fbRestzeitBox1.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box1Stunden	:= fbRestzeitBox1.RestzeitStundenOut;
	
	
	//Restzeiten Box 2
	fbRestzeitBox2.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox2.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox2.Freigabe			:= Betriebsparameter.Boxen[2].IntervallbetriebEin OR Betriebsparameter.Boxen[2].NachtrocknungEin;
	IF Betriebsparameter.Boxen[2].IntervallbetriebEin THEN
		fbRestzeitBox2.ZeitfensterIn := ADR(Betriebsparameter.Boxen[2].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox2.ZeitfensterIn := ADR(Betriebsparameter.Boxen[2].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox2();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box2Minuten	:= fbRestzeitBox2.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box2Stunden	:= fbRestzeitBox2.RestzeitStundenOut;
	
	
	//Restzeiten Box 3
	fbRestzeitBox3.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox3.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox3.Freigabe			:= Betriebsparameter.Boxen[3].IntervallbetriebEin OR Betriebsparameter.Boxen[3].NachtrocknungEin;
	IF Betriebsparameter.Boxen[3].IntervallbetriebEin THEN
		fbRestzeitBox3.ZeitfensterIn := ADR(Betriebsparameter.Boxen[3].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox3.ZeitfensterIn := ADR(Betriebsparameter.Boxen[3].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox3();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box3Minuten	:= fbRestzeitBox3.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box3Stunden	:= fbRestzeitBox3.RestzeitStundenOut;
	
	
	//Restzeiten Box 4
	fbRestzeitBox4.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox4.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox4.Freigabe			:= Betriebsparameter.Boxen[4].IntervallbetriebEin OR Betriebsparameter.Boxen[4].NachtrocknungEin;
	IF Betriebsparameter.Boxen[4].IntervallbetriebEin THEN
		fbRestzeitBox4.ZeitfensterIn := ADR(Betriebsparameter.Boxen[4].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox4.ZeitfensterIn := ADR(Betriebsparameter.Boxen[4].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox4();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box4Minuten	:= fbRestzeitBox4.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box4Stunden	:= fbRestzeitBox4.RestzeitStundenOut;
	
	//Restzeiten Box 5
	fbRestzeitBox5.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox5.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox5.Freigabe			:= Betriebsparameter.Boxen[5].IntervallbetriebEin OR Betriebsparameter.Boxen[5].NachtrocknungEin;
	IF Betriebsparameter.Boxen[5].IntervallbetriebEin THEN
		fbRestzeitBox5.ZeitfensterIn := ADR(Betriebsparameter.Boxen[5].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox5.ZeitfensterIn := ADR(Betriebsparameter.Boxen[5].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox5();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box5Minuten	:= fbRestzeitBox5.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box5Stunden	:= fbRestzeitBox5.RestzeitStundenOut;
	
	
	//Restzeiten Box 6
	fbRestzeitBox6.AktuelleMinute	:= Echtzeit.Minute;
	fbRestzeitBox6.AktuelleStunde	:= Echtzeit.Stunde;
	fbRestzeitBox6.Freigabe			:= Betriebsparameter.Boxen[6].IntervallbetriebEin OR Betriebsparameter.Boxen[6].NachtrocknungEin;
	IF Betriebsparameter.Boxen[6].IntervallbetriebEin THEN
		fbRestzeitBox6.ZeitfensterIn := ADR(Betriebsparameter.Boxen[6].IntervallbetriebZeiten);
	ELSE
		fbRestzeitBox6.ZeitfensterIn := ADR(Betriebsparameter.Boxen[6].NachtrocknungZeiten);
	END_IF
	fbRestzeitBox6();
	
	gStatusAnlage.RestlaufzeitenBoxen.Box6Minuten	:= fbRestzeitBox6.RestzeitMinutenOut;
	gStatusAnlage.RestlaufzeitenBoxen.Box6Stunden	:= fbRestzeitBox6.RestzeitStundenOut;
	
	//======================================================================================================================================================
	//Serviceintervalle
	//======================================================================================================================================================
	
	hmiParameter.Servicebereich.KontrollintervallUhrzeit	:= 200000;
	//Kontrolle Uhrzeit
	fbSrvcUhrzeit.Aktiv				:= TRUE;
	fbSrvcUhrzeit.Tick				:= minTick;
	fbSrvcUhrzeit.ZeitBisSrvc		:= ADR(hmiNutzungsdaten.Serviceintervalle.RestzeitKontrolleUhrzeit);
	fbSrvcUhrzeit.SrvcIntervall		:= Betriebsparameter.Servicebereich.KontrollintervallUhrzeit;
	fbSrvcUhrzeit.SrvcReset			:= hmiButtons.ResetServiceUhrzeit;
	fbSrvcUhrzeit();
	hmiNutzungsdaten.Serviceintervalle.KontrolleUhrzeitErforderlich	:= fbSrvcUhrzeit.SrvcErforderl;
	
	IF (hmiButtons.ResetServiceUhrzeit) THEN
	hmiButtons.ResetServiceUhrzeit	:= FALSE;
	END_IF
	
	TON_ResetInit(IN:= TRUE, PT:= T#1s);
	initOk	:= TON_ResetInit.Q;
	
	
END_PROGRAM

