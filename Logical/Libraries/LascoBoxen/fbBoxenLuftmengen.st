
(* Funktionsblock zur Ermittlung der erforderlichen Luftmengen für Ventilator 1&2 aus Boxenfläche *)
FUNCTION_BLOCK fbBoxenLuftmengen
	
	
	//Min/Max Luftmenge bei Betrieb mit Entfeuchter ermitteln
	loc_MinLuftmengeMitEntfeuchter	:= LuftgeschwEntfeuchterMin * RegisterflaecheEntfeuchter * 3600;
	loc_MaxLuftmengeMitEntfeuchter	:= LuftgeschwEntfeuchterMax * RegisterflaecheEntfeuchter * 3600;

	
	//Soll-Luftmenge Ventilator 1 *********************************************************************************************************************************************
	loc_LuftmengeSollVent1	:= 0;
	
	IF FrischluftbetriebAktiv THEN
		IF Box1.BoxIstAktiv AND Box1.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= Box1.GrundflaecheBox * LuftmengeSollProM2FrischlVent1;
		END_IF
		IF Box2.BoxIstAktiv AND Box2.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box2.GrundflaecheBox * LuftmengeSollProM2FrischlVent1);
		END_IF
		IF Box3.BoxIstAktiv AND Box3.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box3.GrundflaecheBox * LuftmengeSollProM2FrischlVent1);
		END_IF
		IF Box4.BoxIstAktiv AND Box4.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box4.GrundflaecheBox * LuftmengeSollProM2FrischlVent1);
		END_IF
		IF Box5.BoxIstAktiv AND Box5.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box5.GrundflaecheBox * LuftmengeSollProM2FrischlVent1);
		END_IF
		IF Box6.BoxIstAktiv AND Box6.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box6.GrundflaecheBox * LuftmengeSollProM2FrischlVent1);
		END_IF
	ELSIF UmluftbetriebAktiv THEN
		IF Box1.BoxIstAktiv AND Box1.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= Box1.GrundflaecheBox * LuftmengeSollProM2UmluftVent1;
		END_IF
		IF Box2.BoxIstAktiv AND Box2.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box2.GrundflaecheBox * LuftmengeSollProM2UmluftVent1);
		END_IF
		IF Box3.BoxIstAktiv AND Box3.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box3.GrundflaecheBox * LuftmengeSollProM2UmluftVent1);
		END_IF
		IF Box4.BoxIstAktiv AND Box4.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box4.GrundflaecheBox * LuftmengeSollProM2UmluftVent1);
		END_IF
		IF Box5.BoxIstAktiv AND Box5.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box5.GrundflaecheBox * LuftmengeSollProM2UmluftVent1);
		END_IF
		IF Box6.BoxIstAktiv AND Box6.Ventilator1 THEN
			loc_LuftmengeSollVent1	:= loc_LuftmengeSollVent1 + (Box6.GrundflaecheBox * LuftmengeSollProM2UmluftVent1);
		END_IF
	END_IF
	
	//Wenn Entfeuchter in Betrieb -> Luftmenge auf Min/Max von Entfeuchter begrenzen
	IF EntfeuchterInBetrieb THEN
		IF loc_LuftmengeSollVent1 < loc_MinLuftmengeMitEntfeuchter THEN
			LuftmengeSollVent1Out	:= loc_MinLuftmengeMitEntfeuchter;
		ELSIF loc_LuftmengeSollVent1 > loc_MaxLuftmengeMitEntfeuchter THEN
			LuftmengeSollVent1Out	:= loc_MaxLuftmengeMitEntfeuchter;
		ELSE
			LuftmengeSollVent1Out	:= loc_LuftmengeSollVent1;
		END_IF
	ELSE
		LuftmengeSollVent1Out	:= loc_LuftmengeSollVent1;
	END_IF
	

	
	//Soll-Luftmenge Ventilator 2 *********************************************************************************************************************************************
	loc_LuftmengeSollVent2	:= 0;
	
	IF FrischluftbetriebAktiv THEN
		IF Box1.BoxIstAktiv AND Box1.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= Box1.GrundflaecheBox * LuftmengeSollProM2FrischlVent2;
		END_IF
		IF Box2.BoxIstAktiv AND Box2.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box2.GrundflaecheBox * LuftmengeSollProM2FrischlVent2);
		END_IF
		IF Box3.BoxIstAktiv AND Box3.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box3.GrundflaecheBox * LuftmengeSollProM2FrischlVent2);
		END_IF
		IF Box4.BoxIstAktiv AND Box4.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box4.GrundflaecheBox * LuftmengeSollProM2FrischlVent2);
		END_IF
		IF Box5.BoxIstAktiv AND Box5.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box5.GrundflaecheBox * LuftmengeSollProM2FrischlVent2);
		END_IF
		IF Box6.BoxIstAktiv AND Box6.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box6.GrundflaecheBox * LuftmengeSollProM2FrischlVent2);
		END_IF
	ELSIF UmluftbetriebAktiv THEN
		IF Box1.BoxIstAktiv AND Box1.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= Box1.GrundflaecheBox * LuftmengeSollProM2UmluftVent2;
		END_IF
		IF Box2.BoxIstAktiv AND Box2.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box2.GrundflaecheBox * LuftmengeSollProM2UmluftVent2);
		END_IF
		IF Box3.BoxIstAktiv AND Box3.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box3.GrundflaecheBox * LuftmengeSollProM2UmluftVent2);
		END_IF
		IF Box4.BoxIstAktiv AND Box4.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box4.GrundflaecheBox * LuftmengeSollProM2UmluftVent2);
		END_IF
		IF Box5.BoxIstAktiv AND Box5.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box5.GrundflaecheBox * LuftmengeSollProM2UmluftVent2);
		END_IF
		IF Box6.BoxIstAktiv AND Box6.Ventilator2 THEN
			loc_LuftmengeSollVent2	:= loc_LuftmengeSollVent2 + (Box6.GrundflaecheBox * LuftmengeSollProM2UmluftVent2);
		END_IF	
	END_IF
	
	//Wenn Entfeuchter in Betrieb -> Luftmenge auf Min/Max von Entfeuchter begrenzen
	IF EntfeuchterInBetrieb THEN
		IF loc_LuftmengeSollVent2 < loc_MinLuftmengeMitEntfeuchter THEN
			LuftmengeSollVent2Out	:= loc_MinLuftmengeMitEntfeuchter;
		ELSIF loc_LuftmengeSollVent2 > loc_MaxLuftmengeMitEntfeuchter THEN
			LuftmengeSollVent2Out	:= loc_MaxLuftmengeMitEntfeuchter;
		ELSE
			LuftmengeSollVent2Out	:= loc_LuftmengeSollVent2;
		END_IF
	ELSE
		LuftmengeSollVent2Out	:= loc_LuftmengeSollVent2;
	END_IF

	
END_FUNCTION_BLOCK
