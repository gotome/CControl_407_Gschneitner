/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790103064_8_
#define _BUR_1790103064_8_

#include <bur/plctypes.h>

/* Constants */
#ifdef _REPLACE_CONST
#else
#endif


/* Variables */
_GLOBAL plcbit diStatusAbluftFeuchteMin;
_GLOBAL plcbit diStatusAbluftFeuchteMax;
_GLOBAL plcbit diStatusAbluftTempMin;
_GLOBAL plcbit diStatusAbluftTempMax;
_GLOBAL plcbit diStatusDachluftTempMin;
_GLOBAL plcbit diStatusDachluftTempMax;
_GLOBAL plcbit diStatusDachluftFeuchteMin;
_GLOBAL plcbit diStatusDachluftFeuchteMax;
_GLOBAL plcbit diStatusTrockenluftTempMin;
_GLOBAL plcbit diStatusTrockenluftTempMax;
_GLOBAL plcbit diStatusTrockenluftFeuchteMin;
_GLOBAL plcbit diStatusTrockenluftFeuchteMax;
_GLOBAL plcbit diStatusFrischluftTempMin;
_GLOBAL plcbit diStatusFrischluftTempMax;
_GLOBAL plcbit diStatusFrischluftFeuchteMin;
_GLOBAL plcbit diStatusFrischluftFeuchteMax;
_GLOBAL plcbit diStatusAustrittFeuchteMax;
_GLOBAL plcbit diStatusAustrittFeuchteMin;
_GLOBAL plcbit diStatusAustrittTempMax;
_GLOBAL plcbit diStatusAustrittTempMin;
_GLOBAL plcbit diStatusEintrittFeuchteMax;
_GLOBAL plcbit diStatusEintrittFeuchteMin;
_GLOBAL plcbit diStatusEintrittTempMax;
_GLOBAL plcbit diStatusEintrittTempMin;
_GLOBAL plcbit diStatusLuftgeschwMin;
_GLOBAL plcbit diStatusLuftgeschwMax;
_GLOBAL plcbit diStatusLuftgeschwDrahtbruch;
_GLOBAL plcbit diStatusDifferenzdruckMin;
_GLOBAL plcbit diStatusDifferenzdruckMax;
_GLOBAL plcbit diStatusHochdruckMaxMod2;
_GLOBAL plcbit diStatusHochdruckMinMod2;
_GLOBAL plcbit diStatusNiederdruckMaxMod2;
_GLOBAL plcbit diStatusNiederdruckMinMod2;
_GLOBAL plcbit diStatusHochdruckMaxMod1;
_GLOBAL plcbit diStatusHochdruckMinMod1;
_GLOBAL plcbit diStatusNiederdruckMaxMod1;
_GLOBAL plcbit diStatusNiederdruckMinMod1;
_GLOBAL plcbit diHeizregisterFrostschutz;
_GLOBAL plcbit diBypassklappeOffen;
_GLOBAL plcbit diBypassklappeGeschl;
_GLOBAL plcbit diLeistungsvorgKompressorExtMod1;
_GLOBAL plcbit diAnfEntfeuchterExtern;
_GLOBAL plcbit diBetriebsmldgKompressorModul2;
_GLOBAL plcbit diBetriebsmldgKompressorModul1;
_GLOBAL plcbit diVollschutzKompressorModul2;
_GLOBAL plcbit diVollschutzKompressorModul1;
_GLOBAL plcbit diOeldruckKompressorModul2;
_GLOBAL plcbit diOeldruckKompressorModul1;
_GLOBAL plcbit diKopftempKompressorModul2;
_GLOBAL plcbit diKopftempKompressorModul1;
_GLOBAL plcbit diHochdruckOkModul2;
_GLOBAL plcbit diHochdruckOkModul1;
_GLOBAL plcbit diNiederdruckOkModul2;
_GLOBAL plcbit diNiederdruckOkModul1;
_GLOBAL plcbit diNotstromaggregatInBetrieb;
_GLOBAL plcbit diUmschaltklappe2Geschl;
_GLOBAL plcbit diUmschaltklappe2Offen;
_GLOBAL plcbit diUmschaltklappe1Geschl;
_GLOBAL plcbit diUmschaltklappe1Offen;
_GLOBAL plcbit diAbluftklappeGeschl;
_GLOBAL plcbit diAbluftklappeOffen;
_GLOBAL plcbit diAbluftventInBetrieb;
_GLOBAL plcbit diBox6Geschl;
_GLOBAL plcbit diBox6Offen;
_GLOBAL plcbit diBox5Geschl;
_GLOBAL plcbit diBox5Offen;
_GLOBAL plcbit diBox4Geschl;
_GLOBAL plcbit diBox4Offen;
_GLOBAL plcbit diBox3Geschl;
_GLOBAL plcbit diBox3Offen;
_GLOBAL plcbit diWarmluftofenInBetrieb;
_GLOBAL plcbit diScheitholzofenInBetrieb;
_GLOBAL plcbit diDrehzahlbegrVentilator2;
_GLOBAL plcbit diDrehzahlbegrVentilator1;
_GLOBAL plcbit diVentilator2InBetrieb;
_GLOBAL plcbit diBox2Geschl;
_GLOBAL plcbit diBox2Offen;
_GLOBAL plcbit diBox1Geschl;
_GLOBAL plcbit diBox1Offen;
_GLOBAL plcbit di24VDCinternIstOk;
_GLOBAL plcbit diVentilator1InBetrieb;
_GLOBAL plcbit diDrehfeldIstKorrekt;
_GLOBAL plcbit diTasteTrocknungPausieren;
_GLOBAL plcbit diEntfeuchterFremdStoerung;
_GLOBAL plcbit diEntfeuchterFremdInBetrieb;
_GLOBAL plcbit di230VACIstOk;
_GLOBAL float aiAustrittFeuchte;
_GLOBAL float aiAustrittTemperatur;
_GLOBAL float aiEintrittFeuchte;
_GLOBAL float aiEintrittTemperatur;
_GLOBAL float aiHochdruckModul1;
_GLOBAL float aiHochdruckModul2;
_GLOBAL float aiNiederdruckModul1;
_GLOBAL float aiNiederdruckModul2;
_GLOBAL float aiDifferenzdruck;
_GLOBAL float aiLuftgeschwindigkeit;
_GLOBAL float aiDachluftFeuchte;
_GLOBAL float aiDachluftTemperatur;
_GLOBAL float aiAbluftFeuchte;
_GLOBAL float aiAbluftTemperatur;
_GLOBAL float aiTrockenluftFeuchte;
_GLOBAL float aiTrockenluftTemperatur;
_GLOBAL float aiFrischluftFeuchte;
_GLOBAL float aiFrischluftTemperatur;
_GLOBAL float aoDrehzahlvorgKompressorModul2;
_GLOBAL float aoDrehzahlvorgKompressorModul1;
_GLOBAL float aoDrehzahlvorgAbluftventilator;
_GLOBAL float aoLeistungsvorgHeizregister;
_GLOBAL float aoDrehzahlvorgVentilator2;
_GLOBAL float aoTemperaturvorgWarmluftofen;
_GLOBAL float aoDrehzahlvorgVentilator1;
_GLOBAL plcbit doLuftentfeuchterStrombegrEin;
_GLOBAL plcbit doEntfFremdFreigabe;
_GLOBAL plcbit doBypassklappeOeffnen;
_GLOBAL plcbit doBypassklappeSchliessen;
_GLOBAL plcbit doOelsumpfheizungEinModul2;
_GLOBAL plcbit doOelsumpfheizungEinModul1;
_GLOBAL plcbit doMagnetventilEinModul2;
_GLOBAL plcbit doMagnetventilEinModul1;
_GLOBAL plcbit doKompressorEinModul2;
_GLOBAL plcbit doKompressorEinModul1;
_GLOBAL plcbit doNotstromaggregatEin;
_GLOBAL plcbit doUmluftklappe2Freigabe;
_GLOBAL plcbit doUmluftklappe1Freigabe;
_GLOBAL plcbit doUmluftklappe1Oeffnen;
_GLOBAL plcbit doUmluftklappe1Schliessen;
_GLOBAL plcbit doUmluftklappe2Oeffnen;
_GLOBAL plcbit doUmluftklappe2Schliessen;
_GLOBAL plcbit doAbluftklappeSchliessen;
_GLOBAL plcbit doAbluftklappeOeffnen;
_GLOBAL plcbit doAbluftklappeFreigabe;
_GLOBAL plcbit doAbluftventilatorEin;
_GLOBAL plcbit doBrandschutzklappeAuf;
_GLOBAL plcbit doFreigabeBox6;
_GLOBAL plcbit doFreigabeBox5;
_GLOBAL plcbit doFreigabeBox4;
_GLOBAL plcbit doFreigabeBox3;
_GLOBAL plcbit doHeizregisterEin;
_GLOBAL plcbit doWarmluftofenEin;
_GLOBAL plcbit doTrocknungStoerung;
_GLOBAL plcbit doFreigabeBox2;
_GLOBAL plcbit doFreigabeBox1;
_GLOBAL plcbit doTrocknungInBetrieb;
_GLOBAL plcbit doVentilator2Ein;
_GLOBAL plcbit doVentilator1Ein;





__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/IO/InputOutput.var\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790103064_8_ */

