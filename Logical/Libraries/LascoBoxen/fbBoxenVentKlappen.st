
(* Funktionsbaustein für Ansteuerung Ventilatoren und Klappen *)
FUNCTION_BLOCK fbBoxenVentKlappen

	IF Freigabe THEN
		
		//Zeitticks erzeugen
		fbLascoEUhr_0(Freigabe := TRUE);
		fbLascoZdxx_0(IN := fbLascoEUhr_0.Sekunde);
		sekTick	:= fbLascoZdxx_0.Q;
		
		
		//Abfrage, ob Umschaltung Klappen erforderlich
		
		loc_AenderungBypassklappe		:= ((BypassklappeOeffnen AND NOT (EndlBypassOffen OR Bypassklappe.KlappeIstOffenOut)) OR 
		(BypassklappeSchliessen AND NOT (EndlBypassGeschl OR Bypassklappe.KlappeIstGeschlOut))) AND (LaufzeitBypassklappe <> 0);
		
		loc_AenderungUmschaltklappe1	:= ((Umschaltkl1Oeffnen AND NOT (EndlUmschaltkl1Offen OR Umschaltklappe1.KlappeIstOffenOut)) OR 
		(Umschaltkl1Schliessen AND NOT (EndlUmschaltkl1Geschl OR Umschaltklappe1.KlappeIstGeschlOut))) AND (LaufzeitUmschaltklappe1 <> 0);
		
		loc_AenderungUmschaltklappe2	:= ((Umschaltkl2Oeffnen AND NOT (EndlUmschaltkl2Offen OR Umschaltklappe2.KlappeIstOffenOut)) OR
		(Umschaltkl2Schliessen AND NOT (EndlUmschaltkl2Geschl OR Umschaltklappe2.KlappeIstGeschlOut))) AND (LaufzeitUmschaltklappe2 <> 0);
		
		loc_AenderungBoxenklappe1		:= Boxenklappe1Vorhanden AND ((Boxenklappe1Oeffnen AND NOT (EndlBoxenklappe1Offen OR Boxenklappe1.KlappeIstOffenOut)) OR
		(Boxenklappe1Schliessen AND NOT (EndlBoxenklappe1Geschl OR Boxenklappe1.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe1 <> 0);
		
		loc_AenderungBoxenklappe2		:= Boxenklappe2Vorhanden AND ((Boxenklappe2Oeffnen AND NOT (EndlBoxenklappe2Offen OR Boxenklappe2.KlappeIstOffenOut)) OR
		(Boxenklappe2Schliessen AND NOT (EndlBoxenklappe2Geschl OR Boxenklappe2.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe2 <> 0);
		
		loc_AenderungBoxenklappe3		:= Boxenklappe3Vorhanden AND ((Boxenklappe3Oeffnen AND NOT (EndlBoxenklappe3Offen OR Boxenklappe3.KlappeIstOffenOut)) OR
		(Boxenklappe3Schliessen AND NOT (EndlBoxenklappe3Geschl OR Boxenklappe3.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe3 <> 0);
		
		loc_AenderungBoxenklappe4		:= Boxenklappe4Vorhanden AND ((Boxenklappe4Oeffnen AND NOT (EndlBoxenklappe4Offen OR Boxenklappe4.KlappeIstOffenOut)) OR
		(Boxenklappe4Schliessen AND NOT (EndlBoxenklappe4Geschl OR Boxenklappe4.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe4 <> 0);
		
		loc_AenderungBoxenklappe5		:= Boxenklappe5Vorhanden AND ((Boxenklappe5Oeffnen AND NOT (EndlBoxenklappe5Offen OR Boxenklappe5.KlappeIstOffenOut)) OR
		(Boxenklappe5Schliessen AND NOT (EndlBoxenklappe5Geschl OR Boxenklappe5.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe5 <> 0);
		
		loc_AenderungBoxenklappe6		:= Boxenklappe6Vorhanden AND ((Boxenklappe6Oeffnen AND NOT (EndlBoxenklappe6Offen OR Boxenklappe6.KlappeIstOffenOut)) OR
		(Boxenklappe6Schliessen AND NOT (EndlBoxenklappe6Geschl OR Boxenklappe6.KlappeIstGeschlOut))) AND (LaufzeitBoxenklappe6 <> 0);
		
		
		//Umschaltung erforderlich bei Ventilator 1
		loc_UmschaltungErforderlVent1		:= (loc_AenderungBypassklappe AND BypassklVonVent1Abhaengig) OR 
		(loc_AenderungUmschaltklappe1 AND UmluftklVonVent1Abhaengig) OR (loc_AenderungUmschaltklappe2 AND UmluftklVonVent1Abhaengig) OR 
		(loc_AenderungBoxenklappe1 AND Boxenkl1VonVent1Abhaengig) OR (loc_AenderungBoxenklappe2 AND Boxenkl2VonVent1Abhaengig) OR 
		(loc_AenderungBoxenklappe3 AND Boxenkl3VonVent1Abhaengig) OR (loc_AenderungBoxenklappe4 AND Boxenkl4VonVent1Abhaengig) OR 
		(loc_AenderungBoxenklappe5 AND Boxenkl5VonVent1Abhaengig) OR (loc_AenderungBoxenklappe6 AND Boxenkl6VonVent1Abhaengig);
		
		//Umschaltung erfoderlich bei Ventilator 2
		loc_UmschaltungErforderlVent2		:= (loc_AenderungBypassklappe AND BypassklVonVent2Abhaengig) OR 
		(loc_AenderungUmschaltklappe1 AND UmluftklVonVent2Abhaengig) OR (loc_AenderungUmschaltklappe2 AND UmluftklVonVent2Abhaengig) OR 
		(loc_AenderungBoxenklappe1 AND Boxenkl1VonVent2Abhaengig) OR (loc_AenderungBoxenklappe2 AND Boxenkl2VonVent2Abhaengig) OR 
		(loc_AenderungBoxenklappe3 AND Boxenkl3VonVent2Abhaengig) OR (loc_AenderungBoxenklappe4 AND Boxenkl4VonVent2Abhaengig) OR 
		(loc_AenderungBoxenklappe5 AND Boxenkl5VonVent2Abhaengig) OR (loc_AenderungBoxenklappe6 AND Boxenkl6VonVent2Abhaengig);
		
		
	
		//Funktionsbaustein Ansteuerung FU Ventilator 1
		fbFuVentilator1.AnsprechZeitFU		:= 5;
		fbFuVentilator1.BetrMldg			:= Ventilator1InBetrieb;
		fbFuVentilator1.MinDrehzahl			:= DrehzahlVent1Min;
		fbFuVentilator1.MaxDrehzahl			:= DrehzahlVent1Max;
		fbFuVentilator1.RampeUpSek			:= RampeVent1Up;
		fbFuVentilator1.RampeDownSek		:= RampeVent1Down;
		fbFuVentilator1.Reset				:= QuitFehler;
		fbFuVentilator1.Tick				:= sekTick;
		fbFuVentilator1();
		FreigabeVentilator1Out				:= fbFuVentilator1.BetriebFU;
		DrehzahlVent1Out					:= fbFuVentilator1.DrehzahlFU;
		FehlerFuVentilator1					:= fbFuVentilator1.StoerungFU;
		
		//Funktionsbaustein Ansteuerung FU Ventilator 2
		fbFuVentilator2.AnsprechZeitFU		:= 5;
		fbFuVentilator2.BetrMldg			:= Ventilator2InBetrieb;
		fbFuVentilator2.MinDrehzahl			:= DrehzahlVent2Min;
		fbFuVentilator2.MaxDrehzahl			:= DrehzahlVent2Max;
		fbFuVentilator2.RampeUpSek			:= RampeVent2Up;
		fbFuVentilator2.RampeDownSek		:= RampeVent2Down;
		fbFuVentilator2.Reset				:= QuitFehler;
		fbFuVentilator2.Tick				:= sekTick;
		fbFuVentilator2();
		FreigabeVentilator2Out				:= fbFuVentilator2.BetriebFU;
		DrehzahlVent2Out					:= fbFuVentilator2.DrehzahlFU;
		FehlerFuVentilator2					:= fbFuVentilator2.StoerungFU;

		//Funktionsbausteine Klappen
		Bypassklappe.EndlagenVhd			:= EndlagenVhdBypassklappe;
		Bypassklappe.EndlageOffen			:= EndlBypassOffen;
		Bypassklappe.EndlageGeschl			:= EndlBypassGeschl;
		Bypassklappe.LaufzeitOeffnen		:= LaufzeitBypassklappe;
		Bypassklappe.LaufzeitSchliessen		:= LaufzeitBypassklappe;
		Bypassklappe.Stoerung				:= EndlBypassGeschl AND EndlBypassOffen;
		Bypassklappe.QuitFehler				:= QuitFehler;
		Bypassklappe();
		BypassOeffnenOut					:= Bypassklappe.OeffnenOut;
		BypassSchliessenOut					:= Bypassklappe.SchliessenOut;
		FehlerLaufzeitBypass				:= Bypassklappe.FehlerLaufzeitOeffnen OR Bypassklappe.FehlerLaufzeitSchliessen;	
		BypassklappeIstGeschl				:= Bypassklappe.KlappeIstGeschlOut;
		BypassklappeIstOffen				:= Bypassklappe.KlappeIstOffenOut;
		
		Umschaltklappe1.EndlagenVhd			:= EndlagenVhdUmschaltklappe1;
		Umschaltklappe1.EndlageOffen		:= EndlUmschaltkl1Offen;
		Umschaltklappe1.EndlageGeschl		:= EndlUmschaltkl1Geschl;
		Umschaltklappe1.LaufzeitOeffnen		:= LaufzeitUmschaltklappe1;
		Umschaltklappe1.LaufzeitSchliessen	:= LaufzeitUmschaltklappe1;
		Umschaltklappe1.Stoerung			:= EndlUmschaltkl1Offen AND EndlUmschaltkl1Geschl;
		Umschaltklappe1.QuitFehler			:= QuitFehler;
		Umschaltklappe1();
		Umschaltkl1OeffnenOut				:= Umschaltklappe1.OeffnenOut;
		Umschaltkl1SchliessenOut			:= Umschaltklappe1.SchliessenOut;
		FehlerLaufzeitUmschaltkl1			:= Umschaltklappe1.FehlerLaufzeitOeffnen OR Umschaltklappe1.FehlerLaufzeitSchliessen;
		Umschaltklappe1IstGeschl			:= Umschaltklappe1.KlappeIstGeschlOut;
		Umschaltklappe1IstOffen				:= Umschaltklappe1.KlappeIstOffenOut;
	
		Umschaltklappe2.EndlagenVhd			:= EndlagenVhdUmschaltklappe2;
		Umschaltklappe2.EndlageOffen		:= EndlUmschaltkl2Offen;
		Umschaltklappe2.EndlageGeschl		:= EndlUmschaltkl2Geschl;
		Umschaltklappe2.LaufzeitOeffnen		:= LaufzeitUmschaltklappe2;
		Umschaltklappe2.LaufzeitSchliessen	:= LaufzeitUmschaltklappe2;
		Umschaltklappe2.Stoerung			:= EndlUmschaltkl2Offen AND EndlUmschaltkl2Geschl;
		Umschaltklappe2.QuitFehler			:= QuitFehler;
		Umschaltklappe2();
		Umschaltkl2OeffnenOut				:= Umschaltklappe2.OeffnenOut;
		Umschaltkl2SchliessenOut			:= Umschaltklappe2.SchliessenOut;
		FehlerLaufzeitUmschaltkl2			:= Umschaltklappe2.FehlerLaufzeitOeffnen OR Umschaltklappe2.FehlerLaufzeitSchliessen;
		Umschaltklappe2IstGeschl			:= Umschaltklappe2.KlappeIstGeschlOut;
		Umschaltklappe2IstOffen				:= Umschaltklappe2.KlappeIstOffenOut;
		
		Boxenklappe1.EndlagenVhd			:= EndlagenVhdBoxenklappe1;
		Boxenklappe1.EndlageOffen			:= EndlBoxenklappe1Offen;
		Boxenklappe1.EndlageGeschl			:= EndlBoxenklappe1Geschl;
		Boxenklappe1.LaufzeitOeffnen		:= LaufzeitBoxenklappe1;
		Boxenklappe1.LaufzeitSchliessen		:= LaufzeitBoxenklappe1;
		Boxenklappe1.Stoerung				:= EndlBoxenklappe1Offen AND EndlBoxenklappe1Geschl;
		Boxenklappe1.QuitFehler				:= QuitFehler;
		Boxenklappe1();
		Boxenklappe1IstGeschl				:= Boxenklappe1.KlappeIstGeschlOut;
		Boxenklappe1IstOffen				:= Boxenklappe1.KlappeIstOffenOut;
		IF Boxenklappe1Vorhanden THEN
			Boxenklappe1OeffnenOut				:= Boxenklappe1.OeffnenOut;
			Boxenklappe1SchliessenOut			:= Boxenklappe1.SchliessenOut;
			FehlerLaufzeitKlappeBox1			:= Boxenklappe1.FehlerLaufzeitOeffnen OR Boxenklappe1.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe1OeffnenOut				:= FALSE;
			Boxenklappe1SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox1			:= FALSE;
		END_IF
			
		Boxenklappe2.EndlagenVhd			:= EndlagenVhdBoxenklappe2;
		Boxenklappe2.EndlageOffen			:= EndlBoxenklappe2Offen;
		Boxenklappe2.EndlageGeschl			:= EndlBoxenklappe2Geschl;
		Boxenklappe2.LaufzeitOeffnen		:= LaufzeitBoxenklappe2;
		Boxenklappe2.LaufzeitSchliessen		:= LaufzeitBoxenklappe2;
		Boxenklappe2.Stoerung				:= EndlBoxenklappe2Offen AND EndlBoxenklappe2Geschl;
		Boxenklappe2.QuitFehler				:= QuitFehler;
		Boxenklappe2();
		Boxenklappe2IstGeschl				:= Boxenklappe2.KlappeIstGeschlOut;
		Boxenklappe2IstOffen				:= Boxenklappe2.KlappeIstOffenOut;
		IF Boxenklappe2Vorhanden THEN
			Boxenklappe2OeffnenOut				:= Boxenklappe2.OeffnenOut;
			Boxenklappe2SchliessenOut			:= Boxenklappe2.SchliessenOut;
			FehlerLaufzeitKlappeBox2			:= Boxenklappe2.FehlerLaufzeitOeffnen OR Boxenklappe2.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe2OeffnenOut				:= FALSE;
			Boxenklappe2SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox2			:= FALSE;
		END_IF

		Boxenklappe3.EndlagenVhd			:= EndlagenVhdBoxenklappe3;
		Boxenklappe3.EndlageOffen			:= EndlBoxenklappe3Offen;
		Boxenklappe3.EndlageGeschl			:= EndlBoxenklappe3Geschl;
		Boxenklappe3.LaufzeitOeffnen		:= LaufzeitBoxenklappe3;
		Boxenklappe3.LaufzeitSchliessen		:= LaufzeitBoxenklappe3;
		Boxenklappe3.Stoerung				:= EndlBoxenklappe3Offen AND EndlBoxenklappe3Geschl;
		Boxenklappe3.QuitFehler				:= QuitFehler;
		Boxenklappe3();
		Boxenklappe3IstGeschl				:= Boxenklappe3.KlappeIstGeschlOut;
		Boxenklappe3IstOffen				:= Boxenklappe3.KlappeIstOffenOut;
		IF Boxenklappe3Vorhanden THEN
			Boxenklappe3OeffnenOut				:= Boxenklappe3.OeffnenOut;
			Boxenklappe3SchliessenOut			:= Boxenklappe3.SchliessenOut;
			FehlerLaufzeitKlappeBox3			:= Boxenklappe3.FehlerLaufzeitOeffnen OR Boxenklappe3.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe3OeffnenOut				:= FALSE;
			Boxenklappe3SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox3			:= FALSE;
		END_IF
	
		Boxenklappe4.EndlagenVhd			:= EndlagenVhdBoxenklappe4;
		Boxenklappe4.EndlageOffen			:= EndlBoxenklappe4Offen;
		Boxenklappe4.EndlageGeschl			:= EndlBoxenklappe4Geschl;
		Boxenklappe4.LaufzeitOeffnen		:= LaufzeitBoxenklappe4;
		Boxenklappe4.LaufzeitSchliessen		:= LaufzeitBoxenklappe4;
		Boxenklappe4.Stoerung				:= EndlBoxenklappe4Offen AND EndlBoxenklappe4Geschl;
		Boxenklappe4.QuitFehler				:= QuitFehler;
		Boxenklappe4();
		Boxenklappe4IstGeschl				:= Boxenklappe4.KlappeIstGeschlOut;
		Boxenklappe4IstOffen				:= Boxenklappe4.KlappeIstOffenOut;
		IF Boxenklappe4Vorhanden THEN
			Boxenklappe4OeffnenOut				:= Boxenklappe4.OeffnenOut;
			Boxenklappe4SchliessenOut			:= Boxenklappe4.SchliessenOut;
			FehlerLaufzeitKlappeBox4			:= Boxenklappe4.FehlerLaufzeitOeffnen OR Boxenklappe4.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe4OeffnenOut				:= FALSE;
			Boxenklappe4SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox4			:= FALSE;
		END_IF
		
		Boxenklappe5.EndlagenVhd			:= EndlagenVhdBoxenklappe5;
		Boxenklappe5.EndlageOffen			:= EndlBoxenklappe5Offen;
		Boxenklappe5.EndlageGeschl			:= EndlBoxenklappe5Geschl;
		Boxenklappe5.LaufzeitOeffnen		:= LaufzeitBoxenklappe5;
		Boxenklappe5.LaufzeitSchliessen		:= LaufzeitBoxenklappe5;
		Boxenklappe5.Stoerung				:= EndlBoxenklappe5Offen AND EndlBoxenklappe5Geschl;
		Boxenklappe5.QuitFehler				:= QuitFehler;
		Boxenklappe5();
		Boxenklappe5IstGeschl				:= Boxenklappe5.KlappeIstGeschlOut;
		Boxenklappe5IstOffen				:= Boxenklappe5.KlappeIstOffenOut;
		IF Boxenklappe5Vorhanden THEN
			Boxenklappe5OeffnenOut				:= Boxenklappe5.OeffnenOut;
			Boxenklappe5SchliessenOut			:= Boxenklappe5.SchliessenOut;
			FehlerLaufzeitKlappeBox5			:= Boxenklappe5.FehlerLaufzeitOeffnen OR Boxenklappe5.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe5OeffnenOut				:= FALSE;
			Boxenklappe5SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox5			:= FALSE;
		END_IF
		
		Boxenklappe6.EndlagenVhd			:= EndlagenVhdBoxenklappe6;
		Boxenklappe6.EndlageOffen			:= EndlBoxenklappe6Offen;
		Boxenklappe6.EndlageGeschl			:= EndlBoxenklappe6Geschl;
		Boxenklappe6.LaufzeitOeffnen		:= LaufzeitBoxenklappe6;
		Boxenklappe6.LaufzeitSchliessen		:= LaufzeitBoxenklappe6;
		Boxenklappe6.Stoerung				:= EndlBoxenklappe6Offen AND EndlBoxenklappe6Geschl;
		Boxenklappe6.QuitFehler				:= QuitFehler;
		Boxenklappe6();
		Boxenklappe6IstGeschl				:= Boxenklappe6.KlappeIstGeschlOut;
		Boxenklappe6IstOffen				:= Boxenklappe6.KlappeIstOffenOut;
		IF Boxenklappe6Vorhanden THEN
			Boxenklappe6OeffnenOut				:= Boxenklappe6.OeffnenOut;
			Boxenklappe6SchliessenOut			:= Boxenklappe6.SchliessenOut;
			FehlerLaufzeitKlappeBox6			:= Boxenklappe6.FehlerLaufzeitOeffnen OR Boxenklappe6.FehlerLaufzeitSchliessen;
		ELSE
			Boxenklappe6OeffnenOut				:= FALSE;
			Boxenklappe6SchliessenOut			:= FALSE;
			FehlerLaufzeitKlappeBox6			:= FALSE;
		END_IF
		

		//Wenn Laufzeit Klappe auf "0" (Drehzahl Ventilator wird bei Umschaltung der Klappe nicht reduziert) 
		//oder Option bei Umluftklappen aktiviert -> Klappen direkt ansteuern
		IF LaufzeitBypassklappe = 0 THEN
			Bypassklappe.Oeffnen			:= BypassklappeOeffnen;
			Bypassklappe.Schliessen			:= BypassklappeSchliessen;
		END_IF
		IF (LaufzeitUmschaltklappe1 = 0) OR (NOT UmluftklVonVent1Abhaengig AND NOT UmluftklVonVent2Abhaengig) THEN
			Umschaltklappe1.Oeffnen			:= Umschaltkl1Oeffnen;
			Umschaltklappe1.Schliessen		:= Umschaltkl1Schliessen;
		END_IF
		IF (LaufzeitUmschaltklappe2 = 0) OR (NOT UmluftklVonVent1Abhaengig AND NOT UmluftklVonVent2Abhaengig) THEN
			Umschaltklappe2.Oeffnen			:= Umschaltkl2Oeffnen;
			Umschaltklappe2.Schliessen		:= Umschaltkl2Schliessen;
		END_IF
		IF LaufzeitBoxenklappe1 = 0 THEN
			Boxenklappe1.Oeffnen			:= Boxenklappe1Oeffnen AND Boxenklappe1Vorhanden;
			Boxenklappe1.Schliessen			:= Boxenklappe1Schliessen AND Boxenklappe1Vorhanden;
		END_IF
		IF LaufzeitBoxenklappe2 = 0 THEN
			Boxenklappe2.Oeffnen			:= Boxenklappe2Oeffnen AND Boxenklappe2Vorhanden;
			Boxenklappe2.Schliessen			:= Boxenklappe2Schliessen AND Boxenklappe2Vorhanden;
		END_IF
		IF LaufzeitBoxenklappe3 = 0 THEN
			Boxenklappe3.Oeffnen			:= Boxenklappe3Oeffnen AND Boxenklappe3Vorhanden;
			Boxenklappe3.Schliessen			:= Boxenklappe3Schliessen AND Boxenklappe3Vorhanden;
		END_IF
		IF LaufzeitBoxenklappe4 = 0 THEN
			Boxenklappe4.Oeffnen			:= Boxenklappe4Oeffnen AND Boxenklappe4Vorhanden;
			Boxenklappe4.Schliessen			:= Boxenklappe4Schliessen AND Boxenklappe4Vorhanden;
		END_IF
		IF LaufzeitBoxenklappe5 = 0 THEN
			Boxenklappe5.Oeffnen			:= Boxenklappe5Oeffnen AND Boxenklappe5Vorhanden;
			Boxenklappe5.Schliessen			:= Boxenklappe5Schliessen AND Boxenklappe5Vorhanden;
		END_IF
		IF LaufzeitBoxenklappe6 = 0 THEN
			Boxenklappe6.Oeffnen			:= Boxenklappe6Oeffnen AND Boxenklappe6Vorhanden;
			Boxenklappe6.Schliessen			:= Boxenklappe6Schliessen AND Boxenklappe6Vorhanden;
		END_IF
		

		
		
		
		//===============================================================================================================================================================================
		//Schrittkette 
		//===============================================================================================================================================================================
		
		
		curStep	:= nextStep;
		
		
		
		CASE curStep OF
		
		
			//WARTEN *************************************************************************************************************************************************
			0:
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry 						:= FALSE;
					Bypassklappe.Oeffnen			:= FALSE;
					Bypassklappe.Schliessen			:= FALSE;
					Umschaltklappe1.Oeffnen			:= FALSE;
					Umschaltklappe1.Schliessen		:= FALSE;
					Umschaltklappe2.Oeffnen			:= FALSE;
					Umschaltklappe2.Schliessen		:= FALSE;
					Boxenklappe1.Oeffnen			:= FALSE;
					Boxenklappe1.Schliessen			:= FALSE;
					Boxenklappe2.Oeffnen			:= FALSE;
					Boxenklappe2.Schliessen			:= FALSE;
					Boxenklappe3.Oeffnen			:= FALSE;
					Boxenklappe3.Schliessen			:= FALSE;
					Boxenklappe4.Oeffnen			:= FALSE;
					Boxenklappe4.Schliessen			:= FALSE;
					Boxenklappe5.Oeffnen			:= FALSE;
					Boxenklappe5.Schliessen			:= FALSE;
					Boxenklappe6.Oeffnen			:= FALSE;
					Boxenklappe6.Schliessen			:= FALSE;
				END_IF
		
			
				//*** state during ***
				//Ventilatoren ausschalten, wenn nicht angefordert (Drehzahl zuerst auf MIN fahren)
				IF NOT AnforderungVentilator1 THEN
					fbFuVentilator1.SollDrehzahl := DrehzahlVent1Min;
					IF (fbFuVentilator1.DrehzahlFU <= DrehzahlVent1Min) AND NOT AnforderungVentilator1 THEN
						fbFuVentilator1.Freigabe := FALSE;
					END_IF
				END_IF
				
				IF NOT AnforderungVentilator2 THEN
					fbFuVentilator2.SollDrehzahl := DrehzahlVent2Min;
					IF (fbFuVentilator2.DrehzahlFU <= DrehzahlVent2Min) AND NOT AnforderungVentilator2 THEN
						fbFuVentilator2.Freigabe := FALSE;
					END_IF
				END_IF
				
				
				
			(*	IF NOT AnforderungVentilator1 THEN
					fbFuVentilator1.Freigabe		:= FALSE;
					fbFuVentilator1.SollDrehzahl	:= DrehzahlVent1Min;
				END_IF
				IF NOT AnforderungVentilator2 THEN
					fbFuVentilator2.Freigabe		:= FALSE;
					fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Min;
				END_IF*)
		
			
				//*** state exit ***
				//Ventilator 1 oder 2 angefordert und keine Umschaltung Klappen erforderlich -> VENTILATOREN EIN
				IF (AnforderungVentilator1 OR AnforderungVentilator2) AND NOT loc_UmschaltungErforderlVent1 AND NOT loc_UmschaltungErforderlVent2 THEN
					stateEntry	:= TRUE;
					lastStep	:= curStep;
					nextStep	:= 1;
					//Umschaltung Klappen erforderlich -> KLAPPEN UMSCHALTEN
				ELSIF loc_UmschaltungErforderlVent1 OR loc_UmschaltungErforderlVent2 THEN
					stateEntry	:= TRUE;
					lastStep	:= curStep;
					nextStep	:= 2;
				END_IF
		
		
		
			//VENTILATOREN EIN *************************************************************************************************************************************************
			1:
		
				//*** state entry ***
				IF stateEntry THEN
					stateEntry 						:= FALSE;
				(*	Bypassklappe.Oeffnen			:= FALSE;
					Bypassklappe.Schliessen			:= FALSE;
					Umschaltklappe1.Oeffnen			:= FALSE;
					Umschaltklappe1.Schliessen		:= FALSE;
					Umschaltklappe2.Oeffnen			:= FALSE;
					Umschaltklappe2.Schliessen		:= FALSE;
					Boxenklappe1.Oeffnen			:= FALSE;
					Boxenklappe1.Schliessen			:= FALSE;
					Boxenklappe2.Oeffnen			:= FALSE;
					Boxenklappe2.Schliessen			:= FALSE;
					Boxenklappe3.Oeffnen			:= FALSE;
					Boxenklappe3.Schliessen			:= FALSE;
					Boxenklappe4.Oeffnen			:= FALSE;
					Boxenklappe4.Schliessen			:= FALSE;
					Boxenklappe5.Oeffnen			:= FALSE;
					Boxenklappe5.Schliessen			:= FALSE;
					Boxenklappe6.Oeffnen			:= FALSE;
					Boxenklappe6.Schliessen			:= FALSE;
					TON_AnlaufverzVentilatoren(IN	:= FALSE, PT:= 0);*)
				END_IF
			
			
				//*** state during ***
				
				//Anlaufverzögerung Ventilatoren starten
				TON_AnlaufverzVentilatoren(IN:= AnforderungVentilator1 OR AnforderungVentilator2, PT:= AnlaufverzZweiterVent);
				
				
				//Nur 1 Ventilator angefordert
				IF (AnforderungVentilator1 AND NOT AnforderungVentilator2) OR 
					(NOT AnforderungVentilator1 AND AnforderungVentilator2) THEN
					
					IF NOT AnforderungVentilator1 THEN
						fbFuVentilator1.SollDrehzahl := DrehzahlVent1Min;
						IF (fbFuVentilator1.DrehzahlFU <= DrehzahlVent1Min) THEN
							fbFuVentilator1.Freigabe := FALSE;
						END_IF
					ELSE
						fbFuVentilator1.Freigabe			:= AnforderungVentilator1;
						fbFuVentilator1.SollDrehzahl		:= DrehzahlVent1Betrieb;
					END_IF
					
					IF NOT AnforderungVentilator2 THEN
						fbFuVentilator2.SollDrehzahl := DrehzahlVent2Min;
						IF (fbFuVentilator2.DrehzahlFU <= DrehzahlVent2Min) THEN
							fbFuVentilator2.Freigabe := FALSE;
						END_IF
					ELSE
						fbFuVentilator2.Freigabe			:= AnforderungVentilator2;
						fbFuVentilator2.SollDrehzahl		:= DrehzahlVent2Betrieb;
					END_IF
					
				
					//Beide Ventilatoren angefordert
				ELSIF AnforderungVentilator1 AND AnforderungVentilator2 THEN		
					IF (NOT fbFuVentilator2.Freigabe) THEN
						fbFuVentilator1.Freigabe			:= AnforderungVentilator1;
						fbFuVentilator1.SollDrehzahl		:= DrehzahlVent1Betrieb;
						IF TON_AnlaufverzVentilatoren.Q THEN
							fbFuVentilator2.Freigabe		:= AnforderungVentilator2;
							fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Betrieb;
						END_IF
					ELSIF (NOT fbFuVentilator1.Freigabe) THEN
						fbFuVentilator2.Freigabe			:= AnforderungVentilator2;
						fbFuVentilator2.SollDrehzahl		:= DrehzahlVent2Betrieb;
						IF TON_AnlaufverzVentilatoren.Q THEN
							fbFuVentilator1.Freigabe		:= AnforderungVentilator1;
							fbFuVentilator1.SollDrehzahl	:= DrehzahlVent1Betrieb;
						END_IF
					ELSE
						fbFuVentilator1.Freigabe			:= AnforderungVentilator1;
						fbFuVentilator1.SollDrehzahl		:= DrehzahlVent1Betrieb;
						IF TON_AnlaufverzVentilatoren.Q THEN
							fbFuVentilator2.Freigabe		:= AnforderungVentilator2;
							fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Betrieb;
						END_IF
					END_IF
				END_IF
				
				//Restzeit Anlaufverzögerung (für Visu)
				RestAnlaufverzoegerung := AnlaufverzZweiterVent - TIME_TO_UDINT(TON_AnlaufverzVentilatoren.ET);
				AnlaufverzVent1Aktiv := AnforderungVentilator1 AND (fbFuVentilator1.SollDrehzahl <> DrehzahlVent1Betrieb);
				AnlaufverzVent2Aktiv := AnforderungVentilator2 AND (fbFuVentilator2.SollDrehzahl <> DrehzahlVent2Betrieb);
			
				
				//*** state exit ***
				//Keine Anforderung von Ventilator 1 und 2 -> WARTEN
				IF (NOT AnforderungVentilator1 AND NOT AnforderungVentilator2) THEN
					stateEntry	:= TRUE;
					lastStep	:= curStep;
					nextStep	:= 0;
					//Umschaltung Klappen erforderlich -> KLAPPEN UMSCHALTEN
				ELSIF loc_UmschaltungErforderlVent1 OR loc_UmschaltungErforderlVent2 THEN
					stateEntry	:= TRUE;
					lastStep	:= curStep;
					nextStep	:= 2;
				END_IF
			
			
			//KLAPPEN UMSCHALTEN *************************************************************************************************************************************************
			2:
		
				//*** state entry ***
				
				IF stateEntry THEN
					stateEntry 						:= FALSE;
					UmschaltungAktiv				:= TRUE;
					IF loc_UmschaltungErforderlVent1 AND loc_UmschaltungErforderlVent2 THEN
						TON_AnlaufverzVentilatoren(IN:= FALSE, PT:= 0);
					END_IF
				(*	Bypassklappe.Oeffnen			:= FALSE;
					Bypassklappe.Schliessen			:= FALSE;
					Umschaltklappe1.Oeffnen			:= FALSE;
					Umschaltklappe1.Schliessen		:= FALSE;
					Umschaltklappe2.Oeffnen			:= FALSE;
					Umschaltklappe2.Schliessen		:= FALSE;
					Boxenklappe1.Oeffnen			:= FALSE;
					Boxenklappe1.Schliessen			:= FALSE;
					Boxenklappe2.Oeffnen			:= FALSE;
					Boxenklappe2.Schliessen			:= FALSE;
					Boxenklappe3.Oeffnen			:= FALSE;
					Boxenklappe3.Schliessen			:= FALSE;
					Boxenklappe4.Oeffnen			:= FALSE;
					Boxenklappe4.Schliessen			:= FALSE;
					Boxenklappe5.Oeffnen			:= FALSE;
					Boxenklappe5.Schliessen			:= FALSE;
					Boxenklappe6.Oeffnen			:= FALSE;
					Boxenklappe6.Schliessen			:= FALSE;*)
				END_IF
		
			
				//*** state during ***
		
				//Ventilatoren auf Min. Drehzahl fahren
				IF NOT AnforderungVentilator1 THEN
					fbFuVentilator1.SollDrehzahl := DrehzahlVent1Min;
					IF (fbFuVentilator1.DrehzahlFU <= DrehzahlVent1Min) AND NOT AnforderungVentilator1 THEN
						fbFuVentilator1.Freigabe := FALSE;
					END_IF
				END_IF
				
				IF NOT AnforderungVentilator2 THEN
					fbFuVentilator2.SollDrehzahl := DrehzahlVent2Min;
					IF (fbFuVentilator2.DrehzahlFU <= DrehzahlVent2Min) AND NOT AnforderungVentilator2 THEN
						fbFuVentilator2.Freigabe := FALSE;
					END_IF
				END_IF
				
				//Drehzahlvorgabe Ventilator 1
				IF LuftaufbereitungInBetrieb AND loc_UmschaltungErforderlVent1 THEN
					IF DrehzahlVent1Betrieb > DrzVent1UmschMitLuftaufb THEN
						fbFuVentilator1.SollDrehzahl	:= DrzVent1UmschMitLuftaufb;
					ELSE
						fbFuVentilator1.SollDrehzahl	:= DrehzahlVent1Betrieb;
					END_IF
				ELSIF loc_UmschaltungErforderlVent1 THEN
					IF DrehzahlVent1Betrieb > DrehzahlVent1Umsch THEN
						fbFuVentilator1.SollDrehzahl	:= DrehzahlVent1Umsch;
					ELSE
						fbFuVentilator1.SollDrehzahl	:= DrehzahlVent1Betrieb;
					END_IF
				END_IF
				
				//Drehzahlvorgabe Ventilator 2
				IF LuftaufbereitungInBetrieb AND loc_UmschaltungErforderlVent2 THEN
					IF DrehzahlVent2Betrieb > DrzVent2UmschMitLuftaufb THEN
						fbFuVentilator2.SollDrehzahl	:= DrzVent2UmschMitLuftaufb;
					ELSE
						fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Betrieb;
					END_IF
				ELSIF loc_UmschaltungErforderlVent2 THEN
					IF DrehzahlVent2Betrieb > DrehzahlVent2Umsch THEN
						fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Umsch;
					ELSE
						fbFuVentilator2.SollDrehzahl	:= DrehzahlVent2Betrieb;
					END_IF
				END_IF
				
				//Wenn IST-Drehzahl Ventilatoren = MIN -> Ventilatoren ausschalten
				IF (fbFuVentilator1.DrehzahlFU <= DrehzahlVent1Min) THEN
					fbFuVentilator1.Freigabe := FALSE;
				END_IF
				
				IF (fbFuVentilator2.DrehzahlFU <= DrehzahlVent2Min) THEN
					fbFuVentilator2.Freigabe := FALSE;
				END_IF 
				
				
				//Ventilatoren Drehzahl erreicht
				IF ((fbFuVentilator1.DrehzahlFU <= fbFuVentilator1.SollDrehzahl) OR (NOT loc_UmschaltungErforderlVent1)) AND 
					((fbFuVentilator2.DrehzahlFU <= fbFuVentilator2.SollDrehzahl) OR (NOT loc_UmschaltungErforderlVent2)) THEN
					Bypassklappe.Oeffnen			:= BypassklappeOeffnen;
					Bypassklappe.Schliessen			:= BypassklappeSchliessen;
					Umschaltklappe1.Oeffnen			:= Umschaltkl1Oeffnen;
					Umschaltklappe1.Schliessen		:= Umschaltkl1Schliessen;
					Umschaltklappe2.Oeffnen			:= Umschaltkl2Oeffnen;
					Umschaltklappe2.Schliessen		:= Umschaltkl2Schliessen;
					Boxenklappe1.Oeffnen			:= Boxenklappe1Oeffnen;
					Boxenklappe1.Schliessen			:= Boxenklappe1Schliessen;
					Boxenklappe2.Oeffnen			:= Boxenklappe2Oeffnen;
					Boxenklappe2.Schliessen			:= Boxenklappe2Schliessen;
					Boxenklappe3.Oeffnen			:= Boxenklappe3Oeffnen;
					Boxenklappe3.Schliessen			:= Boxenklappe3Schliessen;
					Boxenklappe4.Oeffnen			:= Boxenklappe4Oeffnen;
					Boxenklappe4.Schliessen			:= Boxenklappe4Schliessen;
					Boxenklappe5.Oeffnen			:= Boxenklappe5Oeffnen;
					Boxenklappe5.Schliessen			:= Boxenklappe5Schliessen;
					Boxenklappe6.Oeffnen			:= Boxenklappe6Oeffnen;
					Boxenklappe6.Schliessen			:= Boxenklappe6Schliessen;
				END_IF
			
			
				//*** state exit ***
				//Alle Klappen umgeschaltet -> WARTEN
				IF NOT loc_UmschaltungErforderlVent1 AND NOT loc_UmschaltungErforderlVent2 THEN
					UmschaltungAktiv := FALSE;
					stateEntry	:= TRUE;
					lastStep	:= curStep;
					nextStep	:= 0;
				END_IF
		
	
		END_CASE
	
	ELSE
		
		BypassOeffnenOut			:= FALSE;
		BypassSchliessenOut			:= FALSE;
		Umschaltkl1OeffnenOut		:= FALSE;
		Umschaltkl1SchliessenOut	:= FALSE;
		Umschaltkl2OeffnenOut		:= FALSE;
		Umschaltkl2SchliessenOut	:= FALSE;
		Boxenklappe1OeffnenOut		:= FALSE;
		Boxenklappe1SchliessenOut	:= FALSE;
		Boxenklappe2OeffnenOut		:= FALSE;
		Boxenklappe2SchliessenOut	:= FALSE;
		Boxenklappe3OeffnenOut		:= FALSE;
		Boxenklappe3SchliessenOut	:= FALSE;
		Boxenklappe4OeffnenOut		:= FALSE;
		Boxenklappe4SchliessenOut	:= FALSE;
		Boxenklappe5OeffnenOut		:= FALSE;
		Boxenklappe5SchliessenOut	:= FALSE;
		Boxenklappe6OeffnenOut		:= FALSE;
		Boxenklappe6SchliessenOut	:= FALSE;
		FreigabeVentilator1Out		:= FALSE;
		FreigabeVentilator2Out		:= FALSE;
		DrehzahlVent1Out			:= 0.0;
		DrehzahlVent2Out			:= 0.0;
		stateEntry					:= TRUE;
		curStep						:= 0;
		nextStep					:= 0;
		lastStep					:= 0;
		FehlerLaufzeitBypass		:= FALSE;
		FehlerLaufzeitKlappeBox1	:= FALSE;
		FehlerLaufzeitKlappeBox2	:= FALSE;
		FehlerLaufzeitKlappeBox3	:= FALSE;
		FehlerLaufzeitKlappeBox4	:= FALSE;
		FehlerLaufzeitKlappeBox5	:= FALSE;
		FehlerLaufzeitKlappeBox6	:= FALSE;
		FehlerLaufzeitUmschaltkl1	:= FALSE;
		FehlerLaufzeitUmschaltkl2	:= FALSE;
		FehlerFuVentilator1			:= FALSE;
		FehlerFuVentilator2			:= FALSE;
		UmschaltungAktiv			:= FALSE;
		
		fbFuVentilator1.Reset		:= TRUE;
		fbFuVentilator1();
		
		fbFuVentilator2.Reset		:= TRUE;
		fbFuVentilator2();
		
		Bypassklappe.QuitFehler		:= TRUE;
		Bypassklappe();
		
		Umschaltklappe1.QuitFehler	:= TRUE;
		Umschaltklappe1();
		
		Umschaltklappe2.QuitFehler	:= TRUE;
		Umschaltklappe2();
		
		Boxenklappe1.QuitFehler		:= TRUE;
		Boxenklappe1();
	
		Boxenklappe2.QuitFehler		:= TRUE;
		Boxenklappe2();
		
		Boxenklappe3.QuitFehler		:= TRUE;
		Boxenklappe3();
		
		Boxenklappe4.QuitFehler		:= TRUE;
		Boxenklappe4();
		
		Boxenklappe5.QuitFehler		:= TRUE;
		Boxenklappe5();
		
		Boxenklappe6.QuitFehler		:= TRUE;
		Boxenklappe6();
		
	END_IF
	
	
	
END_FUNCTION_BLOCK
