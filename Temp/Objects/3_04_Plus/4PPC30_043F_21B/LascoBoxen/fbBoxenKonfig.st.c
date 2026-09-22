#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenKonfigst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenKonfig.nodebug"
#line 3 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenKonfig.st"
void fbBoxenKonfig(struct fbBoxenKonfig* inst){struct fbBoxenKonfig* __inst__=inst;{





(__inst__->Box1Out.BoxBereit=(__inst__->Box1In.DauerbetriebEin|__inst__->Box1In.IntervallbetriebEin|__inst__->Box1In.NachtrocknungEin));
(__inst__->Box2Out.BoxBereit=(__inst__->Box2In.DauerbetriebEin|__inst__->Box2In.IntervallbetriebEin|__inst__->Box2In.NachtrocknungEin));
(__inst__->Box3Out.BoxBereit=(__inst__->Box3In.DauerbetriebEin|__inst__->Box3In.IntervallbetriebEin|__inst__->Box3In.NachtrocknungEin));
(__inst__->Box4Out.BoxBereit=(__inst__->Box4In.DauerbetriebEin|__inst__->Box4In.IntervallbetriebEin|__inst__->Box4In.NachtrocknungEin));
(__inst__->Box5Out.BoxBereit=(__inst__->Box5In.DauerbetriebEin|__inst__->Box5In.IntervallbetriebEin|__inst__->Box5In.NachtrocknungEin));
(__inst__->Box6Out.BoxBereit=(__inst__->Box6In.DauerbetriebEin|__inst__->Box6In.IntervallbetriebEin|__inst__->Box6In.NachtrocknungEin));


(__inst__->EntfeuchterInselbetrAktivOut=(__inst__->EntfeuchterInselbetrieb&__inst__->TasteEntfeuchterEinInselbetrieb));
(__inst__->FreigabeEntfeuchterInselbetrieb=(__inst__->AnfEntfeuchterExtern&__inst__->EntfeuchterInselbetrAktivOut));









(__inst__->fbPugeSchlechtwetterBox1.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox1.StartMitPuls=(__inst__->Box1In.DauerbetriebEin&__inst__->Box1In.WetterIstSchlecht&(__inst__->Box1In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox1.ZeitPuls=__inst__->Box1In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox1.ZeitPause=__inst__->Box1In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox1);
(__inst__->Box1Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox1.RestzeitPuls);
(__inst__->Box1Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox1.RestzeitPause);


(__inst__->fbPugeSchlechtwetterBox2.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox2.StartMitPuls=(__inst__->Box2In.DauerbetriebEin&__inst__->Box2In.WetterIstSchlecht&(__inst__->Box2In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox2.ZeitPuls=__inst__->Box2In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox2.ZeitPause=__inst__->Box2In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox2);
(__inst__->Box2Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox2.RestzeitPuls);
(__inst__->Box2Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox2.RestzeitPause);


(__inst__->fbPugeSchlechtwetterBox3.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox3.StartMitPuls=(__inst__->Box3In.DauerbetriebEin&__inst__->Box3In.WetterIstSchlecht&(__inst__->Box3In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox3.ZeitPuls=__inst__->Box3In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox3.ZeitPause=__inst__->Box3In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox3);
(__inst__->Box3Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox3.RestzeitPuls);
(__inst__->Box3Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox3.RestzeitPause);


(__inst__->fbPugeSchlechtwetterBox4.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox4.StartMitPuls=(__inst__->Box4In.DauerbetriebEin&__inst__->Box4In.WetterIstSchlecht&(__inst__->Box4In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox4.ZeitPuls=__inst__->Box4In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox4.ZeitPause=__inst__->Box4In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox4);
(__inst__->Box4Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox4.RestzeitPuls);
(__inst__->Box4Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox4.RestzeitPause);


(__inst__->fbPugeSchlechtwetterBox5.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox5.StartMitPuls=(__inst__->Box5In.DauerbetriebEin&__inst__->Box5In.WetterIstSchlecht&(__inst__->Box5In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox5.ZeitPuls=__inst__->Box5In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox5.ZeitPause=__inst__->Box5In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox5);
(__inst__->Box5Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox5.RestzeitPuls);
(__inst__->Box5Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox5.RestzeitPause);


(__inst__->fbPugeSchlechtwetterBox6.StartMitPause=0);
(__inst__->fbPugeSchlechtwetterBox6.StartMitPuls=(__inst__->Box6In.DauerbetriebEin&__inst__->Box6In.WetterIstSchlecht&(__inst__->Box6In.LuftaufbIstVerfuegbar^1)));
(__inst__->fbPugeSchlechtwetterBox6.ZeitPuls=__inst__->Box6In.SchlechtwetterPulszeit);
(__inst__->fbPugeSchlechtwetterBox6.ZeitPause=__inst__->Box6In.SchlechtwetterPausezeit);
fbLascoPugeV2(&__inst__->fbPugeSchlechtwetterBox6);
(__inst__->Box6Out.RestzeitSchlechtwetterPuls=__inst__->fbPugeSchlechtwetterBox6.RestzeitPuls);
(__inst__->Box6Out.RestzeitSchlechtwetterPause=__inst__->fbPugeSchlechtwetterBox6.RestzeitPause);








if(__inst__->MehrereBoxenBelueftbar){



(__inst__->Box1Out.BoxAktiv=((__inst__->Box1In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox1.PauseOut^1))|(__inst__->Box1In.DauerbetriebEin&(((unsigned long)__inst__->Box1In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box1In.IntervallbetriebEin&__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



(__inst__->Box2Out.BoxAktiv=((__inst__->Box2In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox2.PauseOut^1))|(__inst__->Box2In.DauerbetriebEin&(((unsigned long)__inst__->Box2In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box2In.IntervallbetriebEin&__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



(__inst__->Box3Out.BoxAktiv=((__inst__->Box3In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox3.PauseOut^1))|(__inst__->Box3In.DauerbetriebEin&(((unsigned long)__inst__->Box3In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box3In.IntervallbetriebEin&__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



(__inst__->Box4Out.BoxAktiv=((__inst__->Box4In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox4.PauseOut^1))|(__inst__->Box4In.DauerbetriebEin&(((unsigned long)__inst__->Box4In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box4In.IntervallbetriebEin&__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



(__inst__->Box5Out.BoxAktiv=((__inst__->Box5In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox5.PauseOut^1))|(__inst__->Box5In.DauerbetriebEin&(((unsigned long)__inst__->Box5In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box5In.IntervallbetriebEin&__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



(__inst__->Box6Out.BoxAktiv=((__inst__->Box6In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox6.PauseOut^1))|(__inst__->Box6In.DauerbetriebEin&(((unsigned long)__inst__->Box6In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box6In.IntervallbetriebEin&__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])|(__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)])));



}else{





if(((__inst__->Box1In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox1.PauseOut^1))|(__inst__->Box1In.DauerbetriebEin&(((unsigned long)__inst__->Box1In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box1In.IntervallbetriebEin&__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box2GleicherLuefterkreis=((__inst__->Box1In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box2In.Ventilator2)));
(__inst__->loc_Box3GleicherLuefterkreis=((__inst__->Box1In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box3In.Ventilator2)));
(__inst__->loc_Box4GleicherLuefterkreis=((__inst__->Box1In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box4In.Ventilator2)));
(__inst__->loc_Box5GleicherLuefterkreis=((__inst__->Box1In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box5In.Ventilator2)));
(__inst__->loc_Box6GleicherLuefterkreis=((__inst__->Box1In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box6In.Ventilator2)));





(__inst__->Box1Out.BoxAktiv=(((__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box2GleicherLuefterkreis)^1)&((__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box3GleicherLuefterkreis)^1)&((__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box4GleicherLuefterkreis)^1)&((__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box5GleicherLuefterkreis)^1)&((__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box6GleicherLuefterkreis)^1)));

}else{
(__inst__->Box1Out.BoxAktiv=(__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}






if(((__inst__->Box2In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox2.PauseOut^1))|(__inst__->Box2In.DauerbetriebEin&(((unsigned long)__inst__->Box2In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box2In.IntervallbetriebEin&__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box1GleicherLuefterkreis=((__inst__->Box2In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box1In.Ventilator2)));
(__inst__->loc_Box3GleicherLuefterkreis=((__inst__->Box2In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box3In.Ventilator2)));
(__inst__->loc_Box4GleicherLuefterkreis=((__inst__->Box2In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box4In.Ventilator2)));
(__inst__->loc_Box5GleicherLuefterkreis=((__inst__->Box2In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box5In.Ventilator2)));
(__inst__->loc_Box6GleicherLuefterkreis=((__inst__->Box2In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box6In.Ventilator2)));





(__inst__->Box2Out.BoxAktiv=(((__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box1GleicherLuefterkreis)^1)&((__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box3GleicherLuefterkreis)^1)&((__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box4GleicherLuefterkreis)^1)&((__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box5GleicherLuefterkreis)^1)&((__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box6GleicherLuefterkreis)^1)));

}else{
(__inst__->Box2Out.BoxAktiv=(__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}






if(((__inst__->Box3In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox3.PauseOut^1))|(__inst__->Box3In.DauerbetriebEin&(((unsigned long)__inst__->Box3In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box3In.IntervallbetriebEin&__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box1GleicherLuefterkreis=((__inst__->Box3In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box1In.Ventilator2)));
(__inst__->loc_Box2GleicherLuefterkreis=((__inst__->Box3In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box2In.Ventilator2)));
(__inst__->loc_Box4GleicherLuefterkreis=((__inst__->Box3In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box4In.Ventilator2)));
(__inst__->loc_Box5GleicherLuefterkreis=((__inst__->Box3In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box5In.Ventilator2)));
(__inst__->loc_Box6GleicherLuefterkreis=((__inst__->Box3In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box6In.Ventilator2)));





(__inst__->Box3Out.BoxAktiv=(((__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box1GleicherLuefterkreis)^1)&((__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box2GleicherLuefterkreis)^1)&((__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box4GleicherLuefterkreis)^1)&((__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box5GleicherLuefterkreis)^1)&((__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box6GleicherLuefterkreis)^1)));

}else{
(__inst__->Box3Out.BoxAktiv=(__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}






if(((__inst__->Box4In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox4.PauseOut^1))|(__inst__->Box4In.DauerbetriebEin&(((unsigned long)__inst__->Box4In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box4In.IntervallbetriebEin&__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box1GleicherLuefterkreis=((__inst__->Box4In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box1In.Ventilator2)));
(__inst__->loc_Box2GleicherLuefterkreis=((__inst__->Box4In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box2In.Ventilator2)));
(__inst__->loc_Box3GleicherLuefterkreis=((__inst__->Box4In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box3In.Ventilator2)));
(__inst__->loc_Box5GleicherLuefterkreis=((__inst__->Box4In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box5In.Ventilator2)));
(__inst__->loc_Box6GleicherLuefterkreis=((__inst__->Box4In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box6In.Ventilator2)));





(__inst__->Box4Out.BoxAktiv=(((__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box1GleicherLuefterkreis)^1)&((__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box2GleicherLuefterkreis)^1)&((__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box3GleicherLuefterkreis)^1)&((__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box5GleicherLuefterkreis)^1)&((__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box6GleicherLuefterkreis)^1)));

}else{
(__inst__->Box4Out.BoxAktiv=(__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}






if(((__inst__->Box5In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox5.PauseOut^1))|(__inst__->Box5In.DauerbetriebEin&(((unsigned long)__inst__->Box5In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box5In.IntervallbetriebEin&__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box1GleicherLuefterkreis=((__inst__->Box5In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box1In.Ventilator2)));
(__inst__->loc_Box2GleicherLuefterkreis=((__inst__->Box5In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box2In.Ventilator2)));
(__inst__->loc_Box3GleicherLuefterkreis=((__inst__->Box5In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box3In.Ventilator2)));
(__inst__->loc_Box4GleicherLuefterkreis=((__inst__->Box5In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box4In.Ventilator2)));
(__inst__->loc_Box6GleicherLuefterkreis=((__inst__->Box5In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box6In.Ventilator2)));





(__inst__->Box5Out.BoxAktiv=(((__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box1GleicherLuefterkreis)^1)&((__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box2GleicherLuefterkreis)^1)&((__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box3GleicherLuefterkreis)^1)&((__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box4GleicherLuefterkreis)^1)&((__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box6GleicherLuefterkreis)^1)));

}else{
(__inst__->Box5Out.BoxAktiv=(__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}






if(((__inst__->Box6In.DauerbetriebEin&(__inst__->fbPugeSchlechtwetterBox6.PauseOut^1))|(__inst__->Box6In.DauerbetriebEin&(((unsigned long)__inst__->Box6In.SchlechtwetterPausezeit==(unsigned long)0)))|(__inst__->Box6In.IntervallbetriebEin&__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]))){
(__inst__->loc_Box1GleicherLuefterkreis=((__inst__->Box6In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box1In.Ventilator2)));
(__inst__->loc_Box2GleicherLuefterkreis=((__inst__->Box6In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box2In.Ventilator2)));
(__inst__->loc_Box3GleicherLuefterkreis=((__inst__->Box6In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box3In.Ventilator2)));
(__inst__->loc_Box4GleicherLuefterkreis=((__inst__->Box6In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box4In.Ventilator2)));
(__inst__->loc_Box5GleicherLuefterkreis=((__inst__->Box6In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box5In.Ventilator2)));





(__inst__->Box6Out.BoxAktiv=(((__inst__->Box1In.NachtrocknungEin&__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box1GleicherLuefterkreis)^1)&((__inst__->Box2In.NachtrocknungEin&__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box2GleicherLuefterkreis)^1)&((__inst__->Box3In.NachtrocknungEin&__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box3GleicherLuefterkreis)^1)&((__inst__->Box4In.NachtrocknungEin&__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box4GleicherLuefterkreis)^1)&((__inst__->Box5In.NachtrocknungEin&__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]&__inst__->loc_Box5GleicherLuefterkreis)^1)));

}else{
(__inst__->Box6Out.BoxAktiv=(__inst__->Box6In.NachtrocknungEin&__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->StundeAktuell,0,23)]));
}


}









if(__inst__->MehrereBoxenBelueftbar){





if((((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)){
if((((signed long)__inst__->Box1In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box1In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}






if((((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)){
if((((signed long)__inst__->Box2In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box2In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}





if((((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)){
if((((signed long)__inst__->Box3In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box3In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}






if((((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)){
if((((signed long)__inst__->Box4In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box4In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}






if((((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)){
if((((signed long)__inst__->Box5In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box5In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}






if((((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=1);
}else{
(__inst__->FreigabeKlappe1Out=0);
}
}
}


if((((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=1);
}else{
(__inst__->FreigabeKlappe2Out=0);
}
}
}


if((((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=1);
}else{
(__inst__->FreigabeKlappe3Out=0);
}
}
}


if((((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=1);
}else{
(__inst__->FreigabeKlappe4Out=0);
}
}
}


if((((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=1);
}else{
(__inst__->FreigabeKlappe5Out=0);
}
}
}


if((((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0))){
if((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)){
if((((signed long)__inst__->Box6In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}else{
if((((signed long)__inst__->Box6In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=1);
}else{
(__inst__->FreigabeKlappe6Out=0);
}
}
}




}else{



if(((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)&__inst__->Box1In.Ventilator1)){


if((((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)&__inst__->Box2In.Ventilator1)){



if((((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)&__inst__->Box3In.Ventilator1)){



if((((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)&__inst__->Box4In.Ventilator1)){



if((((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)&__inst__->Box5In.Ventilator1)){



if((((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)&__inst__->Box6In.Ventilator1)){



if((((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(__inst__->AlleKlappenSchliessenWennAus){


if(__inst__->Box1In.Ventilator1){

if((((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box2In.Ventilator1){

if((((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box3In.Ventilator1){

if((((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box4In.Ventilator1){

if((((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box5In.Ventilator1){

if((((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box6In.Ventilator1){

if((((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}
}




if(((__inst__->Box1Out.BoxAktiv|__inst__->NotbetriebBox1)&__inst__->Box1In.Ventilator2)){


if((((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box1In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box2Out.BoxAktiv|__inst__->NotbetriebBox2)&__inst__->Box2In.Ventilator2)){



if((((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box2In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box3Out.BoxAktiv|__inst__->NotbetriebBox3)&__inst__->Box3In.Ventilator2)){



if((((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box3In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box4Out.BoxAktiv|__inst__->NotbetriebBox4)&__inst__->Box4In.Ventilator2)){



if((((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box4In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box5Out.BoxAktiv|__inst__->NotbetriebBox5)&__inst__->Box5In.Ventilator2)){



if((((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box5In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}




}else if(((__inst__->Box6Out.BoxAktiv|__inst__->NotbetriebBox6)&__inst__->Box6In.Ventilator2)){



if((((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe1==(signed long)1))){
(__inst__->FreigabeKlappe1Out=0);
}else{
(__inst__->FreigabeKlappe1Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe2==(signed long)1))){
(__inst__->FreigabeKlappe2Out=0);
}else{
(__inst__->FreigabeKlappe2Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe3==(signed long)1))){
(__inst__->FreigabeKlappe3Out=0);
}else{
(__inst__->FreigabeKlappe3Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe4==(signed long)1))){
(__inst__->FreigabeKlappe4Out=0);
}else{
(__inst__->FreigabeKlappe4Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe5==(signed long)1))){
(__inst__->FreigabeKlappe5Out=0);
}else{
(__inst__->FreigabeKlappe5Out=1);
}
}


if((((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0))){
if((((signed long)__inst__->Box6In.StellungKlappe6==(signed long)1))){
(__inst__->FreigabeKlappe6Out=0);
}else{
(__inst__->FreigabeKlappe6Out=1);
}
}



}else if(__inst__->AlleKlappenSchliessenWennAus){


if(__inst__->Box1In.Ventilator2){

if((((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box2In.Ventilator2){

if((((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box3In.Ventilator2){

if((((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box4In.Ventilator2){

if((((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box5In.Ventilator2){

if((((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}


if(__inst__->Box6In.Ventilator2){

if((((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0))){
(__inst__->FreigabeKlappe1Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0))){
(__inst__->FreigabeKlappe2Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0))){
(__inst__->FreigabeKlappe3Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0))){
(__inst__->FreigabeKlappe4Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0))){
(__inst__->FreigabeKlappe5Out=0);
}

if((((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0))){
(__inst__->FreigabeKlappe6Out=0);
}
}
}


}








(__inst__->FreigabeVentilator1=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Ventilator1)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Ventilator1)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Ventilator1)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Ventilator1)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Ventilator1)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Ventilator1)));



(__inst__->FreigabeVentilator2=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Ventilator2)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Ventilator2)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Ventilator2)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Ventilator2)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Ventilator2)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Ventilator2)));



(__inst__->NotbetriebVentilator1=((__inst__->NotbetriebBox1&__inst__->Box1In.Ventilator1)|(__inst__->NotbetriebBox2&__inst__->Box2In.Ventilator1)|(__inst__->NotbetriebBox3&__inst__->Box3In.Ventilator1)|(__inst__->NotbetriebBox4&__inst__->Box4In.Ventilator1)|(__inst__->NotbetriebBox5&__inst__->Box5In.Ventilator1)|(__inst__->NotbetriebBox6&__inst__->Box6In.Ventilator1)));



(__inst__->NotbetriebVentilator2=((__inst__->NotbetriebBox1&__inst__->Box1In.Ventilator2)|(__inst__->NotbetriebBox2&__inst__->Box2In.Ventilator2)|(__inst__->NotbetriebBox3&__inst__->Box3In.Ventilator2)|(__inst__->NotbetriebBox4&__inst__->Box4In.Ventilator2)|(__inst__->NotbetriebBox5&__inst__->Box5In.Ventilator2)|(__inst__->NotbetriebBox6&__inst__->Box6In.Ventilator2)));



(__inst__->FreigabeLuftentfeuchter=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Luftentfeuchter)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Luftentfeuchter)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Luftentfeuchter)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Luftentfeuchter)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Luftentfeuchter)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Luftentfeuchter)));



(__inst__->FreigabeWarmluftofen=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Warmluftofen)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Warmluftofen)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Warmluftofen)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Warmluftofen)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Warmluftofen)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Warmluftofen)));



(__inst__->FreigabeHeizregister=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Heizregister)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Heizregister)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Heizregister)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Heizregister)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Heizregister)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Heizregister)));



(__inst__->FreigabeScheitholzofen=((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Scheitholzofen)|(__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Scheitholzofen)|(__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Scheitholzofen)|(__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Scheitholzofen)|(__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Scheitholzofen)|(__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Scheitholzofen)));








(__inst__->EntfeuchterVonVent1Abhaengig=((__inst__->Box1In.Ventilator1&__inst__->Box1In.Luftentfeuchter)|(__inst__->Box2In.Ventilator1&__inst__->Box2In.Luftentfeuchter)|(__inst__->Box3In.Ventilator1&__inst__->Box3In.Luftentfeuchter)|(__inst__->Box4In.Ventilator1&__inst__->Box4In.Luftentfeuchter)|(__inst__->Box5In.Ventilator1&__inst__->Box5In.Luftentfeuchter)|(__inst__->Box6In.Ventilator1&__inst__->Box6In.Luftentfeuchter)));



(__inst__->EntfeuchterVonVent2Abhaengig=((__inst__->Box1In.Ventilator2&__inst__->Box1In.Luftentfeuchter)|(__inst__->Box2In.Ventilator2&__inst__->Box2In.Luftentfeuchter)|(__inst__->Box3In.Ventilator2&__inst__->Box3In.Luftentfeuchter)|(__inst__->Box4In.Ventilator2&__inst__->Box4In.Luftentfeuchter)|(__inst__->Box5In.Ventilator2&__inst__->Box5In.Luftentfeuchter)|(__inst__->Box6In.Ventilator2&__inst__->Box6In.Luftentfeuchter)));



(__inst__->WarmluftofenVonVent1Abhaengig=((__inst__->Box1In.Ventilator1&__inst__->Box1In.Warmluftofen)|(__inst__->Box2In.Ventilator1&__inst__->Box2In.Warmluftofen)|(__inst__->Box3In.Ventilator1&__inst__->Box3In.Warmluftofen)|(__inst__->Box4In.Ventilator1&__inst__->Box4In.Warmluftofen)|(__inst__->Box5In.Ventilator1&__inst__->Box5In.Warmluftofen)|(__inst__->Box6In.Ventilator1&__inst__->Box6In.Warmluftofen)));



(__inst__->ScheitholzofenVonVent1Abhaengig=((__inst__->Box1In.Ventilator1&__inst__->Box1In.Scheitholzofen)|(__inst__->Box2In.Ventilator1&__inst__->Box2In.Scheitholzofen)|(__inst__->Box3In.Ventilator1&__inst__->Box3In.Scheitholzofen)|(__inst__->Box4In.Ventilator1&__inst__->Box4In.Scheitholzofen)|(__inst__->Box5In.Ventilator1&__inst__->Box5In.Scheitholzofen)|(__inst__->Box6In.Ventilator1&__inst__->Box6In.Scheitholzofen)));



(__inst__->WarmluftofenVonVent2Abhaengig=((__inst__->Box1In.Ventilator2&__inst__->Box1In.Warmluftofen)|(__inst__->Box2In.Ventilator2&__inst__->Box2In.Warmluftofen)|(__inst__->Box3In.Ventilator2&__inst__->Box3In.Warmluftofen)|(__inst__->Box4In.Ventilator2&__inst__->Box4In.Warmluftofen)|(__inst__->Box5In.Ventilator2&__inst__->Box5In.Warmluftofen)|(__inst__->Box6In.Ventilator2&__inst__->Box6In.Warmluftofen)));



(__inst__->ScheitholzofenVonVent2Abhaengig=((__inst__->Box1In.Ventilator2&__inst__->Box1In.Scheitholzofen)|(__inst__->Box2In.Ventilator2&__inst__->Box2In.Scheitholzofen)|(__inst__->Box3In.Ventilator2&__inst__->Box3In.Scheitholzofen)|(__inst__->Box4In.Ventilator2&__inst__->Box4In.Scheitholzofen)|(__inst__->Box5In.Ventilator2&__inst__->Box5In.Scheitholzofen)|(__inst__->Box6In.Ventilator2&__inst__->Box6In.Scheitholzofen)));



(__inst__->HeizregisterVonVent1Abhaengig=((__inst__->Box1In.Ventilator1&__inst__->Box1In.Heizregister)|(__inst__->Box2In.Ventilator1&__inst__->Box2In.Heizregister)|(__inst__->Box3In.Ventilator1&__inst__->Box3In.Heizregister)|(__inst__->Box4In.Ventilator1&__inst__->Box4In.Heizregister)|(__inst__->Box5In.Ventilator1&__inst__->Box5In.Heizregister)|(__inst__->Box6In.Ventilator1&__inst__->Box6In.Heizregister)));



(__inst__->HeizregisterVonVent2Abhaengig=((__inst__->Box1In.Ventilator2&__inst__->Box1In.Heizregister)|(__inst__->Box2In.Ventilator2&__inst__->Box2In.Heizregister)|(__inst__->Box3In.Ventilator2&__inst__->Box3In.Heizregister)|(__inst__->Box4In.Ventilator2&__inst__->Box4In.Heizregister)|(__inst__->Box5In.Ventilator2&__inst__->Box5In.Heizregister)|(__inst__->Box6In.Ventilator2&__inst__->Box6In.Heizregister)));




if((__inst__->EntfeuchterNochAktiv&((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Luftentfeuchter)^1)&((__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Luftentfeuchter)^1)&((__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Luftentfeuchter)^1)&((__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Luftentfeuchter)^1)&((__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Luftentfeuchter)^1)&((__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Luftentfeuchter)^1))){

if(__inst__->EntfeuchterVonVent1Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator1&__inst__->Box1In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator1&__inst__->Box2In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator1&__inst__->Box3In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator1&__inst__->Box4In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator1&__inst__->Box5In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator1&__inst__->Box6In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator1&__inst__->Box1In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator1&__inst__->Box2In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator1&__inst__->Box3In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator1&__inst__->Box4In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator1&__inst__->Box5In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator1&__inst__->Box6In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox6=1);
}

}else if(__inst__->EntfeuchterVonVent2Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator2&__inst__->Box1In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator2&__inst__->Box2In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator2&__inst__->Box3In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator2&__inst__->Box4In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator2&__inst__->Box5In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator2&__inst__->Box6In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator2&__inst__->Box1In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator2&__inst__->Box2In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator2&__inst__->Box3In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator2&__inst__->Box4In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator2&__inst__->Box5In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator2&__inst__->Box6In.Luftentfeuchter)){
(__inst__->loc_Entf_NotbetriebBox6=1);
}
}
}else{
(__inst__->loc_Entf_NotbetriebBox1=0);
(__inst__->loc_Entf_NotbetriebBox2=0);
(__inst__->loc_Entf_NotbetriebBox3=0);
(__inst__->loc_Entf_NotbetriebBox4=0);
(__inst__->loc_Entf_NotbetriebBox5=0);
(__inst__->loc_Entf_NotbetriebBox6=0);
}





if((__inst__->WarmluftofenNochAktiv&((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Warmluftofen)^1)&((__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Warmluftofen)^1)&((__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Warmluftofen)^1)&((__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Warmluftofen)^1)&((__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Warmluftofen)^1)&((__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Warmluftofen)^1))){

if(__inst__->WarmluftofenVonVent1Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator1&__inst__->Box1In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator1&__inst__->Box2In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator1&__inst__->Box3In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator1&__inst__->Box4In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator1&__inst__->Box5In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator1&__inst__->Box6In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator1&__inst__->Box1In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator1&__inst__->Box2In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator1&__inst__->Box3In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator1&__inst__->Box4In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator1&__inst__->Box5In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator1&__inst__->Box6In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox6=1);
}

}else if(__inst__->WarmluftofenVonVent2Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator2&__inst__->Box1In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator2&__inst__->Box2In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator2&__inst__->Box3In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator2&__inst__->Box4In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator2&__inst__->Box5In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator2&__inst__->Box6In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator2&__inst__->Box1In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator2&__inst__->Box2In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator2&__inst__->Box3In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator2&__inst__->Box4In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator2&__inst__->Box5In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator2&__inst__->Box6In.Warmluftofen)){
(__inst__->loc_Wlo_NotbetriebBox6=1);
}
}
}else{
(__inst__->loc_Wlo_NotbetriebBox1=0);
(__inst__->loc_Wlo_NotbetriebBox2=0);
(__inst__->loc_Wlo_NotbetriebBox3=0);
(__inst__->loc_Wlo_NotbetriebBox4=0);
(__inst__->loc_Wlo_NotbetriebBox5=0);
(__inst__->loc_Wlo_NotbetriebBox6=0);
}





if((__inst__->ScheitholzofenNochAktiv&((__inst__->Box1Out.BoxAktiv&__inst__->Box1In.Scheitholzofen)^1)&((__inst__->Box2Out.BoxAktiv&__inst__->Box2In.Scheitholzofen)^1)&((__inst__->Box3Out.BoxAktiv&__inst__->Box3In.Scheitholzofen)^1)&((__inst__->Box4Out.BoxAktiv&__inst__->Box4In.Scheitholzofen)^1)&((__inst__->Box5Out.BoxAktiv&__inst__->Box5In.Scheitholzofen)^1)&((__inst__->Box6Out.BoxAktiv&__inst__->Box6In.Scheitholzofen)^1))){

if(__inst__->ScheitholzofenVonVent1Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator1&__inst__->Box1In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator1&__inst__->Box2In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator1&__inst__->Box3In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator1&__inst__->Box4In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator1&__inst__->Box5In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator1&__inst__->Box6In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator1&__inst__->Box1In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator1&__inst__->Box2In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator1&__inst__->Box3In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator1&__inst__->Box4In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator1&__inst__->Box5In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator1&__inst__->Box6In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox6=1);
}

}else if(__inst__->ScheitholzofenVonVent2Abhaengig){

if((__inst__->Box1Out.BoxBereit&__inst__->Box1In.Ventilator2&__inst__->Box1In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox1=1);
}else if((__inst__->Box2Out.BoxBereit&__inst__->Box2In.Ventilator2&__inst__->Box2In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox2=1);
}else if((__inst__->Box3Out.BoxBereit&__inst__->Box3In.Ventilator2&__inst__->Box3In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox3=1);
}else if((__inst__->Box4Out.BoxBereit&__inst__->Box4In.Ventilator2&__inst__->Box4In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox4=1);
}else if((__inst__->Box5Out.BoxBereit&__inst__->Box5In.Ventilator2&__inst__->Box5In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox5=1);
}else if((__inst__->Box6Out.BoxBereit&__inst__->Box6In.Ventilator2&__inst__->Box6In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox6=1);

}else if((__inst__->Box1In.Ventilator2&__inst__->Box1In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox1=1);
}else if((__inst__->Box2In.Ventilator2&__inst__->Box2In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox2=1);
}else if((__inst__->Box3In.Ventilator2&__inst__->Box3In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox3=1);
}else if((__inst__->Box4In.Ventilator2&__inst__->Box4In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox4=1);
}else if((__inst__->Box5In.Ventilator2&__inst__->Box5In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox5=1);
}else if((__inst__->Box6In.Ventilator2&__inst__->Box6In.Scheitholzofen)){
(__inst__->loc_Sho_NotbetriebBox6=1);
}
}
}else{
(__inst__->loc_Sho_NotbetriebBox1=0);
(__inst__->loc_Sho_NotbetriebBox2=0);
(__inst__->loc_Sho_NotbetriebBox3=0);
(__inst__->loc_Sho_NotbetriebBox4=0);
(__inst__->loc_Sho_NotbetriebBox5=0);
(__inst__->loc_Sho_NotbetriebBox6=0);
}


(__inst__->NotbetriebBox1=(__inst__->loc_Entf_NotbetriebBox1|__inst__->loc_Wlo_NotbetriebBox1|__inst__->loc_Sho_NotbetriebBox1));
(__inst__->NotbetriebBox2=(__inst__->loc_Entf_NotbetriebBox2|__inst__->loc_Wlo_NotbetriebBox2|__inst__->loc_Sho_NotbetriebBox2));
(__inst__->NotbetriebBox3=(__inst__->loc_Entf_NotbetriebBox3|__inst__->loc_Wlo_NotbetriebBox3|__inst__->loc_Sho_NotbetriebBox3));
(__inst__->NotbetriebBox4=(__inst__->loc_Entf_NotbetriebBox4|__inst__->loc_Wlo_NotbetriebBox4|__inst__->loc_Sho_NotbetriebBox4));
(__inst__->NotbetriebBox5=(__inst__->loc_Entf_NotbetriebBox5|__inst__->loc_Wlo_NotbetriebBox5|__inst__->loc_Sho_NotbetriebBox5));
(__inst__->NotbetriebBox6=(__inst__->loc_Entf_NotbetriebBox6|__inst__->loc_Wlo_NotbetriebBox6|__inst__->loc_Sho_NotbetriebBox6));







if((__inst__->MehrereBoxenBelueftbar^1)){

(__inst__->Box1Out.DauerbetriebSperre=0);
(__inst__->Box1Out.IntervallbetriebSperre=0);
(__inst__->Box2Out.DauerbetriebSperre=0);
(__inst__->Box2Out.IntervallbetriebSperre=0);
(__inst__->Box3Out.DauerbetriebSperre=0);
(__inst__->Box3Out.IntervallbetriebSperre=0);
(__inst__->Box4Out.DauerbetriebSperre=0);
(__inst__->Box4Out.IntervallbetriebSperre=0);
(__inst__->Box5Out.DauerbetriebSperre=0);
(__inst__->Box5Out.IntervallbetriebSperre=0);
(__inst__->Box6Out.DauerbetriebSperre=0);
(__inst__->Box6Out.IntervallbetriebSperre=0);

__AS__MEMSET(((unsigned long)(&__inst__->Box1Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box2Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box3Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box4Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box5Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box6Out.IntervallbetriebZeitenGesperrt)),0,24);

__AS__MEMSET(((unsigned long)(&__inst__->Box1Out.NachtrocknungZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box2Out.NachtrocknungZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box3Out.NachtrocknungZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box4Out.NachtrocknungZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box5Out.NachtrocknungZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box6Out.NachtrocknungZeitenGesperrt)),0,24);





if(__inst__->Box1In.DauerbetriebEin){
if(((__inst__->Box1In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
(__inst__->Box2Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
(__inst__->Box3Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
(__inst__->Box4Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
(__inst__->Box5Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
(__inst__->Box6Out.IntervallbetriebSperre=1);
}
}


if(__inst__->Box2In.DauerbetriebEin){
if(((__inst__->Box2In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
(__inst__->Box1Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
(__inst__->Box3Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
(__inst__->Box4Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
(__inst__->Box5Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
(__inst__->Box6Out.IntervallbetriebSperre=1);
}
}


if(__inst__->Box3In.DauerbetriebEin){
if(((__inst__->Box3In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
(__inst__->Box1Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
(__inst__->Box2Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
(__inst__->Box4Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
(__inst__->Box5Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
(__inst__->Box6Out.IntervallbetriebSperre=1);
}
}


if(__inst__->Box4In.DauerbetriebEin){
if(((__inst__->Box4In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
(__inst__->Box1Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
(__inst__->Box2Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
(__inst__->Box3Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
(__inst__->Box5Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
(__inst__->Box6Out.IntervallbetriebSperre=1);
}
}


if(__inst__->Box5In.DauerbetriebEin){
if(((__inst__->Box5In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
(__inst__->Box1Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
(__inst__->Box2Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
(__inst__->Box3Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
(__inst__->Box4Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
(__inst__->Box6Out.IntervallbetriebSperre=1);
}
}


if(__inst__->Box6In.DauerbetriebEin){
if(((__inst__->Box6In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
(__inst__->Box1Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
(__inst__->Box2Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
(__inst__->Box3Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
(__inst__->Box4Out.IntervallbetriebSperre=1);
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
(__inst__->Box5Out.IntervallbetriebSperre=1);
}
}





if(__inst__->Box1In.IntervallbetriebEin){
if(((__inst__->Box1In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor433_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor436_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor439_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor442_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor445_0:;
}
}


if(__inst__->Box2In.IntervallbetriebEin){
if(((__inst__->Box2In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor449_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor452_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor455_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor458_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor461_0:;
}
}


if(__inst__->Box3In.IntervallbetriebEin){
if(((__inst__->Box3In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor465_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor468_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor471_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor474_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor477_0:;
}
}


if(__inst__->Box4In.IntervallbetriebEin){
if(((__inst__->Box4In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor481_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor484_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor487_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor490_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor493_0:;
}
}



if(__inst__->Box5In.IntervallbetriebEin){
if(((__inst__->Box5In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor497_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor500_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor503_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor506_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box6In.Ventilator2))){
(__inst__->Box6Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor509_0:;
}
}


if(__inst__->Box6In.IntervallbetriebEin){
if(((__inst__->Box6In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box1In.Ventilator2))){
(__inst__->Box1Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor513_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box2In.Ventilator2))){
(__inst__->Box2Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor516_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box3In.Ventilator2))){
(__inst__->Box3Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor519_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box4In.Ventilator2))){
(__inst__->Box4Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor522_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box5In.Ventilator2))){
(__inst__->Box5Out.DauerbetriebSperre=1);
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.IntervallbetriebZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.IntervallbetriebZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor525_0:;
}
}





if(__inst__->Box1In.NachtrocknungEin){
if(((__inst__->Box1In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box2In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor529_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box3In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor532_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box4In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor535_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box5In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor538_0:;
}
if(((__inst__->Box1In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box1In.Ventilator2&__inst__->Box6In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box1In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor541_0:;
}
}


if(__inst__->Box2In.NachtrocknungEin){
if(((__inst__->Box2In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box1In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor545_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box3In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor548_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box4In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor551_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box5In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor554_0:;
}
if(((__inst__->Box2In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box2In.Ventilator2&__inst__->Box6In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box2In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor557_0:;
}
}


if(__inst__->Box3In.NachtrocknungEin){
if(((__inst__->Box3In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box1In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor561_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box2In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor564_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box4In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor567_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box5In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor570_0:;
}
if(((__inst__->Box3In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box3In.Ventilator2&__inst__->Box6In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box3In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor573_0:;
}
}


if(__inst__->Box4In.NachtrocknungEin){
if(((__inst__->Box4In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box1In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor577_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box2In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor580_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box3In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor583_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box5In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor586_0:;
}
if(((__inst__->Box4In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box4In.Ventilator2&__inst__->Box6In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box4In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor589_0:;
}
}


if(__inst__->Box5In.NachtrocknungEin){
if(((__inst__->Box5In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box1In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor593_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box2In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor596_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box3In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor599_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box4In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor602_0:;
}
if(((__inst__->Box5In.Ventilator1&__inst__->Box6In.Ventilator1)|(__inst__->Box5In.Ventilator2&__inst__->Box6In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box5In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box6Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor605_0:;
}
}


if(__inst__->Box6In.NachtrocknungEin){
if(((__inst__->Box6In.Ventilator1&__inst__->Box1In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box1In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box1Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor609_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box2In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box2In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box2Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor612_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box3In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box3In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box3Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor615_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box4In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box4In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box4Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor618_0:;
}
if(((__inst__->Box6In.Ventilator1&__inst__->Box5In.Ventilator1)|(__inst__->Box6In.Ventilator2&__inst__->Box5In.Ventilator2))){
for((__inst__->i=0);__inst__->i<=23;__inst__->i+=1){
if((((unsigned long)(unsigned char)__inst__->Box6In.NachtrocknungZeiten[CheckBounds(__inst__->i,0,23)]==(unsigned long)(unsigned char)1))){
(__inst__->Box5Out.NachtrocknungZeitenGesperrt[CheckBounds(__inst__->i,0,23)]=1);
}
}imp1_endfor621_0:;
}
}



}else{


(__inst__->Box1Out.DauerbetriebSperre=0);
(__inst__->Box1Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box1Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box1Out.NachtrocknungZeitenGesperrt)),0,24);


(__inst__->Box2Out.DauerbetriebSperre=0);
(__inst__->Box2Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box2Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box2Out.NachtrocknungZeitenGesperrt)),0,24);


(__inst__->Box3Out.DauerbetriebSperre=0);
(__inst__->Box3Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box3Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box3Out.NachtrocknungZeitenGesperrt)),0,24);


(__inst__->Box4Out.DauerbetriebSperre=0);
(__inst__->Box4Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box4Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box4Out.NachtrocknungZeitenGesperrt)),0,24);


(__inst__->Box5Out.DauerbetriebSperre=0);
(__inst__->Box5Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box5Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box5Out.NachtrocknungZeitenGesperrt)),0,24);


(__inst__->Box6Out.DauerbetriebSperre=0);
(__inst__->Box6Out.IntervallbetriebSperre=0);
__AS__MEMSET(((unsigned long)(&__inst__->Box6Out.IntervallbetriebZeitenGesperrt)),0,24);
__AS__MEMSET(((unsigned long)(&__inst__->Box6Out.NachtrocknungZeitenGesperrt)),0,24);


}











(__inst__->Boxenkl1VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl1VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe1!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe1!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe1!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe1!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe1!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe1!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl2VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl2VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe2!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe2!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe2!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe2!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe2!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe2!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl3VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl3VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe3!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe3!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe3!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe3!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe3!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe3!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl4VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl4VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe4!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe4!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe4!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe4!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe4!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe4!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl5VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl5VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe5!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe5!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe5!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe5!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe5!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe5!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl6VonVent1Abhaengig=((__inst__->Box1In.Ventilator1&(((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0)))|(__inst__->Box2In.Ventilator1&(((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0)))|(__inst__->Box3In.Ventilator1&(((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0)))|(__inst__->Box4In.Ventilator1&(((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0)))|(__inst__->Box5In.Ventilator1&(((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0)))|(__inst__->Box6In.Ventilator1&(((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));





(__inst__->Boxenkl6VonVent2Abhaengig=((__inst__->Box1In.Ventilator2&(((signed long)__inst__->Box1In.StellungKlappe6!=(signed long)0)))|(__inst__->Box2In.Ventilator2&(((signed long)__inst__->Box2In.StellungKlappe6!=(signed long)0)))|(__inst__->Box3In.Ventilator2&(((signed long)__inst__->Box3In.StellungKlappe6!=(signed long)0)))|(__inst__->Box4In.Ventilator2&(((signed long)__inst__->Box4In.StellungKlappe6!=(signed long)0)))|(__inst__->Box5In.Ventilator2&(((signed long)__inst__->Box5In.StellungKlappe6!=(signed long)0)))|(__inst__->Box6In.Ventilator2&(((signed long)__inst__->Box6In.StellungKlappe6!=(signed long)0)))|__inst__->BoxenklVonBeidenVentAbhaengig));




(__inst__->BypassklVonVent1Abhaengig=((__inst__->Box1In.Ventilator1&__inst__->Box1In.Luftentfeuchter)|(__inst__->Box2In.Ventilator1&__inst__->Box2In.Luftentfeuchter)|(__inst__->Box3In.Ventilator1&__inst__->Box3In.Luftentfeuchter)|(__inst__->Box4In.Ventilator1&__inst__->Box4In.Luftentfeuchter)|(__inst__->Box5In.Ventilator1&__inst__->Box5In.Luftentfeuchter)|(__inst__->Box6In.Ventilator1&__inst__->Box6In.Luftentfeuchter)|__inst__->BypassklVonBeidenVentAbhaengig));




(__inst__->BypassklVonVent2Abhaengig=((__inst__->Box1In.Ventilator2&__inst__->Box1In.Luftentfeuchter)|(__inst__->Box2In.Ventilator2&__inst__->Box2In.Luftentfeuchter)|(__inst__->Box3In.Ventilator2&__inst__->Box3In.Luftentfeuchter)|(__inst__->Box4In.Ventilator2&__inst__->Box4In.Luftentfeuchter)|(__inst__->Box5In.Ventilator2&__inst__->Box5In.Luftentfeuchter)|(__inst__->Box6In.Ventilator2&__inst__->Box6In.Luftentfeuchter)|__inst__->BypassklVonBeidenVentAbhaengig));




}}
#line 3084 "C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenKonfig.nodebug"

void __AS__ImplInitfbBoxenKonfig_st(void){}

unsigned long __AS__MEMSET(unsigned long pDest, unsigned char value, unsigned long length)
{memset((char*)pDest, value, length); return pDest + length;}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenKonfig.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/3_04_Plus/4PPC30_043F_21B/LascoBoxen/fbBoxenKonfig.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoBoxen/fbBoxenKonfig.st\\\"\\n\"");
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
