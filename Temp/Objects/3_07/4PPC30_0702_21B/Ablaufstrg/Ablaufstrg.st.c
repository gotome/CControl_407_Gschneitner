#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Ablaufstrg/Ablaufstrgst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{

(stateEntry=1);
(nextModus=0);

}}
#line 8 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"
#line 11 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{



(zdxxSekunden.IN=Echtzeit.Sekunde);;fbLascoZdxx(&zdxxSekunden);
(sekTick=zdxxSekunden.Q);
(zdxxMinuten.IN=Echtzeit.Minute);;fbLascoZdxx(&zdxxMinuten);
(minTick=zdxxMinuten.Q);
(zdxxStunden.IN=Echtzeit.Stunde);;fbLascoZdxx(&zdxxStunden);
(stdTick=zdxxStunden.Q);
(zdxxTage.IN=Echtzeit.Tag);;fbLascoZdxx(&zdxxTage);
(TagTick=zdxxTage.Q);






(gAktModus=CheckRange(nextModus,0,2));

__AS__Action__actionUpdateStatus();

switch(gAktModus){



case 0:{


if(stateEntry){
(stateEntry=0);
(Strombegrenzung.Freigabe=0);
(Tarifabschaltung.Freigabe=0);
}



__AS__Action__actionStillstand();





if((gCmdAnlage.Start&gCmdAnlage.Auto)){
(nextModus=1);
(stateEntry=1);

}else if((((signed long)Nutzungsdaten.Allgemein.LetzterModus==(signed long)1))){
(nextModus=1);
(stateEntry=1);

}else if((gCmdAnlage.Test&(gCmdAnlage.Auto^1))){
(nextModus=2);
(stateEntry=1);
}else{
(nextModus=CheckRange(gAktModus,0,2));
}



}break;case 1:{


if(stateEntry){
(stateEntry=0);
(hmiNutzungsdaten.Allgemein.LetzterModus=1);
}



__AS__Action__actionBetrieb();


(Strombegrenzung.Freigabe=1);
(Strombegrenzung.AktZeit=Echtzeit.StdMin);


(Tarifabschaltung.Freigabe=1);
(Tarifabschaltung.AktZeit=Echtzeit.StdMin);





if(gCmdAnlage.Stop){
(hmiNutzungsdaten.Allgemein.LetzterModus=0);
(nextModus=0);
(stateEntry=1);
}else{
(nextModus=CheckRange(gAktModus,0,2));
}



}break;case 2:{


if(stateEntry){
(stateEntry=0);
}



(gStatusAnlage.Aktor[CheckBounds(0,0,39)]=2);





if((gCmdAnlage.Test^1)){
(nextModus=0);
(stateEntry=1);
}else{
(nextModus=CheckRange(gAktModus,0,2));
}


}break;}





fbBoxenKonfig(&Boxen);
fbBoxenAbluftkl(&Aktoren.Abluftklappe);
fbBoxenAbluftvent(&Aktoren.Abluftventilator);
fbBoxenKlappenanst(&Aktoren.Brandschutzklappe);
fbBoxenHeizreg(&Aktoren.Heizregister);
fbEntfFremd(&Aktoren.EntfeuchterFremd);
fbEntfKompressor(&Aktoren.KompressorModul1);
fbEntfKompressor(&Aktoren.KompressorModul2);
fbBoxenNotstrom(&Aktoren.Notstromaggregat);
fbEntfOelsumpfheiz(&Aktoren.OelsumpfheizungModul1);
fbEntfOelsumpfheiz(&Aktoren.OelsumpfheizungModul2);
fbBoxenSHO(&Aktoren.Scheitholzofen);
fbBoxenVentKlappen(&Aktoren.VentUndKlappen);
fbBoxenWLO(&Aktoren.Warmluftofen);

fbCControlWitterung(&fbSchlechtwetterBox1);
fbCControlWitterung(&fbSchlechtwetterBox2);
fbCControlWitterung(&fbSchlechtwetterBox3);
fbCControlWitterung(&fbSchlechtwetterBox4);
fbCControlWitterung(&fbSchlechtwetterBox5);
fbCControlWitterung(&fbSchlechtwetterBox6);


(fbEntfUmschaltung_0.Freigabe=(Betriebsparameter.Ausstattung.Umschaltklappe1|Betriebsparameter.Ausstattung.Umschaltklappe2));
(fbEntfUmschaltung_0.AbluftTemp=gStatusAnlage.AbluftTemperatur);
(fbEntfUmschaltung_0.DachluftTemp=gStatusAnlage.DachluftTemperatur);
(fbEntfUmschaltung_0.FrischluftTemp=gStatusAnlage.FrischluftTemperatur);
(fbEntfUmschaltung_0.FrischlDachlTempUmschaltung=Betriebsparameter.Umschaltklappen.TemperaturUmschaltung);
(fbEntfUmschaltung_0.DifferenzTempUmschaltung=Betriebsparameter.Umschaltklappen.TempDifferenzUmschaltung);
(fbEntfUmschaltung_0.Hysterese=Betriebsparameter.Umschaltklappen.Hysterese);
(fbEntfUmschaltung_0.SensorAbluftVhd=Betriebsparameter.Ausstattung.SensorAbluft);
(fbEntfUmschaltung_0.SensorDachluftVhd=Betriebsparameter.Ausstattung.SensorDachluft);
(fbEntfUmschaltung_0.SensorFrischluftVhd=Betriebsparameter.Ausstattung.SensorFrischluft);
(fbEntfUmschaltung_0.StatusSensorAbluftOk=(alarmFehler[CheckBounds(23,0,49)]^1));
(fbEntfUmschaltung_0.StatusSensorDachluftOk=(alarmFehler[CheckBounds(21,0,49)]^1));
(fbEntfUmschaltung_0.StatusSensorFrischluftOk=(alarmFehler[CheckBounds(20,0,49)]^1));
(fbEntfUmschaltung_0.Umschaltverz=Betriebsparameter.Umschaltklappen.Umschaltverzoegerung);
fbBoxenUmschaltung(&fbEntfUmschaltung_0);


(Tarifabschaltung.StartMin1=Betriebsparameter.Tarifabschaltung.Zeitfenster.StartMin);
(Tarifabschaltung.StartStd1=Betriebsparameter.Tarifabschaltung.Zeitfenster.StartStd);
(Tarifabschaltung.StoppMin1=Betriebsparameter.Tarifabschaltung.Zeitfenster.StoppMin);
(Tarifabschaltung.StoppStd1=Betriebsparameter.Tarifabschaltung.Zeitfenster.StoppStd);
(Tarifabschaltung.VorlaufzeitLuftaufbMin=Betriebsparameter.Tarifabschaltung.VorlaufzeitAbschaltungLuftaufb);
fbTrockTarifabsch(&Tarifabschaltung);



(loc_StrombegrStart1=((Betriebsparameter.Strombegrenzung.Zeitfenster.StartStd*100)+Betriebsparameter.Strombegrenzung.Zeitfenster.StartMin));
(loc_StrombegrStopp1=((Betriebsparameter.Strombegrenzung.Zeitfenster.StoppStd*100)+Betriebsparameter.Strombegrenzung.Zeitfenster.StoppMin));
(Strombegrenzung.StartZeit1=loc_StrombegrStart1);
(Strombegrenzung.StoppZeit1=loc_StrombegrStopp1);
fbTrockStrombegr(&Strombegrenzung);


}}
#line 190 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/actionUpdateStatus.st"
static void __AS__Action__actionUpdateStatus(void){
{

(gStatusAnlage.FrischluftTemperatur=aiFrischluftTemperatur);
(gStatusAnlage.FrischluftFeuchte=aiFrischluftFeuchte);
(gStatusAnlage.TrockenluftTemperatur=aiTrockenluftTemperatur);
(gStatusAnlage.TrockenluftFeuchte=aiTrockenluftFeuchte);
(gStatusAnlage.AbluftFeuchte=aiAbluftFeuchte);
(gStatusAnlage.AbluftTemperatur=aiAbluftTemperatur);
(gStatusAnlage.AustrittFeuchte=aiAustrittFeuchte);
(gStatusAnlage.AustrittTemperatur=aiAustrittTemperatur);
(gStatusAnlage.DachluftFeuchte=aiDachluftFeuchte);
(gStatusAnlage.DachluftTemperatur=aiDachluftTemperatur);
(gStatusAnlage.EintrittFeuchte=aiEintrittFeuchte);
(gStatusAnlage.EintrittTemperatur=aiEintrittTemperatur);
(gStatusAnlage.HochdruckModul1=aiHochdruckModul1);
(gStatusAnlage.HochdruckModul2=aiHochdruckModul2);
(gStatusAnlage.NiederdruckModul1=aiNiederdruckModul1);
(gStatusAnlage.NiederdruckModul2=aiNiederdruckModul2);
(gStatusAnlage.Luftgeschwindigkeit=aiLuftgeschwindigkeit);
(gStatusAnlage.Kanaldruck=aiDifferenzdruck);



(gStatusAnlage.DrehzahlKompressorModul1=aoDrehzahlvorgKompressorModul1);
(gStatusAnlage.DrehzahlKompressorModul2=aoDrehzahlvorgKompressorModul2);
(gStatusAnlage.DrehzahlVentilator1=aoDrehzahlvorgVentilator1);
(gStatusAnlage.DrehzahlVentilator2=aoDrehzahlvorgVentilator2);


if(Betriebsparameter.Ausstattung.Entfeuchter){
(gStatusAnlage.LuftmengeAktuell=((aiLuftgeschwindigkeit*Betriebsparameter.Entfeuchter.Registerflaeche[CheckBounds(Betriebsparameter.Entfeuchter.IndexType,0,14)])*3600));
}else{
(gStatusAnlage.LuftmengeAktuell=((aiLuftgeschwindigkeit*Betriebsparameter.Allgemein.AnsaugflaecheVent)*3600));
}


if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)4))&(((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)5)))){

(gStatusAnlage.FrischluftbetriebAktiv=((fbEntfUmschaltung_0.FrischluftbetriebOut&Betriebsparameter.Umschaltklappen.Automatik)|Betriebsparameter.Umschaltklappen.Frischluft));

(gStatusAnlage.UmluftbetriebAktiv=((fbEntfUmschaltung_0.UmluftbetriebOut&Betriebsparameter.Umschaltklappen.Automatik)|Betriebsparameter.Umschaltklappen.Umluft));
}else{

(gStatusAnlage.FrischluftbetriebAktiv=((Betriebsparameter.Umschaltklappen.Automatik&(gStatusAnlage.WetterIstSchlecht^1))|Betriebsparameter.Umschaltklappen.Frischluft));

(gStatusAnlage.UmluftbetriebAktiv=((Betriebsparameter.Umschaltklappen.Automatik&gStatusAnlage.WetterIstSchlecht)|Betriebsparameter.Umschaltklappen.Umluft));
}


}imp3_end1_0:;}
#line 190 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/actionStillstand.st"
static void __AS__Action__actionStillstand(void){
{
(gStatusAnlage.Aktor[CheckBounds(0,0,39)]=1);



(Aktoren.Notstromaggregat.NotstromaggregatAngefordert=((Boxen.NotbetriebVentilator1|Boxen.NotbetriebVentilator2)&Betriebsparameter.Ausstattung.Notstromaggregat));


(Aktoren.OelsumpfheizungModul1.Freigabe=Betriebsparameter.Ausstattung.Entfeuchter);
(Aktoren.OelsumpfheizungModul2.Freigabe=(Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden));


(Aktoren.KompressorModul1.Freigabe=0);
(Aktoren.KompressorModul1.Dauerbetrieb=0);
(Aktoren.KompressorModul1.Automatik=0);
(Aktoren.KompressorModul1.DrehzahlvorgabeFU=gCmdAnlage.Leistung.DrehzahlKompressorModul1);
(Aktoren.KompressorModul2.Freigabe=0);
(Aktoren.KompressorModul2.Dauerbetrieb=0);
(Aktoren.KompressorModul2.Automatik=0);
(Aktoren.KompressorModul2.DrehzahlvorgabeFU=gCmdAnlage.Leistung.DrehzahlKompressorModul2);


(Aktoren.EntfeuchterFremd.Freigabe=0);
(Aktoren.EntfeuchterFremd.Dauerbetrieb=0);
(Aktoren.EntfeuchterFremd.Automatik=0);


if((Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1))){
(Aktoren.VentUndKlappen.AnforderungVentilator1=Boxen.NotbetriebVentilator1);
(Aktoren.VentUndKlappen.DrehzahlVent1Betrieb=gCmdAnlage.Leistung.DrehzahlVentilator1);
}


if((Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1))){
(Aktoren.VentUndKlappen.AnforderungVentilator2=Boxen.NotbetriebVentilator2);
(Aktoren.VentUndKlappen.DrehzahlVent2Betrieb=gCmdAnlage.Leistung.DrehzahlVentilator2);
}


(Aktoren.Warmluftofen.Freigabe=Betriebsparameter.Ausstattung.Warmluftofen);
(Aktoren.Warmluftofen.Automatikbetrieb=0);
(Aktoren.Warmluftofen.Dauerbetrieb=0);


(Aktoren.Heizregister.Freigabe=Betriebsparameter.Ausstattung.Heizregister);
(Aktoren.Heizregister.Automatikbetrieb=0);
(Aktoren.Heizregister.Dauerbetrieb=0);
(Aktoren.Heizregister.DrehzahlHeizregisterSoll=gCmdAnlage.Leistung.DrehzahlHeizregister);


(Aktoren.Abluftklappe.Freigabe=Betriebsparameter.Ausstattung.Abluftklappe);
(Aktoren.Abluftklappe.Automatik=0);
(Aktoren.Abluftklappe.Oeffnen=Betriebsparameter.Abluftklappe.Oeffnen);
(Aktoren.Abluftklappe.Schliessen=Betriebsparameter.Abluftklappe.Schliessen);



(Aktoren.Abluftventilator.Freigabe=(Betriebsparameter.Ausstattung.Abluftventilator&(Aktoren.VentUndKlappen.Ventilator1InBetrieb|Aktoren.VentUndKlappen.Ventilator2InBetrieb)));
(Aktoren.Abluftventilator.Automatik=Betriebsparameter.Abluftventilator.Automatik);
(Aktoren.Abluftventilator.Ein=Betriebsparameter.Abluftventilator.Ein);
(Aktoren.Abluftventilator.DrehzahlSoll=gCmdAnlage.Leistung.DrehzahlAbluftventilator);



(Aktoren.Brandschutzklappe.Oeffnen=(Betriebsparameter.Ausstattung.Brandschutzklappe&(Aktoren.Warmluftofen.WarmluftofenAktiv|Aktoren.Scheitholzofen.ScheitholzofenAktiv)));
(Aktoren.Brandschutzklappe.Schliessen=(Aktoren.Brandschutzklappe.Oeffnen^1));



(Aktoren.VentUndKlappen.BypassklappeOeffnen=(Betriebsparameter.Ausstattung.Bypassklappe&(Betriebsparameter.Bypassklappe.Automatik|Betriebsparameter.Bypassklappe.Oeffnen)));
(Aktoren.VentUndKlappen.BypassklappeSchliessen=(Betriebsparameter.Ausstattung.Bypassklappe&Betriebsparameter.Bypassklappe.Schliessen));


if((Betriebsparameter.Ausstattung.Umschaltklappe1|Betriebsparameter.Ausstattung.Umschaltklappe2)){

if(Betriebsparameter.Umschaltklappen.Automatik){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=(Betriebsparameter.Ausstattung.Umschaltklappe1&Betriebsparameter.Ausstattung.StellungUmluftklappe1Stillstand));
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=(Betriebsparameter.Ausstattung.Umschaltklappe2&Betriebsparameter.Ausstattung.StellungUmluftklappe2Stillstand));
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=(Betriebsparameter.Ausstattung.Umschaltklappe1&(Betriebsparameter.Ausstattung.StellungUmluftklappe1Stillstand^1)));
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=(Betriebsparameter.Ausstattung.Umschaltklappe2&(Betriebsparameter.Ausstattung.StellungUmluftklappe2Stillstand^1)));
}else if(Betriebsparameter.Umschaltklappen.Frischluft){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe2);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=0);
}else if(Betriebsparameter.Umschaltklappen.Umluft){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe2);
}
}else{
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=0);
}

}imp2_end2_0:;}
#line 190 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"
#line 2 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/actionBetrieb.st"
static void __AS__Action__actionBetrieb(void){
{
(gStatusAnlage.Aktor[CheckBounds(0,0,39)]=18);





(Aktoren.Notstromaggregat.NotstromaggregatAngefordert=((Boxen.Box1Out.BoxAktiv|Boxen.Box2Out.BoxAktiv|Boxen.Box3Out.BoxAktiv|Boxen.Box4Out.BoxAktiv|Boxen.Box5Out.BoxAktiv|Boxen.Box6Out.BoxAktiv|Boxen.NotbetriebBox1|Boxen.NotbetriebBox2|Boxen.NotbetriebBox3|Boxen.NotbetriebBox4|Boxen.NotbetriebBox5|Boxen.NotbetriebBox6|Boxen.NotbetriebVentilator1|Boxen.NotbetriebVentilator2)&Betriebsparameter.Ausstattung.Notstromaggregat));


(Aktoren.OelsumpfheizungModul1.Freigabe=(Betriebsparameter.Ausstattung.Entfeuchter&(Aktoren.KompressorModul1.FreigabeKompressorOut^1)));
(Aktoren.OelsumpfheizungModul2.Freigabe=(Betriebsparameter.Ausstattung.Entfeuchter&(Aktoren.KompressorModul2.FreigabeKompressorOut^1)));



if(((gMindestlaufzOelsumpfOk|((((signed long)hmiStatus.CurUserLevel>(signed long)2))&(((unsigned long)Nutzungsdaten.BstGes.Kompressor1Std<(unsigned long)(unsigned char)CONST_ZEIT_TESTPHASE))))&(Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1)))){






(Aktoren.KompressorModul1.Freigabe=(Betriebsparameter.Ausstattung.Entfeuchter&(Boxen.FreigabeLuftentfeuchter|Boxen.FreigabeEntfeuchterInselbetrieb)&((Boxen.EntfeuchterVonVent1Abhaengig&Boxen.FreigabeVentilator1&(Aktoren.VentUndKlappen.FehlerFuVentilator1^1))|(Boxen.EntfeuchterVonVent2Abhaengig&Boxen.FreigabeVentilator2&(Aktoren.VentUndKlappen.FehlerFuVentilator2^1))|(Boxen.FreigabeEntfeuchterInselbetrieb&Aktoren.VentUndKlappen.Ventilator1InBetrieb))&(gCmdAnlage.FehlerModul1^1)&(gStatusAnlage.UmluftbetriebAktiv|(Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb^1))&(Tarifabschaltung.TarifabschaltungLuftaufbEin^1)));
(Aktoren.KompressorModul1.Dauerbetrieb=(Betriebsparameter.Entfeuchter.Dauerbetrieb|Boxen.FreigabeEntfeuchterInselbetrieb));
(Aktoren.KompressorModul1.Automatik=(Betriebsparameter.Entfeuchter.Automatikbetrieb&(Boxen.FreigabeEntfeuchterInselbetrieb^1)));
(Aktoren.KompressorModul1.DrehzahlvorgabeFU=gCmdAnlage.Leistung.DrehzahlKompressorModul1);






(Aktoren.KompressorModul2.Freigabe=((Betriebsparameter.Ausstattung.Entfeuchter&gModul2Vorhanden)&(Boxen.FreigabeLuftentfeuchter|Boxen.FreigabeEntfeuchterInselbetrieb)&((Boxen.EntfeuchterVonVent1Abhaengig&Boxen.FreigabeVentilator1&(Aktoren.VentUndKlappen.FehlerFuVentilator1^1))|(Boxen.EntfeuchterVonVent2Abhaengig&Boxen.FreigabeVentilator2&(Aktoren.VentUndKlappen.FehlerFuVentilator2^1))|(Boxen.FreigabeEntfeuchterInselbetrieb&Aktoren.VentUndKlappen.Ventilator1InBetrieb))&(gCmdAnlage.FehlerModul2^1)&(gStatusAnlage.UmluftbetriebAktiv|(Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb^1))&(Tarifabschaltung.TarifabschaltungLuftaufbEin^1)));
(Aktoren.KompressorModul2.Dauerbetrieb=(Betriebsparameter.Entfeuchter.Dauerbetrieb|Boxen.FreigabeEntfeuchterInselbetrieb));
(Aktoren.KompressorModul2.Automatik=(Betriebsparameter.Entfeuchter.Automatikbetrieb&(Boxen.FreigabeEntfeuchterInselbetrieb^1)));
(Aktoren.KompressorModul2.DrehzahlvorgabeFU=gCmdAnlage.Leistung.DrehzahlKompressorModul2);
}



if((Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1))){





(Aktoren.EntfeuchterFremd.Freigabe=((Boxen.FreigabeLuftentfeuchter|Boxen.FreigabeEntfeuchterInselbetrieb)&((Boxen.EntfeuchterVonVent1Abhaengig&Boxen.FreigabeVentilator1&(Aktoren.VentUndKlappen.FehlerFuVentilator1^1))|(Boxen.EntfeuchterVonVent2Abhaengig&Boxen.FreigabeVentilator2&(Aktoren.VentUndKlappen.FehlerFuVentilator2^1))|(Boxen.FreigabeEntfeuchterInselbetrieb&Aktoren.VentUndKlappen.Ventilator1InBetrieb))&(gCmdAnlage.FehlerModul1^1)&(gStatusAnlage.UmluftbetriebAktiv|(Betriebsparameter.Ausstattung.EntfeuchterNurImUmluftbetrieb^1))&(Tarifabschaltung.TarifabschaltungLuftaufbEin^1)));
(Aktoren.EntfeuchterFremd.Dauerbetrieb=(Betriebsparameter.Entfeuchter.Dauerbetrieb|Boxen.FreigabeEntfeuchterInselbetrieb));
(Aktoren.EntfeuchterFremd.Automatik=(Betriebsparameter.Entfeuchter.Automatikbetrieb&(Boxen.FreigabeEntfeuchterInselbetrieb^1)));
}else{
(Aktoren.EntfeuchterFremd.Freigabe=0);
(Aktoren.EntfeuchterFremd.Dauerbetrieb=0);
(Aktoren.EntfeuchterFremd.Automatik=0);
}



if((Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1))){

(Aktoren.VentUndKlappen.AnforderungVentilator1=((Boxen.FreigabeVentilator1|Boxen.NotbetriebVentilator1)&((Tarifabschaltung.TarifabschaltungEin&(Boxen.NotbetriebVentilator1^1))^1)));
(Aktoren.VentUndKlappen.DrehzahlVent1Betrieb=gCmdAnlage.Leistung.DrehzahlVentilator1);
}else{
(Aktoren.VentUndKlappen.AnforderungVentilator1=0);
}


if((Aktoren.Notstromaggregat.NotstromBereitOut|(Betriebsparameter.Ausstattung.Notstromaggregat^1))){

(Aktoren.VentUndKlappen.AnforderungVentilator2=((Boxen.FreigabeVentilator2|Boxen.NotbetriebVentilator2)&((Tarifabschaltung.TarifabschaltungEin&(Boxen.NotbetriebVentilator2^1))^1)));
(Aktoren.VentUndKlappen.DrehzahlVent2Betrieb=gCmdAnlage.Leistung.DrehzahlVentilator2);
}else{
(Aktoren.VentUndKlappen.AnforderungVentilator2=0);
}





(Aktoren.Warmluftofen.Freigabe=(Betriebsparameter.Ausstattung.Warmluftofen&Boxen.FreigabeWarmluftofen&((Boxen.WarmluftofenVonVent1Abhaengig&Aktoren.VentUndKlappen.FreigabeVentilator1Out&(Aktoren.VentUndKlappen.FehlerFuVentilator1^1))|(Boxen.WarmluftofenVonVent2Abhaengig&Aktoren.VentUndKlappen.FreigabeVentilator2Out&(Aktoren.VentUndKlappen.FehlerFuVentilator2^1)))&(Tarifabschaltung.TarifabschaltungLuftaufbEin^1)));
(Aktoren.Warmluftofen.Automatikbetrieb=Betriebsparameter.Warmluftofen.AutomatikbetriebEin);
(Aktoren.Warmluftofen.Dauerbetrieb=Betriebsparameter.Warmluftofen.DauerbetriebEin);





(Aktoren.Heizregister.Freigabe=(Betriebsparameter.Ausstattung.Heizregister&Boxen.FreigabeHeizregister&((Boxen.HeizregisterVonVent1Abhaengig&Aktoren.VentUndKlappen.FreigabeVentilator1Out&(Aktoren.VentUndKlappen.FehlerFuVentilator1^1))|(Boxen.HeizregisterVonVent2Abhaengig&Aktoren.VentUndKlappen.FreigabeVentilator2Out&(Aktoren.VentUndKlappen.FehlerFuVentilator2^1)))&(Tarifabschaltung.TarifabschaltungLuftaufbEin^1)));
(Aktoren.Heizregister.Automatikbetrieb=Betriebsparameter.Heizregister.AutomatikbetriebEin);
(Aktoren.Heizregister.Dauerbetrieb=Betriebsparameter.Heizregister.DauerbetriebEin);
(Aktoren.Heizregister.DrehzahlHeizregisterSoll=gCmdAnlage.Leistung.DrehzahlHeizregister);


(Aktoren.Abluftklappe.Freigabe=Betriebsparameter.Ausstattung.Abluftklappe);

(Aktoren.Abluftklappe.Automatik=(Betriebsparameter.Abluftklappe.Automatik&((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen)^1)));

(Aktoren.Abluftklappe.Oeffnen=(Betriebsparameter.Abluftklappe.Oeffnen|(gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen&(Betriebsparameter.Abluftklappe.Schliessen^1))));
(Aktoren.Abluftklappe.Schliessen=Betriebsparameter.Abluftklappe.Schliessen);


(Aktoren.Abluftventilator.Freigabe=Betriebsparameter.Ausstattung.Abluftventilator);


(Aktoren.Abluftventilator.Automatik=(Betriebsparameter.Abluftventilator.Automatik&(Boxen.Box1Out.BoxAktiv|Boxen.Box2Out.BoxAktiv|Boxen.Box3Out.BoxAktiv|Boxen.Box4Out.BoxAktiv|Boxen.Box5Out.BoxAktiv|Boxen.Box6Out.BoxAktiv)&((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen)^1)));


(Aktoren.Abluftventilator.Ein=(Betriebsparameter.Abluftventilator.Ein|(gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ausstattung.AbluftklImFrischlbetrImmerOffen&(Boxen.Box1Out.BoxAktiv|Boxen.Box2Out.BoxAktiv|Boxen.Box3Out.BoxAktiv|Boxen.Box4Out.BoxAktiv|Boxen.Box5Out.BoxAktiv|Boxen.Box6Out.BoxAktiv))));
(Aktoren.Abluftventilator.DrehzahlSoll=gCmdAnlage.Leistung.DrehzahlAbluftventilator);



(Aktoren.Brandschutzklappe.Oeffnen=(Betriebsparameter.Ausstattung.Brandschutzklappe&(Aktoren.Warmluftofen.WarmluftofenAktiv|Aktoren.Scheitholzofen.ScheitholzofenAktiv)));
(Aktoren.Brandschutzklappe.Schliessen=(Aktoren.Brandschutzklappe.Oeffnen^1));



if((Betriebsparameter.Bypassklappe.Automatik&Betriebsparameter.Ausstattung.Bypassklappe&(Betriebsparameter.Ausstattung.EntfeuchterFremd^1))){
if(((Aktoren.KompressorModul1.Freigabe^1)&(Aktoren.KompressorModul2.Freigabe^1))){
(Aktoren.VentUndKlappen.BypassklappeOeffnen=1);
(Aktoren.VentUndKlappen.BypassklappeSchliessen=0);
}else{
(Aktoren.VentUndKlappen.BypassklappeOeffnen=((Aktoren.KompressorModul1.loc_StatusFeuchteOk^1)&(Aktoren.KompressorModul2.loc_StatusFeuchteOk^1)));
(Aktoren.VentUndKlappen.BypassklappeSchliessen=(Aktoren.KompressorModul1.loc_StatusFeuchteOk|Aktoren.KompressorModul2.loc_StatusFeuchteOk));
}

}else if((Betriebsparameter.Bypassklappe.Automatik&Betriebsparameter.Ausstattung.Bypassklappe)){
if((Aktoren.EntfeuchterFremd.Freigabe^1)){
(Aktoren.VentUndKlappen.BypassklappeOeffnen=1);
(Aktoren.VentUndKlappen.BypassklappeSchliessen=0);
}else{
(Aktoren.VentUndKlappen.BypassklappeOeffnen=(Aktoren.EntfeuchterFremd.WitterungIstSchlecht^1));
(Aktoren.VentUndKlappen.BypassklappeSchliessen=Aktoren.EntfeuchterFremd.WitterungIstSchlecht);
}
}else{
(Aktoren.VentUndKlappen.BypassklappeOeffnen=(Betriebsparameter.Ausstattung.Bypassklappe&Betriebsparameter.Bypassklappe.Oeffnen));
(Aktoren.VentUndKlappen.BypassklappeSchliessen=(Betriebsparameter.Ausstattung.Bypassklappe&Betriebsparameter.Bypassklappe.Schliessen));
}








if((Betriebsparameter.Ausstattung.Umschaltklappe1|Betriebsparameter.Ausstattung.Umschaltklappe2)){

if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)4))|(((unsigned long)(unsigned char)hmiStatus.NameSteuerung==(unsigned long)(unsigned char)5)))){
if((Betriebsparameter.Umschaltklappen.Frischluft|(Betriebsparameter.Umschaltklappen.Automatik&(gStatusAnlage.WetterIstSchlecht^1)))){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe2);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=0);
}else if((Betriebsparameter.Umschaltklappen.Umluft|(Betriebsparameter.Umschaltklappen.Automatik&gStatusAnlage.WetterIstSchlecht))){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe2);
}
}else if((Betriebsparameter.Umschaltklappen.Frischluft|(Betriebsparameter.Umschaltklappen.Automatik&gStatusAnlage.FrischluftbetriebAktiv))){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=Betriebsparameter.Ausstattung.Umschaltklappe2);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=0);
}else if((Betriebsparameter.Umschaltklappen.Umluft|(Betriebsparameter.Umschaltklappen.Automatik&gStatusAnlage.UmluftbetriebAktiv))){
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe1);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=Betriebsparameter.Ausstattung.Umschaltklappe2);
}
}else{
(Aktoren.VentUndKlappen.Umschaltkl1Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Schliessen=0);
(Aktoren.VentUndKlappen.Umschaltkl1Oeffnen=0);
(Aktoren.VentUndKlappen.Umschaltkl2Oeffnen=0);
}


}imp1_end7_0:;}
#line 190 "C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.nodebug"

void __AS__ImplInitAblaufstrg_st(void){__BUR__ENTRY_INIT_FUNCT__();}

__asm__(".section \".plc\"");
__asm__(".ascii \"iecfile \\\"Logical/Parameter.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Enumeration.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFileAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeAlarm.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipeError.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/LaEntfV2.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/LascoBoxen.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/IecCheck/IecCheck.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpFile/MpFile.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpRecipe/MpRecipe.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/Library/CSV/CSV.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Berechnung/Berechnungen.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Alarmsystem/Alarmsys.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Regelung/RegelungIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/CSV/CSV_Global.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/3_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/operator/operator.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/runtime/runtime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/astime/astime.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsIecCon/AsIecCon.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/standard/standard.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/sys_lib/sys_lib.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsBrStr/AsBrStr.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoMath/LascoMath.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoReg/LascoReg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoTrock/LascoTrock.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoUtil/LascoUtil.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LaEntfV2/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LascoBoxen/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/LoopConR/LoopConR.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/brsystem/brsystem.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/asstring/asstring.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/FileIO/FileIO.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/DataObj/DataObj.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsARCfg/AsARCfg.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/visapi/Visapi.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsUSB/AsUSB.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/dvframe/dvframe.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/AsTCP/AsTCP.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Ablaufstrg/Ablaufstrg.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/Ablaufstrg/Ablaufstrg.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Ablaufsteuerung/Ablaufstrg/Ablaufstrg.st\\\"\\n\"");
__asm__(".previous");
