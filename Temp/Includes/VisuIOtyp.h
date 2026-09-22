/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1790072252_3_
#define _BUR_1790072252_3_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct typHmiStatusBoxen
{	enumStatus Statustext;
	enumIcon FarbeStatustext;
	enumIcon HintergrundAktiv;
	enumIcon HintergrundInaktiv;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon Trockengut;
	enumIcon AnzeigeLaufRestzeit;
	enumIcon FarbeTextNameBox;
	unsigned char TextindexLaufzeit;
	unsigned short LaufRestzeitStunden;
	unsigned short LaufRestzeitMinuten;
	unsigned char IconWitterung;
} typHmiStatusBoxen;

typedef struct typHmiStatusVentilator
{	unsigned char TextFrischluftDachluft;
	plcbit LuftmengenregFrischlSperre;
	plcbit LuftmengenregUmluftSperre;
	enumStatus Status;
	enumIcon FarbeIcon;
	float IstDrehzahl;
	enumIcon BargraphInaktiv;
	enumIcon BargraphAktiv;
	enumIcon FarbeDrehzahl;
	enumIcon EingabefeldFixdrehzUmluft;
	enumIcon EingabefeldFixdrehzFrischl;
	enumIcon EingabefeldLuftmengeUmluft;
	enumIcon EingabefeldLuftmengeFrischl;
	enumIcon Umluftbetrieb;
	enumIcon Luftmenge;
} typHmiStatusVentilator;

typedef struct typHmiStatusEntfeuchter
{	float IstDrehzahlKompressor1;
	float IstDrehzahlKompressor2;
	enumStatus Status;
	enumIcon FarbeIcon;
	plcbit EingabeFeuchteEinAusSperre;
	enumIcon FarbeDrehzahl;
	enumIcon FarbeTextStatus;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon IconAbtauung;
	unsigned long RestlaufzeitOelsumpfh;
	enumIcon StatusButtonInselbetrieb;
	enumIcon IconAnforderungExtern;
} typHmiStatusEntfeuchter;

typedef struct typHmiStatusWarmluftScheitholz
{	plcbit EingabeSattDefizitSperre;
	unsigned char TextindexUeberschrift;
	enumStatus StatusWarmluftofen;
	enumStatus StatusScheitholzofen;
	enumIcon FarbeIcon;
	enumIcon StatusfeldShoInaktiv;
	enumIcon StatusfeldShoAktiv;
	enumIcon StatusfeldWloInaktiv;
	enumIcon StatusfeldWloAktiv;
	enumIcon FarbeStatustextSho;
	enumIcon FarbeStatustextWlo;
} typHmiStatusWarmluftScheitholz;

typedef struct typHmiStatusHeizregister
{	enumStatus Status;
	enumIcon FarbeIcon;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeSattDefizitSperre;
	float IstDrehzahl;
} typHmiStatusHeizregister;

typedef struct typHmiStatusBrandschutzklappe
{	enumIcon FarbeStatustext;
	enumStatus Status;
	enumIcon StatusfeldInaktiv;
	enumIcon StatusfeldAktiv;
} typHmiStatusBrandschutzklappe;

typedef struct typHmiStatusUmluftklappen
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	enumIcon EingabefeldTempDifferenz;
	enumIcon EingabefeldTempUmschaltung;
	plcbit EingabeTempSchaltpunktSperre;
	plcbit EingabeTempDifferenzSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
	unsigned char TextindexEingabeUmschaltpunkt;
} typHmiStatusUmluftklappen;

typedef struct typHmiStatusBypassklappe
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusBypassklappe;

typedef struct typHmiStatusAbluftklappe
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeMaxAbluftfeuchteSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusAbluftklappe;

typedef struct typHmiStatusAbluftventilator
{	enumStatus Status;
	enumIcon StatusfeldAktiv;
	enumIcon StatusfeldInaktiv;
	enumIcon FarbeStatustext;
	plcbit EingabeMaxAbluftfeuchteSperre;
	unsigned char TextindexButton;
	unsigned char IndexBetriebsart;
} typHmiStatusAbluftventilator;

typedef struct typHmiStatusZusatzmeldungen
{	enumZusatzmeldungen Statustext;
	unsigned long RestzeitSchrittAktuell;
	enumIcon AusgabefeldRestzeit;
	enumIcon IconSanduhr;
} typHmiStatusZusatzmeldungen;

typedef struct typHmiTrendkurven
{	float FrischluftTemp;
	float FrischluftFeuchte;
	float DachluftTemp;
	float DachluftFeuchte;
	float TrockenluftTemp;
	float TrockenluftFeuchte;
	float AbluftTemp;
	float AbluftFeuchte;
	float EintrittTemp;
	float EintrittFeuchte;
	float AustrittTemp;
	float AustrittFeuchte;
	float NiederdruckMod1;
	float NiederdruckMod2;
	float HochdruckMod1;
	float HochdruckMod2;
	float Luftgeschw;
	float Kanaldruck;
	float LeistungAktuell;
	float CursorTrend1;
	float CursorTrend2;
	float CursorTrend3;
	float WertScrollTrend1;
	float WertScrollTrend2;
	float WertScrollTrend3;
	float WertZoomTrend1;
	float WertZoomTrend2;
	float WertZoomTrend3;
	float ZeitScrollTrend1;
	float ZeitScrollTrend2;
	float ZeitScrollTrend3;
	float ZeitZoomTrend1;
	float ZeitZoomTrend2;
	float ZeitZoomTrend3;
} typHmiTrendkurven;

typedef struct typHmiStatus
{	enumPasswortebenen CurUserLevel;
	enumSeitenVisu CurPage;
	enumPasswoerter hmiPasswort;
	struct typHmiStatusBoxen Box1;
	struct typHmiStatusBoxen Box2;
	struct typHmiStatusBoxen Box3;
	struct typHmiStatusBoxen Box4;
	struct typHmiStatusBoxen Box5;
	struct typHmiStatusBoxen Box6;
	struct typHmiStatusVentilator Ventilator1;
	struct typHmiStatusVentilator Ventilator2;
	struct typHmiStatusEntfeuchter Entfeuchter;
	struct typHmiStatusWarmluftScheitholz WarmluftScheitholzofen;
	struct typHmiStatusHeizregister Heizregister;
	struct typHmiStatusBrandschutzklappe Brandschutzklappe;
	struct typHmiStatusUmluftklappen Umluftklappen;
	struct typHmiStatusBypassklappe Bypassklappe;
	struct typHmiStatusAbluftklappe Abluftklappe;
	struct typHmiStatusAbluftventilator Abluftventilator;
	struct typHmiStatusZusatzmeldungen Zusatzmeldungen;
	struct typHmiTrendkurven Trendkurven;
	plcstring EntfeuchterType[21];
	plcstring SoftwareVersion[17];
	unsigned char hmiAlarmFilter;
	unsigned char hmiSelectAlarmGroup;
	unsigned char NameSteuerung;
	plcbit UserIstAdmin;
	plcstring ParameterFileNameAufUsb[81];
} typHmiStatus;

typedef struct typHmiSensoren
{	float FrischluftTemp;
	float FrischluftFeuchte;
	float FrischluftSattDefizit;
	float DachluftTemp;
	float DachluftFeuchte;
	float DachluftSattDefizit;
	float TrockenluftTemp;
	float TrockenluftFeuchte;
	float TrockenluftSattDefizit;
	float AbluftTemp;
	float AbluftFeuchte;
	float AbluftSattDefizit;
	float EintrittTemp;
	float EintrittFeuchte;
	float AustrittTemp;
	float AustrittFeuchte;
	float NiederdruckModul1;
	float HochdruckModul1;
	float NiederdruckModul2;
	float HochdruckModul2;
	float Luftgeschwindigkeit;
	float LuftmengeAktuell;
	float KanaldruckmmH2O;
	float KanaldruckPa;
} typHmiSensoren;

typedef struct typHmiVisibilityTrend
{	enumIcon FrischluftTemp;
	enumIcon FrischluftFeuchte;
	enumIcon DachluftTemp;
	enumIcon DachluftFeuchte;
	enumIcon TrockenluftTemp;
	enumIcon TrockenluftFeuchte;
	enumIcon AbluftTemp;
	enumIcon AbluftFeuchte;
	enumIcon Luftgeschw;
	enumIcon Kanaldruck;
	enumIcon EintrittTemp;
	enumIcon EintrittFeuchte;
	enumIcon AustrittTemp;
	enumIcon AustrittFeuchte;
	enumIcon NiederdruckMod1;
	enumIcon NiederdruckMod2;
	enumIcon HochdruckMod1;
	enumIcon HochdruckMod2;
} typHmiVisibilityTrend;

typedef struct typHmiVisibilityAllgemein
{	enumIcon Testbetrieb;
	enumIcon EbeneService;
	enumIcon EbeneLasco;
	enumIcon UmschaltverzBetriebsartAktiv;
	enumIcon Energiemessung;
	enumIcon SymbolRegisterUebersicht;
	enumIcon SymbolOfenUebersicht;
	enumIcon SymbolEntfeuchterFremdUebersicht;
	enumIcon SymbolEntfeuchterUebersicht;
	enumIcon Luftgeschwindigkeit;
	enumIcon Scheitholzofen;
	enumIcon Brandschutzklappe;
	enumIcon KompressorModul2;
	enumIcon TemperaturvorgWarmluftofen;
	enumIcon Warmluftofen;
	enumIcon TemperaturvorgHeizregister;
	enumIcon Kanaldruck;
	enumIcon Abluftventilator;
	enumIcon Abluftklappe;
	enumIcon Abluft;
	enumIcon Dachluft;
	enumIcon Trockenluft;
	enumIcon Frischluft;
	enumIcon Umschaltklappen;
	enumIcon Bypassklappe;
	enumIcon LaufzRestOelsumpf;
	enumIcon Entfeuchter;
	enumIcon Box1;
	enumIcon Box2;
	enumIcon Box3;
	enumIcon Box4;
	enumIcon Box5;
	enumIcon Box6;
	enumIcon Ventilator2;
	enumIcon UmluftbetriebVhd;
	enumIcon UebersichtKlappen;
	enumIcon UebersichtTrocknungsger;
	enumIcon HB4000Hide;
	enumIcon HB4000;
	enumIcon EingabeTrockengutfeuchteBox;
} typHmiVisibilityAllgemein;

typedef struct typHmiVisibilityLayers
{	enumIcon ErrorDatum;
	enumIcon MdgPwSchutzAus;
	enumIcon EbeneFehler;
	enumIcon EbeneWarnung;
	enumIcon MldgDatumFalsch;
	enumIcon MldgKontrolleUhrzeit;
	enumIcon MldgStockkontrolle;
	enumIcon Zeitfenster;
	enumIcon DetailansichtBox;
	enumIcon UebersichtEineBox;
	enumIcon UebersichtZweiBoxen;
	enumIcon UebersichtDreiBoxen;
	enumIcon UebersichtVierBoxen;
	enumIcon UebersichtFuenfBoxen;
	enumIcon UebersichtSechsBoxen;
	enumIcon UebersichtEinVentilator;
	enumIcon UebersichtZweiVentilatoren;
	enumIcon DetailansichtVentilatoren;
	enumIcon DetailansichtRegister;
	enumIcon DetailansichtOfen;
	enumIcon DetailansichtEntfeuchterFremd;
	enumIcon DetailansichtEntfeuchter;
	enumIcon DetailansichtKlappen;
	enumIcon DetailansichtSensoren;
	enumIcon Trocknungsbilanz;
	enumIcon UebersichtInselbetrieb;
} typHmiVisibilityLayers;

typedef struct typHmiVisibilityButtons
{	enumIcon IntervallEinstellenBoxAktuell;
	enumIcon NachtrocknEinstellenBoxAktuell;
	enumIcon IOTestOK;
	enumIcon AckTestbetrieb;
	enumIcon LogoutButton;
} typHmiVisibilityButtons;

typedef struct typHmiVisibility
{	struct typHmiVisibilityAllgemein Allgemein;
	struct typHmiVisibilityLayers Layers;
	struct typHmiVisibilityButtons Buttons;
	struct typHmiVisibilityTrend Trend;
} typHmiVisibility;

typedef struct typHmiTrocknungsbilanz
{	plcstring NameBox[21];
	unsigned long LaufzeitGesamt;
	unsigned long LaufzeitVentilator;
	unsigned long LaufzeitLuftaufbereitung;
} typHmiTrocknungsbilanz;

typedef struct typHmiBoxAktuell
{	plcstring NameBox[21];
	enumIcon Trockengut;
	plcbit Aus;
	plcbit DauerbetriebEin;
	plcbit IntervallbetriebEin;
	plcbit NachtrocknungEin;
	plcbit SperreDauerbetrieb;
	plcbit SperreIntervallbetrieb;
	enumStatus Status;
	plcbit ZeitbereicheGesperrt[24];
	plcbit Zeitbereiche[24];
	unsigned long RestzeitUmschaltverzBetriebsart;
	enumIcon AnzeigeLaufRestzeit;
	unsigned char TextindexLaufzeit;
	unsigned short LaufRestzeitStunden;
	unsigned short LaufRestzeitMinuten;
	unsigned char IconWitterung;
	unsigned char TrockengutfeuchteAktuell;
} typHmiBoxAktuell;

typedef struct typIoTestDigitalIn
{	plcbit diVentilator1InBetrieb;
	plcbit di24VDCinternIstOk;
	plcbit diBox1Offen;
	plcbit diBox1Geschl;
	plcbit diBox2Offen;
	plcbit diBox2Geschl;
	plcbit diVentilator2InBetrieb;
	plcbit diDrehzahlbegrVentilator1;
	plcbit diDrehzahlbegrVentilator2;
	plcbit diScheitholzofenInBetrieb;
	plcbit diWarmluftofenInBetrieb;
	plcbit diBox3Offen;
	plcbit diBox3Geschl;
	plcbit diBox4Offen;
	plcbit diBox4Geschl;
	plcbit diBox5Offen;
	plcbit diBox5Geschl;
	plcbit diBox6Offen;
	plcbit diBox6Geschl;
	plcbit diAbluftventInBetrieb;
	plcbit diAbluftklappeOffen;
	plcbit diAbluftklappeGeschl;
	plcbit diUmschaltklappe1Offen;
	plcbit diUmschaltklappe1Geschl;
	plcbit diUmschaltklappe2Offen;
	plcbit diUmschaltklappe2Geschl;
	plcbit diNotstromaggregatInBetrieb;
	plcbit diNiederdruckOkModul1;
	plcbit diNiederdruckOkModul2;
	plcbit diHochdruckOkModul1;
	plcbit diHochdruckOkModul2;
	plcbit diKopftempKompressorModul1;
	plcbit diKopftempKompressorModul2;
	plcbit diOeldruckKompressorModul1;
	plcbit diOeldruckKompressorModul2;
	plcbit diVollschutzKompressorModul1;
	plcbit diVollschutzKompressorModul2;
	plcbit diBetriebsmldgKompressorModul1;
	plcbit diBetriebsmldgKompressorModul2;
	plcbit diLeistungsvorgKompressorExtMod1;
	plcbit diBypassklappeGeschl;
	plcbit diBypassklappeOffen;
	plcbit diAnfEntfeuchterExtern;
	plcbit diDrehfeldIstKorrekt;
	plcbit di230VACIstOk;
	plcbit diEntfeuchterFremdInBetrieb;
	plcbit diEntfeuchterFremdStoerung;
	plcbit diTasteTrocknungPausieren;
	plcbit diHeizregisterFrostschutz;
} typIoTestDigitalIn;

typedef struct typIoTestStatusIn
{	plcbit diStatusNiederdruckMinMod1;
	plcbit diStatusNiederdruckMaxMod1;
	plcbit diStatusHochdruckMinMod1;
	plcbit diStatusHochdruckMaxMod1;
	plcbit diStatusNiederdruckMinMod2;
	plcbit diStatusNiederdruckMaxMod2;
	plcbit diStatusHochdruckMinMod2;
	plcbit diStatusHochdruckMaxMod2;
	plcbit diStatusDifferenzdruckMax;
	plcbit diStatusDifferenzdruckMin;
	plcbit diStatusLuftgeschwDrahtbruch;
	plcbit diStatusLuftgeschwMax;
	plcbit diStatusLuftgeschwMin;
	plcbit diStatusEintrittTempMin;
	plcbit diStatusEintrittTempMax;
	plcbit diStatusEintrittFeuchteMin;
	plcbit diStatusEintrittFeuchteMax;
	plcbit diStatusAustrittTempMin;
	plcbit diStatusAustrittTempMax;
	plcbit diStatusAustrittFeuchteMin;
	plcbit diStatusAustrittFeuchteMax;
	plcbit diStatusFrischluftFeuchteMax;
	plcbit diStatusFrischluftFeuchteMin;
	plcbit diStatusFrischluftTempMax;
	plcbit diStatusFrischluftTempMin;
	plcbit diStatusTrockenluftFeuchteMax;
	plcbit diStatusTrockenluftFeuchteMin;
	plcbit diStatusTrockenluftTempMax;
	plcbit diStatusTrockenluftTempMin;
	plcbit diStatusDachluftFeuchteMax;
	plcbit diStatusDachluftFeuchteMin;
	plcbit diStatusDachluftTempMax;
	plcbit diStatusDachluftTempMin;
	plcbit diStatusAbluftTempMax;
	plcbit diStatusAbluftTempMin;
	plcbit diStatusAbluftFeuchteMax;
	plcbit diStatusAbluftFeuchteMin;
} typIoTestStatusIn;

typedef struct typIoTestDigitalOut
{	plcbit doVentilator1Ein;
	plcbit doTrocknungInBetrieb;
	plcbit doFreigabeBox1;
	plcbit doFreigabeBox2;
	plcbit doTrocknungStoerung;
	plcbit doVentilator2Ein;
	plcbit doWarmluftofenEin;
	plcbit doHeizregisterEin;
	plcbit doFreigabeBox3;
	plcbit doFreigabeBox4;
	plcbit doFreigabeBox5;
	plcbit doFreigabeBox6;
	plcbit doBrandschutzklappeAuf;
	plcbit doAbluftventilatorEin;
	plcbit doAbluftklappeFreigabe;
	plcbit doUmluftklappe1Freigabe;
	plcbit doUmluftklappe2Freigabe;
	plcbit doNotstromaggregatEin;
	plcbit doKompressorEinModul1;
	plcbit doKompressorEinModul2;
	plcbit doMagnetventilEinModul1;
	plcbit doMagnetventilEinModul2;
	plcbit doOelsumpfheizungEinModul1;
	plcbit doOelsumpfheizungEinModul2;
	plcbit doBypassklappeOeffnen;
	plcbit doBypassklappeSchliessen;
	plcbit doUmluftklappe1Oeffnen;
	plcbit doUmluftklappe1Schliessen;
	plcbit doUmluftklappe2Oeffnen;
	plcbit doUmluftklappe2Schliessen;
	plcbit doAbluftklappeOeffnen;
	plcbit doAbluftklappeSchliessen;
	plcbit doEntfFremdFreigabe;
	plcbit doLuftentfeuchterStrombegrEin;
} typIoTestDigitalOut;

typedef struct typIoTestAnalogIn
{	float aiFrischluftTemperatur;
	float aiFrischluftFeuchte;
	float aiTrockenluftTemperatur;
	float aiTrockenluftFeuchte;
	float aiAbluftTemperatur;
	float aiAbluftFeuchte;
	float aiDachluftTemperatur;
	float aiDachluftFeuchte;
	float aiLuftgeschwindigkeit;
	float aiDifferenzdruck;
	float aiNiederdruckModul2;
	float aiNiederdruckModul1;
	float aiHochdruckModul2;
	float aiHochdruckModul1;
	float aiEintrittTemperatur;
	float aiEintrittFeuchte;
	float aiAustrittTemperatur;
	float aiAustrittFeuchte;
} typIoTestAnalogIn;

typedef struct typIoTestAnalogOut
{	float aoDrehzahlvorgVentilator1;
	float aoTemperaturvorgWarmluftofen;
	float aoDrehzahlvorgVentilator2;
	float aoLeistungsvorgHeizregister;
	float aoDrehzahlvorgAbluftventilator;
	float aoDrehzahlvorgKompressorModul1;
	float aoDrehzahlvorgKompressorModul2;
} typIoTestAnalogOut;

typedef struct typIoTest
{	struct typIoTestDigitalIn DigitalIn;
	struct typIoTestStatusIn StatusIn;
	struct typIoTestDigitalOut DigitalOut;
	struct typIoTestAnalogIn AnalogIn;
	struct typIoTestAnalogOut AnalogOut;
} typIoTest;

typedef struct typHmiButtonsKlappenBoxen
{	plcbit Klappe1;
	plcbit Klappe2;
	plcbit Klappe3;
	plcbit Klappe4;
	plcbit Klappe5;
	plcbit Klappe6;
} typHmiButtonsKlappenBoxen;

typedef struct typHmiButtons
{	plcbit IntervallEinstellenBoxAktuell;
	plcbit NachtrocknEinstellenAktuell;
	plcbit hideDetailansichtBox;
	plcbit hideZeitfenster;
	plcbit showBox1;
	plcbit showBox2;
	plcbit showBox3;
	plcbit showBox4;
	plcbit showBox5;
	plcbit showBox6;
	plcbit showVentilatoren;
	plcbit showEntfeuchterFremd;
	plcbit showEntfeuchter;
	plcbit showOfen;
	plcbit showHeizregister;
	plcbit showKlappen;
	plcbit showSensoren;
	plcbit QuitFehler;
	plcbit TestbetriebEin;
	plcbit TestbetriebAbbrechen;
	plcbit TestbetriebAbschliessen;
	plcbit IpParameterSetzen;
	plcbit DatenaufzeichnungAufUsb;
	plcbit DatenaufzeichnungLoeschen;
	plcbit Logout;
	plcbit TouchKalibrieren;
	plcbit SicherheitshinweisOk;
	plcbit ResetEnergieverbrTag;
	plcbit ResetServiceUhrzeit;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox1;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox2;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox3;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox4;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox5;
	struct typHmiButtonsKlappenBoxen ButtonsKlappeBox6;
	plcbit changeBetrArtBypassklappe;
	plcbit changeBetrArtAbluftvent;
	plcbit changeBetrArtAbluftklappe;
	plcbit changeBetrArtUmluftklappen;
	plcbit ParameterVonUsbLaden;
	plcbit ParameterAufUsbKopieren;
	plcbit TrocknungsbilanzOk;
	plcbit changeTrockengutBox1;
	plcbit changeTrockengutBox2;
	plcbit changeTrockengutBox3;
	plcbit changeTrockengutBox4;
	plcbit changeTrockengutBox5;
	plcbit changeTrockengutBox6;
} typHmiButtons;

typedef struct typHmiActions
{	enumSeitenVisu cmdChangePageTo;
	plcbit cmdInselbetriebEntfeuchterEin;
} typHmiActions;

typedef struct typHmiDatenaufzeichnung
{	unsigned short SaveStepNr;
	unsigned short CopyStepNr;
	unsigned long AnzahlFiles;
	unsigned long AnzahlEintraegeInFile;
} typHmiDatenaufzeichnung;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/VisuIO.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1790072252_3_ */

