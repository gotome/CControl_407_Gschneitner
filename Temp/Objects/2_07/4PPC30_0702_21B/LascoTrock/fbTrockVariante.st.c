#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoTrock/fbTrockVariantest.h"
#line 1 "C:/SharedFolder/CControl/Logical/Libraries/LascoTrock/fbTrockVariante.nodebug"
#line 13 "C:/SharedFolder/CControl/Logical/Libraries/LascoTrock/fbTrockVariante.st"
void fbTrockVariante(struct fbTrockVariante* inst){struct fbTrockVariante* __inst__=inst;{

if(__inst__->Freigabe){

if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=1);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=2);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=3);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=4);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=5);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=6);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=7);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=8);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=9);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=10);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=11);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=12);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=13);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=14);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=15);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=16);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=17);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=18);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=19);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=20);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=21);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=22);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=23);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=24);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=25);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=26);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=27);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=28);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=29);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=30);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=31);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=32);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=33);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=34);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=35);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=36);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=37);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=38);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=39);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=40);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=41);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=42);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=43);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=44);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=45);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=46);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=47);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=48);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=49);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=50);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=51);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=52);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=53);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=54);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=55);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=56);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=57);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=58);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=59);
}else if((__inst__->Ventilator1&(__inst__->Ventilator2^1)&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=60);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=61);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=62);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=63);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=64);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=65);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=66);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=67);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=68);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=69);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=70);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=71);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=72);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=73);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=74);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=75);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=76);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=77);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=78);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=79);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=80);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=81);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=82);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=83);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=84);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=85);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=86);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=87);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=88);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=89);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&(__inst__->Luftentfeuchter^1)&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=90);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=91);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=92);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=93);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=94);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=95);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=96);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=97);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=98);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=99);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=100);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=101);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=102);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=103);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&(__inst__->Warmluftofen^1)&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=104);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=105);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=106);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=107);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=108);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=109);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=110);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=111);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&(__inst__->BetriebsmldgWarmluftofen^1)&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=112);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=113);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=114);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=115);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&(__inst__->BetriebsmldgScheitholzofen^1)&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=116);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=117);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&(__inst__->Brandschutzklappe^1)&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=118);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&(__inst__->Umschaltklappe^1))){
(__inst__->VarianteNr=119);
}else if((__inst__->Ventilator1&__inst__->Ventilator2&__inst__->Luftentfeuchter&__inst__->Warmluftofen&__inst__->BetriebsmldgWarmluftofen&__inst__->BetriebsmldgScheitholzofen&__inst__->Brandschutzklappe&__inst__->Umschaltklappe)){
(__inst__->VarianteNr=120);
}else{
(__inst__->VarianteNr=0);
}




}else{

(__inst__->VarianteNr=0);


}


}imp1_end0_0:;}
#line 272 "C:/SharedFolder/CControl/Logical/Libraries/LascoTrock/fbTrockVariante.nodebug"

void __AS__ImplInitfbTrockVariante_st(void){}

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
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoTrock/fbTrockVariante.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/2_07/4PPC30_0702_21B/LascoTrock/fbTrockVariante.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Libraries/LascoTrock/fbTrockVariante.st\\\"\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockZeitprogramm\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockLaufPause\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockNachtrock\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockTarifabsch\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockStrombegr\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockAutomatik\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockStufen\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockVent\\\" FUB\\n\"");
__asm__(".ascii \"plcexport \\\"fbTrockVariante\\\" FUB\\n\"");
__asm__(".previous");
