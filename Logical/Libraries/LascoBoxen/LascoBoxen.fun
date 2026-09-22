
{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenKonfig (*Funktionsbaustein für Konfiguration der einzelnen Boxen (Anforderung Box, Klappen, Ventilatoren, Luftaufbereitung,...)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		StundeAktuell : {REDUND_UNREPLICABLE} USINT; (*Aktuelle Stunde (0-23h)*)
		ScheitholzofenNochAktiv : {REDUND_UNREPLICABLE} BOOL; (*Für Notbetrieb Boxen und Ventilatoren, wenn Boxen in Pause oder Stillstand und Scheitholzofen noch aktiv*)
		EntfeuchterNochAktiv : {REDUND_UNREPLICABLE} BOOL; (*Für Notbetrieb Boxen und Ventilatoren, wenn Boxen in Pause oder Stillstand und Entfeuchter noch aktiv*)
		BypassklVonBeidenVentAbhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, werden beide Ventilatoren bei Umschaltung Bypassklappe auf Min-Drehzahl gefahren (wird an Baustein für Ventilatoren übergeben*)
		BoxenklVonBeidenVentAbhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, werden beide Ventilatoren bei Klappenumschaltung auf Min-Drehzahl gefahren (wird an Baustein für Ventilatoren übergeben*)
		WarmluftofenNochAktiv : {REDUND_UNREPLICABLE} BOOL; (*Für Notbetrieb Boxen und Ventilatoren, wenn Boxen in Pause oder Stillstand und Warmluftofen noch aktiv*)
		AlleKlappenSchliessenWennAus : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, werden alle Klappen geschlossen wenn keine Box im jeweiligen Lüfterkreis aktiv ist*)
		MehrereBoxenBelueftbar : {REDUND_UNREPLICABLE} BOOL; (*Wenn TRUE, können mehrere Boxen pro Lüfterkreis gleichzeitig belüftet werden (z.B. bei Anlagen mit Jalousieklappen)*)
		Box1In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		Box2In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		Box3In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		Box4In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		Box5In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		Box6In : {REDUND_UNREPLICABLE} typKonfigurationBoxenIn;
		EntfeuchterInselbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Für 3.04: Wenn kein Ventilator in Ausstattung ausgewählt, wird der Entfeuchter im Inselbetrieb (Start/Stopp über Extern) betrieben*)
		TasteEntfeuchterEinInselbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Für 3.04: TRUE, wenn Taste "Entfeuchter freigeben" im Inselbetrieb eingeschaltet ist*)
		AnfEntfeuchterExtern : {REDUND_UNREPLICABLE} BOOL; (*Für 3.04, TRUE, wenn Entfeuchter wird über Fremdsteuerung angefordert wird*)
	END_VAR
	VAR_OUTPUT
		Box1Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		Box2Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		Box3Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		Box4Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		Box5Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		Box6Out : {REDUND_UNREPLICABLE} typKonfigurationBoxenOut;
		FreigabeKlappe1Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKlappe2Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKlappe3Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKlappe4Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKlappe5Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeKlappe6Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVentilator1 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVentilator2 : {REDUND_UNREPLICABLE} BOOL;
		FreigabeLuftentfeuchter : {REDUND_UNREPLICABLE} BOOL;
		FreigabeWarmluftofen : {REDUND_UNREPLICABLE} BOOL;
		FreigabeHeizregister : {REDUND_UNREPLICABLE} BOOL;
		FreigabeScheitholzofen : {REDUND_UNREPLICABLE} BOOL;
		EntfeuchterVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Entfeuchter von Ventilator 1 abhängig ist (damit Ventilator läuft, wenn Entfeuchter noch aktiv)*)
		EntfeuchterVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Entfeuchter von Ventilator 2 abhängig ist (damit Ventilator läuft, wenn Entfeuchter aktiv)*)
		WarmluftofenVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Warmluftofen von Ventilator 1 abhängig ist (damit Ventilator läuft, wenn Warmluftofen aktiv)*)
		WarmluftofenVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Warmluftofen von Ventilator 2 abhängig ist (damit Ventilator läuft, wenn Warmluftofen aktiv)*)
		HeizregisterVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Heizregister von Ventilator 1 abhängig ist (damit Ventilator läuft, wenn Heizregister aktiv)*)
		HeizregisterVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Heizregister von Ventilator 2 abhängig ist (damit Ventilator läuft, wenn Heizregister aktiv)*)
		ScheitholzofenVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Scheitholzofen von Ventilator 1 abhängig ist (damit Ventilator läuft, wenn Scheitholzofen aktiv)*)
		ScheitholzofenVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird freigegeben, wenn Scheitholzofen von Ventilator 2 abhängig ist (damit Ventilator läuft, wenn Scheitholzofen aktiv)*)
		NotbetriebBox1 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebBox2 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebBox3 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebBox4 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebBox5 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebBox6 : {REDUND_UNREPLICABLE} BOOL;
		NotbetriebVentilator1 : {REDUND_UNREPLICABLE} BOOL; (*Freigabe für Notbetrieb Ventilator 1 (keine Box aktiv, jedoch Trocknungsgeräte noch im Nachlauf (Auskühlphasen Öfen)*)
		NotbetriebVentilator2 : {REDUND_UNREPLICABLE} BOOL; (*Freigabe für Notbetrieb Ventilator 2 (keine Box aktiv, jedoch Trocknungsgeräte noch im Nachlauf (Auskühlphasen Öfen)*)
		Boxenkl1VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl1VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl2VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl2VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl3VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl3VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl4VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl4VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl5VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl5VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl6VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		Boxenkl6VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		BypassklVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		BypassklVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL; (*Wird an Baustein für Ansteuerung Ventilatoren übergeben (nur jeweiligen Ventilator bei Klappenumschaltung ausschalten)*)
		FreigabeEntfeuchterInselbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Für 3.04: Freigabe Luftentfeuchter, wenn über Fremdsteuerung angefordert*)
		EntfeuchterInselbetrAktivOut : {REDUND_UNREPLICABLE} BOOL; (*TRUE, wenn Entfeuchter im Inselbetrieb betrieben wird & Taste "EIN" für Inselbetrieb aktiv ist.*)
	END_VAR
	VAR
		fbPugeSchlechtwetterBox1 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		fbPugeSchlechtwetterBox2 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		fbPugeSchlechtwetterBox3 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		fbPugeSchlechtwetterBox4 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		fbPugeSchlechtwetterBox5 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		fbPugeSchlechtwetterBox6 : {REDUND_UNREPLICABLE} fbLascoPugeV2;
		i : {REDUND_UNREPLICABLE} INT; (*Schleifenzähler*)
		loc_Box1GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Box2GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Box3GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Box4GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Box5GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Box6GleicherLuefterkreis : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox1 : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox2 : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox3 : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox4 : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox5 : {REDUND_UNREPLICABLE} BOOL;
		loc_Entf_NotbetriebBox6 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox1 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox2 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox3 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox4 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox5 : {REDUND_UNREPLICABLE} BOOL;
		loc_Sho_NotbetriebBox6 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox1 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox2 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox3 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox4 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox5 : {REDUND_UNREPLICABLE} BOOL;
		loc_Wlo_NotbetriebBox6 : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenVentKlappen (*Funktionsbaustein für Ansteuerung Ventilatoren und Klappen*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		Ventilator1InBetrieb : {REDUND_UNREPLICABLE} BOOL;
		Ventilator2InBetrieb : {REDUND_UNREPLICABLE} BOOL;
		AnforderungVentilator1 : {REDUND_UNREPLICABLE} BOOL;
		AnforderungVentilator2 : {REDUND_UNREPLICABLE} BOOL;
		LuftaufbereitungInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		DrzVent1UmschMitLuftaufb : {REDUND_UNREPLICABLE} REAL;
		DrzVent2UmschMitLuftaufb : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Umsch : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Umsch : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Betrieb : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Betrieb : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Min : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent1Max : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Min : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Max : {REDUND_UNREPLICABLE} REAL;
		RampeVent1Up : {REDUND_UNREPLICABLE} REAL;
		RampeVent1Down : {REDUND_UNREPLICABLE} REAL;
		RampeVent2Up : {REDUND_UNREPLICABLE} REAL;
		RampeVent2Down : {REDUND_UNREPLICABLE} REAL;
		BypassklappeOeffnen : {REDUND_UNREPLICABLE} BOOL;
		BypassklappeSchliessen : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl1Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl1Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl2Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl2Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe1Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe1Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe2Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe2Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe3Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe3Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe4Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe4Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe5Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe5Schliessen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe6Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe6Schliessen : {REDUND_UNREPLICABLE} BOOL;
		EndlBypassGeschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBypassOffen : {REDUND_UNREPLICABLE} BOOL;
		EndlUmschaltkl1Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlUmschaltkl1Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlUmschaltkl2Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlUmschaltkl2Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe1Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe1Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe2Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe2Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe3Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe3Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe4Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe4Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe5Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe5Geschl : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe6Offen : {REDUND_UNREPLICABLE} BOOL;
		EndlBoxenklappe6Geschl : {REDUND_UNREPLICABLE} BOOL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		LaufzeitBypassklappe : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitUmschaltklappe1 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitUmschaltklappe2 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe1 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe2 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe3 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe4 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe5 : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitBoxenklappe6 : {REDUND_UNREPLICABLE} UDINT;
		AnlaufverzZweiterVent : {REDUND_UNREPLICABLE} UDINT;
		Boxenklappe6Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		Boxenklappe5Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		Boxenklappe4Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		Boxenklappe3Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		Boxenklappe2Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		Boxenklappe1Vorhanden : {REDUND_UNREPLICABLE} BOOL; (*True, wenn Boxenklappe in der Ausstattung vorhanden ist*)
		UmluftklVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		UmluftklVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl1VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl1VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl2VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl2VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl3VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl3VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl4VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl4VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl5VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl5VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl6VonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		Boxenkl6VonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		BypassklVonVent1Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		BypassklVonVent2Abhaengig : {REDUND_UNREPLICABLE} BOOL;
		EndlagenVhdBoxenklappe1 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBoxenklappe2 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBoxenklappe3 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBoxenklappe4 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBoxenklappe5 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBoxenklappe6 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdUmschaltklappe1 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdUmschaltklappe2 : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
		EndlagenVhdBypassklappe : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen für die Klappe vorhanden, wird die Umschaltung der Klappe über die eingestellte Laufzeit simuliert*)
	END_VAR
	VAR_OUTPUT
		FreigabeVentilator1Out : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVentilator2Out : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlVent1Out : {REDUND_UNREPLICABLE} REAL;
		DrehzahlVent2Out : {REDUND_UNREPLICABLE} REAL;
		BypassSchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		BypassOeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl1SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl1OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl2SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Umschaltkl2OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe1OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe1SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe2OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe2SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe3OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe3SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe4OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe4SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe5OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe5SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe6OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		Boxenklappe6SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		UmschaltungAktiv : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitBypass : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitUmschaltkl1 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitUmschaltkl2 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox1 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox2 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox3 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox4 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox5 : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitKlappeBox6 : {REDUND_UNREPLICABLE} BOOL;
		FehlerFuVentilator1 : {REDUND_UNREPLICABLE} BOOL;
		BypassklappeIstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		BypassklappeIstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Umschaltklappe1IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Umschaltklappe1IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Umschaltklappe2IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Umschaltklappe2IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe1IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe1IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe2IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe2IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe3IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe3IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe4IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe4IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe5IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe5IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe6IstOffen : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		Boxenklappe6IstGeschl : {REDUND_UNREPLICABLE} BOOL; (*Statusausgang Stellung Klappe, wenn keine Endlagen vorhanden sind & Laufzeit <> 0 ist*)
		FehlerFuVentilator2 : {REDUND_UNREPLICABLE} BOOL;
		curStep : {REDUND_UNREPLICABLE} USINT;
		RestAnlaufverzoegerung : {REDUND_UNREPLICABLE} UDINT;
		AnlaufverzVent1Aktiv : {REDUND_UNREPLICABLE} BOOL; (*Für Visu -> Ist TRUE, wenn Ventilator 1 angefordert und Anlaufverzögerung noch nicht abgelaufen ist*)
		AnlaufverzVent2Aktiv : {REDUND_UNREPLICABLE} BOOL; (*Für Visu -> Ist TRUE, wenn Ventilator 2 angefordert und Anlaufverzögerung noch nicht abgelaufen ist*)
	END_VAR
	VAR
		fbLascoEUhr_0 : {REDUND_UNREPLICABLE} fbLascoEUhr;
		fbLascoZdxx_0 : {REDUND_UNREPLICABLE} fbLascoZdxx;
		sekTick : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBypassklappe : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungUmschaltklappe1 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungUmschaltklappe2 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe1 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe2 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe3 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe4 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe5 : {REDUND_UNREPLICABLE} BOOL;
		loc_AenderungBoxenklappe6 : {REDUND_UNREPLICABLE} BOOL;
		loc_UmschaltungErforderlVent1 : {REDUND_UNREPLICABLE} BOOL;
		loc_UmschaltungErforderlVent2 : {REDUND_UNREPLICABLE} BOOL;
		fbFuVentilator1 : {REDUND_UNREPLICABLE} fbLascoFU;
		fbFuVentilator2 : {REDUND_UNREPLICABLE} fbLascoFU;
		Bypassklappe : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Umschaltklappe1 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Umschaltklappe2 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe1 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe2 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe3 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe4 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe5 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		Boxenklappe6 : {REDUND_UNREPLICABLE} fbBoxenKlappenanst;
		nextStep : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		lastStep : {REDUND_UNREPLICABLE} USINT;
		TON_AnlaufverzVentilatoren : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenKlappenanst (*Funktionsbaustein zur Ansteuerung von Klappen mit nur einem Wechsler-Relais (nicht angesteuert = Richtung A, angesteuert = Richtung B)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Stoerung : {REDUND_UNREPLICABLE} BOOL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		LaufzeitOeffnen : {REDUND_UNREPLICABLE} UDINT;
		LaufzeitSchliessen : {REDUND_UNREPLICABLE} UDINT;
		Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Schliessen : {REDUND_UNREPLICABLE} BOOL;
		EndlageOffen : {REDUND_UNREPLICABLE} BOOL;
		EndlageGeschl : {REDUND_UNREPLICABLE} BOOL;
		EndlagenVhd : {REDUND_UNREPLICABLE} BOOL; (*Wenn FALSE, wird die Umschaltung über die eingestellte Laufzeit simuliert und die Position der Klappe über "KlappeIstGeschl" bzw. "KlappeIstOffen" ausgegeben.*)
	END_VAR
	VAR_OUTPUT
		OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitOeffnen : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeitSchliessen : {REDUND_UNREPLICABLE} BOOL;
		KlappeIstOffenOut : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen vorhanden ("EndlagenVhd" ist FALSE), gibt der Ausgang die simulierte Position aus.*)
		KlappeIstGeschlOut : {REDUND_UNREPLICABLE} BOOL; (*Sind keine Endlagen vorhanden ("EndlagenVhd" ist FALSE), gibt der Ausgang die simulierte Position aus.*)
	END_VAR
	VAR
		step : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		TON_Laufzeit : {REDUND_UNREPLICABLE} TON;
		TON_AnzVerz : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenAbluftkl (*Funktionsbaustein zur Ansteuerung Abluftklappe/Abluftventilator*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		Quit : {REDUND_UNREPLICABLE} BOOL;
		Laufzeit : {REDUND_UNREPLICABLE} UDINT;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		AbluftFeuchteIst : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchteSoll : {REDUND_UNREPLICABLE} REAL;
		EndlageOffen : {REDUND_UNREPLICABLE} BOOL;
		EndlageGeschl : {REDUND_UNREPLICABLE} BOOL;
		Oeffnen : {REDUND_UNREPLICABLE} BOOL;
		Schliessen : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		OeffnenOut : {REDUND_UNREPLICABLE} BOOL;
		SchliessenOut : {REDUND_UNREPLICABLE} BOOL;
		FehlerLaufzeit : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		step : {REDUND_UNREPLICABLE} USINT;
		TON_Laufzeit : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenAbluftvent (*Funktionsbaustein zur Ansteuerung Abluftventilator inkl. Drehzahlvorgabe*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		Automatik : {REDUND_UNREPLICABLE} BOOL;
		Ein : {REDUND_UNREPLICABLE} BOOL; (*Handbetrieb EIN*)
		VentilatorInBetrieb : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlMin : {REDUND_UNREPLICABLE} REAL;
		DrehzahlMax : {REDUND_UNREPLICABLE} REAL;
		RampeUp : {REDUND_UNREPLICABLE} REAL;
		RampeDown : {REDUND_UNREPLICABLE} REAL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		AbluftFeuchteIst : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		AbluftFeuchteSoll : {REDUND_UNREPLICABLE} REAL;
		DrehzahlSoll : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR_OUTPUT
		FehlerOut : {REDUND_UNREPLICABLE} BOOL;
		FreigabeVentilatorOut : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlVentilatorOut : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		step : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		fbFuAbluftventilator : {REDUND_UNREPLICABLE} fbLascoFU;
		sekTick : {REDUND_UNREPLICABLE} BOOL;
		fbLascoEUhr_0 : {REDUND_UNREPLICABLE} fbLascoEUhr;
		fbLascoZdxx_0 : {REDUND_UNREPLICABLE} fbLascoZdxx;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenUmschaltung (*Funktionsbaustein für Umschaltung Frischluft/Umluft*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		AbluftTemp : {REDUND_UNREPLICABLE} REAL;
		SensorFrischluftVhd : {REDUND_UNREPLICABLE} BOOL;
		SensorDachluftVhd : {REDUND_UNREPLICABLE} BOOL;
		SensorAbluftVhd : {REDUND_UNREPLICABLE} BOOL;
		FrischluftTemp : {REDUND_UNREPLICABLE} REAL;
		DachluftTemp : {REDUND_UNREPLICABLE} REAL;
		DifferenzTempUmschaltung : {REDUND_UNREPLICABLE} REAL;
		FrischlDachlTempUmschaltung : {REDUND_UNREPLICABLE} REAL;
		Umschaltverz : {REDUND_UNREPLICABLE} UDINT;
		StatusSensorDachluftOk : {REDUND_UNREPLICABLE} BOOL;
		StatusSensorFrischluftOk : {REDUND_UNREPLICABLE} BOOL;
		StatusSensorAbluftOk : {REDUND_UNREPLICABLE} BOOL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		FrischluftbetriebOut : {REDUND_UNREPLICABLE} BOOL;
		UmluftbetriebOut : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR
		step : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		TON_Umluft : {REDUND_UNREPLICABLE} TON;
		TON_Frischluft : {REDUND_UNREPLICABLE} TON;
		zzEdge00000 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00001 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00002 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00003 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00004 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00005 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00006 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00007 : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenWLO (*Funktionsbaustein zur Ansteuerung Warmluftofen inkl. Solltemperatur-Vorgabe*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL; (*Freigabe, wenn in Ausstattung vorhanden*)
		Automatikbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Automatikbetrieb nach Aussenluft-Sättigungsdefizit*)
		Dauerbetrieb : {REDUND_UNREPLICABLE} BOOL; (*Betriebsart Dauerbetrieb*)
		FehlerSensorAussenluft : {REDUND_UNREPLICABLE} BOOL; (*Eingang Fehler Sensor Aussenluft (Automatikbetrieb nicht möglich)*)
		FrischluftSattDefizitIst : {REDUND_UNREPLICABLE} REAL;
		FrischluftSattDefizitSoll : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		UmschaltverzWitterung : {REDUND_UNREPLICABLE} UDINT;
		WarmlufttemperaturVorgabe : {REDUND_UNREPLICABLE} REAL;
		OptionBetriebsmldgVhd : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmeldungWarmluftofen : {REDUND_UNREPLICABLE} BOOL;
		VerzBetriebsmeldung : {REDUND_UNREPLICABLE} UDINT;
		Auskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		FreigabeWarmluftofenOut : {REDUND_UNREPLICABLE} BOOL;
		WarmlufttempSollOut : {REDUND_UNREPLICABLE} REAL;
		FehlerBetriebsmeldungOut : {REDUND_UNREPLICABLE} BOOL;
		FehlerSensorAussenluftOut : {REDUND_UNREPLICABLE} BOOL;
		WarmluftofenAktiv : {REDUND_UNREPLICABLE} BOOL; (*Warmluftofen aktiv (oder Nachkühlzeit nicht abgelaufen)*)
		RestAuskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		step : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		TON_VerzBetriebsmeldung : {REDUND_UNREPLICABLE} TON;
		TOF_Auskuehlzeit : {REDUND_UNREPLICABLE} TOF;
		loc_WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
		loc_WetterIstGut : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00000 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00001 : {REDUND_UNREPLICABLE} BOOL;
		TON_WetterIstGut : {REDUND_UNREPLICABLE} TON;
		TON_WetterIstSchlecht : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenHeizreg (*Funktionsbaustein zur Ansteuerung eines Heizregisters inkl. Drehzahlvorgabe Heizungspumpe*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlHeizregisterSoll : {REDUND_UNREPLICABLE} REAL;
		Automatikbetrieb : {REDUND_UNREPLICABLE} BOOL;
		FehlerSensorAussenluft : {REDUND_UNREPLICABLE} BOOL;
		Dauerbetrieb : {REDUND_UNREPLICABLE} BOOL;
		FrischluftSattDefizitIst : {REDUND_UNREPLICABLE} REAL;
		FrischluftSattDefizitSoll : {REDUND_UNREPLICABLE} REAL;
		Hysterese : {REDUND_UNREPLICABLE} REAL;
		UmschaltverzWitterung : {REDUND_UNREPLICABLE} UDINT;
		WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL; (*Wird nur in für HB3000/HB4000 verwendet*)
	END_VAR
	VAR_OUTPUT
		FehlerOut : {REDUND_UNREPLICABLE} BOOL;
		FreigabeHeizregisterOut : {REDUND_UNREPLICABLE} BOOL;
		DrehzahlHeizregisterOut : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		zzEdge00000 : {REDUND_UNREPLICABLE} BOOL;
		zzEdge00001 : {REDUND_UNREPLICABLE} BOOL;
		step : {REDUND_UNREPLICABLE} USINT;
		stateEntry : {REDUND_UNREPLICABLE} BOOL;
		loc_WetterIstSchlecht : {REDUND_UNREPLICABLE} BOOL;
		loc_WetterIstGut : {REDUND_UNREPLICABLE} BOOL;
		TON_WetterIstGut : {REDUND_UNREPLICABLE} TON;
		TON_WetterIstSchlecht : {REDUND_UNREPLICABLE} TON;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenNotstrom (*Funktionsbaustein zur Ansteuerung eines Notstromaggregates inkl. Vorlaufzeit und Abfrage Betriebsmeldung*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		BetriebsmldgNotstromaggregat : {REDUND_UNREPLICABLE} BOOL;
		VerzBetriebsmeldung : {REDUND_UNREPLICABLE} UDINT;
		NotstromaggregatAngefordert : {REDUND_UNREPLICABLE} BOOL;
		QuitFehler : {REDUND_UNREPLICABLE} BOOL;
		Vorlaufzeit : {REDUND_UNREPLICABLE} UDINT;
		Nachlaufzeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_OUTPUT
		FreigabeNotstromaggregatOut : {REDUND_UNREPLICABLE} BOOL;
		FehlerOut : {REDUND_UNREPLICABLE} BOOL;
		NotstromBereitOut : {REDUND_UNREPLICABLE} BOOL;
		RestVorlaufzeit : {REDUND_UNREPLICABLE} UDINT;
		RestNachlaufzeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		TON_VerzBetriebsmeldung : {REDUND_UNREPLICABLE} TON;
		TON_Vorlaufzeit : {REDUND_UNREPLICABLE} TON;
		TOF_Nachlaufzeit : {REDUND_UNREPLICABLE} TOF;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenSHO (*Funktionsbaustein Ansteuerung Scheitholzofen (Auskühlzeit)*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		Betriebsmeldung : {REDUND_UNREPLICABLE} BOOL;
		Auskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR_OUTPUT
		ScheitholzofenAktiv : {REDUND_UNREPLICABLE} BOOL;
		RestAuskuehlzeit : {REDUND_UNREPLICABLE} UDINT;
	END_VAR
	VAR
		TOF_Auskuehlzeit : {REDUND_UNREPLICABLE} TOF;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbBoxenLuftmengen (*Funktionsblock zur Ermittlung der erforderlichen Luftmengen für Ventilator 1&2 aus Boxenfläche*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Box1 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		Box2 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		Box3 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		Box4 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		Box5 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		Box6 : {REDUND_UNREPLICABLE} typBoxenLuftmengenIn;
		LuftmengeSollProM2FrischlVent1 : {REDUND_UNREPLICABLE} REAL;
		LuftmengeSollProM2FrischlVent2 : {REDUND_UNREPLICABLE} REAL;
		LuftmengeSollProM2UmluftVent1 : {REDUND_UNREPLICABLE} REAL;
		LuftmengeSollProM2UmluftVent2 : {REDUND_UNREPLICABLE} REAL;
		RegisterflaecheEntfeuchter : {REDUND_UNREPLICABLE} REAL;
		LuftgeschwEntfeuchterMin : {REDUND_UNREPLICABLE} REAL;
		LuftgeschwEntfeuchterMax : {REDUND_UNREPLICABLE} REAL;
		FrischluftbetriebAktiv : {REDUND_UNREPLICABLE} BOOL;
		UmluftbetriebAktiv : {REDUND_UNREPLICABLE} BOOL;
		EntfeuchterInBetrieb : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		LuftmengeSollVent1Out : {REDUND_UNREPLICABLE} REAL;
		LuftmengeSollVent2Out : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		loc_LuftmengeSollVent1 : {REDUND_UNREPLICABLE} REAL;
		loc_LuftmengeSollVent2 : {REDUND_UNREPLICABLE} REAL;
		loc_MinLuftmengeMitEntfeuchter : {REDUND_UNREPLICABLE} REAL;
		loc_MaxLuftmengeMitEntfeuchter : {REDUND_UNREPLICABLE} REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK fbRestzeit (*Funktionsbaustein zur Berechnung der Restzeit Lauf/Pause aus 24h Zeitfenstern (BOOL [24])*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Freigabe : {REDUND_UNREPLICABLE} BOOL;
		AktuelleStunde : {REDUND_UNREPLICABLE} USINT;
		AktuelleMinute : {REDUND_UNREPLICABLE} USINT;
		ZeitfensterIn : REFERENCE TO ARRAY[0..23] OF BOOL;
	END_VAR
	VAR_OUTPUT
		ZeitfensterAktiv : {REDUND_UNREPLICABLE} BOOL;
		RestzeitStundenOut : {REDUND_UNREPLICABLE} UINT;
		RestzeitMinutenOut : {REDUND_UNREPLICABLE} UINT;
	END_VAR
	VAR
		loc_MinutenRestTag : {REDUND_UNREPLICABLE} UINT;
		loc_Aenderung : {REDUND_UNREPLICABLE} DINT;
		MEM_ZeitfensterIn : {REDUND_UNREPLICABLE} BOOL;
		loc_firstInitLauf : {REDUND_UNREPLICABLE} BOOL;
		i : {REDUND_UNREPLICABLE} USINT;
		loc_StundeEndeZeitfTag : {REDUND_UNREPLICABLE} USINT;
		loc_MinutenRestFolgetag : {REDUND_UNREPLICABLE} UINT;
		ii : {REDUND_UNREPLICABLE} USINT;
		loc_StundeEndeZeitfFolgetag : {REDUND_UNREPLICABLE} USINT;
		loc_MinutenRestGesamt : {REDUND_UNREPLICABLE} UINT;
		loc_firstInitPause : {REDUND_UNREPLICABLE} BOOL;
		loc_RestzeitStunden : {REDUND_UNREPLICABLE} UINT;
	END_VAR
END_FUNCTION_BLOCK
