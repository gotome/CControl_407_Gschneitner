#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoBoxen/fbBoxenVentKlappenst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenVentKlappen.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenVentKlappen.st"
void fbBoxenVentKlappen(struct fbBoxenVentKlappen* inst){struct fbBoxenVentKlappen* __inst__=inst;{

if(__inst__->Freigabe){


(__inst__->fbLascoEUhr_0.Freigabe=1);;fbLascoEUhr(&__inst__->fbLascoEUhr_0);
(__inst__->fbLascoZdxx_0.IN=__inst__->fbLascoEUhr_0.Sekunde);;fbLascoZdxx(&__inst__->fbLascoZdxx_0);
(__inst__->sekTick=__inst__->fbLascoZdxx_0.Q);





(__inst__->loc_AenderungBypassklappe=(((__inst__->BypassklappeOeffnen&((__inst__->EndlBypassOffen|__inst__->Bypassklappe.KlappeIstOffenOut)^1))|(__inst__->BypassklappeSchliessen&((__inst__->EndlBypassGeschl|__inst__->Bypassklappe.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBypassklappe!=(unsigned long)0))));


(__inst__->loc_AenderungUmschaltklappe1=(((__inst__->Umschaltkl1Oeffnen&((__inst__->EndlUmschaltkl1Offen|__inst__->Umschaltklappe1.KlappeIstOffenOut)^1))|(__inst__->Umschaltkl1Schliessen&((__inst__->EndlUmschaltkl1Geschl|__inst__->Umschaltklappe1.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitUmschaltklappe1!=(unsigned long)0))));


(__inst__->loc_AenderungUmschaltklappe2=(((__inst__->Umschaltkl2Oeffnen&((__inst__->EndlUmschaltkl2Offen|__inst__->Umschaltklappe2.KlappeIstOffenOut)^1))|(__inst__->Umschaltkl2Schliessen&((__inst__->EndlUmschaltkl2Geschl|__inst__->Umschaltklappe2.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitUmschaltklappe2!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe1=(__inst__->Boxenklappe1Vorhanden&((__inst__->Boxenklappe1Oeffnen&((__inst__->EndlBoxenklappe1Offen|__inst__->Boxenklappe1.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe1Schliessen&((__inst__->EndlBoxenklappe1Geschl|__inst__->Boxenklappe1.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe1!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe2=(__inst__->Boxenklappe2Vorhanden&((__inst__->Boxenklappe2Oeffnen&((__inst__->EndlBoxenklappe2Offen|__inst__->Boxenklappe2.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe2Schliessen&((__inst__->EndlBoxenklappe2Geschl|__inst__->Boxenklappe2.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe2!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe3=(__inst__->Boxenklappe3Vorhanden&((__inst__->Boxenklappe3Oeffnen&((__inst__->EndlBoxenklappe3Offen|__inst__->Boxenklappe3.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe3Schliessen&((__inst__->EndlBoxenklappe3Geschl|__inst__->Boxenklappe3.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe3!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe4=(__inst__->Boxenklappe4Vorhanden&((__inst__->Boxenklappe4Oeffnen&((__inst__->EndlBoxenklappe4Offen|__inst__->Boxenklappe4.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe4Schliessen&((__inst__->EndlBoxenklappe4Geschl|__inst__->Boxenklappe4.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe4!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe5=(__inst__->Boxenklappe5Vorhanden&((__inst__->Boxenklappe5Oeffnen&((__inst__->EndlBoxenklappe5Offen|__inst__->Boxenklappe5.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe5Schliessen&((__inst__->EndlBoxenklappe5Geschl|__inst__->Boxenklappe5.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe5!=(unsigned long)0))));


(__inst__->loc_AenderungBoxenklappe6=(__inst__->Boxenklappe6Vorhanden&((__inst__->Boxenklappe6Oeffnen&((__inst__->EndlBoxenklappe6Offen|__inst__->Boxenklappe6.KlappeIstOffenOut)^1))|(__inst__->Boxenklappe6Schliessen&((__inst__->EndlBoxenklappe6Geschl|__inst__->Boxenklappe6.KlappeIstGeschlOut)^1)))&(((unsigned long)__inst__->LaufzeitBoxenklappe6!=(unsigned long)0))));







(__inst__->loc_UmschaltungErforderlVent1=((__inst__->loc_AenderungBypassklappe&__inst__->BypassklVonVent1Abhaengig)|(__inst__->loc_AenderungUmschaltklappe1&__inst__->UmluftklVonVent1Abhaengig)|(__inst__->loc_AenderungUmschaltklappe2&__inst__->UmluftklVonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe1&__inst__->Boxenkl1VonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe2&__inst__->Boxenkl2VonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe3&__inst__->Boxenkl3VonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe4&__inst__->Boxenkl4VonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe5&__inst__->Boxenkl5VonVent1Abhaengig)|(__inst__->loc_AenderungBoxenklappe6&__inst__->Boxenkl6VonVent1Abhaengig)));






(__inst__->loc_UmschaltungErforderlVent2=((__inst__->loc_AenderungBypassklappe&__inst__->BypassklVonVent2Abhaengig)|(__inst__->loc_AenderungUmschaltklappe1&__inst__->UmluftklVonVent2Abhaengig)|(__inst__->loc_AenderungUmschaltklappe2&__inst__->UmluftklVonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe1&__inst__->Boxenkl1VonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe2&__inst__->Boxenkl2VonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe3&__inst__->Boxenkl3VonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe4&__inst__->Boxenkl4VonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe5&__inst__->Boxenkl5VonVent2Abhaengig)|(__inst__->loc_AenderungBoxenklappe6&__inst__->Boxenkl6VonVent2Abhaengig)));




(__inst__->fbFuVentilator1.AnsprechZeitFU=5);
(__inst__->fbFuVentilator1.BetrMldg=__inst__->Ventilator1InBetrieb);
(__inst__->fbFuVentilator1.MinDrehzahl=__inst__->DrehzahlVent1Min);
(__inst__->fbFuVentilator1.MaxDrehzahl=__inst__->DrehzahlVent1Max);
(__inst__->fbFuVentilator1.RampeUpSek=__inst__->RampeVent1Up);
(__inst__->fbFuVentilator1.RampeDownSek=__inst__->RampeVent1Down);
(__inst__->fbFuVentilator1.Reset=__inst__->QuitFehler);
(__inst__->fbFuVentilator1.Tick=__inst__->sekTick);
fbLascoFU(&__inst__->fbFuVentilator1);
(__inst__->FreigabeVentilator1Out=__inst__->fbFuVentilator1.BetriebFU);
(__inst__->DrehzahlVent1Out=__inst__->fbFuVentilator1.DrehzahlFU);
(__inst__->FehlerFuVentilator1=__inst__->fbFuVentilator1.StoerungFU);


(__inst__->fbFuVentilator2.AnsprechZeitFU=5);
(__inst__->fbFuVentilator2.BetrMldg=__inst__->Ventilator2InBetrieb);
(__inst__->fbFuVentilator2.MinDrehzahl=__inst__->DrehzahlVent2Min);
(__inst__->fbFuVentilator2.MaxDrehzahl=__inst__->DrehzahlVent2Max);
(__inst__->fbFuVentilator2.RampeUpSek=__inst__->RampeVent2Up);
(__inst__->fbFuVentilator2.RampeDownSek=__inst__->RampeVent2Down);
(__inst__->fbFuVentilator2.Reset=__inst__->QuitFehler);
(__inst__->fbFuVentilator2.Tick=__inst__->sekTick);
fbLascoFU(&__inst__->fbFuVentilator2);
(__inst__->FreigabeVentilator2Out=__inst__->fbFuVentilator2.BetriebFU);
(__inst__->DrehzahlVent2Out=__inst__->fbFuVentilator2.DrehzahlFU);
(__inst__->FehlerFuVentilator2=__inst__->fbFuVentilator2.StoerungFU);


(__inst__->Bypassklappe.EndlagenVhd=__inst__->EndlagenVhdBypassklappe);
(__inst__->Bypassklappe.EndlageOffen=__inst__->EndlBypassOffen);
(__inst__->Bypassklappe.EndlageGeschl=__inst__->EndlBypassGeschl);
(__inst__->Bypassklappe.LaufzeitOeffnen=__inst__->LaufzeitBypassklappe);
(__inst__->Bypassklappe.LaufzeitSchliessen=__inst__->LaufzeitBypassklappe);
(__inst__->Bypassklappe.Stoerung=(__inst__->EndlBypassGeschl&__inst__->EndlBypassOffen));
(__inst__->Bypassklappe.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Bypassklappe);
(__inst__->BypassOeffnenOut=__inst__->Bypassklappe.OeffnenOut);
(__inst__->BypassSchliessenOut=__inst__->Bypassklappe.SchliessenOut);
(__inst__->FehlerLaufzeitBypass=(__inst__->Bypassklappe.FehlerLaufzeitOeffnen|__inst__->Bypassklappe.FehlerLaufzeitSchliessen));
(__inst__->BypassklappeIstGeschl=__inst__->Bypassklappe.KlappeIstGeschlOut);
(__inst__->BypassklappeIstOffen=__inst__->Bypassklappe.KlappeIstOffenOut);

(__inst__->Umschaltklappe1.EndlagenVhd=__inst__->EndlagenVhdUmschaltklappe1);
(__inst__->Umschaltklappe1.EndlageOffen=__inst__->EndlUmschaltkl1Offen);
(__inst__->Umschaltklappe1.EndlageGeschl=__inst__->EndlUmschaltkl1Geschl);
(__inst__->Umschaltklappe1.LaufzeitOeffnen=__inst__->LaufzeitUmschaltklappe1);
(__inst__->Umschaltklappe1.LaufzeitSchliessen=__inst__->LaufzeitUmschaltklappe1);
(__inst__->Umschaltklappe1.Stoerung=(__inst__->EndlUmschaltkl1Offen&__inst__->EndlUmschaltkl1Geschl));
(__inst__->Umschaltklappe1.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Umschaltklappe1);
(__inst__->Umschaltkl1OeffnenOut=__inst__->Umschaltklappe1.OeffnenOut);
(__inst__->Umschaltkl1SchliessenOut=__inst__->Umschaltklappe1.SchliessenOut);
(__inst__->FehlerLaufzeitUmschaltkl1=(__inst__->Umschaltklappe1.FehlerLaufzeitOeffnen|__inst__->Umschaltklappe1.FehlerLaufzeitSchliessen));
(__inst__->Umschaltklappe1IstGeschl=__inst__->Umschaltklappe1.KlappeIstGeschlOut);
(__inst__->Umschaltklappe1IstOffen=__inst__->Umschaltklappe1.KlappeIstOffenOut);

(__inst__->Umschaltklappe2.EndlagenVhd=__inst__->EndlagenVhdUmschaltklappe2);
(__inst__->Umschaltklappe2.EndlageOffen=__inst__->EndlUmschaltkl2Offen);
(__inst__->Umschaltklappe2.EndlageGeschl=__inst__->EndlUmschaltkl2Geschl);
(__inst__->Umschaltklappe2.LaufzeitOeffnen=__inst__->LaufzeitUmschaltklappe2);
(__inst__->Umschaltklappe2.LaufzeitSchliessen=__inst__->LaufzeitUmschaltklappe2);
(__inst__->Umschaltklappe2.Stoerung=(__inst__->EndlUmschaltkl2Offen&__inst__->EndlUmschaltkl2Geschl));
(__inst__->Umschaltklappe2.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Umschaltklappe2);
(__inst__->Umschaltkl2OeffnenOut=__inst__->Umschaltklappe2.OeffnenOut);
(__inst__->Umschaltkl2SchliessenOut=__inst__->Umschaltklappe2.SchliessenOut);
(__inst__->FehlerLaufzeitUmschaltkl2=(__inst__->Umschaltklappe2.FehlerLaufzeitOeffnen|__inst__->Umschaltklappe2.FehlerLaufzeitSchliessen));
(__inst__->Umschaltklappe2IstGeschl=__inst__->Umschaltklappe2.KlappeIstGeschlOut);
(__inst__->Umschaltklappe2IstOffen=__inst__->Umschaltklappe2.KlappeIstOffenOut);

(__inst__->Boxenklappe1.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe1);
(__inst__->Boxenklappe1.EndlageOffen=__inst__->EndlBoxenklappe1Offen);
(__inst__->Boxenklappe1.EndlageGeschl=__inst__->EndlBoxenklappe1Geschl);
(__inst__->Boxenklappe1.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe1);
(__inst__->Boxenklappe1.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe1);
(__inst__->Boxenklappe1.Stoerung=(__inst__->EndlBoxenklappe1Offen&__inst__->EndlBoxenklappe1Geschl));
(__inst__->Boxenklappe1.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe1);
(__inst__->Boxenklappe1IstGeschl=__inst__->Boxenklappe1.KlappeIstGeschlOut);
(__inst__->Boxenklappe1IstOffen=__inst__->Boxenklappe1.KlappeIstOffenOut);
if(__inst__->Boxenklappe1Vorhanden){
(__inst__->Boxenklappe1OeffnenOut=__inst__->Boxenklappe1.OeffnenOut);
(__inst__->Boxenklappe1SchliessenOut=__inst__->Boxenklappe1.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox1=(__inst__->Boxenklappe1.FehlerLaufzeitOeffnen|__inst__->Boxenklappe1.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe1OeffnenOut=0);
(__inst__->Boxenklappe1SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox1=0);
}

(__inst__->Boxenklappe2.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe2);
(__inst__->Boxenklappe2.EndlageOffen=__inst__->EndlBoxenklappe2Offen);
(__inst__->Boxenklappe2.EndlageGeschl=__inst__->EndlBoxenklappe2Geschl);
(__inst__->Boxenklappe2.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe2);
(__inst__->Boxenklappe2.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe2);
(__inst__->Boxenklappe2.Stoerung=(__inst__->EndlBoxenklappe2Offen&__inst__->EndlBoxenklappe2Geschl));
(__inst__->Boxenklappe2.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe2);
(__inst__->Boxenklappe2IstGeschl=__inst__->Boxenklappe2.KlappeIstGeschlOut);
(__inst__->Boxenklappe2IstOffen=__inst__->Boxenklappe2.KlappeIstOffenOut);
if(__inst__->Boxenklappe2Vorhanden){
(__inst__->Boxenklappe2OeffnenOut=__inst__->Boxenklappe2.OeffnenOut);
(__inst__->Boxenklappe2SchliessenOut=__inst__->Boxenklappe2.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox2=(__inst__->Boxenklappe2.FehlerLaufzeitOeffnen|__inst__->Boxenklappe2.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe2OeffnenOut=0);
(__inst__->Boxenklappe2SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox2=0);
}

(__inst__->Boxenklappe3.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe3);
(__inst__->Boxenklappe3.EndlageOffen=__inst__->EndlBoxenklappe3Offen);
(__inst__->Boxenklappe3.EndlageGeschl=__inst__->EndlBoxenklappe3Geschl);
(__inst__->Boxenklappe3.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe3);
(__inst__->Boxenklappe3.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe3);
(__inst__->Boxenklappe3.Stoerung=(__inst__->EndlBoxenklappe3Offen&__inst__->EndlBoxenklappe3Geschl));
(__inst__->Boxenklappe3.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe3);
(__inst__->Boxenklappe3IstGeschl=__inst__->Boxenklappe3.KlappeIstGeschlOut);
(__inst__->Boxenklappe3IstOffen=__inst__->Boxenklappe3.KlappeIstOffenOut);
if(__inst__->Boxenklappe3Vorhanden){
(__inst__->Boxenklappe3OeffnenOut=__inst__->Boxenklappe3.OeffnenOut);
(__inst__->Boxenklappe3SchliessenOut=__inst__->Boxenklappe3.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox3=(__inst__->Boxenklappe3.FehlerLaufzeitOeffnen|__inst__->Boxenklappe3.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe3OeffnenOut=0);
(__inst__->Boxenklappe3SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox3=0);
}

(__inst__->Boxenklappe4.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe4);
(__inst__->Boxenklappe4.EndlageOffen=__inst__->EndlBoxenklappe4Offen);
(__inst__->Boxenklappe4.EndlageGeschl=__inst__->EndlBoxenklappe4Geschl);
(__inst__->Boxenklappe4.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe4);
(__inst__->Boxenklappe4.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe4);
(__inst__->Boxenklappe4.Stoerung=(__inst__->EndlBoxenklappe4Offen&__inst__->EndlBoxenklappe4Geschl));
(__inst__->Boxenklappe4.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe4);
(__inst__->Boxenklappe4IstGeschl=__inst__->Boxenklappe4.KlappeIstGeschlOut);
(__inst__->Boxenklappe4IstOffen=__inst__->Boxenklappe4.KlappeIstOffenOut);
if(__inst__->Boxenklappe4Vorhanden){
(__inst__->Boxenklappe4OeffnenOut=__inst__->Boxenklappe4.OeffnenOut);
(__inst__->Boxenklappe4SchliessenOut=__inst__->Boxenklappe4.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox4=(__inst__->Boxenklappe4.FehlerLaufzeitOeffnen|__inst__->Boxenklappe4.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe4OeffnenOut=0);
(__inst__->Boxenklappe4SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox4=0);
}

(__inst__->Boxenklappe5.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe5);
(__inst__->Boxenklappe5.EndlageOffen=__inst__->EndlBoxenklappe5Offen);
(__inst__->Boxenklappe5.EndlageGeschl=__inst__->EndlBoxenklappe5Geschl);
(__inst__->Boxenklappe5.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe5);
(__inst__->Boxenklappe5.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe5);
(__inst__->Boxenklappe5.Stoerung=(__inst__->EndlBoxenklappe5Offen&__inst__->EndlBoxenklappe5Geschl));
(__inst__->Boxenklappe5.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe5);
(__inst__->Boxenklappe5IstGeschl=__inst__->Boxenklappe5.KlappeIstGeschlOut);
(__inst__->Boxenklappe5IstOffen=__inst__->Boxenklappe5.KlappeIstOffenOut);
if(__inst__->Boxenklappe5Vorhanden){
(__inst__->Boxenklappe5OeffnenOut=__inst__->Boxenklappe5.OeffnenOut);
(__inst__->Boxenklappe5SchliessenOut=__inst__->Boxenklappe5.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox5=(__inst__->Boxenklappe5.FehlerLaufzeitOeffnen|__inst__->Boxenklappe5.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe5OeffnenOut=0);
(__inst__->Boxenklappe5SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox5=0);
}

(__inst__->Boxenklappe6.EndlagenVhd=__inst__->EndlagenVhdBoxenklappe6);
(__inst__->Boxenklappe6.EndlageOffen=__inst__->EndlBoxenklappe6Offen);
(__inst__->Boxenklappe6.EndlageGeschl=__inst__->EndlBoxenklappe6Geschl);
(__inst__->Boxenklappe6.LaufzeitOeffnen=__inst__->LaufzeitBoxenklappe6);
(__inst__->Boxenklappe6.LaufzeitSchliessen=__inst__->LaufzeitBoxenklappe6);
(__inst__->Boxenklappe6.Stoerung=(__inst__->EndlBoxenklappe6Offen&__inst__->EndlBoxenklappe6Geschl));
(__inst__->Boxenklappe6.QuitFehler=__inst__->QuitFehler);
fbBoxenKlappenanst(&__inst__->Boxenklappe6);
(__inst__->Boxenklappe6IstGeschl=__inst__->Boxenklappe6.KlappeIstGeschlOut);
(__inst__->Boxenklappe6IstOffen=__inst__->Boxenklappe6.KlappeIstOffenOut);
if(__inst__->Boxenklappe6Vorhanden){
(__inst__->Boxenklappe6OeffnenOut=__inst__->Boxenklappe6.OeffnenOut);
(__inst__->Boxenklappe6SchliessenOut=__inst__->Boxenklappe6.SchliessenOut);
(__inst__->FehlerLaufzeitKlappeBox6=(__inst__->Boxenklappe6.FehlerLaufzeitOeffnen|__inst__->Boxenklappe6.FehlerLaufzeitSchliessen));
}else{
(__inst__->Boxenklappe6OeffnenOut=0);
(__inst__->Boxenklappe6SchliessenOut=0);
(__inst__->FehlerLaufzeitKlappeBox6=0);
}




if((((unsigned long)__inst__->LaufzeitBypassklappe==(unsigned long)0))){
(__inst__->Bypassklappe.Oeffnen=__inst__->BypassklappeOeffnen);
(__inst__->Bypassklappe.Schliessen=__inst__->BypassklappeSchliessen);
}
if(((((unsigned long)__inst__->LaufzeitUmschaltklappe1==(unsigned long)0))|((__inst__->UmluftklVonVent1Abhaengig^1)&(__inst__->UmluftklVonVent2Abhaengig^1)))){
(__inst__->Umschaltklappe1.Oeffnen=__inst__->Umschaltkl1Oeffnen);
(__inst__->Umschaltklappe1.Schliessen=__inst__->Umschaltkl1Schliessen);
}
if(((((unsigned long)__inst__->LaufzeitUmschaltklappe2==(unsigned long)0))|((__inst__->UmluftklVonVent1Abhaengig^1)&(__inst__->UmluftklVonVent2Abhaengig^1)))){
(__inst__->Umschaltklappe2.Oeffnen=__inst__->Umschaltkl2Oeffnen);
(__inst__->Umschaltklappe2.Schliessen=__inst__->Umschaltkl2Schliessen);
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe1==(unsigned long)0))){
(__inst__->Boxenklappe1.Oeffnen=(__inst__->Boxenklappe1Oeffnen&__inst__->Boxenklappe1Vorhanden));
(__inst__->Boxenklappe1.Schliessen=(__inst__->Boxenklappe1Schliessen&__inst__->Boxenklappe1Vorhanden));
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe2==(unsigned long)0))){
(__inst__->Boxenklappe2.Oeffnen=(__inst__->Boxenklappe2Oeffnen&__inst__->Boxenklappe2Vorhanden));
(__inst__->Boxenklappe2.Schliessen=(__inst__->Boxenklappe2Schliessen&__inst__->Boxenklappe2Vorhanden));
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe3==(unsigned long)0))){
(__inst__->Boxenklappe3.Oeffnen=(__inst__->Boxenklappe3Oeffnen&__inst__->Boxenklappe3Vorhanden));
(__inst__->Boxenklappe3.Schliessen=(__inst__->Boxenklappe3Schliessen&__inst__->Boxenklappe3Vorhanden));
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe4==(unsigned long)0))){
(__inst__->Boxenklappe4.Oeffnen=(__inst__->Boxenklappe4Oeffnen&__inst__->Boxenklappe4Vorhanden));
(__inst__->Boxenklappe4.Schliessen=(__inst__->Boxenklappe4Schliessen&__inst__->Boxenklappe4Vorhanden));
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe5==(unsigned long)0))){
(__inst__->Boxenklappe5.Oeffnen=(__inst__->Boxenklappe5Oeffnen&__inst__->Boxenklappe5Vorhanden));
(__inst__->Boxenklappe5.Schliessen=(__inst__->Boxenklappe5Schliessen&__inst__->Boxenklappe5Vorhanden));
}
if((((unsigned long)__inst__->LaufzeitBoxenklappe6==(unsigned long)0))){
(__inst__->Boxenklappe6.Oeffnen=(__inst__->Boxenklappe6Oeffnen&__inst__->Boxenklappe6Vorhanden));
(__inst__->Boxenklappe6.Schliessen=(__inst__->Boxenklappe6Schliessen&__inst__->Boxenklappe6Vorhanden));
}










(__inst__->curStep=__inst__->nextStep);



switch(__inst__->curStep){



case 0:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->Bypassklappe.Oeffnen=0);
(__inst__->Bypassklappe.Schliessen=0);
(__inst__->Umschaltklappe1.Oeffnen=0);
(__inst__->Umschaltklappe1.Schliessen=0);
(__inst__->Umschaltklappe2.Oeffnen=0);
(__inst__->Umschaltklappe2.Schliessen=0);
(__inst__->Boxenklappe1.Oeffnen=0);
(__inst__->Boxenklappe1.Schliessen=0);
(__inst__->Boxenklappe2.Oeffnen=0);
(__inst__->Boxenklappe2.Schliessen=0);
(__inst__->Boxenklappe3.Oeffnen=0);
(__inst__->Boxenklappe3.Schliessen=0);
(__inst__->Boxenklappe4.Oeffnen=0);
(__inst__->Boxenklappe4.Schliessen=0);
(__inst__->Boxenklappe5.Oeffnen=0);
(__inst__->Boxenklappe5.Schliessen=0);
(__inst__->Boxenklappe6.Oeffnen=0);
(__inst__->Boxenklappe6.Schliessen=0);
}




if((__inst__->AnforderungVentilator1^1)){
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Min);
if((((__inst__->fbFuVentilator1.DrehzahlFU<=__inst__->DrehzahlVent1Min))&(__inst__->AnforderungVentilator1^1))){
(__inst__->fbFuVentilator1.Freigabe=0);
}
}

if((__inst__->AnforderungVentilator2^1)){
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Min);
if((((__inst__->fbFuVentilator2.DrehzahlFU<=__inst__->DrehzahlVent2Min))&(__inst__->AnforderungVentilator2^1))){
(__inst__->fbFuVentilator2.Freigabe=0);
}
}















if(((__inst__->AnforderungVentilator1|__inst__->AnforderungVentilator2)&(__inst__->loc_UmschaltungErforderlVent1^1)&(__inst__->loc_UmschaltungErforderlVent2^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=1);

}else if((__inst__->loc_UmschaltungErforderlVent1|__inst__->loc_UmschaltungErforderlVent2)){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=2);
}




}break;case 1:{


if(__inst__->stateEntry){
(__inst__->stateEntry=0);



















}





(__inst__->TON_AnlaufverzVentilatoren.IN=(__inst__->AnforderungVentilator1|__inst__->AnforderungVentilator2));;(__inst__->TON_AnlaufverzVentilatoren.PT=__inst__->AnlaufverzZweiterVent);;TON(&__inst__->TON_AnlaufverzVentilatoren);




if(((__inst__->AnforderungVentilator1&(__inst__->AnforderungVentilator2^1))|((__inst__->AnforderungVentilator1^1)&__inst__->AnforderungVentilator2))){

if((__inst__->AnforderungVentilator1^1)){
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Min);
if(((__inst__->fbFuVentilator1.DrehzahlFU<=__inst__->DrehzahlVent1Min))){
(__inst__->fbFuVentilator1.Freigabe=0);
}
}else{
(__inst__->fbFuVentilator1.Freigabe=__inst__->AnforderungVentilator1);
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
}

if((__inst__->AnforderungVentilator2^1)){
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Min);
if(((__inst__->fbFuVentilator2.DrehzahlFU<=__inst__->DrehzahlVent2Min))){
(__inst__->fbFuVentilator2.Freigabe=0);
}
}else{
(__inst__->fbFuVentilator2.Freigabe=__inst__->AnforderungVentilator2);
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
}



}else if((__inst__->AnforderungVentilator1&__inst__->AnforderungVentilator2)){
if((__inst__->fbFuVentilator2.Freigabe^1)){
(__inst__->fbFuVentilator1.Freigabe=__inst__->AnforderungVentilator1);
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
if(__inst__->TON_AnlaufverzVentilatoren.Q){
(__inst__->fbFuVentilator2.Freigabe=__inst__->AnforderungVentilator2);
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
}
}else if((__inst__->fbFuVentilator1.Freigabe^1)){
(__inst__->fbFuVentilator2.Freigabe=__inst__->AnforderungVentilator2);
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
if(__inst__->TON_AnlaufverzVentilatoren.Q){
(__inst__->fbFuVentilator1.Freigabe=__inst__->AnforderungVentilator1);
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
}
}else{
(__inst__->fbFuVentilator1.Freigabe=__inst__->AnforderungVentilator1);
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
if(__inst__->TON_AnlaufverzVentilatoren.Q){
(__inst__->fbFuVentilator2.Freigabe=__inst__->AnforderungVentilator2);
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
}
}
}


(__inst__->RestAnlaufverzoegerung=(__inst__->AnlaufverzZweiterVent-(unsigned long)__inst__->TON_AnlaufverzVentilatoren.ET));
(__inst__->AnlaufverzVent1Aktiv=(__inst__->AnforderungVentilator1&((__inst__->fbFuVentilator1.SollDrehzahl!=__inst__->DrehzahlVent1Betrieb))));
(__inst__->AnlaufverzVent2Aktiv=(__inst__->AnforderungVentilator2&((__inst__->fbFuVentilator2.SollDrehzahl!=__inst__->DrehzahlVent2Betrieb))));




if(((__inst__->AnforderungVentilator1^1)&(__inst__->AnforderungVentilator2^1))){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);

}else if((__inst__->loc_UmschaltungErforderlVent1|__inst__->loc_UmschaltungErforderlVent2)){
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=2);
}



}break;case 2:{



if(__inst__->stateEntry){
(__inst__->stateEntry=0);
(__inst__->UmschaltungAktiv=1);
if((__inst__->loc_UmschaltungErforderlVent1&__inst__->loc_UmschaltungErforderlVent2)){
(__inst__->TON_AnlaufverzVentilatoren.IN=0);;(__inst__->TON_AnlaufverzVentilatoren.PT=0);;TON(&__inst__->TON_AnlaufverzVentilatoren);
}


















}





if((__inst__->AnforderungVentilator1^1)){
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Min);
if((((__inst__->fbFuVentilator1.DrehzahlFU<=__inst__->DrehzahlVent1Min))&(__inst__->AnforderungVentilator1^1))){
(__inst__->fbFuVentilator1.Freigabe=0);
}
}

if((__inst__->AnforderungVentilator2^1)){
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Min);
if((((__inst__->fbFuVentilator2.DrehzahlFU<=__inst__->DrehzahlVent2Min))&(__inst__->AnforderungVentilator2^1))){
(__inst__->fbFuVentilator2.Freigabe=0);
}
}


if((__inst__->LuftaufbereitungInBetrieb&__inst__->loc_UmschaltungErforderlVent1)){
if(((__inst__->DrehzahlVent1Betrieb>__inst__->DrzVent1UmschMitLuftaufb))){
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrzVent1UmschMitLuftaufb);
}else{
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
}
}else if(__inst__->loc_UmschaltungErforderlVent1){
if(((__inst__->DrehzahlVent1Betrieb>__inst__->DrehzahlVent1Umsch))){
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Umsch);
}else{
(__inst__->fbFuVentilator1.SollDrehzahl=__inst__->DrehzahlVent1Betrieb);
}
}


if((__inst__->LuftaufbereitungInBetrieb&__inst__->loc_UmschaltungErforderlVent2)){
if(((__inst__->DrehzahlVent2Betrieb>__inst__->DrzVent2UmschMitLuftaufb))){
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrzVent2UmschMitLuftaufb);
}else{
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
}
}else if(__inst__->loc_UmschaltungErforderlVent2){
if(((__inst__->DrehzahlVent2Betrieb>__inst__->DrehzahlVent2Umsch))){
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Umsch);
}else{
(__inst__->fbFuVentilator2.SollDrehzahl=__inst__->DrehzahlVent2Betrieb);
}
}


if(((__inst__->fbFuVentilator1.DrehzahlFU<=__inst__->DrehzahlVent1Min))){
(__inst__->fbFuVentilator1.Freigabe=0);
}

if(((__inst__->fbFuVentilator2.DrehzahlFU<=__inst__->DrehzahlVent2Min))){
(__inst__->fbFuVentilator2.Freigabe=0);
}




if(((((__inst__->fbFuVentilator1.DrehzahlFU<=__inst__->fbFuVentilator1.SollDrehzahl))|(__inst__->loc_UmschaltungErforderlVent1^1))&(((__inst__->fbFuVentilator2.DrehzahlFU<=__inst__->fbFuVentilator2.SollDrehzahl))|(__inst__->loc_UmschaltungErforderlVent2^1)))){
(__inst__->Bypassklappe.Oeffnen=__inst__->BypassklappeOeffnen);
(__inst__->Bypassklappe.Schliessen=__inst__->BypassklappeSchliessen);
(__inst__->Umschaltklappe1.Oeffnen=__inst__->Umschaltkl1Oeffnen);
(__inst__->Umschaltklappe1.Schliessen=__inst__->Umschaltkl1Schliessen);
(__inst__->Umschaltklappe2.Oeffnen=__inst__->Umschaltkl2Oeffnen);
(__inst__->Umschaltklappe2.Schliessen=__inst__->Umschaltkl2Schliessen);
(__inst__->Boxenklappe1.Oeffnen=__inst__->Boxenklappe1Oeffnen);
(__inst__->Boxenklappe1.Schliessen=__inst__->Boxenklappe1Schliessen);
(__inst__->Boxenklappe2.Oeffnen=__inst__->Boxenklappe2Oeffnen);
(__inst__->Boxenklappe2.Schliessen=__inst__->Boxenklappe2Schliessen);
(__inst__->Boxenklappe3.Oeffnen=__inst__->Boxenklappe3Oeffnen);
(__inst__->Boxenklappe3.Schliessen=__inst__->Boxenklappe3Schliessen);
(__inst__->Boxenklappe4.Oeffnen=__inst__->Boxenklappe4Oeffnen);
(__inst__->Boxenklappe4.Schliessen=__inst__->Boxenklappe4Schliessen);
(__inst__->Boxenklappe5.Oeffnen=__inst__->Boxenklappe5Oeffnen);
(__inst__->Boxenklappe5.Schliessen=__inst__->Boxenklappe5Schliessen);
(__inst__->Boxenklappe6.Oeffnen=__inst__->Boxenklappe6Oeffnen);
(__inst__->Boxenklappe6.Schliessen=__inst__->Boxenklappe6Schliessen);
}




if(((__inst__->loc_UmschaltungErforderlVent1^1)&(__inst__->loc_UmschaltungErforderlVent2^1))){
(__inst__->UmschaltungAktiv=0);
(__inst__->stateEntry=1);
(__inst__->lastStep=__inst__->curStep);
(__inst__->nextStep=0);
}


}break;}

}else{

(__inst__->BypassOeffnenOut=0);
(__inst__->BypassSchliessenOut=0);
(__inst__->Umschaltkl1OeffnenOut=0);
(__inst__->Umschaltkl1SchliessenOut=0);
(__inst__->Umschaltkl2OeffnenOut=0);
(__inst__->Umschaltkl2SchliessenOut=0);
(__inst__->Boxenklappe1OeffnenOut=0);
(__inst__->Boxenklappe1SchliessenOut=0);
(__inst__->Boxenklappe2OeffnenOut=0);
(__inst__->Boxenklappe2SchliessenOut=0);
(__inst__->Boxenklappe3OeffnenOut=0);
(__inst__->Boxenklappe3SchliessenOut=0);
(__inst__->Boxenklappe4OeffnenOut=0);
(__inst__->Boxenklappe4SchliessenOut=0);
(__inst__->Boxenklappe5OeffnenOut=0);
(__inst__->Boxenklappe5SchliessenOut=0);
(__inst__->Boxenklappe6OeffnenOut=0);
(__inst__->Boxenklappe6SchliessenOut=0);
(__inst__->FreigabeVentilator1Out=0);
(__inst__->FreigabeVentilator2Out=0);
(__inst__->DrehzahlVent1Out=(0.00000000000000000000E+00));
(__inst__->DrehzahlVent2Out=(0.00000000000000000000E+00));
(__inst__->stateEntry=1);
(__inst__->curStep=0);
(__inst__->nextStep=0);
(__inst__->lastStep=0);
(__inst__->FehlerLaufzeitBypass=0);
(__inst__->FehlerLaufzeitKlappeBox1=0);
(__inst__->FehlerLaufzeitKlappeBox2=0);
(__inst__->FehlerLaufzeitKlappeBox3=0);
(__inst__->FehlerLaufzeitKlappeBox4=0);
(__inst__->FehlerLaufzeitKlappeBox5=0);
(__inst__->FehlerLaufzeitKlappeBox6=0);
(__inst__->FehlerLaufzeitUmschaltkl1=0);
(__inst__->FehlerLaufzeitUmschaltkl2=0);
(__inst__->FehlerFuVentilator1=0);
(__inst__->FehlerFuVentilator2=0);
(__inst__->UmschaltungAktiv=0);

(__inst__->fbFuVentilator1.Reset=1);
fbLascoFU(&__inst__->fbFuVentilator1);

(__inst__->fbFuVentilator2.Reset=1);
fbLascoFU(&__inst__->fbFuVentilator2);

(__inst__->Bypassklappe.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Bypassklappe);

(__inst__->Umschaltklappe1.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Umschaltklappe1);

(__inst__->Umschaltklappe2.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Umschaltklappe2);

(__inst__->Boxenklappe1.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe1);

(__inst__->Boxenklappe2.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe2);

(__inst__->Boxenklappe3.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe3);

(__inst__->Boxenklappe4.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe4);

(__inst__->Boxenklappe5.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe5);

(__inst__->Boxenklappe6.QuitFehler=1);
fbBoxenKlappenanst(&__inst__->Boxenklappe6);

}



}imp1_end0_0:;}
#line 684 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenVentKlappen.nodebug"

void __AS__ImplInitfbBoxenVentKlappen_st(void){}

__asm__(".section \".plc\"");
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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoBoxen/fbBoxenVentKlappen.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_07/4PPC30_0702_21B/LascoBoxen/fbBoxenVentKlappen.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenVentKlappen.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenKonfig\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenVentKlappen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenKlappenanst\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenAbluftkl\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenAbluftvent\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenUmschaltung\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenWLO\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenHeizreg\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenNotstrom\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenSHO\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbBoxenLuftmengen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbRestzeit\\\" FUB\\n\"");
__asm__(".previous");
