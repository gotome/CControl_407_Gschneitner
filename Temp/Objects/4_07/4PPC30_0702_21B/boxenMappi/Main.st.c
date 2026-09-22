#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/boxenMappi/Mainst.h"
#line 1 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.nodebug"
#line 2 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.st"
void __BUR__ENTRY_INIT_FUNCT__(void){{


}}
#line 5 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.nodebug"
#line 7 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{


(Boxen.StundeAktuell=Echtzeit.Stunde);
(Boxen.MehrereBoxenBelueftbar=Betriebsparameter.Ausstattung.MehrereBoxenBelueftbar);
(Boxen.AlleKlappenSchliessenWennAus=Betriebsparameter.Ausstattung.AlleBoxenklSchliessenWennAus);
(Boxen.BoxenklVonBeidenVentAbhaengig=Betriebsparameter.Ausstattung.BeideVentAusBeiUmschBoxenkl);
(Boxen.BypassklVonBeidenVentAbhaengig=Betriebsparameter.Ausstattung.BeideVentAusBeiUmschBypasskl);
(Boxen.WarmluftofenNochAktiv=Aktoren.Warmluftofen.WarmluftofenAktiv);
(Boxen.ScheitholzofenNochAktiv=Aktoren.Scheitholzofen.ScheitholzofenAktiv);
(Boxen.EntfeuchterNochAktiv=((((unsigned long)(unsigned char)Aktoren.KompressorModul1.curStep!=(unsigned long)(unsigned char)0))|(((unsigned long)(unsigned char)Aktoren.KompressorModul2.curStep!=(unsigned long)(unsigned char)0))|Aktoren.EntfeuchterFremd.BetriebsmldgEntfeuchter));
(Boxen.AnfEntfeuchterExtern=diAnfEntfeuchterExtern);
(Boxen.EntfeuchterInselbetrieb=(Betriebsparameter.Ausstattung.Ventilator1^1));
(Boxen.TasteEntfeuchterEinInselbetrieb=hmiActions.cmdInselbetriebEntfeuchterEin);


(Aktoren.VentUndKlappen.Boxenklappe1Oeffnen=Boxen.FreigabeKlappe1Out);
(Aktoren.VentUndKlappen.Boxenklappe1Schliessen=(Boxen.FreigabeKlappe1Out^1));
(Aktoren.VentUndKlappen.Boxenklappe2Oeffnen=Boxen.FreigabeKlappe2Out);
(Aktoren.VentUndKlappen.Boxenklappe2Schliessen=(Boxen.FreigabeKlappe2Out^1));
(Aktoren.VentUndKlappen.Boxenklappe3Oeffnen=Boxen.FreigabeKlappe3Out);
(Aktoren.VentUndKlappen.Boxenklappe3Schliessen=(Boxen.FreigabeKlappe3Out^1));
(Aktoren.VentUndKlappen.Boxenklappe4Oeffnen=Boxen.FreigabeKlappe4Out);
(Aktoren.VentUndKlappen.Boxenklappe4Schliessen=(Boxen.FreigabeKlappe4Out^1));
(Aktoren.VentUndKlappen.Boxenklappe5Oeffnen=Boxen.FreigabeKlappe5Out);
(Aktoren.VentUndKlappen.Boxenklappe5Schliessen=(Boxen.FreigabeKlappe5Out^1));
(Aktoren.VentUndKlappen.Boxenklappe6Oeffnen=Boxen.FreigabeKlappe6Out);
(Aktoren.VentUndKlappen.Boxenklappe6Schliessen=(Boxen.FreigabeKlappe6Out^1));





(Boxen.Box1In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].DauerbetriebEin);
(Boxen.Box1In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebEin);
(Boxen.Box1In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungEin);


(Boxen.Box1In.WetterIstSchlecht=fbSchlechtwetterBox1.WetterIstSchlecht);



(Boxen.Box1In.LuftaufbIstVerfuegbar=((Boxen.Box1In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box1In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box1In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box1In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box1In.SchlechtwetterPulszeit=fbSchlechtwetterBox1.SchlechtwetterPulszeit);
(Boxen.Box1In.SchlechtwetterPausezeit=fbSchlechtwetterBox1.SchlechtwetterPausezeit);

(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box1In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box1In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);


(Boxen.Box1In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box1In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box1In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box1In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box1In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box1In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box1In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box1In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box1In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box1In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box1In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box1In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(1,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));





(Boxen.Box2In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].DauerbetriebEin);
(Boxen.Box2In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebEin);
(Boxen.Box2In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungEin);


(Boxen.Box2In.WetterIstSchlecht=fbSchlechtwetterBox2.WetterIstSchlecht);



(Boxen.Box2In.LuftaufbIstVerfuegbar=((Boxen.Box2In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box2In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box2In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box2In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box2In.SchlechtwetterPulszeit=fbSchlechtwetterBox2.SchlechtwetterPulszeit);
(Boxen.Box2In.SchlechtwetterPausezeit=fbSchlechtwetterBox2.SchlechtwetterPausezeit);

(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box2In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box2In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);


(Boxen.Box2In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box2In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box2In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box2In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box2In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box2In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box2In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box2In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box2In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box2In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box2In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box2In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(2,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));




(Boxen.Box3In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].DauerbetriebEin);
(Boxen.Box3In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebEin);
(Boxen.Box3In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungEin);


(Boxen.Box3In.WetterIstSchlecht=fbSchlechtwetterBox3.WetterIstSchlecht);



(Boxen.Box3In.LuftaufbIstVerfuegbar=((Boxen.Box3In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box3In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box3In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box3In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box3In.SchlechtwetterPulszeit=fbSchlechtwetterBox3.SchlechtwetterPulszeit);
(Boxen.Box3In.SchlechtwetterPausezeit=fbSchlechtwetterBox3.SchlechtwetterPausezeit);

(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box3In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box3In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);


(Boxen.Box3In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box3In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box3In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box3In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box3In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box3In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box3In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box3In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box3In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box3In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box3In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box3In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(3,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));





(Boxen.Box4In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].DauerbetriebEin);
(Boxen.Box4In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebEin);
(Boxen.Box4In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungEin);


(Boxen.Box4In.WetterIstSchlecht=fbSchlechtwetterBox4.WetterIstSchlecht);



(Boxen.Box4In.LuftaufbIstVerfuegbar=((Boxen.Box4In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box4In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box4In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box4In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box4In.SchlechtwetterPulszeit=fbSchlechtwetterBox4.SchlechtwetterPulszeit);
(Boxen.Box4In.SchlechtwetterPausezeit=fbSchlechtwetterBox4.SchlechtwetterPausezeit);

(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box4In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box4In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);



(Boxen.Box4In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box4In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box4In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box4In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box4In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box4In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box4In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box4In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box4In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box4In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box4In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box4In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(4,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));





(Boxen.Box5In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].DauerbetriebEin);
(Boxen.Box5In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebEin);
(Boxen.Box5In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungEin);


(Boxen.Box5In.WetterIstSchlecht=fbSchlechtwetterBox5.WetterIstSchlecht);



(Boxen.Box5In.LuftaufbIstVerfuegbar=((Boxen.Box5In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box5In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box5In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box5In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box5In.SchlechtwetterPulszeit=fbSchlechtwetterBox5.SchlechtwetterPulszeit);
(Boxen.Box5In.SchlechtwetterPausezeit=fbSchlechtwetterBox5.SchlechtwetterPausezeit);

(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box5In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box5In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);


(Boxen.Box5In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box5In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box5In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box5In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box5In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box5In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box5In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box5In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box5In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box5In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box5In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box5In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(5,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));





(Boxen.Box6In.DauerbetriebEin=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].DauerbetriebEin);
(Boxen.Box6In.IntervallbetriebEin=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebEin);
(Boxen.Box6In.NachtrocknungEin=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungEin);


(Boxen.Box6In.WetterIstSchlecht=fbSchlechtwetterBox6.WetterIstSchlecht);



(Boxen.Box6In.LuftaufbIstVerfuegbar=((Boxen.Box6In.Heizregister&(Betriebsparameter.Heizregister.Aus^1))|(Boxen.Box6In.Luftentfeuchter&(Betriebsparameter.Entfeuchter.Aus^1)&(gCmdAnlage.FehlerModul1^1)&(gCmdAnlage.FehlerModul2^1))|(Boxen.Box6In.Scheitholzofen&diScheitholzofenInBetrieb)|(Boxen.Box6In.Warmluftofen&(Betriebsparameter.Warmluftofen.Aus^1)&(alarmFehler[CheckBounds(18,0,49)]^1))));
(Boxen.Box6In.SchlechtwetterPulszeit=fbSchlechtwetterBox6.SchlechtwetterPulszeit);
(Boxen.Box6In.SchlechtwetterPausezeit=fbSchlechtwetterBox6.SchlechtwetterPausezeit);

(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(0,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(1,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(2,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(3,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(4,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(5,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(6,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(7,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(8,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(9,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(10,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(11,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(12,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(13,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(14,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(15,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(16,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(17,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(18,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(19,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(20,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(21,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(22,0,23)]);
(Boxen.Box6In.IntervallbetriebZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].IntervallbetriebZeiten[CheckBounds(23,0,23)]);

(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(0,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(0,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(1,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(1,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(2,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(2,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(3,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(3,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(4,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(4,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(5,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(5,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(6,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(6,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(7,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(7,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(8,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(8,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(9,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(9,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(10,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(10,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(11,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(11,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(12,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(12,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(13,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(13,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(14,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(14,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(15,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(15,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(16,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(16,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(17,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(17,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(18,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(18,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(19,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(19,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(20,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(20,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(21,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(21,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(22,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(22,0,23)]);
(Boxen.Box6In.NachtrocknungZeiten[CheckBounds(23,0,23)]=Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].NachtrocknungZeiten[CheckBounds(23,0,23)]);


(Boxen.Box6In.StellungKlappe1=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe1,0,2));
(Boxen.Box6In.StellungKlappe2=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe2,0,2));
(Boxen.Box6In.StellungKlappe3=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe3,0,2));
(Boxen.Box6In.StellungKlappe4=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe4,0,2));
(Boxen.Box6In.StellungKlappe5=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe5,0,2));
(Boxen.Box6In.StellungKlappe6=CheckRange(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].StellungKlappe6,0,2));


(Boxen.Box6In.Ventilator1=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator1&Betriebsparameter.Ausstattung.Ventilator1));
(Boxen.Box6In.Ventilator2=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Ventilator2&Betriebsparameter.Ausstattung.Ventilator2));
(Boxen.Box6In.Luftentfeuchter=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Luftentfeuchter&(Betriebsparameter.Ausstattung.Entfeuchter|Betriebsparameter.Ausstattung.EntfeuchterFremd)));
(Boxen.Box6In.Warmluftofen=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Warmluftofen&Betriebsparameter.Ausstattung.Warmluftofen));
(Boxen.Box6In.Heizregister=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Heizregister&Betriebsparameter.Ausstattung.Heizregister));
(Boxen.Box6In.Scheitholzofen=(Betriebsparameter.Boxen[CheckBounds(6,1,6)-1].Scheitholzofen&Betriebsparameter.Ausstattung.Scheitholzofen));


}}
#line 535 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.nodebug"
#line 537 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.st"
void _EXIT __BUR__ENTRY_EXIT_FUNCT__(void){{


}}
#line 540 "C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.nodebug"

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
__asm__(".ascii \"iecfile \\\"Logical/IO/boxenMapping/Types.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/IO/boxenMapping/Variables.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/boxenMappi/Main.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl_407_Gschneitner/Temp/Objects/4_07/4PPC30_0702_21B/boxenMappi/Main.st.c\\\" \\\"C:/SharedFolder/CControl_407_Gschneitner/Logical/IO/boxenMapping/Main.st\\\"\\n\"");
__asm__(".previous");
