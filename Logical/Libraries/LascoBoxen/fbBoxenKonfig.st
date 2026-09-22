
(* Funktionsbaustein für Konfiguration der einzelnen Boxen (Klappen, Ventilatoren, Luftaufbereitung,...) *)
FUNCTION_BLOCK fbBoxenKonfig

	//===================================================================================================================================================================================================
	//Variable Box1 - Box6 "bereit" generieren, wenn Betriebsart für Box <> AUS
	//===================================================================================================================================================================================================
	
	Box1Out.BoxBereit	:= Box1In.DauerbetriebEin OR Box1In.IntervallbetriebEin OR Box1In.NachtrocknungEin;
	Box2Out.BoxBereit	:= Box2In.DauerbetriebEin OR Box2In.IntervallbetriebEin OR Box2In.NachtrocknungEin;
	Box3Out.BoxBereit	:= Box3In.DauerbetriebEin OR Box3In.IntervallbetriebEin OR Box3In.NachtrocknungEin;
	Box4Out.BoxBereit	:= Box4In.DauerbetriebEin OR Box4In.IntervallbetriebEin OR Box4In.NachtrocknungEin;
	Box5Out.BoxBereit	:= Box5In.DauerbetriebEin OR Box5In.IntervallbetriebEin OR Box5In.NachtrocknungEin;
	Box6Out.BoxBereit	:= Box6In.DauerbetriebEin OR Box6In.IntervallbetriebEin OR Box6In.NachtrocknungEin;	
	
	//Anforderung Entfeuchter über Fremdsteuerung (für Steuerungsvariante 3.04)
	EntfeuchterInselbetrAktivOut := EntfeuchterInselbetrieb AND TasteEntfeuchterEinInselbetrieb;
	FreigabeEntfeuchterInselbetrieb := AnfEntfeuchterExtern AND EntfeuchterInselbetrAktivOut;
	
	
	//===================================================================================================================================================================================================
	//Automatikbetrieb - Schlechtwetterbetrieb
	//===================================================================================================================================================================================================

	//Im Automatikbetrieb welchselt die Box in den Puls/Pausebetrieb, wenn die Witterungsverhältnisse schlecht sind UND keine Luftaufbereitung verfügbar ist
	
	//Funktionsbaustein Puls-Pausebetrieb Box 1
	fbPugeSchlechtwetterBox1.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox1.StartMitPuls 	:= Box1In.DauerbetriebEin AND Box1In.WetterIstSchlecht AND NOT Box1In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox1.ZeitPuls 		:= Box1In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox1.ZeitPause		:= Box1In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox1();
	Box1Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox1.RestzeitPuls;
	Box1Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox1.RestzeitPause;

	//Funktionsbaustein Puls-Pausebetrieb Box 2
	fbPugeSchlechtwetterBox2.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox2.StartMitPuls 	:= Box2In.DauerbetriebEin AND Box2In.WetterIstSchlecht AND NOT Box2In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox2.ZeitPuls 		:= Box2In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox2.ZeitPause		:= Box2In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox2();
	Box2Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox2.RestzeitPuls;
	Box2Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox2.RestzeitPause;	
	
	//Funktionsbaustein Puls-Pausebetrieb Box 3
	fbPugeSchlechtwetterBox3.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox3.StartMitPuls 	:= Box3In.DauerbetriebEin AND Box3In.WetterIstSchlecht AND NOT Box3In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox3.ZeitPuls 		:= Box3In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox3.ZeitPause		:= Box3In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox3();
	Box3Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox3.RestzeitPuls;
	Box3Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox3.RestzeitPause;	
	
	//Funktionsbaustein Puls-Pausebetrieb Box 4
	fbPugeSchlechtwetterBox4.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox4.StartMitPuls 	:= Box4In.DauerbetriebEin AND Box4In.WetterIstSchlecht AND NOT Box4In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox4.ZeitPuls 		:= Box4In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox4.ZeitPause		:= Box4In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox4();
	Box4Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox4.RestzeitPuls;
	Box4Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox4.RestzeitPause;
	
	//Funktionsbaustein Puls-Pausebetrieb Box 5
	fbPugeSchlechtwetterBox5.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox5.StartMitPuls 	:= Box5In.DauerbetriebEin AND Box5In.WetterIstSchlecht AND NOT Box5In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox5.ZeitPuls 		:= Box5In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox5.ZeitPause		:= Box5In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox5();
	Box5Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox5.RestzeitPuls;
	Box5Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox5.RestzeitPause;
	
	//Funktionsbaustein Puls-Pausebetrieb Box 6
	fbPugeSchlechtwetterBox6.StartMitPause 	:= FALSE;
	fbPugeSchlechtwetterBox6.StartMitPuls 	:= Box6In.DauerbetriebEin AND Box6In.WetterIstSchlecht AND NOT Box6In.LuftaufbIstVerfuegbar;
	fbPugeSchlechtwetterBox6.ZeitPuls 		:= Box6In.SchlechtwetterPulszeit;
	fbPugeSchlechtwetterBox6.ZeitPause		:= Box6In.SchlechtwetterPausezeit;
	fbPugeSchlechtwetterBox6();
	Box6Out.RestzeitSchlechtwetterPuls 		:= fbPugeSchlechtwetterBox6.RestzeitPuls;
	Box6Out.RestzeitSchlechtwetterPause		:= fbPugeSchlechtwetterBox6.RestzeitPause;
	
	
	//===================================================================================================================================================================================================
	//Freigaben Box1 - Box6
	//===================================================================================================================================================================================================

	
	//Mehrere Boxen gleichzeitig belüftbar ==============================================================================================================================================================
	IF MehrereBoxenBelueftbar THEN
		
		//Box 1
		Box1Out.BoxAktiv	:= (Box1In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox1.PauseOut) OR (Box1In.DauerbetriebEin AND (Box1In.SchlechtwetterPausezeit = 0)) OR
		(Box1In.IntervallbetriebEin AND Box1In.IntervallbetriebZeiten[StundeAktuell]) OR (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell]);
		
		//Box 2
		Box2Out.BoxAktiv	:= (Box2In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox2.PauseOut) OR (Box2In.DauerbetriebEin AND (Box2In.SchlechtwetterPausezeit = 0)) OR
		(Box2In.IntervallbetriebEin AND Box2In.IntervallbetriebZeiten[StundeAktuell]) OR (Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell]);
		
		//Box 3
		Box3Out.BoxAktiv	:= (Box3In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox3.PauseOut) OR (Box3In.DauerbetriebEin AND (Box3In.SchlechtwetterPausezeit = 0)) OR
		(Box3In.IntervallbetriebEin AND Box3In.IntervallbetriebZeiten[StundeAktuell]) OR (Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell]);
		
		//Box 4
		Box4Out.BoxAktiv	:= (Box4In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox4.PauseOut) OR (Box4In.DauerbetriebEin AND (Box4In.SchlechtwetterPausezeit = 0)) OR
		(Box4In.IntervallbetriebEin AND Box4In.IntervallbetriebZeiten[StundeAktuell]) OR (Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell]);
		
		//Box 5
		Box5Out.BoxAktiv	:= (Box5In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox5.PauseOut) OR (Box5In.DauerbetriebEin AND (Box5In.SchlechtwetterPausezeit = 0)) OR
		(Box5In.IntervallbetriebEin AND Box5In.IntervallbetriebZeiten[StundeAktuell]) OR (Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell]);
		
		//Box 6
		Box6Out.BoxAktiv	:= (Box6In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox6.PauseOut) OR (Box6In.DauerbetriebEin AND (Box6In.SchlechtwetterPausezeit = 0)) OR
		(Box6In.IntervallbetriebEin AND Box6In.IntervallbetriebZeiten[StundeAktuell]) OR (Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell]);
		
		
		//Nur eine Box pro Lüfterkreis belüftbar ===============================================================================================================================================
	ELSE
		
		//Box 1 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box1In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox1.PauseOut) OR (Box1In.DauerbetriebEin AND (Box1In.SchlechtwetterPausezeit = 0)) OR
			(Box1In.IntervallbetriebEin AND Box1In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box2GleicherLuefterkreis	:= (Box1In.Ventilator1 AND Box2In.Ventilator1) OR (Box1In.Ventilator2 AND Box2In.Ventilator2);
			loc_Box3GleicherLuefterkreis	:= (Box1In.Ventilator1 AND Box3In.Ventilator1) OR (Box1In.Ventilator2 AND Box3In.Ventilator2);
			loc_Box4GleicherLuefterkreis	:= (Box1In.Ventilator1 AND Box4In.Ventilator1) OR (Box1In.Ventilator2 AND Box4In.Ventilator2);
			loc_Box5GleicherLuefterkreis	:= (Box1In.Ventilator1 AND Box5In.Ventilator1) OR (Box1In.Ventilator2 AND Box5In.Ventilator2);
			loc_Box6GleicherLuefterkreis	:= (Box1In.Ventilator1 AND Box6In.Ventilator1) OR (Box1In.Ventilator2 AND Box6In.Ventilator2);

			Box1Out.BoxAktiv	:= (NOT (Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell] AND loc_Box2GleicherLuefterkreis) AND NOT
			(Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell] AND loc_Box3GleicherLuefterkreis) AND NOT
			(Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell] AND loc_Box4GleicherLuefterkreis) AND NOT
			(Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell] AND loc_Box5GleicherLuefterkreis) AND NOT
			(Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell] AND loc_Box6GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box1Out.BoxAktiv	:= Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell];
		END_IF
			
		
		//Box 2 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box2In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox2.PauseOut) OR (Box2In.DauerbetriebEin AND (Box2In.SchlechtwetterPausezeit = 0)) OR
			(Box2In.IntervallbetriebEin AND Box2In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box1GleicherLuefterkreis	:= (Box2In.Ventilator1 AND Box1In.Ventilator1) OR (Box2In.Ventilator2 AND Box1In.Ventilator2);
			loc_Box3GleicherLuefterkreis	:= (Box2In.Ventilator1 AND Box3In.Ventilator1) OR (Box2In.Ventilator2 AND Box3In.Ventilator2);
			loc_Box4GleicherLuefterkreis	:= (Box2In.Ventilator1 AND Box4In.Ventilator1) OR (Box2In.Ventilator2 AND Box4In.Ventilator2);
			loc_Box5GleicherLuefterkreis	:= (Box2In.Ventilator1 AND Box5In.Ventilator1) OR (Box2In.Ventilator2 AND Box5In.Ventilator2);
			loc_Box6GleicherLuefterkreis	:= (Box2In.Ventilator1 AND Box6In.Ventilator1) OR (Box2In.Ventilator2 AND Box6In.Ventilator2);

			Box2Out.BoxAktiv	:= (NOT (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell] AND loc_Box1GleicherLuefterkreis) AND NOT
			(Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell] AND loc_Box3GleicherLuefterkreis) AND NOT
			(Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell] AND loc_Box4GleicherLuefterkreis) AND NOT
			(Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell] AND loc_Box5GleicherLuefterkreis) AND NOT
			(Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell] AND loc_Box6GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box2Out.BoxAktiv	:= Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell];
		END_IF
		
		
		//Box 3 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box3In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox3.PauseOut) OR (Box3In.DauerbetriebEin AND (Box3In.SchlechtwetterPausezeit = 0)) OR
			(Box3In.IntervallbetriebEin AND Box3In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box1GleicherLuefterkreis	:= (Box3In.Ventilator1 AND Box1In.Ventilator1) OR (Box3In.Ventilator2 AND Box1In.Ventilator2);
			loc_Box2GleicherLuefterkreis	:= (Box3In.Ventilator1 AND Box2In.Ventilator1) OR (Box3In.Ventilator2 AND Box2In.Ventilator2);
			loc_Box4GleicherLuefterkreis	:= (Box3In.Ventilator1 AND Box4In.Ventilator1) OR (Box3In.Ventilator2 AND Box4In.Ventilator2);
			loc_Box5GleicherLuefterkreis	:= (Box3In.Ventilator1 AND Box5In.Ventilator1) OR (Box3In.Ventilator2 AND Box5In.Ventilator2);
			loc_Box6GleicherLuefterkreis	:= (Box3In.Ventilator1 AND Box6In.Ventilator1) OR (Box3In.Ventilator2 AND Box6In.Ventilator2);

			Box3Out.BoxAktiv	:= (NOT (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell] AND loc_Box1GleicherLuefterkreis) AND NOT
			(Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell] AND loc_Box2GleicherLuefterkreis) AND NOT
			(Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell] AND loc_Box4GleicherLuefterkreis) AND NOT
			(Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell] AND loc_Box5GleicherLuefterkreis) AND NOT
			(Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell] AND loc_Box6GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box3Out.BoxAktiv	:= Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell];
		END_IF

		
		//Box 4 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box4In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox4.PauseOut) OR (Box4In.DauerbetriebEin AND (Box4In.SchlechtwetterPausezeit = 0)) OR
			(Box4In.IntervallbetriebEin AND Box4In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box1GleicherLuefterkreis	:= (Box4In.Ventilator1 AND Box1In.Ventilator1) OR (Box4In.Ventilator2 AND Box1In.Ventilator2);
			loc_Box2GleicherLuefterkreis	:= (Box4In.Ventilator1 AND Box2In.Ventilator1) OR (Box4In.Ventilator2 AND Box2In.Ventilator2);
			loc_Box3GleicherLuefterkreis	:= (Box4In.Ventilator1 AND Box3In.Ventilator1) OR (Box4In.Ventilator2 AND Box3In.Ventilator2);
			loc_Box5GleicherLuefterkreis	:= (Box4In.Ventilator1 AND Box5In.Ventilator1) OR (Box4In.Ventilator2 AND Box5In.Ventilator2);
			loc_Box6GleicherLuefterkreis	:= (Box4In.Ventilator1 AND Box6In.Ventilator1) OR (Box4In.Ventilator2 AND Box6In.Ventilator2);

			Box4Out.BoxAktiv	:= (NOT (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell] AND loc_Box1GleicherLuefterkreis) AND NOT
			(Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell] AND loc_Box2GleicherLuefterkreis) AND NOT
			(Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell] AND loc_Box3GleicherLuefterkreis) AND NOT
			(Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell] AND loc_Box5GleicherLuefterkreis) AND NOT
			(Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell] AND loc_Box6GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box4Out.BoxAktiv	:= Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell];
		END_IF
			

		//Box 5 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box5In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox5.PauseOut) OR (Box5In.DauerbetriebEin AND (Box5In.SchlechtwetterPausezeit = 0)) OR
			(Box5In.IntervallbetriebEin AND Box5In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box1GleicherLuefterkreis	:= (Box5In.Ventilator1 AND Box1In.Ventilator1) OR (Box5In.Ventilator2 AND Box1In.Ventilator2);
			loc_Box2GleicherLuefterkreis	:= (Box5In.Ventilator1 AND Box2In.Ventilator1) OR (Box5In.Ventilator2 AND Box2In.Ventilator2);
			loc_Box3GleicherLuefterkreis	:= (Box5In.Ventilator1 AND Box3In.Ventilator1) OR (Box5In.Ventilator2 AND Box3In.Ventilator2);
			loc_Box4GleicherLuefterkreis	:= (Box5In.Ventilator1 AND Box4In.Ventilator1) OR (Box5In.Ventilator2 AND Box4In.Ventilator2);
			loc_Box6GleicherLuefterkreis	:= (Box5In.Ventilator1 AND Box6In.Ventilator1) OR (Box5In.Ventilator2 AND Box6In.Ventilator2);

			Box5Out.BoxAktiv	:= (NOT (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell] AND loc_Box1GleicherLuefterkreis) AND NOT
			(Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell] AND loc_Box2GleicherLuefterkreis) AND NOT
			(Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell] AND loc_Box3GleicherLuefterkreis) AND NOT
			(Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell] AND loc_Box4GleicherLuefterkreis) AND NOT
			(Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell] AND loc_Box6GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box5Out.BoxAktiv	:= Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell];
		END_IF
		
		
		//Box 6 *******************************************************************************************************************************
			
		//Box im Dauer- und Intervallbetrieb freigeben, wenn keine andere Box (im gleichen Lüfterkreis) in der Nachtrocknung ist
		IF ((Box6In.DauerbetriebEin AND NOT fbPugeSchlechtwetterBox6.PauseOut) OR (Box6In.DauerbetriebEin AND (Box6In.SchlechtwetterPausezeit = 0)) OR
			(Box6In.IntervallbetriebEin AND Box6In.IntervallbetriebZeiten[StundeAktuell])) THEN
			loc_Box1GleicherLuefterkreis	:= (Box6In.Ventilator1 AND Box1In.Ventilator1) OR (Box6In.Ventilator2 AND Box1In.Ventilator2);
			loc_Box2GleicherLuefterkreis	:= (Box6In.Ventilator1 AND Box2In.Ventilator1) OR (Box6In.Ventilator2 AND Box2In.Ventilator2);
			loc_Box3GleicherLuefterkreis	:= (Box6In.Ventilator1 AND Box3In.Ventilator1) OR (Box6In.Ventilator2 AND Box3In.Ventilator2);
			loc_Box4GleicherLuefterkreis	:= (Box6In.Ventilator1 AND Box4In.Ventilator1) OR (Box6In.Ventilator2 AND Box4In.Ventilator2);
			loc_Box5GleicherLuefterkreis	:= (Box6In.Ventilator1 AND Box5In.Ventilator1) OR (Box6In.Ventilator2 AND Box5In.Ventilator2);

			Box6Out.BoxAktiv	:= (NOT (Box1In.NachtrocknungEin AND Box1In.NachtrocknungZeiten[StundeAktuell] AND loc_Box1GleicherLuefterkreis) AND NOT
			(Box2In.NachtrocknungEin AND Box2In.NachtrocknungZeiten[StundeAktuell] AND loc_Box2GleicherLuefterkreis) AND NOT
			(Box3In.NachtrocknungEin AND Box3In.NachtrocknungZeiten[StundeAktuell] AND loc_Box3GleicherLuefterkreis) AND NOT
			(Box4In.NachtrocknungEin AND Box4In.NachtrocknungZeiten[StundeAktuell] AND loc_Box4GleicherLuefterkreis) AND NOT
			(Box5In.NachtrocknungEin AND Box5In.NachtrocknungZeiten[StundeAktuell] AND loc_Box5GleicherLuefterkreis));		
			//Aus oder Nachtrocknung aktiv
		ELSE
			Box6Out.BoxAktiv	:= Box6In.NachtrocknungEin AND Box6In.NachtrocknungZeiten[StundeAktuell];
		END_IF
		
		
	END_IF
	
	
	
	//===================================================================================================================================================================================================
	//Klappenansteuerungen (Linearantriebe oder Jalousieklappen für Boxen)
	//===================================================================================================================================================================================================

	//Belüften von mehreren Boxen gleichzeitig (pro Ventilator) möglich
	//***************************************************************************************************************************************************************************************************
	IF MehrereBoxenBelueftbar THEN
		
		
		//Box 1 ***********************************************************************************************************************
				
		//Klappe 1
		IF Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box1Out.BoxAktiv OR NotbetriebBox1 THEN
				IF Box1In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box1In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF


		
		//Box 2 ************************************************************************************************************************
			
		//Klappe 1
		IF Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box2Out.BoxAktiv OR NotbetriebBox2 THEN
				IF Box2In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box2In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	

		//Box 3 ************************************************************************************************************************
			
		//Klappe 1
		IF Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box3Out.BoxAktiv OR NotbetriebBox3 THEN
				IF Box3In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box3In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF

	
		
		//Box 4 ************************************************************************************************************************
		
		//Klappe 1
		IF Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box4Out.BoxAktiv OR NotbetriebBox4 THEN
				IF Box4In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box4In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		
		
		//Box 5 ************************************************************************************************************************
		
		//Klappe 1
		IF Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box5Out.BoxAktiv OR NotbetriebBox5 THEN
				IF Box5In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box5In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		
		
		//Box 6 ************************************************************************************************************************
		
		//Klappe 1
		IF Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= TRUE;
				ELSE
					FreigabeKlappe1Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 2
		IF Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= TRUE;
				ELSE
					FreigabeKlappe2Out	:= FALSE;
				END_IF
			END_IF
		END_IF
				
		//Klappe 3
		IF Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= TRUE;
				ELSE
					FreigabeKlappe3Out	:= FALSE;
				END_IF
			END_IF
		END_IF
			
		//Klappe 4
		IF Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= TRUE;
				ELSE
					FreigabeKlappe4Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		//Klappe 5
		IF Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= TRUE;
				ELSE
					FreigabeKlappe5Out	:= FALSE;
				END_IF
			END_IF
		END_IF
	
		//Klappe 6
		IF Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
			IF Box6Out.BoxAktiv OR NotbetriebBox6 THEN
				IF Box6In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			ELSE
				IF Box6In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= TRUE;
				ELSE
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		
		//Immer nur eine Box belüftbar (pro Ventilator), kein gleichzeitiges belüften mehrerer Boxen möglich	
		//===================================================================================================================================================================================================	
	ELSE
		
	
		//Box 1 + Ventilator 1 ************************************************************************************************************************
		IF (Box1Out.BoxAktiv OR NotbetriebBox1) AND Box1In.Ventilator1 THEN
			
			//Klappe 1
			IF Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF

			
		
			//Box 2 + Ventilator 1 ************************************************************************************************************************
		ELSIF (Box2Out.BoxAktiv OR NotbetriebBox2) AND Box2In.Ventilator1 THEN
		
			
			//Klappe 1
			IF Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			

			//Box 3 + Ventilator 1 ************************************************************************************************************************
		ELSIF (Box3Out.BoxAktiv OR NotbetriebBox3) AND Box3In.Ventilator1 THEN
		
			
			//Klappe 1
			IF Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			
		
			//Box 4 + Ventilator 1 ************************************************************************************************************************
		ELSIF (Box4Out.BoxAktiv OR NotbetriebBox4) AND Box4In.Ventilator1 THEN
		
			
			//Klappe 1
			IF Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			
		
			//Box 5 + Ventilator 1 ************************************************************************************************************************
		ELSIF (Box5Out.BoxAktiv OR NotbetriebBox5) AND Box5In.Ventilator1 THEN
		
			
			//Klappe 1
			IF Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			
		
			//Box 6 + Ventilator 1 ************************************************************************************************************************
		ELSIF (Box6Out.BoxAktiv OR NotbetriebBox6) AND Box6In.Ventilator1 THEN
		
			
			//Klappe 1
			IF Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			
			//################################### NEU NEU NEU
		//Keine Box im Ventilatorkreis 1 aktiv und Option ein -> Klappen schliessen ************************************************************************************************************************	
		ELSIF AlleKlappenSchliessenWennAus THEN
			
			//Box 1 *************************************************************
			IF Box1In.Ventilator1 THEN
				//Klappe 1
				IF Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 2 *************************************************************
			IF Box2In.Ventilator1 THEN
				//Klappe 1
				IF Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 3 *************************************************************
			IF Box3In.Ventilator1 THEN
				//Klappe 1
				IF Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 4 *************************************************************
			IF Box4In.Ventilator1 THEN
				//Klappe 1
				IF Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 5 *************************************************************
			IF Box5In.Ventilator1 THEN
				//Klappe 1
				IF Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 6 *************************************************************
			IF Box6In.Ventilator1 THEN
				//Klappe 1
				IF Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF
		
		
		
		//Box 1 + Ventilator 2 ************************************************************************************************************************
		IF (Box1Out.BoxAktiv OR NotbetriebBox1) AND Box1In.Ventilator2 THEN
			
			//Klappe 1
			IF Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box1In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF


		
			//Box 2 + Ventilator 2 ************************************************************************************************************************
		ELSIF (Box2Out.BoxAktiv OR NotbetriebBox2) AND Box2In.Ventilator2 THEN
		
			
			//Klappe 1
			IF Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box2In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
	
	

			//Box 3 + Ventilator 2 ************************************************************************************************************************
		ELSIF (Box3Out.BoxAktiv OR NotbetriebBox3) AND Box3In.Ventilator2 THEN
		
			
			//Klappe 1
			IF Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box3In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF

	
		
			//Box 4 + Ventilator 2 ************************************************************************************************************************
		ELSIF (Box4Out.BoxAktiv OR NotbetriebBox4) AND Box4In.Ventilator2 THEN
		
			
			//Klappe 1
			IF Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box4In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
	
	
		
			//Box 5 + Ventilator 2 ************************************************************************************************************************
		ELSIF (Box5Out.BoxAktiv OR NotbetriebBox5) AND Box5In.Ventilator2 THEN
		
			
			//Klappe 1
			IF Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box5In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF

	
		
			//Box 6 + Ventilator 2 ************************************************************************************************************************
		ELSIF (Box6Out.BoxAktiv OR NotbetriebBox6) AND Box6In.Ventilator2 THEN
		
			
			//Klappe 1
			IF Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe1 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe1Out	:= FALSE;
				ELSE
					FreigabeKlappe1Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 2
			IF Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe2 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe2Out	:= FALSE;
				ELSE
					FreigabeKlappe2Out	:= TRUE;
				END_IF
			END_IF
				
			//Klappe 3
			IF Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe3 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe3Out	:= FALSE;
				ELSE
					FreigabeKlappe3Out	:= TRUE;
				END_IF
			END_IF
			
			//Klappe 4
			IF Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe4 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe4Out	:= FALSE;
				ELSE
					FreigabeKlappe4Out	:= TRUE;
				END_IF
			END_IF
		
			//Klappe 5
			IF Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe5 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe5Out	:= FALSE;
				ELSE
					FreigabeKlappe5Out	:= TRUE;
				END_IF
			END_IF
	
			//Klappe 6
			IF Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
				IF Box6In.StellungKlappe6 = FBBOX_GESCHLOSSEN THEN
					FreigabeKlappe6Out	:= FALSE;
				ELSE
					FreigabeKlappe6Out	:= TRUE;
				END_IF
			END_IF
			

			//Keine Box im Ventilatorkreis 2 aktiv und Option ein -> Klappen schliessen ************************************************************************************************************************	
		ELSIF AlleKlappenSchliessenWennAus THEN
			
			//Box 1 *************************************************************
			IF Box1In.Ventilator2 THEN
				//Klappe 1
				IF Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 2 *************************************************************
			IF Box2In.Ventilator2 THEN
				//Klappe 1
				IF Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 3 *************************************************************
			IF Box3In.Ventilator2 THEN
				//Klappe 1
				IF Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 4 *************************************************************
			IF Box4In.Ventilator2 THEN
				//Klappe 1
				IF Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 5 *************************************************************
			IF Box5In.Ventilator2 THEN
				//Klappe 1
				IF Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
			
			//Box 6 *************************************************************
			IF Box6In.Ventilator2 THEN
				//Klappe 1
				IF Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe1Out	:= FALSE;
				END_IF
				//Klappe 2
				IF Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe2Out	:= FALSE;
				END_IF
				//Klappe 3
				IF Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe3Out	:= FALSE;
				END_IF
				//Klappe 4
				IF Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe4Out	:= FALSE;
				END_IF
				//Klappe 5
				IF Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe5Out	:= FALSE;
				END_IF
				//Klappe 6
				IF Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET THEN
					FreigabeKlappe6Out	:= FALSE;
				END_IF
			END_IF
		END_IF


	END_IF
	

	//===================================================================================================================================================================================================
	//Freigabe Ventilatoren und Luftaufbereitungen für die jeweiligen Boxen
	//===================================================================================================================================================================================================
	
	//Ventilator 1 Normalbetrieb
	FreigabeVentilator1	:= (Box1Out.BoxAktiv AND Box1In.Ventilator1) OR (Box2Out.BoxAktiv AND Box2In.Ventilator1) OR (Box3Out.BoxAktiv AND Box3In.Ventilator1) OR 
	(Box4Out.BoxAktiv AND Box4In.Ventilator1) OR (Box5Out.BoxAktiv AND Box5In.Ventilator1) OR (Box6Out.BoxAktiv AND Box6In.Ventilator1);
	
	//Ventilator 2 Normalbetrieb
	FreigabeVentilator2	:= (Box1Out.BoxAktiv AND Box1In.Ventilator2) OR (Box2Out.BoxAktiv AND Box2In.Ventilator2) OR (Box3Out.BoxAktiv AND Box3In.Ventilator2) OR 
	(Box4Out.BoxAktiv AND Box4In.Ventilator2) OR (Box5Out.BoxAktiv AND Box5In.Ventilator2) OR (Box6Out.BoxAktiv AND Box6In.Ventilator2);
	
	//Ventilator 1 Notbetrieb
	NotbetriebVentilator1 := (NotbetriebBox1 AND Box1In.Ventilator1) OR (NotbetriebBox2 AND Box2In.Ventilator1) OR (NotbetriebBox3 AND Box3In.Ventilator1) OR 
	(NotbetriebBox4 AND Box4In.Ventilator1) OR (NotbetriebBox5 AND Box5In.Ventilator1) OR (NotbetriebBox6 AND Box6In.Ventilator1);
	
	//Ventilator 2 Notbetrieb
	NotbetriebVentilator2 := (NotbetriebBox1 AND Box1In.Ventilator2) OR (NotbetriebBox2 AND Box2In.Ventilator2) OR (NotbetriebBox3 AND Box3In.Ventilator2) OR 
	(NotbetriebBox4 AND Box4In.Ventilator2) OR (NotbetriebBox5 AND Box5In.Ventilator2) OR (NotbetriebBox6 AND Box6In.Ventilator2);
	
	//Luftentfeuchter
	FreigabeLuftentfeuchter	:= (Box1Out.BoxAktiv AND Box1In.Luftentfeuchter) OR (Box2Out.BoxAktiv AND Box2In.Luftentfeuchter) OR (Box3Out.BoxAktiv AND Box3In.Luftentfeuchter) OR
	(Box4Out.BoxAktiv AND Box4In.Luftentfeuchter) OR (Box5Out.BoxAktiv AND Box5In.Luftentfeuchter) OR (Box6Out.BoxAktiv AND Box6In.Luftentfeuchter);

	//Warmluftofen
	FreigabeWarmluftofen	:= (Box1Out.BoxAktiv AND Box1In.Warmluftofen) OR (Box2Out.BoxAktiv AND Box2In.Warmluftofen) OR (Box3Out.BoxAktiv AND Box3In.Warmluftofen) OR
	(Box4Out.BoxAktiv AND Box4In.Warmluftofen) OR (Box5Out.BoxAktiv AND Box5In.Warmluftofen) OR (Box6Out.BoxAktiv AND Box6In.Warmluftofen);
	
	//Heizregister
	FreigabeHeizregister	:= (Box1Out.BoxAktiv AND Box1In.Heizregister) OR (Box2Out.BoxAktiv AND Box2In.Heizregister) OR (Box3Out.BoxAktiv AND Box3In.Heizregister) OR
	(Box4Out.BoxAktiv AND Box4In.Heizregister) OR (Box5Out.BoxAktiv AND Box5In.Heizregister) OR (Box6Out.BoxAktiv AND Box6In.Heizregister);
	
	//Scheitholzofen
	FreigabeScheitholzofen	:= (Box1Out.BoxAktiv AND Box1In.Scheitholzofen) OR (Box2Out.BoxAktiv AND Box2In.Scheitholzofen) OR (Box3Out.BoxAktiv AND Box3In.Scheitholzofen) OR
	(Box4Out.BoxAktiv AND Box4In.Scheitholzofen) OR (Box5Out.BoxAktiv AND Box5In.Scheitholzofen) OR (Box6Out.BoxAktiv AND Box6In.Scheitholzofen);
	
	
	//===================================================================================================================================================================================================
	//Notbetrieb, wenn Warmluftofen oder Scheitholzofen noch in Betrieb (zuständigen Ventilator einschalten, mind. 1 Box öffnen)
	//===================================================================================================================================================================================================
	
	//Abhängigkeit von Luftentfeuchter & Ventilator 1
	EntfeuchterVonVent1Abhaengig := (Box1In.Ventilator1 AND Box1In.Luftentfeuchter) OR (Box2In.Ventilator1 AND Box2In.Luftentfeuchter) OR (Box3In.Ventilator1 AND Box3In.Luftentfeuchter) OR
	(Box4In.Ventilator1 AND Box4In.Luftentfeuchter) OR (Box5In.Ventilator1 AND Box5In.Luftentfeuchter) OR (Box6In.Ventilator1 AND Box6In.Luftentfeuchter); 
	
	//Abhängigkeit von Luftentfeuchter & Ventilator 2
	EntfeuchterVonVent2Abhaengig := (Box1In.Ventilator2 AND Box1In.Luftentfeuchter) OR (Box2In.Ventilator2 AND Box2In.Luftentfeuchter) OR (Box3In.Ventilator2 AND Box3In.Luftentfeuchter) OR
	(Box4In.Ventilator2 AND Box4In.Luftentfeuchter) OR (Box5In.Ventilator2 AND Box5In.Luftentfeuchter) OR (Box6In.Ventilator2 AND Box6In.Luftentfeuchter);
	
	//Abhängigkeit von Warmluftofen & Ventilator 1 (für Auskühlphase)
	WarmluftofenVonVent1Abhaengig := (Box1In.Ventilator1 AND Box1In.Warmluftofen) OR (Box2In.Ventilator1 AND Box2In.Warmluftofen) OR (Box3In.Ventilator1 AND Box3In.Warmluftofen) OR
	(Box4In.Ventilator1 AND Box4In.Warmluftofen) OR (Box5In.Ventilator1 AND Box5In.Warmluftofen) OR (Box6In.Ventilator1 AND Box6In.Warmluftofen);
	
	//Abhängigkeit von Scheitholzofen & Ventilator 1 (für Auskühlphase)
	ScheitholzofenVonVent1Abhaengig := (Box1In.Ventilator1 AND Box1In.Scheitholzofen) OR (Box2In.Ventilator1 AND Box2In.Scheitholzofen) OR (Box3In.Ventilator1 AND Box3In.Scheitholzofen) OR
	(Box4In.Ventilator1 AND Box4In.Scheitholzofen) OR (Box5In.Ventilator1 AND Box5In.Scheitholzofen) OR (Box6In.Ventilator1 AND Box6In.Scheitholzofen);
	
	//Abhängigkeit von Warmluftofen & Ventilator 2 (für Auskühlphase)
	WarmluftofenVonVent2Abhaengig := (Box1In.Ventilator2 AND Box1In.Warmluftofen) OR (Box2In.Ventilator2 AND Box2In.Warmluftofen) OR (Box3In.Ventilator2 AND Box3In.Warmluftofen) OR
	(Box4In.Ventilator2 AND Box4In.Warmluftofen) OR (Box5In.Ventilator2 AND Box5In.Warmluftofen) OR (Box6In.Ventilator2 AND Box6In.Warmluftofen);
	
	//Abhängigkeit von Scheitholzofen & Ventilator 2 (für Auskühlphase)
	ScheitholzofenVonVent2Abhaengig := (Box1In.Ventilator2 AND Box1In.Scheitholzofen) OR (Box2In.Ventilator2 AND Box2In.Scheitholzofen) OR (Box3In.Ventilator2 AND Box3In.Scheitholzofen) OR
	(Box4In.Ventilator2 AND Box4In.Scheitholzofen) OR (Box5In.Ventilator2 AND Box5In.Scheitholzofen) OR (Box6In.Ventilator2 AND Box6In.Scheitholzofen);
	
	//Abhängigkeit von Heizregister und Ventilator 1
	HeizregisterVonVent1Abhaengig := (Box1In.Ventilator1 AND Box1In.Heizregister) OR (Box2In.Ventilator1 AND Box2In.Heizregister) OR (Box3In.Ventilator1 AND Box3In.Heizregister) OR
	(Box4In.Ventilator1 AND Box4In.Heizregister) OR (Box5In.Ventilator1 AND Box5In.Heizregister) OR (Box6In.Ventilator1 AND Box6In.Heizregister);
	
	//Abhängigkeit von Heizregister und Ventilator 2
	HeizregisterVonVent2Abhaengig := (Box1In.Ventilator2 AND Box1In.Heizregister) OR (Box2In.Ventilator2 AND Box2In.Heizregister) OR (Box3In.Ventilator2 AND Box3In.Heizregister) OR
	(Box4In.Ventilator2 AND Box4In.Heizregister) OR (Box5In.Ventilator2 AND Box5In.Heizregister) OR (Box6In.Ventilator2 AND Box6In.Heizregister);
	
	//Entfeuchter noch in Betrieb, keine der zuständigen Boxen in Betrieb -> Notbetrieb einer Box
	IF EntfeuchterNochAktiv AND NOT (Box1Out.BoxAktiv AND Box1In.Luftentfeuchter) AND NOT (Box2Out.BoxAktiv AND Box2In.Luftentfeuchter) AND NOT  
		(Box3Out.BoxAktiv AND Box3In.Luftentfeuchter) AND NOT (Box4Out.BoxAktiv AND Box4In.Luftentfeuchter) AND NOT
		(Box5Out.BoxAktiv AND Box5In.Luftentfeuchter) AND NOT (Box6Out.BoxAktiv AND Box6In.Luftentfeuchter) THEN
		//Ventilator 1 zuständig
		IF EntfeuchterVonVent1Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator1 AND Box1In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator1 AND Box2In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator1 AND Box3In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator1 AND Box4In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator1 AND Box5In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator1 AND Box6In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator1 AND Box1In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator1 AND Box2In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator1 AND Box3In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator1 AND Box4In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator1 AND Box5In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator1 AND Box6In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox6	:= TRUE;
			END_IF
			//Ventilator 2 zuständig
		ELSIF EntfeuchterVonVent2Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator2 AND Box1In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator2 AND Box2In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator2 AND Box3In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator2 AND Box4In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator2 AND Box5In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator2 AND Box6In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator2 AND Box1In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator2 AND Box2In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator2 AND Box3In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator2 AND Box4In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator2 AND Box5In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator2 AND Box6In.Luftentfeuchter) THEN
				loc_Entf_NotbetriebBox6	:= TRUE;
			END_IF
		END_IF	
	ELSE
		loc_Entf_NotbetriebBox1 := FALSE;
		loc_Entf_NotbetriebBox2 := FALSE;
		loc_Entf_NotbetriebBox3 := FALSE;
		loc_Entf_NotbetriebBox4 := FALSE;
		loc_Entf_NotbetriebBox5 := FALSE;
		loc_Entf_NotbetriebBox6 := FALSE;
	END_IF
	
	
	//Warmluftofen noch in Betrieb, keine der zuständigen Boxen in Betrieb -> Notbetrieb einer Box
	IF WarmluftofenNochAktiv AND NOT (Box1Out.BoxAktiv AND Box1In.Warmluftofen) AND NOT (Box2Out.BoxAktiv AND Box2In.Warmluftofen) AND NOT  
		(Box3Out.BoxAktiv AND Box3In.Warmluftofen) AND NOT (Box4Out.BoxAktiv AND Box4In.Warmluftofen) AND NOT
		(Box5Out.BoxAktiv AND Box5In.Warmluftofen) AND NOT (Box6Out.BoxAktiv AND Box6In.Warmluftofen) THEN
		//Ventilator 1 zuständig
		IF WarmluftofenVonVent1Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator1 AND Box1In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator1 AND Box2In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator1 AND Box3In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator1 AND Box4In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator1 AND Box5In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator1 AND Box6In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator1 AND Box1In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator1 AND Box2In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator1 AND Box3In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator1 AND Box4In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator1 AND Box5In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator1 AND Box6In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox6	:= TRUE;
			END_IF
			//Ventilator 2 zuständig
		ELSIF WarmluftofenVonVent2Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator2 AND Box1In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator2 AND Box2In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator2 AND Box3In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator2 AND Box4In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator2 AND Box5In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator2 AND Box6In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator2 AND Box1In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator2 AND Box2In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator2 AND Box3In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator2 AND Box4In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator2 AND Box5In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator2 AND Box6In.Warmluftofen) THEN
				loc_Wlo_NotbetriebBox6	:= TRUE;
			END_IF
		END_IF	
	ELSE
		loc_Wlo_NotbetriebBox1 := FALSE;
		loc_Wlo_NotbetriebBox2 := FALSE;
		loc_Wlo_NotbetriebBox3 := FALSE;
		loc_Wlo_NotbetriebBox4 := FALSE;
		loc_Wlo_NotbetriebBox5 := FALSE;
		loc_Wlo_NotbetriebBox6 := FALSE;
	END_IF
	
	
	//Scheitholzofen noch in Betrieb, keine der zuständigen Boxen in Betrieb -> Notbetrieb einer Box
	IF ScheitholzofenNochAktiv AND NOT (Box1Out.BoxAktiv AND Box1In.Scheitholzofen) AND NOT (Box2Out.BoxAktiv AND Box2In.Scheitholzofen) AND NOT  
		(Box3Out.BoxAktiv AND Box3In.Scheitholzofen) AND NOT (Box4Out.BoxAktiv AND Box4In.Scheitholzofen) AND NOT
		(Box5Out.BoxAktiv AND Box5In.Scheitholzofen) AND NOT (Box6Out.BoxAktiv AND Box6In.Scheitholzofen) THEN
		//Ventilator 1 zuständig
		IF ScheitholzofenVonVent1Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator1 AND Box1In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator1 AND Box2In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator1 AND Box3In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator1 AND Box4In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator1 AND Box5In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator1 AND Box6In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator1 AND Box1In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator1 AND Box2In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator1 AND Box3In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator1 AND Box4In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator1 AND Box5In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator1 AND Box6In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox6	:= TRUE;
			END_IF
			//Ventilator 2 zuständig
		ELSIF ScheitholzofenVonVent2Abhaengig THEN
			//Eine der Boxen in Pause -> pausierte Box Notbetrieb
			IF (Box1Out.BoxBereit AND Box1In.Ventilator2 AND Box1In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox1	:= TRUE;
			ELSIF (Box2Out.BoxBereit AND Box2In.Ventilator2 AND Box2In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox2	:= TRUE;
			ELSIF (Box3Out.BoxBereit AND Box3In.Ventilator2 AND Box3In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4Out.BoxBereit AND Box4In.Ventilator2 AND Box4In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox4	:= TRUE;
			ELSIF (Box5Out.BoxBereit AND Box5In.Ventilator2 AND Box5In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox5	:= TRUE;
			ELSIF (Box6Out.BoxBereit AND Box6In.Ventilator2 AND Box6In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox6	:= TRUE;
				//Keine Box eingeschaltet -> Erste Box mit richtigem Ventilator Notbetrieb 
			ELSIF (Box1In.Ventilator2 AND Box1In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox1	:= TRUE;
			ELSIF (Box2In.Ventilator2 AND Box2In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox2	:= TRUE;
			ELSIF (Box3In.Ventilator2 AND Box3In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox3	:= TRUE;	
			ELSIF (Box4In.Ventilator2 AND Box4In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox4	:= TRUE;
			ELSIF (Box5In.Ventilator2 AND Box5In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox5	:= TRUE;
			ELSIF (Box6In.Ventilator2 AND Box6In.Scheitholzofen) THEN
				loc_Sho_NotbetriebBox6	:= TRUE;
			END_IF
		END_IF	
	ELSE
		loc_Sho_NotbetriebBox1 := FALSE;
		loc_Sho_NotbetriebBox2 := FALSE;
		loc_Sho_NotbetriebBox3 := FALSE;
		loc_Sho_NotbetriebBox4 := FALSE;
		loc_Sho_NotbetriebBox5 := FALSE;
		loc_Sho_NotbetriebBox6 := FALSE;
	END_IF
	
	//Notbetriebe für Boxen 1 - 6
	NotbetriebBox1 := loc_Entf_NotbetriebBox1 OR loc_Wlo_NotbetriebBox1 OR loc_Sho_NotbetriebBox1;
	NotbetriebBox2 := loc_Entf_NotbetriebBox2 OR loc_Wlo_NotbetriebBox2 OR loc_Sho_NotbetriebBox2;
	NotbetriebBox3 := loc_Entf_NotbetriebBox3 OR loc_Wlo_NotbetriebBox3 OR loc_Sho_NotbetriebBox3;
	NotbetriebBox4 := loc_Entf_NotbetriebBox4 OR loc_Wlo_NotbetriebBox4 OR loc_Sho_NotbetriebBox4;
	NotbetriebBox5 := loc_Entf_NotbetriebBox5 OR loc_Wlo_NotbetriebBox5 OR loc_Sho_NotbetriebBox5;
	NotbetriebBox6 := loc_Entf_NotbetriebBox6 OR loc_Wlo_NotbetriebBox6 OR loc_Sho_NotbetriebBox6;
	
	
	
	//===================================================================================================================================================================================================
	//Anforderung Boxen je nach Konfiguration verriegeln
	//===================================================================================================================================================================================================
	
	IF (NOT MehrereBoxenBelueftbar) THEN
		
		Box1Out.DauerbetriebSperre		:= FALSE;
		Box1Out.IntervallbetriebSperre	:= FALSE;
		Box2Out.DauerbetriebSperre		:= FALSE;
		Box2Out.IntervallbetriebSperre	:= FALSE;
		Box3Out.DauerbetriebSperre		:= FALSE;
		Box3Out.IntervallbetriebSperre	:= FALSE;
		Box4Out.DauerbetriebSperre		:= FALSE;
		Box4Out.IntervallbetriebSperre	:= FALSE;
		Box5Out.DauerbetriebSperre		:= FALSE;
		Box5Out.IntervallbetriebSperre	:= FALSE;
		Box6Out.DauerbetriebSperre		:= FALSE;
		Box6Out.IntervallbetriebSperre	:= FALSE;
		
		memset(ADR(Box1Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box1Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box2Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box2Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box3Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box3Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box4Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box4Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box5Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box5Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box6Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box6Out.IntervallbetriebZeitenGesperrt));
		
		memset(ADR(Box1Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box1Out.NachtrocknungZeitenGesperrt));
		memset(ADR(Box2Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box2Out.NachtrocknungZeitenGesperrt));
		memset(ADR(Box3Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box3Out.NachtrocknungZeitenGesperrt));
		memset(ADR(Box4Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box4Out.NachtrocknungZeitenGesperrt));
		memset(ADR(Box5Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box5Out.NachtrocknungZeitenGesperrt));
		memset(ADR(Box6Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box6Out.NachtrocknungZeitenGesperrt));

		
		//DAUERBETRIEB AKTIVIERT =========================================================================================================================================================
		
		//Box 1 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box1In.DauerbetriebEin THEN
			IF (Box1In.Ventilator1 AND Box2In.Ventilator1) OR (Box1In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre		:= TRUE;
				Box2Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box1In.Ventilator1 AND Box3In.Ventilator1) OR (Box1In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre		:= TRUE;
				Box3Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box1In.Ventilator1 AND Box4In.Ventilator1) OR (Box1In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre		:= TRUE;
				Box4Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box1In.Ventilator1 AND Box5In.Ventilator1) OR (Box1In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre		:= TRUE;
				Box5Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box1In.Ventilator1 AND Box6In.Ventilator1) OR (Box1In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre		:= TRUE;
				Box6Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		//Box 2 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box2In.DauerbetriebEin THEN
			IF (Box2In.Ventilator1 AND Box1In.Ventilator1) OR (Box2In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre		:= TRUE;
				Box1Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box2In.Ventilator1 AND Box3In.Ventilator1) OR (Box2In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre		:= TRUE;
				Box3Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box2In.Ventilator1 AND Box4In.Ventilator1) OR (Box2In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre		:= TRUE;
				Box4Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box2In.Ventilator1 AND Box5In.Ventilator1) OR (Box2In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre		:= TRUE;
				Box5Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box2In.Ventilator1 AND Box6In.Ventilator1) OR (Box2In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre		:= TRUE;
				Box6Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		//Box 3 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box3In.DauerbetriebEin THEN
			IF (Box3In.Ventilator1 AND Box1In.Ventilator1) OR (Box3In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre		:= TRUE;
				Box1Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box3In.Ventilator1 AND Box2In.Ventilator1) OR (Box3In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre		:= TRUE;
				Box2Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box3In.Ventilator1 AND Box4In.Ventilator1) OR (Box3In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre		:= TRUE;
				Box4Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box3In.Ventilator1 AND Box5In.Ventilator1) OR (Box3In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre		:= TRUE;
				Box5Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box3In.Ventilator1 AND Box6In.Ventilator1) OR (Box3In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre		:= TRUE;
				Box6Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		//Box 4 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box4In.DauerbetriebEin THEN
			IF (Box4In.Ventilator1 AND Box1In.Ventilator1) OR (Box4In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre		:= TRUE;
				Box1Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box4In.Ventilator1 AND Box2In.Ventilator1) OR (Box4In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre		:= TRUE;
				Box2Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box4In.Ventilator1 AND Box3In.Ventilator1) OR (Box4In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre		:= TRUE;
				Box3Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box4In.Ventilator1 AND Box5In.Ventilator1) OR (Box4In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre		:= TRUE;
				Box5Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box4In.Ventilator1 AND Box6In.Ventilator1) OR (Box4In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre		:= TRUE;
				Box6Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		//Box 5 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box5In.DauerbetriebEin THEN
			IF (Box5In.Ventilator1 AND Box1In.Ventilator1) OR (Box5In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre		:= TRUE;
				Box1Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box5In.Ventilator1 AND Box2In.Ventilator1) OR (Box5In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre		:= TRUE;
				Box2Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box5In.Ventilator1 AND Box3In.Ventilator1) OR (Box5In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre		:= TRUE;
				Box3Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box5In.Ventilator1 AND Box4In.Ventilator1) OR (Box5In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre		:= TRUE;
				Box4Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box5In.Ventilator1 AND Box6In.Ventilator1) OR (Box5In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre		:= TRUE;
				Box6Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		//Box 6 im Dauerbetrieb -> Dauer- und Intervallbetrieb für andere Boxen mit gleichem Lüfter sperren
		IF Box6In.DauerbetriebEin THEN
			IF (Box6In.Ventilator1 AND Box1In.Ventilator1) OR (Box6In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre		:= TRUE;
				Box1Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box6In.Ventilator1 AND Box2In.Ventilator1) OR (Box6In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre		:= TRUE;
				Box2Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box6In.Ventilator1 AND Box3In.Ventilator1) OR (Box6In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre		:= TRUE;
				Box3Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box6In.Ventilator1 AND Box4In.Ventilator1) OR (Box6In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre		:= TRUE;
				Box4Out.IntervallbetriebSperre	:= TRUE;
			END_IF
			IF (Box6In.Ventilator1 AND Box5In.Ventilator1) OR (Box6In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre		:= TRUE;
				Box5Out.IntervallbetriebSperre	:= TRUE;
			END_IF
		END_IF
		
		
		//INTERVALLBETRIEB AKTIVIERT =========================================================================================================================================================
		
		//Box 1 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box1In.IntervallbetriebEin THEN
			IF (Box1In.Ventilator1 AND Box2In.Ventilator1) OR (Box1In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box1In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box2Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box3In.Ventilator1) OR (Box1In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box1In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box3Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box4In.Ventilator1) OR (Box1In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box1In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box4Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box5In.Ventilator1) OR (Box1In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box1In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box5Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box6In.Ventilator1) OR (Box1In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box1In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box6Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 2 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box2In.IntervallbetriebEin THEN
			IF (Box2In.Ventilator1 AND Box1In.Ventilator1) OR (Box2In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box2In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box1Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box3In.Ventilator1) OR (Box2In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box2In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box3Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box4In.Ventilator1) OR (Box2In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box2In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box4Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box5In.Ventilator1) OR (Box2In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box2In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box5Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box6In.Ventilator1) OR (Box2In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box2In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box6Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 3 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box3In.IntervallbetriebEin THEN
			IF (Box3In.Ventilator1 AND Box1In.Ventilator1) OR (Box3In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box3In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box1Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box2In.Ventilator1) OR (Box3In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box3In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box2Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box4In.Ventilator1) OR (Box3In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box3In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box4Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box5In.Ventilator1) OR (Box3In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box3In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box5Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box6In.Ventilator1) OR (Box3In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box3In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box6Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 4 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box4In.IntervallbetriebEin THEN
			IF (Box4In.Ventilator1 AND Box1In.Ventilator1) OR (Box4In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box4In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box1Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box2In.Ventilator1) OR (Box4In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box4In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box2Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box3In.Ventilator1) OR (Box4In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box4In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box3Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box5In.Ventilator1) OR (Box4In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box4In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box5Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box6In.Ventilator1) OR (Box4In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box4In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box6Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		
		//Box 5 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box5In.IntervallbetriebEin THEN
			IF (Box5In.Ventilator1 AND Box1In.Ventilator1) OR (Box5In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box5In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box1Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box2In.Ventilator1) OR (Box5In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box5In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box2Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box3In.Ventilator1) OR (Box5In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box5In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box3Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box4In.Ventilator1) OR (Box5In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box5In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box4Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box6In.Ventilator1) OR (Box5In.Ventilator2 AND Box6In.Ventilator2) THEN
				Box6Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box5In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box6Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 6 im Intervallbetrieb -> Dauerbetrieb u. Intervallbetrieb-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box6In.IntervallbetriebEin THEN
			IF (Box6In.Ventilator1 AND Box1In.Ventilator1) OR (Box6In.Ventilator2 AND Box1In.Ventilator2) THEN
				Box1Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box6In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box1Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box2In.Ventilator1) OR (Box6In.Ventilator2 AND Box2In.Ventilator2) THEN
				Box2Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box6In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box2Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box3In.Ventilator1) OR (Box6In.Ventilator2 AND Box3In.Ventilator2) THEN
				Box3Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box6In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box3Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box4In.Ventilator1) OR (Box6In.Ventilator2 AND Box4In.Ventilator2) THEN
				Box4Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box6In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box4Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box5In.Ventilator1) OR (Box6In.Ventilator2 AND Box5In.Ventilator2) THEN
				Box5Out.DauerbetriebSperre	:= TRUE;
				FOR i := 0 TO 23 DO
					IF (Box6In.IntervallbetriebZeiten[i] = TRUE) THEN
						Box5Out.IntervallbetriebZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		
		//NACHTROCKNUNG AKTIVIERT =========================================================================================================================================================

		//Box 1 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box1In.NachtrocknungEin THEN
			IF (Box1In.Ventilator1 AND Box2In.Ventilator1) OR (Box1In.Ventilator2 AND Box2In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box1In.NachtrocknungZeiten[i] = TRUE) THEN
						Box2Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box3In.Ventilator1) OR (Box1In.Ventilator2 AND Box3In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box1In.NachtrocknungZeiten[i] = TRUE) THEN
						Box3Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box4In.Ventilator1) OR (Box1In.Ventilator2 AND Box4In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box1In.NachtrocknungZeiten[i] = TRUE) THEN
						Box4Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box5In.Ventilator1) OR (Box1In.Ventilator2 AND Box5In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box1In.NachtrocknungZeiten[i] = TRUE) THEN
						Box5Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box1In.Ventilator1 AND Box6In.Ventilator1) OR (Box1In.Ventilator2 AND Box6In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box1In.NachtrocknungZeiten[i] = TRUE) THEN
						Box6Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 2 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box2In.NachtrocknungEin THEN
			IF (Box2In.Ventilator1 AND Box1In.Ventilator1) OR (Box2In.Ventilator2 AND Box1In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box2In.NachtrocknungZeiten[i] = TRUE) THEN
						Box1Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box3In.Ventilator1) OR (Box2In.Ventilator2 AND Box3In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box2In.NachtrocknungZeiten[i] = TRUE) THEN
						Box3Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box4In.Ventilator1) OR (Box2In.Ventilator2 AND Box4In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box2In.NachtrocknungZeiten[i] = TRUE) THEN
						Box4Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box5In.Ventilator1) OR (Box2In.Ventilator2 AND Box5In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box2In.NachtrocknungZeiten[i] = TRUE) THEN
						Box5Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box2In.Ventilator1 AND Box6In.Ventilator1) OR (Box2In.Ventilator2 AND Box6In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box2In.NachtrocknungZeiten[i] = TRUE) THEN
						Box6Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 3 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box3In.NachtrocknungEin THEN
			IF (Box3In.Ventilator1 AND Box1In.Ventilator1) OR (Box3In.Ventilator2 AND Box1In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box3In.NachtrocknungZeiten[i] = TRUE) THEN
						Box1Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box2In.Ventilator1) OR (Box3In.Ventilator2 AND Box2In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box3In.NachtrocknungZeiten[i] = TRUE) THEN
						Box2Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box4In.Ventilator1) OR (Box3In.Ventilator2 AND Box4In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box3In.NachtrocknungZeiten[i] = TRUE) THEN
						Box4Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box5In.Ventilator1) OR (Box3In.Ventilator2 AND Box5In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box3In.NachtrocknungZeiten[i] = TRUE) THEN
						Box5Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box3In.Ventilator1 AND Box6In.Ventilator1) OR (Box3In.Ventilator2 AND Box6In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box3In.NachtrocknungZeiten[i] = TRUE) THEN
						Box6Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 4 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box4In.NachtrocknungEin THEN
			IF (Box4In.Ventilator1 AND Box1In.Ventilator1) OR (Box4In.Ventilator2 AND Box1In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box4In.NachtrocknungZeiten[i] = TRUE) THEN
						Box1Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box2In.Ventilator1) OR (Box4In.Ventilator2 AND Box2In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box4In.NachtrocknungZeiten[i] = TRUE) THEN
						Box2Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box3In.Ventilator1) OR (Box4In.Ventilator2 AND Box3In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box4In.NachtrocknungZeiten[i] = TRUE) THEN
						Box3Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box5In.Ventilator1) OR (Box4In.Ventilator2 AND Box5In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box4In.NachtrocknungZeiten[i] = TRUE) THEN
						Box5Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box4In.Ventilator1 AND Box6In.Ventilator1) OR (Box4In.Ventilator2 AND Box6In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box4In.NachtrocknungZeiten[i] = TRUE) THEN
						Box6Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 5 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box5In.NachtrocknungEin THEN
			IF (Box5In.Ventilator1 AND Box1In.Ventilator1) OR (Box5In.Ventilator2 AND Box1In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box5In.NachtrocknungZeiten[i] = TRUE) THEN
						Box1Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box2In.Ventilator1) OR (Box5In.Ventilator2 AND Box2In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box5In.NachtrocknungZeiten[i] = TRUE) THEN
						Box2Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box3In.Ventilator1) OR (Box5In.Ventilator2 AND Box3In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box5In.NachtrocknungZeiten[i] = TRUE) THEN
						Box3Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box4In.Ventilator1) OR (Box5In.Ventilator2 AND Box4In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box5In.NachtrocknungZeiten[i] = TRUE) THEN
						Box4Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box5In.Ventilator1 AND Box6In.Ventilator1) OR (Box5In.Ventilator2 AND Box6In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box5In.NachtrocknungZeiten[i] = TRUE) THEN
						Box6Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
		//Box 6 in der Nachtrocknung -> Nachtrocknungs-Zeitfenster für alle anderen Boxen mit gleichem Lüfter sperren
		IF Box6In.NachtrocknungEin THEN
			IF (Box6In.Ventilator1 AND Box1In.Ventilator1) OR (Box6In.Ventilator2 AND Box1In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box6In.NachtrocknungZeiten[i] = TRUE) THEN
						Box1Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box2In.Ventilator1) OR (Box6In.Ventilator2 AND Box2In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box6In.NachtrocknungZeiten[i] = TRUE) THEN
						Box2Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box3In.Ventilator1) OR (Box6In.Ventilator2 AND Box3In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box6In.NachtrocknungZeiten[i] = TRUE) THEN
						Box3Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box4In.Ventilator1) OR (Box6In.Ventilator2 AND Box4In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box6In.NachtrocknungZeiten[i] = TRUE) THEN
						Box4Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
			IF (Box6In.Ventilator1 AND Box5In.Ventilator1) OR (Box6In.Ventilator2 AND Box5In.Ventilator2) THEN
				FOR i := 0 TO 23 DO
					IF (Box6In.NachtrocknungZeiten[i] = TRUE) THEN
						Box5Out.NachtrocknungZeitenGesperrt[i]	:= TRUE;
					END_IF
				END_FOR
			END_IF
		END_IF
		
			
		//Mehrere Boxen gleichzeitig belüftbar (Jalousieklappen) ******************************************************************************************************************
	ELSE
		
		//Box 1
		Box1Out.DauerbetriebSperre		:= FALSE;
		Box1Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box1Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box1Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box1Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box1Out.NachtrocknungZeitenGesperrt));
		
		//Box 2
		Box2Out.DauerbetriebSperre		:= FALSE;
		Box2Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box2Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box2Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box2Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box2Out.NachtrocknungZeitenGesperrt));
		
		//Box 3
		Box3Out.DauerbetriebSperre		:= FALSE;
		Box3Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box3Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box3Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box3Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box3Out.NachtrocknungZeitenGesperrt));
		
		//Box 4
		Box4Out.DauerbetriebSperre		:= FALSE;
		Box4Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box4Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box4Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box4Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box4Out.NachtrocknungZeitenGesperrt));
		
		//Box 5
		Box5Out.DauerbetriebSperre		:= FALSE;
		Box5Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box5Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box5Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box5Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box5Out.NachtrocknungZeitenGesperrt));
		
		//Box 6
		Box6Out.DauerbetriebSperre		:= FALSE;
		Box6Out.IntervallbetriebSperre	:= FALSE;
		memset(ADR(Box6Out.IntervallbetriebZeitenGesperrt), 0, SIZEOF(Box6Out.IntervallbetriebZeitenGesperrt));
		memset(ADR(Box6Out.NachtrocknungZeitenGesperrt), 0, SIZEOF(Box6Out.NachtrocknungZeitenGesperrt));
		
	
	END_IF
	
	
	//===================================================================================================================================================================================================
	//Abhängigkeiten der Boxenklappen und Bypassklappe zu den Ventilatoren ermitteln 
	//(damit bei Klappenumschaltung Anlagen mit 2 Ventilatoren nur der zuständige Ventilator abgeschaltet wird)
	//===================================================================================================================================================================================================
	
	//Boxenklappe 1 - Ventilator 1
	Boxenkl1VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 1 - Ventilator 2
	Boxenkl1VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe1 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 2 - Ventilator 1
	Boxenkl2VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 2 - Ventilator 2
	Boxenkl2VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe2 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 3 - Ventilator 1
	Boxenkl3VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 3 - Ventilator 2
	Boxenkl3VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe3 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 4 - Ventilator 1
	Boxenkl4VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 4 - Ventilator 2
	Boxenkl4VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe4 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;

	//Boxenklappe 5 - Ventilator 1
	Boxenkl5VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 5 - Ventilator 2
	Boxenkl5VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe5 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 6 - Ventilator 1
	Boxenkl6VonVent1Abhaengig := (Box1In.Ventilator1 AND (Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator1 AND (Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator1 AND (Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator1 AND (Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator1 AND (Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator1 AND (Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Boxenklappe 6 - Ventilator 2
	Boxenkl6VonVent2Abhaengig := (Box1In.Ventilator2 AND (Box1In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR 
	(Box2In.Ventilator2 AND (Box2In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR (Box3In.Ventilator2 AND (Box3In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR
	(Box4In.Ventilator2 AND (Box4In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR (Box5In.Ventilator2 AND (Box5In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR
	(Box6In.Ventilator2 AND (Box6In.StellungKlappe6 <> FBBOX_NICHT_VERWENDET)) OR BoxenklVonBeidenVentAbhaengig;
	
	//Bypassklappe & Ventilator 1
	BypassklVonVent1Abhaengig := (Box1In.Ventilator1 AND Box1In.Luftentfeuchter) OR (Box2In.Ventilator1 AND Box2In.Luftentfeuchter) OR
	(Box3In.Ventilator1 AND Box3In.Luftentfeuchter) OR (Box4In.Ventilator1 AND Box4In.Luftentfeuchter) OR
	(Box5In.Ventilator1 AND Box5In.Luftentfeuchter) OR (Box6In.Ventilator1 AND Box6In.Luftentfeuchter) OR BypassklVonBeidenVentAbhaengig;
	
	//Bypassklappe & Ventilator 2
	BypassklVonVent2Abhaengig := (Box1In.Ventilator2 AND Box1In.Luftentfeuchter) OR (Box2In.Ventilator2 AND Box2In.Luftentfeuchter) OR
	(Box3In.Ventilator2 AND Box3In.Luftentfeuchter) OR (Box4In.Ventilator2 AND Box4In.Luftentfeuchter) OR
	(Box5In.Ventilator2 AND Box5In.Luftentfeuchter) OR (Box6In.Ventilator2 AND Box6In.Luftentfeuchter) OR BypassklVonBeidenVentAbhaengig;
	
	
	

END_FUNCTION_BLOCK
