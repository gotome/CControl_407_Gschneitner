
PROGRAM _INIT

	//Trendkurven einschalten (werden zurückgesetzt, wenn Sensor in Ausstattung nicht vorhanden)
	hmiVisibility.Trend.AbluftFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.AbluftTemp := ICON_VISIBLE;
	hmiVisibility.Trend.AustrittFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.AustrittTemp := ICON_VISIBLE;
	hmiVisibility.Trend.DachluftFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.DachluftTemp := ICON_VISIBLE;
	hmiVisibility.Trend.EintrittFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.EintrittTemp := ICON_VISIBLE;
	hmiVisibility.Trend.FrischluftFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.FrischluftTemp := ICON_VISIBLE;
	hmiVisibility.Trend.HochdruckMod1 := ICON_VISIBLE;
	hmiVisibility.Trend.HochdruckMod2 := ICON_VISIBLE;
	hmiVisibility.Trend.Kanaldruck := ICON_VISIBLE;
	hmiVisibility.Trend.Luftgeschw := ICON_VISIBLE;
	hmiVisibility.Trend.NiederdruckMod1 := ICON_VISIBLE;
	hmiVisibility.Trend.NiederdruckMod2 := ICON_VISIBLE;
	hmiVisibility.Trend.TrockenluftFeuchte := ICON_VISIBLE;
	hmiVisibility.Trend.TrockenluftTemp := ICON_VISIBLE;
	
	
	//Trendvariablen (Zoom)
	hmiStatus.Trendkurven.WertZoomTrend1	:= 1;
	hmiStatus.Trendkurven.WertZoomTrend2	:= 1;
	hmiStatus.Trendkurven.WertZoomTrend3	:= 1;

	//Software-Version
	hmiStatus.SoftwareVersion	:= VERSION;
	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	
	//Ticks erzeugen
	//==============
	fbLascoZdxx_0(IN	:= Echtzeit.Milli / 100);
	hmilliTick			:= fbLascoZdxx_0.Q;
	fbLascoZdxx_1(IN	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_1.Q;
	fbLascoZdxx_2(IN	:= Echtzeit.Stunde);
	stdTick				:= fbLascoZdxx_2.Q;
	fbLascoZdxx_3(IN	:= Echtzeit.Tag);
	tagTick				:= fbLascoZdxx_3.Q;
	fbLascoZdxx_5(IN	:= Echtzeit.Jahr);
	jahrTick			:= fbLascoZdxx_5.Q;
       
	fbLascoPuge_0(StartMitPuls := TRUE, Tick := hmilliTick, ZeitPuls := 8, ZeitPause := 8,);
	hmiBlink			:= fbLascoPuge_0.PulsQ;
	
	fbLascoPuge_1(StartMitPuls := TRUE, Tick := hmilliTick, ZeitPuls := 8, ZeitPause := 40,);
	hmiBlink2			:= fbLascoPuge_1.PulsQ;
	
	
	//===========================================================================================================================================================================================
	//Visu-Parameter an Betriebsparameter und Nutzungsdaten übergeben
	//===========================================================================================================================================================================================

	memcpy(ADR(Betriebsparameter), ADR(hmiParameter), SIZEOF(Betriebsparameter));
	memcpy(ADR(Nutzungsdaten), ADR(hmiNutzungsdaten), SIZEOF(Nutzungsdaten));

	//===========================================================================================================================================================================================
	//Trocknungsbilanz anzeigen, wenn Box ausgeschaltet wird & Zeitfenster Intervall und Nachtrocknung zurücksetzen
	//===========================================================================================================================================================================================
	
	//Box 1
	IF EDGENEG(Boxen.Box1Out.BoxBereit) THEN
		loc_Box1Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[1].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box1Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Box 2
	IF EDGENEG(Boxen.Box2Out.BoxBereit) THEN
		loc_Box2Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[2].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box2Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Box 3
	IF EDGENEG(Boxen.Box3Out.BoxBereit) THEN
		loc_Box3Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[3].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box3Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Box 4
	IF EDGENEG(Boxen.Box4Out.BoxBereit) THEN
		loc_Box4Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[4].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box4Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Box 5
	IF EDGENEG(Boxen.Box5Out.BoxBereit) THEN
		loc_Box5Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[5].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box5Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Box 6
	IF EDGENEG(Boxen.Box6Out.BoxBereit) THEN
		loc_Box6Beendet := TRUE;
		hmiTrocknungsbilanz.NameBox := hmiParameter.Boxen[6].NameBox;
		hmiTrocknungsbilanz.LaufzeitGesamt := hmiNutzungsdaten.Bst.Box6Std;
		hmiTrocknungsbilanz.LaufzeitLuftaufbereitung := hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6;
		hmiTrocknungsbilanz.LaufzeitVentilator := hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_VISIBLE;
	END_IF
	
	//Wenn Taste Ok -> Ebene ausblenden und Betriebsstunden der jeweiligen Box auf 0 setzen
	IF hmiButtons.TrocknungsbilanzOk THEN
		IF loc_Box1Beendet THEN
			hmiNutzungsdaten.Bst.Box1Min := 0;
			hmiNutzungsdaten.Bst.Box1Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox1 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox1 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox1 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox1 := 0;
			memset(ADR(hmiParameter.Boxen[1].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[1].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[1].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[1].NachtrocknungZeiten));
			loc_Box1Beendet := FALSE;
		ELSIF loc_Box2Beendet THEN
			hmiNutzungsdaten.Bst.Box2Min := 0;
			hmiNutzungsdaten.Bst.Box2Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox2 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox2 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox2 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox2 := 0;
			memset(ADR(hmiParameter.Boxen[2].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[2].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[2].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[2].NachtrocknungZeiten));
			loc_Box2Beendet := FALSE;
		ELSIF loc_Box3Beendet THEN
			hmiNutzungsdaten.Bst.Box3Min := 0;
			hmiNutzungsdaten.Bst.Box3Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox3 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox3 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox3 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox3 := 0;
			memset(ADR(hmiParameter.Boxen[3].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[3].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[3].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[3].NachtrocknungZeiten));
			loc_Box3Beendet := FALSE;
		ELSIF loc_Box4Beendet THEN
			hmiNutzungsdaten.Bst.Box4Min := 0;
			hmiNutzungsdaten.Bst.Box4Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox4 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox4 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox4 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox4 := 0;
			memset(ADR(hmiParameter.Boxen[4].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[4].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[4].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[4].NachtrocknungZeiten));
			loc_Box4Beendet := FALSE;
		ELSIF loc_Box5Beendet THEN
			hmiNutzungsdaten.Bst.Box5Min := 0;
			hmiNutzungsdaten.Bst.Box5Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox5 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox5 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox5 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox5 := 0;
			memset(ADR(hmiParameter.Boxen[5].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[5].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[5].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[5].NachtrocknungZeiten));
			loc_Box5Beendet := FALSE;
		ELSIF loc_Box6Beendet THEN
			hmiNutzungsdaten.Bst.Box6Min := 0;
			hmiNutzungsdaten.Bst.Box6Std := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbMinutenBox6 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.LuftaufbStundenBox6 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentMinutenBox6 := 0;
			hmiNutzungsdaten.Trocknungsbilanz.VentStundenBox6 := 0;
			memset(ADR(hmiParameter.Boxen[6].IntervallbetriebZeiten), 0, SIZEOF(hmiParameter.Boxen[6].IntervallbetriebZeiten));
			memset(ADR(hmiParameter.Boxen[6].NachtrocknungZeiten), 0, SIZEOF(hmiParameter.Boxen[6].NachtrocknungZeiten));
			loc_Box6Beendet := FALSE;
		END_IF
		hmiButtons.TrocknungsbilanzOk := FALSE;
		hmiVisibility.Layers.Trocknungsbilanz := ICON_HIDDEN;
	END_IF
	
	
	
	//===========================================================================================================================================================================================
	//Zusatzinfo Übersichtsseite Anlagenstatus
	//===========================================================================================================================================================================================
	
	//Anlage im Stillstand
	IF (gAktModus = STILLSTAND) THEN
		
		//Warte auf Bereitmeldung Notstromaggregat
		IF (Aktoren.Notstromaggregat.NotstromaggregatAngefordert AND NOT Aktoren.Notstromaggregat.NotstromBereitOut) THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_WARTE_AUF_NOTSTROM;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Notstromaggregat.RestVorlaufzeit;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Auskühlphase Warmluftofen
		ELSIF Aktoren.Warmluftofen.WarmluftofenAktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_AUSKUEHLZEIT_WLO_AKTIV;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Warmluftofen.RestAuskuehlzeit;
			IF NOT hmiParameter.Ausstattung.WarmluftofenBetriebsmldg THEN
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			ELSE
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			END_IF
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			//Auskühlphase Scheitholzofen
		ELSIF Aktoren.Scheitholzofen.ScheitholzofenAktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_AUSKUEHLZEIT_SHO_AKTIV;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Scheitholzofen.RestAuskuehlzeit;
			IF NOT Aktoren.Scheitholzofen.Betriebsmeldung THEN
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			END_IF
		//Warten bis Entfeuchter im Stillstand
		ELSIF (Boxen.NotbetriebVentilator1 OR Boxen.NotbetriebVentilator2) AND ((Aktoren.KompressorModul1.curStep <> 0) OR (Aktoren.KompressorModul2.curStep <> 0) OR
			(hmiParameter.Ausstattung.EntfeuchterFremd AND diEntfeuchterFremdInBetrieb)) THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_ENTF_NOCH_IN_BETR;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			//Fehler - kein Start möglich
		ELSIF gCmdAnlage.FehlerStopp THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_FEHLERSTOPP;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Fehler - Start jedoch möglich
		ELSIF gStatusAnlage.Fehler.SummeFehler THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_FEHLER;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Warte auf Bereitmeldung Notstromaggregat
		ELSE
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_BEREIT;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
		END_IF
		
	
		//Anlage im IO-Test
	ELSIF (gAktModus = IOTEST) THEN
		hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_IOTEST_NICHT_ABGE;
		hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
		hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;

		//Anlage in Betrieb
	ELSIF (gAktModus = BETRIEB) THEN
		
		//Tarifabschaltung aktiv
		IF Tarifabschaltung.TarifabschaltungEin THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_TARIFABSCHALTUNG_AKTIV;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Strombegrenzung aktiv
		ELSIF Strombegrenzung.StrombegrenzungEin THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STROMBEGRENZUNG_AKTIV;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Klappenumschaltung aktiv
		ELSIF Aktoren.VentUndKlappen.UmschaltungAktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_KLAPPEN_WERDEN_UMGESCHALTET;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			//Warte auf Bereitmeldung Notstromaggregat
		ELSIF (Aktoren.Notstromaggregat.NotstromaggregatAngefordert AND NOT Aktoren.Notstromaggregat.NotstromBereitOut) THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_WARTE_AUF_NOTSTROM;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Notstromaggregat.RestVorlaufzeit;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			//Anlaufverzögerung Ventilator 1
		ELSIF Aktoren.VentUndKlappen.AnlaufverzVent1Aktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_ANLAUFVERZ_VENT1_AKTIV;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.VentUndKlappen.RestAnlaufverzoegerung;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;	
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			//Anlaufverzögerung Ventilator 2
		ELSIF Aktoren.VentUndKlappen.AnlaufverzVent2Aktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_ANLAUFVERZ_VENT2_AKTIV;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.VentUndKlappen.RestAnlaufverzoegerung;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
		//Entfeuchter im Inselbetrieb (Entfeuchter wird von Fremdsteuerung angefordert)
		ELSIF Boxen.EntfeuchterInselbetrieb THEN
			//Entfeuchter nicht aktiviert
			IF NOT Boxen.EntfeuchterInselbetrAktivOut THEN
				hmiStatus.Zusatzmeldungen.Statustext := ZM_INSELBETRIEB_AUS;
			//Entfeuchter aktiviert, jedoch keine Anforderung von Extern
			ELSIF NOT Boxen.FreigabeEntfeuchterInselbetrieb THEN
				hmiStatus.Zusatzmeldungen.Statustext := ZM_INSELBETRIEB_STANDBY;
			//Entfeuchter angefordert -> aktiv
			ELSIF NOT Aktoren.VentUndKlappen.Ventilator1InBetrieb THEN
				hmiStatus.Zusatzmeldungen.Statustext := ZM_INSELBETRIEB_VENT_NICHT_AKTIV;
			ELSE
				hmiStatus.Zusatzmeldungen.Statustext := ZM_INSELBETRIEB_AKTIV;
			END_IF
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := 0;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Warten auf Anforderung Box
		ELSIF NOT Aktoren.VentUndKlappen.AnforderungVentilator1 AND NOT Aktoren.VentUndKlappen.AnforderungVentilator2 THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_WARTE_AUF_ANFORDERUNG_BOX;
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
		//Auskühlzeit Warmluftofen
		ELSIF Aktoren.Warmluftofen.WarmluftofenAktiv AND NOT Aktoren.Warmluftofen.Freigabe THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_AUSKUEHLZEIT_WLO_AKTIV;
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Warmluftofen.RestAuskuehlzeit;
			IF NOT hmiParameter.Ausstattung.WarmluftofenBetriebsmldg THEN
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			ELSE
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			END_IF
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
		//Auskühlzeit Scheitholzofen
		ELSIF (Boxen.NotbetriebVentilator1 OR Boxen.NotbetriebVentilator2) AND Aktoren.Scheitholzofen.ScheitholzofenAktiv THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_AUSKUEHLZEIT_SHO_AKTIV;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			hmiStatus.Zusatzmeldungen.RestzeitSchrittAktuell := Aktoren.Scheitholzofen.RestAuskuehlzeit;
			IF NOT Aktoren.Scheitholzofen.Betriebsmeldung THEN
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_VISIBLE;
			END_IF
		//Warten bis Entfeuchter im Stillstand
		ELSIF (Boxen.NotbetriebVentilator1 OR Boxen.NotbetriebVentilator2) AND ((Aktoren.KompressorModul1.curStep <> 0) OR (Aktoren.KompressorModul2.curStep <> 0)) THEN
			hmiStatus.Zusatzmeldungen.Statustext := ZM_STILLSTAND_ENTF_NOCH_IN_BETR;
			hmiStatus.Zusatzmeldungen.IconSanduhr := BOOL_TO_USINT(hmiBlink);
			hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
			//Frischluft/Dachabsaugungsbetrieb
		ELSIF ((gStatusAnlage.FrischluftbetriebAktiv AND hmiParameter.Umschaltklappen.Automatik) OR hmiParameter.Umschaltklappen.Frischluft) THEN
			IF hmiParameter.Ausstattung.SensorDachluft THEN
				//Vorlaufzeit Trocknungsgeräte Tarifabschaltung aktiv
				IF Tarifabschaltung.TarifabschaltungLuftaufbEin THEN
					hmiStatus.Zusatzmeldungen.Statustext := ZM_DACHABSAUGUNGSB_VLZ_TARIF;
					hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				ELSE
					hmiStatus.Zusatzmeldungen.Statustext := ZM_DACHABSAUGUNGSBETRIEB;
					hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				END_IF
					ELSE
				//Vorlaufzeit Trocknungsgeräte Tarifabschaltung aktiv
				IF Tarifabschaltung.TarifabschaltungLuftaufbEin THEN
					hmiStatus.Zusatzmeldungen.Statustext := ZM_FRISCHLUFTB_VLZ_TARIF;
					hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				ELSE
					hmiStatus.Zusatzmeldungen.Statustext := ZM_FRISCHLUFTBETRIEB;
					hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				END_IF	
			END_IF
			hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			//Umluftbetrieb
		ELSIF ((gStatusAnlage.UmluftbetriebAktiv AND hmiParameter.Umschaltklappen.Automatik) OR hmiParameter.Umschaltklappen.Umluft) THEN
			//Vorlaufzeit Trocknungsgeräte Tarifabschaltung aktiv
			IF Tarifabschaltung.TarifabschaltungLuftaufbEin THEN
				hmiStatus.Zusatzmeldungen.Statustext := ZM_UMLUFTBETR_VLZ_TARIF;
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			ELSE	
				hmiStatus.Zusatzmeldungen.Statustext := ZM_UMLUFTBETRIEB;
				hmiStatus.Zusatzmeldungen.AusgabefeldRestzeit := ICON_HIDDEN;
				hmiStatus.Zusatzmeldungen.IconSanduhr := ICON_HIDDEN;
			END_IF
		END_IF
	END_IF
	
	
	//===========================================================================================================================================================================================
	//Konfiguration Hauptübersicht Trocknungsgeräte
	//===========================================================================================================================================================================================

	//Symbol Entfeuchter
	IF Betriebsparameter.Ausstattung.Entfeuchter THEN
		hmiVisibility.Allgemein.SymbolEntfeuchterUebersicht	:= ICON_VISIBLE;
		IF gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1] = STATUS_STOERUNG THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_ROT;
		ELSIF gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1] = STATUS_AKTIV THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GELB;
		ELSIF gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1] = STATUS_BEREIT THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
		ELSIF (gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1] = STATUS_ENTF_ABTAUUNG) OR (gStatusAnlage.Aktor[AKTOR_KOMPRESSOR_MOD1] = STATUS_ENTF_STANDBY) THEN
			IF hmiBlink THEN
				hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GELB;
			ELSE
				hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
			END_IF
		ELSE
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
		END_IF
	ELSE
		hmiVisibility.Allgemein.SymbolEntfeuchterUebersicht	:= ICON_HIDDEN;
	END_IF
	
	//Symbol Entfeuchter Fremdgerät
	IF Betriebsparameter.Ausstattung.EntfeuchterFremd THEN
		hmiVisibility.Allgemein.SymbolEntfeuchterFremdUebersicht := ICON_VISIBLE;
		IF gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD] = STATUS_STOERUNG THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_ROT;
		ELSIF gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD] = STATUS_AKTIV THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GELB;
		ELSIF gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD] = STATUS_BEREIT THEN
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
		ELSIF (gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD] = STATUS_ENTF_ABTAUUNG) OR (gStatusAnlage.Aktor[AKTOR_ENTFEUCHTER_FREMD] = STATUS_ENTF_STANDBY) THEN
			IF hmiBlink THEN
				hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GELB;
			ELSE
				hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
			END_IF
		ELSE
			hmiStatus.Entfeuchter.FarbeIcon	:= ICON_GRAU;
		END_IF
	ELSE
		hmiVisibility.Allgemein.SymbolEntfeuchterFremdUebersicht := ICON_HIDDEN;
	END_IF
	
	
	//Symbol Warluftofen und Scheitholzofen
	IF Betriebsparameter.Ausstattung.Warmluftofen OR Betriebsparameter.Ausstattung.Scheitholzofen THEN
		hmiVisibility.Allgemein.SymbolOfenUebersicht	:= ICON_VISIBLE;
		IF gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN] = STATUS_STOERUNG THEN
			hmiStatus.WarmluftScheitholzofen.FarbeIcon	:= ICON_ROT;
		ELSIF (gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN] = STATUS_AKTIV) OR (gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN] = STATUS_AKTIV) THEN
			hmiStatus.WarmluftScheitholzofen.FarbeIcon	:= ICON_GELB;
		ELSIF (gStatusAnlage.Aktor[AKTOR_WARMLUFTOFEN] = STATUS_AUSKUEHLPHASE) OR (gStatusAnlage.Aktor[AKTOR_SCHEITHOLZOFEN] = STATUS_AUSKUEHLPHASE) THEN
			IF hmiBlink THEN
				hmiStatus.WarmluftScheitholzofen.FarbeIcon	:= ICON_GELB;
			ELSE
				hmiStatus.WarmluftScheitholzofen.FarbeIcon	:= ICON_GRAU;
			END_IF
		ELSE
			hmiStatus.WarmluftScheitholzofen.FarbeIcon	:= ICON_GRAU;
		END_IF
	ELSE
		hmiVisibility.Allgemein.SymbolOfenUebersicht := ICON_HIDDEN;
	END_IF
	
	
	//Symbol Heizregister
	IF Betriebsparameter.Ausstattung.Heizregister THEN
		hmiVisibility.Allgemein.SymbolRegisterUebersicht	:= ICON_VISIBLE;
		IF gStatusAnlage.Aktor[AKTOR_HEIZREGISTER] = STATUS_STOERUNG THEN
			hmiStatus.Heizregister.FarbeIcon	:= ICON_ROT;
		ELSIF gStatusAnlage.Aktor[AKTOR_HEIZREGISTER] = STATUS_AKTIV THEN
			hmiStatus.Heizregister.FarbeIcon	:= ICON_GELB;
		ELSE
			hmiStatus.Heizregister.FarbeIcon	:= ICON_GRAU;
		END_IF
	ELSE
		hmiVisibility.Allgemein.SymbolRegisterUebersicht := ICON_HIDDEN;
	END_IF
	
	
	
	//===========================================================================================================================================================================================
	//Konfiguration Hauptübersicht Boxen
	//===========================================================================================================================================================================================
	
	
	//Ebenen Boxen je nach Ausstattung ein/ausblenden (1-6 Boxen)
	IF hmiParameter.Ausstattung.Box1 AND hmiParameter.Ausstattung.Box2 AND hmiParameter.Ausstattung.Box3 AND hmiParameter.Ausstattung.Box4 AND hmiParameter.Ausstattung.Box5 AND
		hmiParameter.Ausstattung.Box6 THEN
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_VISIBLE;
	ELSIF hmiParameter.Ausstattung.Box1 AND hmiParameter.Ausstattung.Box2 AND hmiParameter.Ausstattung.Box3 AND hmiParameter.Ausstattung.Box4 AND hmiParameter.Ausstattung.Box5 THEN
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_HIDDEN;
	ELSIF hmiParameter.Ausstattung.Box1 AND hmiParameter.Ausstattung.Box2 AND hmiParameter.Ausstattung.Box3 AND hmiParameter.Ausstattung.Box4 THEN
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_HIDDEN;	
	ELSIF hmiParameter.Ausstattung.Box1 AND hmiParameter.Ausstattung.Box2 AND hmiParameter.Ausstattung.Box3 THEN
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_HIDDEN;		
	ELSIF hmiParameter.Ausstattung.Box1 AND hmiParameter.Ausstattung.Box2 THEN
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_HIDDEN;
	ELSE
		hmiVisibility.Layers.UebersichtEineBox		:= ICON_VISIBLE;
		hmiVisibility.Layers.UebersichtZweiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtDreiBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtVierBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtFuenfBoxen	:= ICON_HIDDEN;
		hmiVisibility.Layers.UebersichtSechsBoxen	:= ICON_HIDDEN;
	END_IF
	
	
	//===========================================================================================================================================================================================
	//TRENDKURVEN
	//===========================================================================================================================================================================================

	//Werte an Visu-Struktur übergeben
	hmiStatus.Trendkurven.FrischluftTemp		:= gStatusAnlage.FrischluftTemperatur;
	hmiStatus.Trendkurven.FrischluftFeuchte		:= gStatusAnlage.FrischluftFeuchte;
	hmiStatus.Trendkurven.DachluftTemp			:= gStatusAnlage.DachluftTemperatur;
	hmiStatus.Trendkurven.DachluftFeuchte		:= gStatusAnlage.DachluftFeuchte;
	hmiStatus.Trendkurven.TrockenluftTemp		:= gStatusAnlage.TrockenluftTemperatur;
	hmiStatus.Trendkurven.TrockenluftFeuchte	:= gStatusAnlage.TrockenluftFeuchte;
	hmiStatus.Trendkurven.AbluftTemp			:= gStatusAnlage.AbluftTemperatur;
	hmiStatus.Trendkurven.AbluftFeuchte			:= gStatusAnlage.AbluftFeuchte;
	hmiStatus.Trendkurven.EintrittTemp			:= gStatusAnlage.EintrittTemperatur;
	hmiStatus.Trendkurven.EintrittFeuchte		:= gStatusAnlage.EintrittFeuchte;
	hmiStatus.Trendkurven.AustrittTemp			:= gStatusAnlage.AustrittTemperatur;
	hmiStatus.Trendkurven.AustrittFeuchte		:= gStatusAnlage.AustrittFeuchte;
	hmiStatus.Trendkurven.NiederdruckMod1		:= gStatusAnlage.NiederdruckModul1;
	hmiStatus.Trendkurven.NiederdruckMod2		:= gStatusAnlage.NiederdruckModul2;
	hmiStatus.Trendkurven.HochdruckMod1			:= gStatusAnlage.HochdruckModul1;
	hmiStatus.Trendkurven.HochdruckMod2			:= gStatusAnlage.HochdruckModul2;
	hmiStatus.Trendkurven.Luftgeschw			:= gStatusAnlage.Luftgeschwindigkeit;
	hmiStatus.Trendkurven.Kanaldruck			:= gStatusAnlage.Berechnungen.Kanaldruck_mmWs;
	hmiStatus.Trendkurven.LeistungAktuell		:= hmiNutzungsdaten.Energiemessung.LeistungAktuell;
	
	//Trendkurven ausschalten, wenn in Ausstattung nicht vorhanden
	IF NOT hmiParameter.Ausstattung.SensorFrischluft THEN
		hmiVisibility.Trend.FrischluftFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.FrischluftTemp		:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorDachluft THEN
		hmiVisibility.Trend.DachluftFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.DachluftTemp	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorTrockenluft THEN
		hmiVisibility.Trend.TrockenluftFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.TrockenluftTemp	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorAbluft THEN
		hmiVisibility.Trend.AbluftFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.AbluftTemp	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorLuftgeschwindigkeit THEN
		hmiVisibility.Trend.Luftgeschw	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorLuftgeschwindigkeit THEN
		hmiVisibility.Trend.Luftgeschw	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.SensorKanaldruck THEN
		hmiVisibility.Trend.Kanaldruck	:= ICON_HIDDEN;
	END_IF
	IF NOT hmiParameter.Ausstattung.Entfeuchter THEN
		hmiVisibility.Trend.EintrittFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.EintrittTemp	:= ICON_HIDDEN;
		hmiVisibility.Trend.AustrittFeuchte	:= ICON_HIDDEN;
		hmiVisibility.Trend.AustrittTemp	:= ICON_HIDDEN;
		hmiVisibility.Trend.NiederdruckMod1	:= ICON_HIDDEN;
		hmiVisibility.Trend.HochdruckMod1	:= ICON_HIDDEN;
	END_IF
	
	
	//===========================================================================================================================================================================================
	//AUSSTATTUNG BOXEN ZURÜCKSETZEN, WENN BOX ODER AKTOR NICHT VORHANDEN
	//===========================================================================================================================================================================================
	
	//Box 2
	IF NOT hmiParameter.Ausstattung.Box2 THEN
		hmiParameter.Boxen[2].Heizregister := FALSE;
		hmiParameter.Boxen[2].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[2].Scheitholzofen := FALSE;
		hmiParameter.Boxen[2].StellungKlappe1 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].StellungKlappe2 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].StellungKlappe3 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].StellungKlappe4 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].StellungKlappe5 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].StellungKlappe6 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[2].Ventilator1 := FALSE;
		hmiParameter.Boxen[2].Ventilator2 := FALSE;
		hmiParameter.Boxen[2].Warmluftofen := FALSE;
		hmiParameter.Boxen[2].Aus := TRUE;
		hmiParameter.Boxen[2].DauerbetriebEin := FALSE;
		hmiParameter.Boxen[2].IntervallbetriebEin := FALSE;
		hmiParameter.Boxen[2].NachtrocknungEin := FALSE;
	END_IF
	
	//Box 3
	IF NOT hmiParameter.Ausstattung.Box3 THEN
		hmiParameter.Boxen[3].Heizregister := FALSE;
		hmiParameter.Boxen[3].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[3].Scheitholzofen := FALSE;
		hmiParameter.Boxen[3].StellungKlappe1 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].StellungKlappe2 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].StellungKlappe3 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].StellungKlappe4 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].StellungKlappe5 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].StellungKlappe6 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[3].Ventilator1 := FALSE;
		hmiParameter.Boxen[3].Ventilator2 := FALSE;
		hmiParameter.Boxen[3].Warmluftofen := FALSE;
		hmiParameter.Boxen[3].Aus := TRUE;
		hmiParameter.Boxen[3].DauerbetriebEin := FALSE;
		hmiParameter.Boxen[3].IntervallbetriebEin := FALSE;
		hmiParameter.Boxen[3].NachtrocknungEin := FALSE;
	END_IF
	
	//Box 4
	IF NOT hmiParameter.Ausstattung.Box4 THEN
		hmiParameter.Boxen[4].Heizregister := FALSE;
		hmiParameter.Boxen[4].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[4].Scheitholzofen := FALSE;
		hmiParameter.Boxen[4].StellungKlappe1 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].StellungKlappe2 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].StellungKlappe3 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].StellungKlappe4 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].StellungKlappe5 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].StellungKlappe6 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[4].Ventilator1 := FALSE;
		hmiParameter.Boxen[4].Ventilator2 := FALSE;
		hmiParameter.Boxen[4].Warmluftofen := FALSE;
		hmiParameter.Boxen[4].Aus := TRUE;
		hmiParameter.Boxen[4].DauerbetriebEin := FALSE;
		hmiParameter.Boxen[4].IntervallbetriebEin := FALSE;
		hmiParameter.Boxen[4].NachtrocknungEin := FALSE;
	END_IF
	
	//Box 5
	IF NOT hmiParameter.Ausstattung.Box5 THEN
		hmiParameter.Boxen[5].Heizregister := FALSE;
		hmiParameter.Boxen[5].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[5].Scheitholzofen := FALSE;
		hmiParameter.Boxen[5].StellungKlappe1 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].StellungKlappe2 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].StellungKlappe3 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].StellungKlappe4 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].StellungKlappe5 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].StellungKlappe6 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[5].Ventilator1 := FALSE;
		hmiParameter.Boxen[5].Ventilator2 := FALSE;
		hmiParameter.Boxen[5].Warmluftofen := FALSE;
		hmiParameter.Boxen[5].Aus := TRUE;
		hmiParameter.Boxen[5].DauerbetriebEin := FALSE;
		hmiParameter.Boxen[5].IntervallbetriebEin := FALSE;
		hmiParameter.Boxen[5].NachtrocknungEin := FALSE;
	END_IF
	
	//Box 6
	IF NOT hmiParameter.Ausstattung.Box6 THEN
		hmiParameter.Boxen[6].Heizregister := FALSE;
		hmiParameter.Boxen[6].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[6].Scheitholzofen := FALSE;
		hmiParameter.Boxen[6].StellungKlappe1 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].StellungKlappe2 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].StellungKlappe3 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].StellungKlappe4 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].StellungKlappe5 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].StellungKlappe6 := FBBOX_NICHT_VERWENDET;
		hmiParameter.Boxen[6].Ventilator1 := FALSE;
		hmiParameter.Boxen[6].Ventilator2 := FALSE;
		hmiParameter.Boxen[6].Warmluftofen := FALSE;
		hmiParameter.Boxen[6].Aus := TRUE;
		hmiParameter.Boxen[6].DauerbetriebEin := FALSE;
		hmiParameter.Boxen[6].IntervallbetriebEin := FALSE;
		hmiParameter.Boxen[6].NachtrocknungEin := FALSE;
	END_IF
	
	//Luftentfeuchter nicht vorhanden
	IF NOT hmiParameter.Ausstattung.Entfeuchter AND NOT hmiParameter.Ausstattung.EntfeuchterFremd THEN
		hmiParameter.Boxen[1].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[2].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[3].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[4].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[5].Luftentfeuchter := FALSE;
		hmiParameter.Boxen[6].Luftentfeuchter := FALSE;
	END_IF
	
	//Warmluftofen nicht vorhanden
	IF NOT hmiParameter.Ausstattung.Warmluftofen THEN
		hmiParameter.Boxen[1].Warmluftofen := FALSE;
		hmiParameter.Boxen[2].Warmluftofen := FALSE;
		hmiParameter.Boxen[3].Warmluftofen := FALSE;
		hmiParameter.Boxen[4].Warmluftofen := FALSE;
		hmiParameter.Boxen[5].Warmluftofen := FALSE;
		hmiParameter.Boxen[6].Warmluftofen := FALSE;
	END_IF
	
	//Ventilator 2 nicht vorhanden
	IF NOT hmiParameter.Ausstattung.Ventilator2 THEN
		hmiParameter.Boxen[1].Ventilator2 := FALSE;
		hmiParameter.Boxen[2].Ventilator2 := FALSE;
		hmiParameter.Boxen[3].Ventilator2 := FALSE;
		hmiParameter.Boxen[4].Ventilator2 := FALSE;
		hmiParameter.Boxen[5].Ventilator2 := FALSE;
		hmiParameter.Boxen[6].Ventilator2 := FALSE;
	END_IF
	
	//Scheitholzofen nicht vorhanden
	IF NOT hmiParameter.Ausstattung.Scheitholzofen THEN
		hmiParameter.Boxen[1].Scheitholzofen := FALSE;
		hmiParameter.Boxen[2].Scheitholzofen := FALSE;
		hmiParameter.Boxen[3].Scheitholzofen := FALSE;
		hmiParameter.Boxen[4].Scheitholzofen := FALSE;
		hmiParameter.Boxen[5].Scheitholzofen := FALSE;
		hmiParameter.Boxen[6].Scheitholzofen := FALSE;
	END_IF
	
	//Heizregister nicht vorhanden
	IF NOT hmiParameter.Ausstattung.Heizregister THEN
		hmiParameter.Boxen[1].Heizregister := FALSE;
		hmiParameter.Boxen[2].Heizregister := FALSE;
		hmiParameter.Boxen[3].Heizregister := FALSE;
		hmiParameter.Boxen[4].Heizregister := FALSE;
		hmiParameter.Boxen[5].Heizregister := FALSE;
		hmiParameter.Boxen[6].Heizregister := FALSE;
	END_IF
	

	
	
	
	
END_PROGRAM
