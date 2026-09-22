#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/aktorenMap/Mainst.h"
#line 1 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.nodebug"
#line 2 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{


}}
#line 5 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.nodebug"
#line 8 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{



(fbLascoZdxx_0.IN=Echtzeit.Sekunde);;fbLascoZdxx(&fbLascoZdxx_0);
(sekTick=fbLascoZdxx_0.Q);



(gModul2Vorhanden=((((unsigned long)(unsigned char)Betriebsparameter.Entfeuchter.IndexType==(unsigned long)(unsigned char)7))|(((unsigned long)(unsigned char)Betriebsparameter.Entfeuchter.IndexType==(unsigned long)(unsigned char)8))|(((unsigned long)(unsigned char)Betriebsparameter.Entfeuchter.IndexType==(unsigned long)(unsigned char)9))|(((unsigned long)(unsigned char)Betriebsparameter.Entfeuchter.IndexType==(unsigned long)(unsigned char)10))));






(Aktoren.OelsumpfheizungModul1.EintrittTemp=aiEintrittTemperatur);
(Aktoren.OelsumpfheizungModul1.StatusSensorEintrittOk=(alarmFehler[CheckBounds(24,0,49)]^1));


(Aktoren.OelsumpfheizungModul1.parTempOelsumpfheizungEin=(0.00000000000000000000E+00));
(Aktoren.OelsumpfheizungModul1.parTempOelsumpfheizungAus=(0.00000000000000000000E+00));


(doOelsumpfheizungEinModul1=Aktoren.OelsumpfheizungModul1.OelsumpfheizungEin);


if(doOelsumpfheizungEinModul1){
(gStatusAnlage.Aktor[CheckBounds(1,0,39)]=10);
}else{
(gStatusAnlage.Aktor[CheckBounds(1,0,39)]=11);
}





(Aktoren.OelsumpfheizungModul2.EintrittTemp=aiEintrittTemperatur);
(Aktoren.OelsumpfheizungModul2.StatusSensorEintrittOk=(alarmFehler[CheckBounds(24,0,49)]^1));


(Aktoren.OelsumpfheizungModul2.parTempOelsumpfheizungEin=(0.00000000000000000000E+00));
(Aktoren.OelsumpfheizungModul2.parTempOelsumpfheizungAus=(0.00000000000000000000E+00));


(doOelsumpfheizungEinModul2=Aktoren.OelsumpfheizungModul2.OelsumpfheizungEin);



if(doOelsumpfheizungEinModul2){
(gStatusAnlage.Aktor[CheckBounds(2,0,39)]=10);
}else{
(gStatusAnlage.Aktor[CheckBounds(2,0,39)]=11);
}





(Aktoren.KompressorModul1.EintrittFeuchte=aiEintrittFeuchte);
(Aktoren.KompressorModul1.Niederdruck=aiNiederdruckModul1);
(Aktoren.KompressorModul1.Hochdruck=aiHochdruckModul1);

(Aktoren.KompressorModul1.KlappenumschaltungAkiv=(Aktoren.VentUndKlappen.UmschaltungAktiv|Strombegrenzung.StrombegrenzungEin|(diDrehzahlbegrVentilator1&Boxen.EntfeuchterVonVent1Abhaengig)|(diDrehzahlbegrVentilator2&Boxen.EntfeuchterVonVent2Abhaengig)));

(Aktoren.KompressorModul1.BetriebsmldgVentilator=((doVentilator1Ein&Boxen.EntfeuchterVonVent1Abhaengig)|(doVentilator2Ein&Boxen.EntfeuchterVonVent2Abhaengig)|(diVentilator1InBetrieb&Boxen.EntfeuchterInselbetrieb)));
(Aktoren.KompressorModul1.BetriebsmldgKompressor=diBetriebsmldgKompressorModul1);
(Aktoren.KompressorModul1.StatusSensorEintrittOk=(alarmFehler[CheckBounds(24,0,49)]^1));
(Aktoren.KompressorModul1.StatusSensorNiederdruckOk=(alarmFehler[CheckBounds(28,0,49)]^1));
(Aktoren.KompressorModul1.diHochdruckOk=diHochdruckOkModul1);
(Aktoren.KompressorModul1.diNiederdruckOk=diNiederdruckOkModul1);

(Aktoren.KompressorModul1.SicherheitOk=((alarmFehler[CheckBounds(8,0,49)]^1)&(alarmFehler[CheckBounds(10,0,49)]^1)&(alarmFehler[CheckBounds(16,0,49)]^1)&(alarmFehler[CheckBounds(12,0,49)]^1)&(alarmFehler[CheckBounds(42,0,49)]^1)&(alarmFehler[CheckBounds(43,0,49)]^1)));


(Aktoren.KompressorModul1.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.KompressorModul1.parEinschaltverzAbtau=Betriebsparameter.Entfeuchter.EinschaltverzAbtau);
(Aktoren.KompressorModul1.parAusschaltverzAbtau=Betriebsparameter.Entfeuchter.AusschaltverzAbtau);
(Aktoren.KompressorModul1.parEinschaltverzKompressor=Betriebsparameter.Entfeuchter.EinschaltverzKompressor);
(Aktoren.KompressorModul1.parEinschaltverzMagnetventil=Betriebsparameter.Kompressor1.EinschaltverzMagnetventil);
(Aktoren.KompressorModul1.parFeuchteEin=Betriebsparameter.Entfeuchter.EintrittFeuchteEin);
(Aktoren.KompressorModul1.parFeuchteAus=Betriebsparameter.Entfeuchter.EintrittFeuchteAus);
(Aktoren.KompressorModul1.parNiederdruckMin=Betriebsparameter.Kompressor1.NiederdruckMin);
(Aktoren.KompressorModul1.parNiederdruckMax=Betriebsparameter.Kompressor1.NiederdruckMax);
(Aktoren.KompressorModul1.parNiederdruckPumpdown=Betriebsparameter.Kompressor1.NiederdruckPumpDown);
(Aktoren.KompressorModul1.parHochdruckMax=Betriebsparameter.Kompressor1.HochdruckMax);
(Aktoren.KompressorModul1.parVerzStandbyBeiKlappenumsch=Betriebsparameter.Entfeuchter.VerzStandbyHochdruckMax);
(Aktoren.KompressorModul1.DrehzahlMin=Betriebsparameter.Kompressor1.DrehzahlMin);
(Aktoren.KompressorModul1.DrehzahlMax=Betriebsparameter.Kompressor1.DrehzahlMax);
(Aktoren.KompressorModul1.RampeUp=Betriebsparameter.Kompressor1.RampeUp);
(Aktoren.KompressorModul1.RampeDown=Betriebsparameter.Kompressor1.RampeDown);


(doKompressorEinModul1=(Aktoren.KompressorModul1.FreigabeKompressorOut&diHochdruckOkModul1&diNiederdruckOkModul1));
(aoDrehzahlvorgKompressorModul1=Aktoren.KompressorModul1.DrehzahlOut);
(doMagnetventilEinModul1=Aktoren.KompressorModul1.MagnetventilOut);


if(doKompressorEinModul1){
(gStatusAnlage.Aktor[CheckBounds(3,0,39)]=10);
}else if(Aktoren.KompressorModul1.StoerungOut){
(gStatusAnlage.Aktor[CheckBounds(3,0,39)]=9);
}else if(((Aktoren.KompressorModul1.Automatik|Aktoren.KompressorModul1.Dauerbetrieb)&Boxen.FreigabeLuftentfeuchter&(doKompressorEinModul1^1))){
(gStatusAnlage.Aktor[CheckBounds(3,0,39)]=20);
}else if(Aktoren.KompressorModul1.AbtauungAktiv){
(gStatusAnlage.Aktor[CheckBounds(3,0,39)]=17);
}else{
(gStatusAnlage.Aktor[CheckBounds(3,0,39)]=11);
}


if(doMagnetventilEinModul1){
(gStatusAnlage.Aktor[CheckBounds(10,0,39)]=10);
}else{
(gStatusAnlage.Aktor[CheckBounds(10,0,39)]=11);
}





(Aktoren.KompressorModul2.EintrittFeuchte=aiEintrittFeuchte);
(Aktoren.KompressorModul2.Niederdruck=aiNiederdruckModul2);
(Aktoren.KompressorModul2.Hochdruck=aiHochdruckModul2);

(Aktoren.KompressorModul2.KlappenumschaltungAkiv=(Aktoren.VentUndKlappen.UmschaltungAktiv|Strombegrenzung.StrombegrenzungEin|(diDrehzahlbegrVentilator1&Boxen.EntfeuchterVonVent1Abhaengig)|(diDrehzahlbegrVentilator2&Boxen.EntfeuchterVonVent2Abhaengig)));

(Aktoren.KompressorModul2.BetriebsmldgVentilator=((doVentilator1Ein&Boxen.EntfeuchterVonVent1Abhaengig)|(doVentilator2Ein&Boxen.EntfeuchterVonVent2Abhaengig)|(diVentilator1InBetrieb&Boxen.EntfeuchterInselbetrieb)));
(Aktoren.KompressorModul2.BetriebsmldgKompressor=diBetriebsmldgKompressorModul2);
(Aktoren.KompressorModul2.StatusSensorEintrittOk=(alarmFehler[CheckBounds(24,0,49)]^1));
(Aktoren.KompressorModul2.StatusSensorNiederdruckOk=(alarmFehler[CheckBounds(29,0,49)]^1));
(Aktoren.KompressorModul2.diHochdruckOk=diHochdruckOkModul2);
(Aktoren.KompressorModul2.diNiederdruckOk=diNiederdruckOkModul2);

(Aktoren.KompressorModul2.SicherheitOk=((alarmFehler[CheckBounds(9,0,49)]^1)&(alarmFehler[CheckBounds(11,0,49)]^1)&(alarmFehler[CheckBounds(17,0,49)]^1)&(alarmFehler[CheckBounds(13,0,49)]^1)&(alarmFehler[CheckBounds(42,0,49)]^1)&(alarmFehler[CheckBounds(43,0,49)]^1)));


(Aktoren.KompressorModul2.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.KompressorModul2.parEinschaltverzAbtau=Betriebsparameter.Entfeuchter.EinschaltverzAbtau);
(Aktoren.KompressorModul2.parAusschaltverzAbtau=Betriebsparameter.Entfeuchter.AusschaltverzAbtau);
(Aktoren.KompressorModul2.parEinschaltverzKompressor=(Betriebsparameter.Entfeuchter.EinschaltverzKompressor+Betriebsparameter.Entfeuchter.AnlaufverzModul2));
(Aktoren.KompressorModul2.parEinschaltverzMagnetventil=Betriebsparameter.Kompressor1.EinschaltverzMagnetventil);
(Aktoren.KompressorModul2.parFeuchteEin=Betriebsparameter.Entfeuchter.EintrittFeuchteEin);
(Aktoren.KompressorModul2.parFeuchteAus=Betriebsparameter.Entfeuchter.EintrittFeuchteAus);
(Aktoren.KompressorModul2.parNiederdruckMin=Betriebsparameter.Kompressor1.NiederdruckMin);
(Aktoren.KompressorModul2.parNiederdruckMax=Betriebsparameter.Kompressor1.NiederdruckMax);
(Aktoren.KompressorModul2.parNiederdruckPumpdown=Betriebsparameter.Kompressor1.NiederdruckPumpDown);
(Aktoren.KompressorModul2.parHochdruckMax=Betriebsparameter.Kompressor1.HochdruckMax);
(Aktoren.KompressorModul2.parVerzStandbyBeiKlappenumsch=Betriebsparameter.Entfeuchter.VerzStandbyHochdruckMax);
(Aktoren.KompressorModul2.DrehzahlMin=Betriebsparameter.Kompressor2.DrehzahlMin);
(Aktoren.KompressorModul2.DrehzahlMax=Betriebsparameter.Kompressor2.DrehzahlMax);
(Aktoren.KompressorModul2.RampeUp=Betriebsparameter.Kompressor2.RampeUp);
(Aktoren.KompressorModul2.RampeDown=Betriebsparameter.Kompressor2.RampeDown);


(doKompressorEinModul2=(Aktoren.KompressorModul2.FreigabeKompressorOut&diHochdruckOkModul2&diNiederdruckOkModul2));
(aoDrehzahlvorgKompressorModul2=Aktoren.KompressorModul2.DrehzahlOut);
(doMagnetventilEinModul2=Aktoren.KompressorModul2.MagnetventilOut);


if(doKompressorEinModul2){
(gStatusAnlage.Aktor[CheckBounds(4,0,39)]=10);
}else if(Aktoren.KompressorModul2.StoerungOut){
(gStatusAnlage.Aktor[CheckBounds(4,0,39)]=9);
}else if(((Aktoren.KompressorModul2.Automatik|Aktoren.KompressorModul2.Dauerbetrieb)&Boxen.FreigabeLuftentfeuchter&(doKompressorEinModul2^1))){
(gStatusAnlage.Aktor[CheckBounds(4,0,39)]=20);
}else if(Aktoren.KompressorModul2.AbtauungAktiv){
(gStatusAnlage.Aktor[CheckBounds(4,0,39)]=17);
}else{
(gStatusAnlage.Aktor[CheckBounds(4,0,39)]=11);
}


if(doMagnetventilEinModul2){
(gStatusAnlage.Aktor[CheckBounds(11,0,39)]=10);
}else{
(gStatusAnlage.Aktor[CheckBounds(11,0,39)]=11);
}





(Aktoren.EntfeuchterFremd.BetriebsmldgEntfeuchter=diEntfeuchterFremdInBetrieb);
(Aktoren.EntfeuchterFremd.BetriebsmldgVentilator=diVentilator1InBetrieb);






(Aktoren.EntfeuchterFremd.WitterungIstSchlecht=((fbSchlechtwetterBox1.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Luftentfeuchter&Boxen.Box1Out.BoxAktiv)|(fbSchlechtwetterBox2.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Luftentfeuchter&Boxen.Box2Out.BoxAktiv)|(fbSchlechtwetterBox3.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Luftentfeuchter&Boxen.Box3Out.BoxAktiv)|(fbSchlechtwetterBox4.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Luftentfeuchter&Boxen.Box4Out.BoxAktiv)|(fbSchlechtwetterBox5.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Luftentfeuchter&Boxen.Box5Out.BoxAktiv)|(fbSchlechtwetterBox6.WetterIstSchlecht&Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Luftentfeuchter&Boxen.Box6Out.BoxAktiv)));
(Aktoren.EntfeuchterFremd.StoerungIn=diEntfeuchterFremdStoerung);


(Aktoren.EntfeuchterFremd.parEinschaltverzKompressor=Betriebsparameter.Entfeuchter.EinschaltverzKompressor);
(Aktoren.EntfeuchterFremd.parVerzBetriebEntfeuchter=Betriebsparameter.Entfeuchter.VerzBetriebsmeldung);
(Aktoren.EntfeuchterFremd.parVerzStoerung=(unsigned long)((Betriebsparameter.Allgemein.VerzoegerungFehler*1000)>=0.0?(Betriebsparameter.Allgemein.VerzoegerungFehler*1000)+0.5:(Betriebsparameter.Allgemein.VerzoegerungFehler*1000)-0.5));
(Aktoren.EntfeuchterFremd.QuitFehler=hmiButtons.QuitFehler);


(doEntfFremdFreigabe=Aktoren.EntfeuchterFremd.FreigabeKompressorOut);


if(doEntfFremdFreigabe){
if(diEntfeuchterFremdInBetrieb){
(gStatusAnlage.Aktor[CheckBounds(25,0,39)]=10);
}else{
(gStatusAnlage.Aktor[CheckBounds(25,0,39)]=20);
}
}else if(Aktoren.EntfeuchterFremd.StoerungOut){
(gStatusAnlage.Aktor[CheckBounds(25,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(25,0,39)]=11);
}






(Aktoren.Abluftklappe.AbluftFeuchteIst=aiAbluftFeuchte);
(Aktoren.Abluftklappe.EndlageOffen=diAbluftklappeOffen);
(Aktoren.Abluftklappe.EndlageGeschl=diAbluftklappeGeschl);


(Aktoren.Abluftklappe.AbluftFeuchteSoll=Betriebsparameter.Abluftklappe.AbluftfeuchteMax);
(Aktoren.Abluftklappe.Hysterese=Betriebsparameter.Abluftklappe.Hysterese);
(Aktoren.Abluftklappe.Laufzeit=Betriebsparameter.Abluftklappe.Laufzeit);
(Aktoren.Abluftklappe.Quit=hmiButtons.QuitFehler);


(doAbluftklappeFreigabe=(Aktoren.Abluftklappe.OeffnenOut&(Aktoren.Abluftklappe.SchliessenOut^1)));
(doAbluftklappeOeffnen=Aktoren.Abluftklappe.OeffnenOut);
(doAbluftklappeSchliessen=Aktoren.Abluftklappe.SchliessenOut);


if((doAbluftklappeFreigabe&(diAbluftklappeOffen^1)&(((unsigned long)Betriebsparameter.Abluftklappe.Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=10);
}else if(((doAbluftklappeFreigabe^1)&(diAbluftklappeGeschl^1)&(((unsigned long)Betriebsparameter.Abluftklappe.Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=10);
}else if(Aktoren.Abluftklappe.FehlerLaufzeit){
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=9);
}else if((doAbluftklappeFreigabe&(diAbluftklappeOffen|(((unsigned long)Betriebsparameter.Abluftklappe.Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=12);
}else if(((doAbluftklappeFreigabe^1)&(diAbluftklappeGeschl|(((unsigned long)Betriebsparameter.Abluftklappe.Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=13);
}else{
(gStatusAnlage.Aktor[CheckBounds(18,0,39)]=11);
}





(Aktoren.Abluftventilator.AbluftFeuchteIst=aiAbluftFeuchte);
(Aktoren.Abluftventilator.VentilatorInBetrieb=diAbluftventInBetrieb);
(Aktoren.Abluftventilator.RampeUp=10);
(Aktoren.Abluftventilator.RampeDown=10);


(Aktoren.Abluftventilator.DrehzahlMin=Betriebsparameter.Abluftventilator.DrehzahlMin);
(Aktoren.Abluftventilator.DrehzahlMax=Betriebsparameter.Abluftventilator.DrehzahlMax);
(Aktoren.Abluftventilator.AbluftFeuchteSoll=Betriebsparameter.Abluftventilator.AbluftfeuchteMax);
(Aktoren.Abluftventilator.Hysterese=Betriebsparameter.Abluftventilator.Hysterese);
(Aktoren.Abluftventilator.QuitFehler=hmiButtons.QuitFehler);


(doAbluftventilatorEin=Aktoren.Abluftventilator.FreigabeVentilatorOut);
(aoDrehzahlvorgAbluftventilator=Aktoren.Abluftventilator.DrehzahlVentilatorOut);



if(doAbluftventilatorEin){
(gStatusAnlage.Aktor[CheckBounds(19,0,39)]=10);
}else if(Aktoren.Abluftventilator.FehlerOut){
(gStatusAnlage.Aktor[CheckBounds(19,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(19,0,39)]=11);
}





(Aktoren.VentUndKlappen.Freigabe=1);
(Aktoren.VentUndKlappen.BypassklVonVent1Abhaengig=Boxen.BypassklVonVent1Abhaengig);
(Aktoren.VentUndKlappen.BypassklVonVent2Abhaengig=Boxen.BypassklVonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl1VonVent1Abhaengig=Boxen.Boxenkl1VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl2VonVent1Abhaengig=Boxen.Boxenkl2VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl3VonVent1Abhaengig=Boxen.Boxenkl3VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl4VonVent1Abhaengig=Boxen.Boxenkl4VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl5VonVent1Abhaengig=Boxen.Boxenkl5VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl6VonVent1Abhaengig=Boxen.Boxenkl6VonVent1Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl1VonVent2Abhaengig=Boxen.Boxenkl1VonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl2VonVent2Abhaengig=Boxen.Boxenkl2VonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl3VonVent2Abhaengig=Boxen.Boxenkl3VonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl4VonVent2Abhaengig=Boxen.Boxenkl4VonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl5VonVent2Abhaengig=Boxen.Boxenkl5VonVent2Abhaengig);
(Aktoren.VentUndKlappen.Boxenkl6VonVent2Abhaengig=Boxen.Boxenkl6VonVent2Abhaengig);
(Aktoren.VentUndKlappen.UmluftklVonVent1Abhaengig=Betriebsparameter.Ausstattung.Vent1AusWennUmschUmluftkl);
(Aktoren.VentUndKlappen.UmluftklVonVent2Abhaengig=Betriebsparameter.Ausstattung.Vent2AusWennUmschUmluftkl);
(Aktoren.VentUndKlappen.EndlBoxenklappe1Geschl=diBox1Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe1Offen=diBox1Offen);
(Aktoren.VentUndKlappen.EndlBoxenklappe2Geschl=diBox2Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe2Offen=diBox2Offen);
(Aktoren.VentUndKlappen.EndlBoxenklappe3Geschl=diBox3Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe3Offen=diBox3Offen);
(Aktoren.VentUndKlappen.EndlBoxenklappe4Geschl=diBox4Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe4Offen=diBox4Offen);
(Aktoren.VentUndKlappen.EndlBoxenklappe5Geschl=diBox5Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe5Offen=diBox5Offen);
(Aktoren.VentUndKlappen.EndlBoxenklappe6Geschl=diBox6Geschl);
(Aktoren.VentUndKlappen.EndlBoxenklappe6Offen=diBox6Offen);
(Aktoren.VentUndKlappen.EndlBypassGeschl=diBypassklappeGeschl);
(Aktoren.VentUndKlappen.EndlBypassOffen=diBypassklappeOffen);
(Aktoren.VentUndKlappen.EndlBypassGeschl=diBypassklappeGeschl);
(Aktoren.VentUndKlappen.EndlBypassOffen=diBypassklappeOffen);
(Aktoren.VentUndKlappen.EndlUmschaltkl1Geschl=diUmschaltklappe1Geschl);
(Aktoren.VentUndKlappen.EndlUmschaltkl1Offen=diUmschaltklappe1Offen);
(Aktoren.VentUndKlappen.EndlUmschaltkl2Geschl=diUmschaltklappe2Geschl);
(Aktoren.VentUndKlappen.EndlUmschaltkl2Offen=diUmschaltklappe2Offen);

(Aktoren.VentUndKlappen.LuftaufbereitungInBetrieb=(doKompressorEinModul1|doKompressorEinModul2|Aktoren.Warmluftofen.WarmluftofenAktiv|Aktoren.Scheitholzofen.ScheitholzofenAktiv|doHeizregisterEin));
(Aktoren.VentUndKlappen.Ventilator1InBetrieb=diVentilator1InBetrieb);
(Aktoren.VentUndKlappen.Ventilator2InBetrieb=diVentilator2InBetrieb);



(Aktoren.VentUndKlappen.Boxenklappe1Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1!=(signed long)0))));



(Aktoren.VentUndKlappen.Boxenklappe2Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2!=(signed long)0))));



(Aktoren.VentUndKlappen.Boxenklappe3Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3!=(signed long)0))));



(Aktoren.VentUndKlappen.Boxenklappe4Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4!=(signed long)0))));



(Aktoren.VentUndKlappen.Boxenklappe5Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5!=(signed long)0))));



(Aktoren.VentUndKlappen.Boxenklappe6Vorhanden=((((signed long)Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6!=(signed long)0))|(((signed long)Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6!=(signed long)0))));


(Aktoren.VentUndKlappen.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.VentUndKlappen.AnlaufverzZweiterVent=Betriebsparameter.Schrittkette.AnlaufverzZweiterVentilator);
(Aktoren.VentUndKlappen.DrehzahlVent1Min=Betriebsparameter.Ventilator1.DrehzahlMin);
(Aktoren.VentUndKlappen.DrehzahlVent1Max=Betriebsparameter.Ventilator1.DrehzahlMax);
(Aktoren.VentUndKlappen.RampeVent1Up=Betriebsparameter.Ventilator1.ZeitRampeUp);
(Aktoren.VentUndKlappen.RampeVent1Down=Betriebsparameter.Ventilator1.ZeitRampeDown);
(Aktoren.VentUndKlappen.DrehzahlVent1Umsch=Betriebsparameter.Ventilator1.DrzUmschaltung);
(Aktoren.VentUndKlappen.DrzVent1UmschMitLuftaufb=Betriebsparameter.Ventilator1.DrzUmschaltungMitLuftaufb);
(Aktoren.VentUndKlappen.DrehzahlVent2Min=Betriebsparameter.Ventilator2.DrehzahlMin);
(Aktoren.VentUndKlappen.DrehzahlVent2Max=Betriebsparameter.Ventilator2.DrehzahlMax);
(Aktoren.VentUndKlappen.RampeVent2Up=Betriebsparameter.Ventilator2.ZeitRampeUp);
(Aktoren.VentUndKlappen.RampeVent2Down=Betriebsparameter.Ventilator2.ZeitRampeDown);
(Aktoren.VentUndKlappen.DrehzahlVent2Umsch=Betriebsparameter.Ventilator2.DrzUmschaltung);
(Aktoren.VentUndKlappen.DrzVent2UmschMitLuftaufb=Betriebsparameter.Ventilator2.DrzUmschaltungMitLuftaufb);
(Aktoren.VentUndKlappen.LaufzeitBypassklappe=Betriebsparameter.Bypassklappe.Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe1=Betriebsparameter.KlappenBoxen[CheckBounds(1,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe2=Betriebsparameter.KlappenBoxen[CheckBounds(2,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe3=Betriebsparameter.KlappenBoxen[CheckBounds(3,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe4=Betriebsparameter.KlappenBoxen[CheckBounds(4,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe5=Betriebsparameter.KlappenBoxen[CheckBounds(5,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitBoxenklappe6=Betriebsparameter.KlappenBoxen[CheckBounds(6,1,6)-1].Laufzeit);
(Aktoren.VentUndKlappen.LaufzeitUmschaltklappe1=Betriebsparameter.Umschaltklappen.LaufzeitKlappe1);
(Aktoren.VentUndKlappen.LaufzeitUmschaltklappe2=Betriebsparameter.Umschaltklappen.LaufzeitKlappe2);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe1=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe1);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe2=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe2);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe3=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe3);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe4=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe4);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe5=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe5);
(Aktoren.VentUndKlappen.EndlagenVhdBoxenklappe6=Betriebsparameter.Ausstattung.EndlagenVhdBoxenklappe6);
(Aktoren.VentUndKlappen.EndlagenVhdUmschaltklappe1=Betriebsparameter.Ausstattung.EndlagenVhdUmschaltklappe1);
(Aktoren.VentUndKlappen.EndlagenVhdUmschaltklappe2=Betriebsparameter.Ausstattung.EndlagenVhdUmschaltklappe1);
(Aktoren.VentUndKlappen.EndlagenVhdBypassklappe=Betriebsparameter.Ausstattung.EndlagenVhdBypassklappe);



(doVentilator1Ein=Aktoren.VentUndKlappen.FreigabeVentilator1Out);
(doVentilator2Ein=Aktoren.VentUndKlappen.FreigabeVentilator2Out);
(aoDrehzahlvorgVentilator1=Aktoren.VentUndKlappen.DrehzahlVent1Out);
(aoDrehzahlvorgVentilator2=Aktoren.VentUndKlappen.DrehzahlVent2Out);
(doBypassklappeOeffnen=Aktoren.VentUndKlappen.BypassOeffnenOut);
(doBypassklappeSchliessen=Aktoren.VentUndKlappen.BypassSchliessenOut);
(doUmluftklappe1Freigabe=hmiButtons.changeBetrArtUmluftklappen);
(doUmluftklappe1Oeffnen=Aktoren.VentUndKlappen.Umschaltkl1OeffnenOut);
(doUmluftklappe1Schliessen=Aktoren.VentUndKlappen.Umschaltkl1SchliessenOut);
(doUmluftklappe2Freigabe=hmiButtons.changeBetrArtBypassklappe);
(doUmluftklappe2Oeffnen=Aktoren.VentUndKlappen.Umschaltkl2OeffnenOut);
(doUmluftklappe2Schliessen=Aktoren.VentUndKlappen.Umschaltkl2SchliessenOut);
(doFreigabeBox1=Aktoren.VentUndKlappen.Boxenklappe1OeffnenOut);
(doFreigabeBox2=Aktoren.VentUndKlappen.Boxenklappe2OeffnenOut);
(doFreigabeBox3=Aktoren.VentUndKlappen.Boxenklappe3OeffnenOut);
(doFreigabeBox4=Aktoren.VentUndKlappen.Boxenklappe4OeffnenOut);
(doFreigabeBox5=Aktoren.VentUndKlappen.Boxenklappe5OeffnenOut);
(doFreigabeBox6=Aktoren.VentUndKlappen.Boxenklappe6OeffnenOut);




if(Aktoren.VentUndKlappen.FreigabeVentilator1Out){
(gStatusAnlage.Aktor[CheckBounds(5,0,39)]=10);
}else if(Aktoren.VentUndKlappen.FehlerFuVentilator1){
(gStatusAnlage.Aktor[CheckBounds(5,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(5,0,39)]=11);
}


if(Aktoren.VentUndKlappen.FreigabeVentilator2Out){
(gStatusAnlage.Aktor[CheckBounds(6,0,39)]=10);
}else if(Aktoren.VentUndKlappen.FehlerFuVentilator2){
(gStatusAnlage.Aktor[CheckBounds(6,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(6,0,39)]=11);
}



if((doBypassklappeOeffnen&((diBypassklappeOffen|Aktoren.VentUndKlappen.BypassklappeIstOffen)^1)&(((unsigned long)Betriebsparameter.Bypassklappe.Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=10);
}else if(((doBypassklappeOeffnen^1)&((diBypassklappeGeschl|Aktoren.VentUndKlappen.BypassklappeIstGeschl)^1)&(((unsigned long)Betriebsparameter.Bypassklappe.Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=10);
}else if((doBypassklappeOeffnen&((diBypassklappeOffen|Aktoren.VentUndKlappen.BypassklappeIstOffen)|(((unsigned long)Betriebsparameter.Bypassklappe.Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=12);
}else if(((doBypassklappeOeffnen^1)&((diBypassklappeGeschl|Aktoren.VentUndKlappen.BypassklappeIstGeschl)|(((unsigned long)Betriebsparameter.Bypassklappe.Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitBypass){
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(7,0,39)]=11);
}


if((doUmluftklappe1Freigabe&((diUmschaltklappe1Offen|Aktoren.VentUndKlappen.Umschaltklappe1IstOffen)^1)&(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe1!=(unsigned long)0))&Betriebsparameter.Ausstattung.Umschaltklappe1)){
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=10);
}else if(((doUmluftklappe1Freigabe^1)&((diUmschaltklappe1Geschl|Aktoren.VentUndKlappen.Umschaltklappe1IstGeschl)^1)&(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe1!=(unsigned long)0))&Betriebsparameter.Ausstattung.Umschaltklappe1)){
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=10);
}else if((doUmluftklappe1Freigabe&((diUmschaltklappe1Offen|Aktoren.VentUndKlappen.Umschaltklappe1IstOffen)|(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe1==(unsigned long)0)))&Betriebsparameter.Ausstattung.Umschaltklappe1)){
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=12);
}else if(((doUmluftklappe1Freigabe^1)&((diUmschaltklappe1Geschl|Aktoren.VentUndKlappen.Umschaltklappe1IstGeschl)|(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe1==(unsigned long)0)))&Betriebsparameter.Ausstattung.Umschaltklappe1)){
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=13);
}else if((Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl1&Betriebsparameter.Ausstattung.Umschaltklappe1)){
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(8,0,39)]=11);
}


if((doUmluftklappe2Freigabe&((diUmschaltklappe2Offen|Aktoren.VentUndKlappen.Umschaltklappe2IstOffen)^1)&(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe2!=(unsigned long)0))&Betriebsparameter.Ausstattung.Umschaltklappe2)){
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=10);
}else if(((doUmluftklappe2Freigabe^1)&((diUmschaltklappe2Geschl|Aktoren.VentUndKlappen.Umschaltklappe2IstGeschl)^1)&(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe2!=(unsigned long)0))&Betriebsparameter.Ausstattung.Umschaltklappe2)){
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=10);
}else if((doUmluftklappe2Freigabe&((diUmschaltklappe2Offen|Aktoren.VentUndKlappen.Umschaltklappe2IstOffen)|(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe2==(unsigned long)0)))&Betriebsparameter.Ausstattung.Umschaltklappe2)){
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=12);
}else if(((doUmluftklappe2Freigabe^1)&((diUmschaltklappe2Geschl|Aktoren.VentUndKlappen.Umschaltklappe2IstGeschl)|(((unsigned long)Betriebsparameter.Umschaltklappen.LaufzeitKlappe2==(unsigned long)0)))&Betriebsparameter.Ausstattung.Umschaltklappe2)){
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=13);
}else if((Aktoren.VentUndKlappen.FehlerLaufzeitUmschaltkl2&Betriebsparameter.Ausstattung.Umschaltklappe2)){
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(9,0,39)]=11);
}


if((doFreigabeBox1&((diBox1Offen|Aktoren.VentUndKlappen.Boxenklappe1IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(1,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=10);
}else if(((doFreigabeBox1^1)&((diBox1Geschl|Aktoren.VentUndKlappen.Boxenklappe1IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(1,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=10);
}else if((doFreigabeBox1&((diBox1Offen|Aktoren.VentUndKlappen.Boxenklappe1IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(1,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=12);
}else if(((doFreigabeBox1^1)&((diBox1Geschl|Aktoren.VentUndKlappen.Boxenklappe1IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(1,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox1){
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(12,0,39)]=11);
}


if((doFreigabeBox2&((diBox2Offen|Aktoren.VentUndKlappen.Boxenklappe2IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(2,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=10);
}else if(((doFreigabeBox2^1)&((diBox2Geschl|Aktoren.VentUndKlappen.Boxenklappe2IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(2,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=10);
}else if((doFreigabeBox2&((diBox2Offen|Aktoren.VentUndKlappen.Boxenklappe2IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(2,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=12);
}else if(((doFreigabeBox2^1)&((diBox2Geschl|Aktoren.VentUndKlappen.Boxenklappe2IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(2,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox2){
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(13,0,39)]=11);
}


if((doFreigabeBox3&((diBox3Offen|Aktoren.VentUndKlappen.Boxenklappe3IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(3,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=10);
}else if(((doFreigabeBox3^1)&((diBox3Geschl|Aktoren.VentUndKlappen.Boxenklappe3IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(3,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=10);
}else if((doFreigabeBox3&((diBox3Offen|Aktoren.VentUndKlappen.Boxenklappe3IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(3,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=12);
}else if(((doFreigabeBox3^1)&((diBox3Geschl|Aktoren.VentUndKlappen.Boxenklappe3IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(3,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox3){
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(14,0,39)]=11);
}


if((doFreigabeBox4&((diBox4Offen|Aktoren.VentUndKlappen.Boxenklappe4IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(4,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=10);
}else if(((doFreigabeBox4^1)&((diBox4Geschl|Aktoren.VentUndKlappen.Boxenklappe4IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(4,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=10);
}else if((doFreigabeBox4&((diBox4Offen|Aktoren.VentUndKlappen.Boxenklappe4IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(4,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=12);
}else if(((doFreigabeBox4^1)&((diBox4Geschl|Aktoren.VentUndKlappen.Boxenklappe4IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(4,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox4){
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(15,0,39)]=11);
}


if((doFreigabeBox5&((diBox5Offen|Aktoren.VentUndKlappen.Boxenklappe5IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(5,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=10);
}else if(((doFreigabeBox5^1)&((diBox5Geschl|Aktoren.VentUndKlappen.Boxenklappe5IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(5,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=10);
}else if((doFreigabeBox5&((diBox5Offen|Aktoren.VentUndKlappen.Boxenklappe5IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(5,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=12);
}else if(((doFreigabeBox5^1)&((diBox5Geschl|Aktoren.VentUndKlappen.Boxenklappe5IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(5,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox5){
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(16,0,39)]=11);
}


if((doFreigabeBox6&((diBox6Offen|Aktoren.VentUndKlappen.Boxenklappe6IstOffen)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(6,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=10);
}else if(((doFreigabeBox6^1)&((diBox6Geschl|Aktoren.VentUndKlappen.Boxenklappe6IstGeschl)^1)&(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(6,1,6)-1].Laufzeit!=(unsigned long)0)))){
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=10);
}else if((doFreigabeBox6&((diBox6Offen|Aktoren.VentUndKlappen.Boxenklappe6IstOffen)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(6,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=12);
}else if(((doFreigabeBox6^1)&((diBox6Geschl|Aktoren.VentUndKlappen.Boxenklappe6IstGeschl)|(((unsigned long)Betriebsparameter.KlappenBoxen[CheckBounds(6,1,6)-1].Laufzeit==(unsigned long)0))))){
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=13);
}else if(Aktoren.VentUndKlappen.FehlerLaufzeitKlappeBox6){
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(17,0,39)]=11);
}





if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)4))&(((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)5)))){


(Aktoren.Warmluftofen.BetriebsmeldungWarmluftofen=diWarmluftofenInBetrieb);
(Aktoren.Warmluftofen.FehlerSensorAussenluft=alarmFehler[CheckBounds(20,0,49)]);
(Aktoren.Warmluftofen.FrischluftSattDefizitIst=gStatusAnlage.Berechnungen.FrischluftSattDefizit);


(Aktoren.Warmluftofen.Auskuehlzeit=Betriebsparameter.Warmluftofen.Auskuehlzeit);
(Aktoren.Warmluftofen.FrischluftSattDefizitSoll=Betriebsparameter.Warmluftofen.SaettigungFrischlEin);
(Aktoren.Warmluftofen.Hysterese=Betriebsparameter.Warmluftofen.Hysterese);
(Aktoren.Warmluftofen.OptionBetriebsmldgVhd=Betriebsparameter.Ausstattung.WarmluftofenBetriebsmldg);
(Aktoren.Warmluftofen.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.Warmluftofen.UmschaltverzWitterung=Betriebsparameter.Warmluftofen.VerzWetterwechsel);
(Aktoren.Warmluftofen.VerzBetriebsmeldung=Betriebsparameter.Warmluftofen.VerzBetriebsmeldung);
(Aktoren.Warmluftofen.WarmlufttemperaturVorgabe=Betriebsparameter.Warmluftofen.WarmlufttempVorgabeSoll);


}else{


(Aktoren.Warmluftofen.BetriebsmeldungWarmluftofen=diWarmluftofenInBetrieb);
(Aktoren.Warmluftofen.FehlerSensorAussenluft=0);
(Aktoren.Warmluftofen.WetterIstSchlecht=gStatusAnlage.WetterIstSchlecht);


(Aktoren.Warmluftofen.Auskuehlzeit=Betriebsparameter.Warmluftofen.Auskuehlzeit);
(Aktoren.Warmluftofen.OptionBetriebsmldgVhd=Betriebsparameter.Ausstattung.WarmluftofenBetriebsmldg);
(Aktoren.Warmluftofen.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.Warmluftofen.VerzBetriebsmeldung=Betriebsparameter.Warmluftofen.VerzBetriebsmeldung);

}


(doWarmluftofenEin=Aktoren.Warmluftofen.FreigabeWarmluftofenOut);
(aoTemperaturvorgWarmluftofen=Aktoren.Warmluftofen.WarmlufttempSollOut);


if(doWarmluftofenEin){
(gStatusAnlage.Aktor[CheckBounds(20,0,39)]=10);
}else if(Aktoren.Warmluftofen.WarmluftofenAktiv){
(gStatusAnlage.Aktor[CheckBounds(20,0,39)]=19);
}else if((Aktoren.Warmluftofen.FehlerBetriebsmeldungOut|Aktoren.Warmluftofen.FehlerSensorAussenluftOut)){
(gStatusAnlage.Aktor[CheckBounds(20,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(20,0,39)]=11);
}





if(((((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)4))&(((unsigned long)(unsigned char)hmiStatus.NameSteuerung!=(unsigned long)(unsigned char)5)))){


(Aktoren.Heizregister.FehlerSensorAussenluft=alarmFehler[CheckBounds(20,0,49)]);
(Aktoren.Heizregister.FrischluftSattDefizitIst=gStatusAnlage.Berechnungen.FrischluftSattDefizit);


(Aktoren.Heizregister.DrehzahlHeizregisterSoll=gCmdAnlage.Leistung.DrehzahlHeizregister);
(Aktoren.Heizregister.FrischluftSattDefizitSoll=Betriebsparameter.Heizregister.SaettigungFrischlEin);
(Aktoren.Heizregister.Hysterese=Betriebsparameter.Heizregister.Hysterese);
(Aktoren.Heizregister.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.Heizregister.UmschaltverzWitterung=Betriebsparameter.Heizregister.VerzWetterwechsel);


if(diHeizregisterFrostschutz){

(doHeizregisterEin=1);
(aoLeistungsvorgHeizregister=(1.00000000000000000000E+02));

}else if((gStatusAnlage.FrischluftbetriebAktiv&Betriebsparameter.Ventilator1.LuftmengenregFrischluftEin&Betriebsparameter.Ventilator2.LuftmengenregFrischluftEin)){
(doHeizregisterEin=0);
(aoLeistungsvorgHeizregister=(0.00000000000000000000E+00));
}else{

(doHeizregisterEin=Aktoren.Heizregister.FreigabeHeizregisterOut);
(aoLeistungsvorgHeizregister=Aktoren.Heizregister.DrehzahlHeizregisterOut);
}



}else{

(Aktoren.Heizregister.FehlerSensorAussenluft=0);
(Aktoren.Heizregister.WetterIstSchlecht=gStatusAnlage.WetterIstSchlecht);


(Aktoren.Heizregister.QuitFehler=hmiButtons.QuitFehler);


(doHeizregisterEin=Aktoren.Heizregister.FreigabeHeizregisterOut);
}


if(doHeizregisterEin){
(gStatusAnlage.Aktor[CheckBounds(21,0,39)]=10);
}else if(Aktoren.Heizregister.FehlerOut){
(gStatusAnlage.Aktor[CheckBounds(21,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(21,0,39)]=11);
}





(Aktoren.Scheitholzofen.Betriebsmeldung=diScheitholzofenInBetrieb);


(Aktoren.Scheitholzofen.Freigabe=Betriebsparameter.Ausstattung.Scheitholzofen);
(Aktoren.Scheitholzofen.Auskuehlzeit=Betriebsparameter.Scheitholzofen.Auskuehlzeit);




if(diScheitholzofenInBetrieb){
(gStatusAnlage.Aktor[CheckBounds(22,0,39)]=10);
}else if(Aktoren.Scheitholzofen.ScheitholzofenAktiv){
(gStatusAnlage.Aktor[CheckBounds(22,0,39)]=19);
}else{
(gStatusAnlage.Aktor[CheckBounds(22,0,39)]=11);
}





(Aktoren.Notstromaggregat.BetriebsmldgNotstromaggregat=diNotstromaggregatInBetrieb);


(Aktoren.Notstromaggregat.Freigabe=Betriebsparameter.Ausstattung.Notstromaggregat);
(Aktoren.Notstromaggregat.QuitFehler=hmiButtons.QuitFehler);
(Aktoren.Notstromaggregat.VerzBetriebsmeldung=Betriebsparameter.Notstromaggregat.VerzBetriebsmeldung);
(Aktoren.Notstromaggregat.Vorlaufzeit=Betriebsparameter.Notstromaggregat.Vorlaufzeit);
(Aktoren.Notstromaggregat.Nachlaufzeit=Betriebsparameter.Notstromaggregat.Nachlaufzeit);


(doNotstromaggregatEin=Aktoren.Notstromaggregat.FreigabeNotstromaggregatOut);


if(Aktoren.Notstromaggregat.NotstromBereitOut){
(gStatusAnlage.Aktor[CheckBounds(23,0,39)]=8);
}else if(doNotstromaggregatEin){
(gStatusAnlage.Aktor[CheckBounds(23,0,39)]=10);
}else if(Aktoren.Notstromaggregat.FehlerOut){
(gStatusAnlage.Aktor[CheckBounds(23,0,39)]=9);
}else{
(gStatusAnlage.Aktor[CheckBounds(23,0,39)]=11);
}





(Aktoren.Brandschutzklappe.EndlageOffen=0);
(Aktoren.Brandschutzklappe.EndlageGeschl=0);
(Aktoren.Brandschutzklappe.LaufzeitOeffnen=0);
(Aktoren.Brandschutzklappe.LaufzeitSchliessen=0);
(Aktoren.Brandschutzklappe.Stoerung=0);


(Aktoren.Brandschutzklappe.QuitFehler=hmiButtons.QuitFehler);


(doBrandschutzklappeAuf=Aktoren.Brandschutzklappe.OeffnenOut);


if(Aktoren.Brandschutzklappe.OeffnenOut){
(gStatusAnlage.Aktor[CheckBounds(24,0,39)]=12);
}else if(Betriebsparameter.Ausstattung.Brandschutzklappe){
(gStatusAnlage.Aktor[CheckBounds(24,0,39)]=13);
}else{
(gStatusAnlage.Aktor[CheckBounds(24,0,39)]=0);
}



}imp1_end28_0:;}
#line 752 "C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.nodebug"

void __AS__ImplInitMain_st(void){__BUR__ENTRY_INIT_FUNCT__();}

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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/IO/aktorenMapping/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/aktorenMapping/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/aktorenMap/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/aktorenMap/Main.st.c\\\" \\\"C:/SharedFolder/CControl_Gschneitner/Logical/IO/aktorenMapping/Main.st\\\"\\n\"");
__asm__(".previous");
