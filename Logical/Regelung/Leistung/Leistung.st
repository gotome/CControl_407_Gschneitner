
PROGRAM _INIT


	
	//Luftmengenregler für Ventilator 1 initialisieren
	fbPidLuftmengeVent1.Mode	:= FBREG_MODUS_AUS;
	fbPidLuftmengeVent1();
	
	//Luftmengenregler für Ventilator 2 initialisieren
	fbPidLuftmengeVent2.Mode	:= FBREG_MODUS_AUS;
	fbPidLuftmengeVent2();
	
	//Regler Entfeuchter Kompressor 1 -Drehzahl initialisieren
	fbPidKompressor1.Mode	:= FBREG_MODUS_AUS;
	fbPidKompressor1();
	
	//Regler Entfeuchter Kompressor 2 -Drehzahl initialisieren
	fbPidKompressor2.Mode	:= FBREG_MODUS_AUS;
	fbPidKompressor2();
	
	//Regler Heizregister-Pumpe initialisieren
	fbPidHeizregister.Mode	:= FBREG_MODUS_AUS;
	fbPidHeizregister();
	
	//Abluftregler initialisieren
	fbPidAbluftregler.Mode		:= FBREG_MODUS_AUS;
	fbPidAbluftregler();
	
END_PROGRAM



PROGRAM _CYCLIC
	
	//Zeitticks erzeugen
	fbLascoZdxx_0(IN 	:= Echtzeit.Minute);
	minTick				:= fbLascoZdxx_0.Q;
	fbLascoZdxx_1(IN	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_1.Q;
	


	//Erforderliche Soll-Luftmengen für Ventilator 1 & 2 ermitteln
	//************************************************************
	
	fbBoxenLuftmengen_0.EntfeuchterInBetrieb			:= Aktoren.KompressorModul1.FreigabeKompressorOut OR Aktoren.KompressorModul2.FreigabeKompressorOut OR 
	diEntfeuchterFremdInBetrieb;
	fbBoxenLuftmengen_0.FrischluftbetriebAktiv			:= gStatusAnlage.FrischluftbetriebAktiv;
	fbBoxenLuftmengen_0.UmluftbetriebAktiv				:= gStatusAnlage.UmluftbetriebAktiv;
	fbBoxenLuftmengen_0.LuftgeschwEntfeuchterMin		:= Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMin;
	fbBoxenLuftmengen_0.LuftgeschwEntfeuchterMax		:= Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax;
	fbBoxenLuftmengen_0.LuftmengeSollProM2FrischlVent1	:= Betriebsparameter.Ventilator1.LuftmengeSollFrischluft;
	fbBoxenLuftmengen_0.LuftmengeSollProM2UmluftVent1	:= Betriebsparameter.Ventilator1.LuftmengeSollUmluft;
	fbBoxenLuftmengen_0.LuftmengeSollProM2FrischlVent2	:= Betriebsparameter.Ventilator2.LuftmengeSollFrischluft;
	fbBoxenLuftmengen_0.LuftmengeSollProM2UmluftVent2	:= Betriebsparameter.Ventilator2.LuftmengeSollUmluft;
	IF Betriebsparameter.Ausstattung.EntfeuchterFremd THEN
		fbBoxenLuftmengen_0.RegisterflaecheEntfeuchter		:= Betriebsparameter.Allgemein.AnsaugflaecheVent;
	ELSE
		fbBoxenLuftmengen_0.RegisterflaecheEntfeuchter		:= Betriebsparameter.Entfeuchter.Registerflaeche[Betriebsparameter.Entfeuchter.IndexType];
	END_IF
	
	
	fbBoxenLuftmengen_0.Box1.BoxIstAktiv		:= Boxen.Box1Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box1.GrundflaecheBox	:= Betriebsparameter.Boxen[1].Grundflaeche;
	fbBoxenLuftmengen_0.Box1.Ventilator1		:= Betriebsparameter.Boxen[1].Ventilator1;
	fbBoxenLuftmengen_0.Box1.Ventilator2		:= Betriebsparameter.Boxen[1].Ventilator2;
	
	fbBoxenLuftmengen_0.Box2.BoxIstAktiv		:= Boxen.Box2Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box2.GrundflaecheBox	:= Betriebsparameter.Boxen[2].Grundflaeche;
	fbBoxenLuftmengen_0.Box2.Ventilator1		:= Betriebsparameter.Boxen[2].Ventilator1;
	fbBoxenLuftmengen_0.Box2.Ventilator2		:= Betriebsparameter.Boxen[2].Ventilator2;
	
	fbBoxenLuftmengen_0.Box3.BoxIstAktiv		:= Boxen.Box3Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box3.GrundflaecheBox	:= Betriebsparameter.Boxen[3].Grundflaeche;
	fbBoxenLuftmengen_0.Box3.Ventilator1		:= Betriebsparameter.Boxen[3].Ventilator1;
	fbBoxenLuftmengen_0.Box3.Ventilator2		:= Betriebsparameter.Boxen[3].Ventilator2;
	
	fbBoxenLuftmengen_0.Box4.BoxIstAktiv		:= Boxen.Box4Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box4.GrundflaecheBox	:= Betriebsparameter.Boxen[4].Grundflaeche;
	fbBoxenLuftmengen_0.Box4.Ventilator1		:= Betriebsparameter.Boxen[4].Ventilator1;
	fbBoxenLuftmengen_0.Box4.Ventilator2		:= Betriebsparameter.Boxen[4].Ventilator2;
	
	fbBoxenLuftmengen_0.Box5.BoxIstAktiv		:= Boxen.Box5Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box5.GrundflaecheBox	:= Betriebsparameter.Boxen[5].Grundflaeche;
	fbBoxenLuftmengen_0.Box5.Ventilator1		:= Betriebsparameter.Boxen[5].Ventilator1;
	fbBoxenLuftmengen_0.Box5.Ventilator2		:= Betriebsparameter.Boxen[5].Ventilator2;
	
	fbBoxenLuftmengen_0.Box6.BoxIstAktiv		:= Boxen.Box6Out.BoxAktiv;
	fbBoxenLuftmengen_0.Box6.GrundflaecheBox	:= Betriebsparameter.Boxen[6].Grundflaeche;
	fbBoxenLuftmengen_0.Box6.Ventilator1		:= Betriebsparameter.Boxen[6].Ventilator1;
	fbBoxenLuftmengen_0.Box6.Ventilator2		:= Betriebsparameter.Boxen[6].Ventilator2;
	
	//Kunde Gschneitner: Warmluft entspricht dem frueheren Umluftbetrieb, Kaltluft dem Frischluftbetrieb.
	//Die beiden Ventilatoren koennen unterschiedlich stehen, der Baustein kennt aber nur eine gemeinsame
	//Betriebsart. Er wird deshalb zweimal aufgerufen (er ist rein kombinatorisch, hat also keinen Zustand)
	//und beide Ergebnisse werden zwischengespeichert.
	fbBoxenLuftmengen_0.FrischluftbetriebAktiv			:= TRUE;
	fbBoxenLuftmengen_0.UmluftbetriebAktiv				:= FALSE;
	fbBoxenLuftmengen_0();
	loc_LuftmengeSollKaltVent1							:= fbBoxenLuftmengen_0.LuftmengeSollVent1Out;
	loc_LuftmengeSollKaltVent2							:= fbBoxenLuftmengen_0.LuftmengeSollVent2Out;
	
	fbBoxenLuftmengen_0.FrischluftbetriebAktiv			:= FALSE;
	fbBoxenLuftmengen_0.UmluftbetriebAktiv				:= TRUE;
	fbBoxenLuftmengen_0();
	loc_LuftmengeSollWarmVent1							:= fbBoxenLuftmengen_0.LuftmengeSollVent1Out;
	loc_LuftmengeSollWarmVent2							:= fbBoxenLuftmengen_0.LuftmengeSollVent2Out;
	
		
	//Erforderliche Luftmengen Ventilator 1 & 2 in Luftgeschwindigkeit umrechnen
	//**************************************************************************
	
	//Auswahl, ob Registerfläche oder Ansaugfläche zur Berechnung verwendet wird (Registerfläche nur wenn Entfeuchter vorhanden)
	IF Betriebsparameter.Ausstattung.Entfeuchter THEN
		loc_Ansaugflaeche	:= Betriebsparameter.Entfeuchter.Registerflaeche[Betriebsparameter.Entfeuchter.IndexType];
	ELSE
		loc_Ansaugflaeche	:= Betriebsparameter.Allgemein.AnsaugflaecheVent;
	END_IF
		
	//Kunde Gschneitner: Sollwert je nach Stellung der Warmluft-/Kaltluftumschaltung des jeweiligen Ventilators.
	//Warmluft verwendet den Umluft-Parametersatz (LuftmengeSollUmluft), Kaltluft den Frischluft-Parametersatz.
	
	//Ventilator 1
	IF gStatusAnlage.Warmluft1 AND Betriebsparameter.Ventilator1.LuftmengenregUmluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent1	:= loc_LuftmengeSollWarmVent1 / loc_Ansaugflaeche / 3600;
		END_IF
	ELSIF (NOT gStatusAnlage.Warmluft1) AND Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent1	:= loc_LuftmengeSollKaltVent1 / loc_Ansaugflaeche / 3600;
		END_IF
	END_IF
	
	//Ventilator 2
	IF gStatusAnlage.Warmluft2 AND Betriebsparameter.Ventilator2.LuftmengenregUmluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent2	:= loc_LuftmengeSollWarmVent2 / loc_Ansaugflaeche / 3600;
		END_IF
	ELSIF (NOT gStatusAnlage.Warmluft2) AND Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent2	:= loc_LuftmengeSollKaltVent2 / loc_Ansaugflaeche / 3600;
		END_IF
	END_IF
	
	//Originallogik (Frischluft-/Umluftbetrieb) - fuer Kunde Gschneitner nicht in Verwendung:
	(*
	//Ventilator 1 - Frischluftbetrieb aktiv 
	IF gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent1	:= fbBoxenLuftmengen_0.LuftmengeSollVent1Out / loc_Ansaugflaeche / 3600;
		END_IF
		//Ventilator 2 - Umluftbetrieb aktiv
	ELSIF gStatusAnlage.UmluftbetriebAktiv AND Betriebsparameter.Ventilator1.LuftmengenregUmluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent1	:= fbBoxenLuftmengen_0.LuftmengeSollVent1Out / loc_Ansaugflaeche / 3600;
		END_IF
	END_IF
	
	//Ventilator 2 - Frischluftbetrieb aktiv
	IF gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent2	:= fbBoxenLuftmengen_0.LuftmengeSollVent2Out / loc_Ansaugflaeche / 3600;
		END_IF
		//Ventilator 2 - Umluftbetrieb aktiv
	ELSIF gStatusAnlage.UmluftbetriebAktiv AND Betriebsparameter.Ventilator2.LuftmengenregUmluftEin THEN
		IF loc_Ansaugflaeche <> 0 THEN
			loc_LuftgeschwSollVent2	:= fbBoxenLuftmengen_0.LuftmengeSollVent2Out / loc_Ansaugflaeche / 3600;
		END_IF
	END_IF
	*)
			
	
	//====================================================================================================================================================================================
	//Luftmengenregler Ventilator 1 Eingänge 
	//====================================================================================================================================================================================
	
	PidLuftmengeVent1.Sollgroesse				:= loc_LuftgeschwSollVent1;
	fbPidLuftmengeVent1.Freigabe				:= PidLuftmengeVent1.Enable;
	fbPidLuftmengeVent1.Sollwert				:= PidLuftmengeVent1.Sollgroesse;
	fbPidLuftmengeVent1.Istwert					:= gStatusAnlage.Luftgeschwindigkeit;
	fbPidLuftmengeVent1.AbschwaechungSollwert	:= 1.0;
	fbPidLuftmengeVent1.Aufschaltgroesse		:= 0.0;
	fbPidLuftmengeVent1.Fehlerverzoegerung		:= 0;
	fbPidLuftmengeVent1.Hold_I					:= FALSE;
	fbPidLuftmengeVent1.Hysterese				:= 0.0;
	fbPidLuftmengeVent1.Invert					:= FALSE;
	fbPidLuftmengeVent1.D_Anteil				:= Betriebsparameter.Ventilator1.D;
	fbPidLuftmengeVent1.D_Filterzeit			:= Betriebsparameter.Ventilator1.D * 1.4;
	fbPidLuftmengeVent1.I_Anteil				:= Betriebsparameter.Ventilator1.I;
	fbPidLuftmengeVent1.P_Anteil				:= Betriebsparameter.Ventilator1.P;
	fbPidLuftmengeVent1.RampeMax				:= 0.0;
	fbPidLuftmengeVent1.RegelbereichMin			:= Betriebsparameter.Sensoren.LuftgeschwMessberMin;
	IF Betriebsparameter.Ausstattung.Entfeuchter THEN
		fbPidLuftmengeVent1.RegelbereichMax		:= Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax;
	ELSE
		fbPidLuftmengeVent1.RegelbereichMax		:= Betriebsparameter.Sensoren.LuftgeschwMessberMax;
	END_IF
	fbPidLuftmengeVent1.StellgroesseManuell		:= 0.0;
	fbPidLuftmengeVent1.StellgroesseMin			:= Betriebsparameter.Ventilator1.DrehzahlMin;
	fbPidLuftmengeVent1.StellgroesseMax			:= Betriebsparameter.Ventilator1.DrehzahlMax;
	fbPidLuftmengeVent1.WindupDaempfung			:= 0.0;
	
	
	//====================================================================================================================================================================================
	//Luftmengenregler Ventilator 2 Eingänge 
	//====================================================================================================================================================================================
	
	PidLuftmengeVent2.Sollgroesse				:= loc_LuftgeschwSollVent2;
	fbPidLuftmengeVent2.Freigabe				:= PidLuftmengeVent2.Enable;
	fbPidLuftmengeVent2.Sollwert				:= PidLuftmengeVent2.Sollgroesse;
	fbPidLuftmengeVent2.Istwert					:= gStatusAnlage.Luftgeschwindigkeit;
	fbPidLuftmengeVent2.AbschwaechungSollwert	:= 1.0;
	fbPidLuftmengeVent2.Aufschaltgroesse		:= 0.0;
	fbPidLuftmengeVent2.Fehlerverzoegerung		:= 0;
	fbPidLuftmengeVent2.Hold_I					:= FALSE;
	fbPidLuftmengeVent2.Hysterese				:= 0.0;
	fbPidLuftmengeVent2.Invert					:= FALSE;
	fbPidLuftmengeVent2.D_Anteil				:= Betriebsparameter.Ventilator2.D;
	fbPidLuftmengeVent2.D_Filterzeit			:= Betriebsparameter.Ventilator2.D * 1.4;
	fbPidLuftmengeVent2.I_Anteil				:= Betriebsparameter.Ventilator2.I;
	fbPidLuftmengeVent2.P_Anteil				:= Betriebsparameter.Ventilator2.P;
	fbPidLuftmengeVent2.RampeMax				:= 0.0;
	fbPidLuftmengeVent2.RegelbereichMin			:= Betriebsparameter.Sensoren.LuftgeschwMessberMin;
	IF Betriebsparameter.Ausstattung.Entfeuchter THEN
		fbPidLuftmengeVent1.RegelbereichMax		:= Betriebsparameter.Entfeuchter.LuftgeschwEntfeuchterMax;
	ELSE
		fbPidLuftmengeVent1.RegelbereichMax		:= Betriebsparameter.Sensoren.LuftgeschwMessberMax;
	END_IF
	fbPidLuftmengeVent2.StellgroesseManuell		:= 0.0;
	fbPidLuftmengeVent2.StellgroesseMin			:= Betriebsparameter.Ventilator2.DrehzahlMin;
	fbPidLuftmengeVent2.StellgroesseMax			:= Betriebsparameter.Ventilator2.DrehzahlMax;
	fbPidLuftmengeVent2.WindupDaempfung			:= 0.0;
	
	
	//====================================================================================================================================================================================
	//Drehzahlregelung Kompressor 1 Eingänge
	//====================================================================================================================================================================================

	PidKompressor1.Sollgroesse				:= Betriebsparameter.Kompressor1.NiederdruckSoll;
	fbPidKompressor1.Freigabe				:= PidKompressor1.Enable;
	fbPidKompressor1.Sollwert				:= PidKompressor1.Sollgroesse;
	fbPidKompressor1.Istwert				:= gStatusAnlage.NiederdruckModul1;
	fbPidKompressor1.AbschwaechungSollwert	:= 1.0;
	fbPidKompressor1.Aufschaltgroesse		:= 0.0;
	fbPidKompressor1.Fehlerverzoegerung		:= 0;
	fbPidKompressor1.Hold_I					:= FALSE;
	fbPidKompressor1.Hysterese				:= Betriebsparameter.Kompressor1.Hysterese;
	fbPidKompressor1.Invert					:= TRUE;
	fbPidKompressor1.D_Anteil				:= Betriebsparameter.Kompressor1.D;
	fbPidKompressor1.D_Filterzeit			:= Betriebsparameter.Kompressor1.D * 1.4;
	fbPidKompressor1.I_Anteil				:= Betriebsparameter.Kompressor1.I;
	fbPidKompressor1.P_Anteil				:= Betriebsparameter.Kompressor1.P;
	fbPidKompressor1.RampeMax				:= 0.0;
	fbPidKompressor1.RegelbereichMin		:= Betriebsparameter.Sensoren.NiederdruckMessberMin;
	fbPidKompressor1.RegelbereichMax		:= Betriebsparameter.Sensoren.NiederdruckMessberMax;
	fbPidKompressor1.StellgroesseManuell	:= 0.0;
	fbPidKompressor1.StellgroesseMin		:= Betriebsparameter.Kompressor1.DrehzahlMin;
	fbPidKompressor1.StellgroesseMax		:= Betriebsparameter.Kompressor1.DrehzahlMax;
	fbPidKompressor1.WindupDaempfung		:= 0.0;
	
	
	//====================================================================================================================================================================================
	//Drehzahlregelung Kompressor 2 Eingänge
	//====================================================================================================================================================================================

	PidKompressor2.Sollgroesse				:= Betriebsparameter.Kompressor2.NiederdruckSoll;
	fbPidKompressor2.Freigabe				:= PidKompressor2.Enable;
	fbPidKompressor2.Sollwert				:= PidKompressor2.Sollgroesse;
	fbPidKompressor2.Istwert				:= gStatusAnlage.NiederdruckModul2;
	fbPidKompressor2.AbschwaechungSollwert	:= 1.0;
	fbPidKompressor2.Aufschaltgroesse		:= 0.0;
	fbPidKompressor2.Fehlerverzoegerung		:= 0;
	fbPidKompressor2.Hold_I					:= FALSE;
	fbPidKompressor2.Hysterese				:= Betriebsparameter.Kompressor2.Hysterese;
	fbPidKompressor2.Invert					:= TRUE;
	fbPidKompressor2.D_Anteil				:= Betriebsparameter.Kompressor2.D;
	fbPidKompressor2.D_Filterzeit			:= Betriebsparameter.Kompressor2.D * 1.4;
	fbPidKompressor2.I_Anteil				:= Betriebsparameter.Kompressor2.I;
	fbPidKompressor2.P_Anteil				:= Betriebsparameter.Kompressor2.P;
	fbPidKompressor2.RampeMax				:= 0.0;
	fbPidKompressor2.RegelbereichMin		:= Betriebsparameter.Sensoren.NiederdruckMessberMin;
	fbPidKompressor2.RegelbereichMax		:= Betriebsparameter.Sensoren.NiederdruckMessberMax;
	fbPidKompressor2.StellgroesseManuell	:= 0.0;
	fbPidKompressor2.StellgroesseMin		:= Betriebsparameter.Kompressor2.DrehzahlMin;
	fbPidKompressor2.StellgroesseMax		:= Betriebsparameter.Kompressor2.DrehzahlMax;
	fbPidKompressor2.WindupDaempfung		:= 0.0;
	
	
	//====================================================================================================================================================================================
	//Heizregister-Regler Eingänge
	//====================================================================================================================================================================================
	
	PidHeizregister.Sollgroesse					:= Betriebsparameter.Heizregister.TrockenluftTempSoll;
	fbPidHeizregister.Freigabe					:= PidHeizregister.Enable;
	fbPidHeizregister.Sollwert					:= PidHeizregister.Sollgroesse;
	fbPidHeizregister.Istwert					:= gStatusAnlage.TrockenluftTemperatur;
	fbPidHeizregister.AbschwaechungSollwert		:= 1.0;
	fbPidHeizregister.Aufschaltgroesse			:= 0.0;
	fbPidHeizregister.Fehlerverzoegerung		:= 0;
	fbPidHeizregister.Hold_I					:= FALSE;
	fbPidHeizregister.Hysterese					:= Betriebsparameter.Heizregister.Hysterese;
	fbPidHeizregister.Invert					:= FALSE;
	fbPidHeizregister.D_Anteil					:= Betriebsparameter.Heizregister.D;
	fbPidHeizregister.D_Filterzeit				:= Betriebsparameter.Heizregister.D * 1.4;
	fbPidHeizregister.I_Anteil					:= Betriebsparameter.Heizregister.I;
	fbPidHeizregister.P_Anteil					:= Betriebsparameter.Heizregister.P;
	fbPidHeizregister.RampeMax					:= 0.0;
	fbPidHeizregister.RegelbereichMin			:= 0.0;
	fbPidHeizregister.RegelbereichMax			:= 100.0;
	fbPidHeizregister.StellgroesseManuell		:= 0.0;
	fbPidHeizregister.StellgroesseMin			:= Betriebsparameter.Heizregister.DrehzahlVorgabeMin;
	fbPidHeizregister.StellgroesseMax			:= Betriebsparameter.Heizregister.DrehzahlVorgabeMax;
	fbPidHeizregister.WindupDaempfung			:= 0.0;

	
	
	//====================================================================================================================================================================================
	//Abluftregler Eingänge
	//====================================================================================================================================================================================
	
	PidAbluftregler.Sollgroesse					:= Betriebsparameter.Abluftventilator.AbluftfeuchteMax;
	fbPidAbluftregler.Freigabe					:= PidAbluftregler.Enable;
	fbPidAbluftregler.Sollwert					:= PidAbluftregler.Sollgroesse;
	fbPidAbluftregler.Istwert					:= gStatusAnlage.AbluftFeuchte;
	fbPidAbluftregler.AbschwaechungSollwert		:= 1.0;
	fbPidAbluftregler.Aufschaltgroesse			:= 0.0;
	fbPidAbluftregler.Fehlerverzoegerung		:= 0;
	fbPidAbluftregler.Hold_I					:= FALSE;
	fbPidAbluftregler.Hysterese					:= Betriebsparameter.Abluftventilator.Hysterese;
	fbPidAbluftregler.Invert					:= TRUE;
	fbPidAbluftregler.D_Anteil					:= Betriebsparameter.Abluftventilator.D;
	fbPidAbluftregler.D_Filterzeit				:= Betriebsparameter.Abluftventilator.D * 1.4;
	fbPidAbluftregler.I_Anteil					:= Betriebsparameter.Abluftventilator.I;
	fbPidAbluftregler.P_Anteil					:= Betriebsparameter.Abluftventilator.P;
	fbPidAbluftregler.RampeMax					:= 0.0;
	fbPidAbluftregler.RegelbereichMin			:= 0.0;
	fbPidAbluftregler.RegelbereichMax			:= 100.0;
	fbPidAbluftregler.StellgroesseManuell		:= 0.0;
	fbPidAbluftregler.StellgroesseMin			:= Betriebsparameter.Abluftventilator.DrehzahlMin;
	fbPidAbluftregler.StellgroesseMax			:= Betriebsparameter.Abluftventilator.DrehzahlMax;
	fbPidAbluftregler.WindupDaempfung			:= 0.0;

	
	
	
	//========================================================================================================================================================================================
	//Schrittschaltwerk Regelung
	//========================================================================================================================================================================================
			
	
	
	//**********************************************************************************************************************************************************************************
	IF gAktModus = STILLSTAND THEN
		
		
		//*** Luftmengenregler Eingänge *** 
		PidLuftmengeVent1.Enable	:= FALSE;
		PidLuftmengeVent2.Enable	:= FALSE;
		
		//*** Regler Kompressor 1 & 2 Eingänge ***
		PidKompressor1.Enable	:= FALSE;
		PidKompressor2.Enable	:= FALSE;
		
		//*** Regler Heizregister Eingänge ***
		PidHeizregister.Enable	:= FALSE;
		
		//*** Abluftregler Eingänge ***
		PidAbluftregler.Enable	:= Betriebsparameter.Abluftventilator.Automatik AND 
		(Aktoren.VentUndKlappen.AnforderungVentilator1 OR Aktoren.VentUndKlappen.AnforderungVentilator2);
		
		//*** Drehzahlvorgabe Ventilator 1 & 2 *** 
		IF Aktoren.VentUndKlappen.AnforderungVentilator1 THEN
			gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlBeiAuskuehlphase;
		ELSE
			gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlMin;
		END_IF
		
		IF Aktoren.VentUndKlappen.AnforderungVentilator2 THEN
			gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlBeiAuskuehlphase;
		ELSE
			gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlMin;
		END_IF

		//*** Drehzahlvorgabe Kompressor 1 & 2 ***
		gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= 0.0;
		gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= 0.0;

		//*** Drehzahlvorgabe Heizregister ***
		gCmdAnlage.Leistung.DrehzahlHeizregister		:= 0.0;
		
		//*** Drehzahlvorgabe Abluftventilator ***
		IF PidAbluftregler.Enable THEN
			gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= fbPidAbluftregler.Stellgroesse;
		ELSE
			gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= Betriebsparameter.Abluftventilator.DrehzahlMin;
		END_IF

		

	
		//**********************************************************************************************************************************************************************************
	ELSIF gAktModus = BETRIEB THEN
		
		
		//*** Luftmengenregler Eingänge *** 
		//Kunde Gschneitner: Warmluft entspricht dem frueheren Umluftbetrieb. Die Luftmengenregelung ist deshalb
		//je Klappenstellung getrennt waehlbar: bei Warmluft ueber 'Luftmengenregelung Umluft', bei Kaltluft ueber
		//'Luftmengenregelung Frischluft' (beide auf der Ventilator-Detailseite in der Visu).
		IF gStatusAnlage.Warmluft1 THEN
			PidLuftmengeVent1.Enable	:= Betriebsparameter.Ventilator1.LuftmengenregUmluftEin;
		ELSE
			PidLuftmengeVent1.Enable	:= Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin;
		END_IF
		
		IF gStatusAnlage.Warmluft2 THEN
			PidLuftmengeVent2.Enable	:= Betriebsparameter.Ventilator2.LuftmengenregUmluftEin;
		ELSE
			PidLuftmengeVent2.Enable	:= Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin;
		END_IF
		
		//Originallogik (Frischluft-/Umluftbetrieb) - fuer Kunde Gschneitner nicht in Verwendung:
		(*
		//*** Luftmengenregler Eingänge *** 
		IF gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin THEN
			PidLuftmengeVent1.Enable	:= TRUE;
		//ELSIF (gStatusAnlage.UmluftbetriebAktiv AND Betriebsparameter.Ventilator1.LuftmengenregUmluftEin) AND NOT hmiButtons.changeBetrArtUmluftklappen THEN
		//	PidLuftmengeVent1.Enable	:= TRUE;
		//Kunde Gschneitner wenn Warmluftbetrieb Ventilator 1 aktiv dann Luftmengenregler aktivieren
		ELSIF hmiButtons.changeBetrArtUmluftklappen THEN
			PidLuftmengeVent1.Enable	:= TRUE;
		ELSE
			PidLuftmengeVent1.Enable	:= FALSE;
		END_IF
		
		IF gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin THEN
			PidLuftmengeVent2.Enable	:= TRUE;
		//ELSIF (gStatusAnlage.UmluftbetriebAktiv AND Betriebsparameter.Ventilator2.LuftmengenregUmluftEin) AND NOT hmiButtons.changeBetrArtBypassklappe THEN
		//	PidLuftmengeVent2.Enable	:= TRUE;
		//Kunde Gschneitner wenn Warmluftbetrieb Ventilator 2 aktiv dann Luftmengenregler aktivieren
		ELSIF hmiButtons.changeBetrArtBypassklappe THEN
			PidLuftmengeVent2.Enable	:= TRUE;
		ELSE
			PidLuftmengeVent2.Enable	:= FALSE;
		END_IF
		
		*)
		
		//*** Regler Kompressor 1 & 2 Eingänge ***
		PidKompressor1.Enable	:= Betriebsparameter.Kompressor1.DrehzahlregelungEin;
		PidKompressor2.Enable	:= Betriebsparameter.Kompressor2.DrehzahlregelungEin;
		
		//*** Regler Heizregister Eingänge ***
		//Kunde Gschneitner: Regler zusaetzlich sperren, wenn kein laufender Ventilator auf Warmluft steht
		//(sonst laeuft der I-Anteil weiter, waehrend das Heizregister bereits abgeschaltet ist).
		PidHeizregister.Enable	:= Betriebsparameter.Ausstattung.Heizregister AND NOT diHeizregisterFrostschutz AND
		gStatusAnlage.WarmluftAnforderung;
		
		//*** Abluftregler Eingänge ***
		PidAbluftregler.Enable	:= Betriebsparameter.Abluftventilator.Automatik;
		
		//*** Drehzahlvorgabe Ventilator 1 *** 
		
		//Digitaler Eingang Leistungsreduzierung aktiv
		IF diDrehzahlbegrVentilator1 THEN
			IF PidLuftmengeVent1.Enable THEN
				IF (fbPidLuftmengeVent1.Stellgroesse > Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= fbPidLuftmengeVent1.Stellgroesse;
				END_IF
			ELSIF gStatusAnlage.FrischluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator1.DrehzahlFixFrischluft > Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixFrischluft;
				END_IF
			ELSIF gStatusAnlage.UmluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator1.DrehzahlFixUmluft > Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixUmluft;
				END_IF
			END_IF
			//Strombegrenzung aktiv (Zeitfenster)
		ELSIF Strombegrenzung.StrombegrenzungEin THEN
			IF PidLuftmengeVent1.Enable THEN
				IF (fbPidLuftmengeVent1.Stellgroesse > Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= fbPidLuftmengeVent1.Stellgroesse;
				END_IF
			ELSIF gStatusAnlage.FrischluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator1.DrehzahlFixFrischluft > Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixFrischluft;
				END_IF
			ELSIF gStatusAnlage.UmluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator1.DrehzahlFixUmluft > Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixUmluft;
				END_IF
			END_IF
		//Notbetrieb Ventilator -> Drehzahl Auskühlphase
		ELSIF (Boxen.NotbetriebVentilator1 AND NOT Boxen.FreigabeVentilator1) THEN
			gCmdAnlage.Leistung.DrehzahlVentilator1 := Betriebsparameter.Ventilator1.DrehzahlBeiAuskuehlphase;		
			//Luftmengenregelung aktiv
		ELSIF PidLuftmengeVent1.Enable THEN
			gCmdAnlage.Leistung.DrehzahlVentilator1	:= fbPidLuftmengeVent1.Stellgroesse;
			//Betrieb mit Fixdrehzahlen
		ELSE
			IF gStatusAnlage.FrischluftbetriebAktiv THEN
				gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixFrischluft;
			ELSE
				gCmdAnlage.Leistung.DrehzahlVentilator1	:= Betriebsparameter.Ventilator1.DrehzahlFixUmluft;
			END_IF
		END_IF
		
		
		//*** Drehzahlvorgabe Ventilator 2 *** 
		
		//Digitaler Eingang Leistungsreduzierung aktiv
		IF diDrehzahlbegrVentilator2 THEN
			IF PidLuftmengeVent2.Enable THEN
				IF (fbPidLuftmengeVent2.Stellgroesse > Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= fbPidLuftmengeVent2.Stellgroesse;
				END_IF
			ELSIF gStatusAnlage.FrischluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator2.DrehzahlFixFrischluft > Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixFrischluft;
				END_IF
			ELSIF gStatusAnlage.UmluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator2.DrehzahlFixUmluft > Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlLeistungsreduz;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixUmluft;
				END_IF
			END_IF
			//Strombegrenzung aktiv (Zeitfenster)
		ELSIF Strombegrenzung.StrombegrenzungEin THEN
			IF PidLuftmengeVent2.Enable THEN
				IF (fbPidLuftmengeVent2.Stellgroesse > Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= fbPidLuftmengeVent2.Stellgroesse;
				END_IF
			ELSIF gStatusAnlage.FrischluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator2.DrehzahlFixFrischluft > Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixFrischluft;
				END_IF
			ELSIF gStatusAnlage.UmluftbetriebAktiv THEN
				IF (Betriebsparameter.Ventilator2.DrehzahlFixUmluft > Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung) THEN
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlStrombegrenzung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixUmluft;
				END_IF
			END_IF
		//Notbetrieb Ventilator -> Drehzahl Auskühlphase
		ELSIF (Boxen.NotbetriebVentilator2 AND NOT Boxen.FreigabeVentilator2) THEN
			gCmdAnlage.Leistung.DrehzahlVentilator2 := Betriebsparameter.Ventilator2.DrehzahlBeiAuskuehlphase;
			//Luftmengenregelung aktiv
		ELSIF PidLuftmengeVent2.Enable THEN
			gCmdAnlage.Leistung.DrehzahlVentilator2	:= fbPidLuftmengeVent2.Stellgroesse;
			//Betrieb mit Fixdrehzahlen
		ELSE
			IF gStatusAnlage.FrischluftbetriebAktiv THEN
				gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixFrischluft;
			ELSE
				gCmdAnlage.Leistung.DrehzahlVentilator2	:= Betriebsparameter.Ventilator2.DrehzahlFixUmluft;
			END_IF
		END_IF


		//*** Drehzahlvorgabe Kompressor 1 ***
		
		//Digitaler Eingang für Leistungsreduzierung aktiv
		IF diLeistungsvorgKompressorExtMod1 THEN
			IF PidKompressor1.Enable THEN
				IF fbPidKompressor1.Stellgroesse > Betriebsparameter.Kompressor1.DrehzahlReduzierung THEN
					gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= Betriebsparameter.Kompressor1.DrehzahlReduzierung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= fbPidKompressor1.Stellgroesse;
				END_IF
			END_IF
		//Drehzahlregelung aktiv
		ELSIF PidKompressor1.Enable THEN
			gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= fbPidKompressor1.Stellgroesse;
		//Betrieb mit Fixdrehzahl
		ELSE
			gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= Betriebsparameter.Kompressor1.DrehzahlFix;
		END_IF
		
		
		//*** Drehzahlvorgabe Kompressor 2 ***
		
		//Digitaler Eingang für Leistungsreduzierung aktiv
		IF diLeistungsvorgKompressorExtMod1 THEN
			IF PidKompressor2.Enable THEN
				IF fbPidKompressor2.Stellgroesse > Betriebsparameter.Kompressor2.DrehzahlReduzierung THEN
					gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= Betriebsparameter.Kompressor2.DrehzahlReduzierung;
				ELSE
					gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= fbPidKompressor2.Stellgroesse;
				END_IF
			END_IF
			//Drehzahlregelung aktiv
		ELSIF PidKompressor2.Enable THEN
			gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= fbPidKompressor2.Stellgroesse;
			//Betrieb mit Fixdrehzahl
		ELSE
			gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= Betriebsparameter.Kompressor2.DrehzahlFix;
		END_IF
		

		//*** Drehzahlvorgabe Heizregister ***
		IF PidHeizregister.Enable AND Aktoren.Heizregister.FreigabeHeizregisterOut THEN
			gCmdAnlage.Leistung.DrehzahlHeizregister		:= fbPidHeizregister.Stellgroesse;
		ELSE
			gCmdAnlage.Leistung.DrehzahlHeizregister		:= Betriebsparameter.Heizregister.DrehzahlVorgabeMin;
		END_IF
		
		
		//*** Drehzahlvorgabe Abluftventilator ***
		IF gStatusAnlage.FrischluftbetriebAktiv AND Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen THEN
			gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= Betriebsparameter.Abluftventilator.DrehzahlMax;
		ELSIF PidAbluftregler.Enable AND Betriebsparameter.Abluftventilator.Automatik THEN
			gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= fbPidAbluftregler.Stellgroesse;
		ELSE
			gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= Betriebsparameter.Abluftventilator.DrehzahlMax;
		END_IF
		
		
	//***************************************************************************************************************************************************************	
	ELSE
		
		//*** Luftmengenregler Eingänge *** 
		PidLuftmengeVent1.Enable	:= FALSE;
		PidLuftmengeVent2.Enable	:= FALSE;
		
		//*** Regler Kompressor 1 & 2 Eingänge ***
		PidKompressor1.Enable	:= FALSE;
		PidKompressor2.Enable	:= FALSE;
		
		//*** Regler Heizregister Eingänge ***
		PidHeizregister.Enable	:= FALSE;
		
		//*** Abluftregler Eingänge ***
		PidAbluftregler.Enable	:= FALSE;
		
		//*** Drehzahlvorgabe Ventilator 1 & 2 *** 
		gCmdAnlage.Leistung.DrehzahlVentilator1	:= 0.0;
		gCmdAnlage.Leistung.DrehzahlVentilator2	:= 0.0;

		//*** Drehzahlvorgabe Kompressor 1 & 2 ***
		gCmdAnlage.Leistung.DrehzahlKompressorModul1	:= 0.0;
		gCmdAnlage.Leistung.DrehzahlKompressorModul2	:= 0.0;

		//*** Drehzahlvorgabe Heizregister ***
		gCmdAnlage.Leistung.DrehzahlHeizregister		:= 0.0;
		
		//*** Drehzahlvorgabe Abluftventilator ***
		gCmdAnlage.Leistung.DrehzahlAbluftventilator	:= 0.0;
	
		
	END_IF

		
	//Funktionsblock Aufrufe
	//=======================
	
	//Luftmengenregler Ventilator 1
	IF fbPidLuftmengeVent1.Freigabe THEN
		fbPidLuftmengeVent1.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidLuftmengeVent1.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidLuftmengeVent1();
	
	//Luftmengenregler Ventilator 2
	IF fbPidLuftmengeVent2.Freigabe THEN
		fbPidLuftmengeVent2.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidLuftmengeVent2.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidLuftmengeVent2();
	
	//Regler Heizregister
	IF fbPidHeizregister.Freigabe THEN
		fbPidHeizregister.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidHeizregister.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidHeizregister();
	
	//Regler Kompressor 1
	IF fbPidKompressor1.Freigabe THEN
		fbPidKompressor1.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidKompressor1.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidKompressor1();
	
	//Regler Kompressor 2
	IF fbPidKompressor2.Freigabe THEN
		fbPidKompressor2.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidKompressor2.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidKompressor2();
	
	//Abluftregler
	IF fbPidAbluftregler.Freigabe THEN
		fbPidAbluftregler.Mode	:= FBREG_MODUS_AUTO;
	ELSE
		fbPidAbluftregler.Mode	:= FBREG_MODUS_FREEZE;
	END_IF
	fbPidAbluftregler();
	

END_PROGRAM