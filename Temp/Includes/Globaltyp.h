/* Automation Studio generated header file */
/* Do not edit ! */

#ifndef _BUR_1782306733_2_
#define _BUR_1782306733_2_

#include <bur/plctypes.h>

/* Datatypes and datatypes of function blocks */
typedef struct typNutzungAllgemein
{	enumBetriebsmodus LetzterModus;
	plcdt DatumLetzterBetrieb;
	plcbit IoTestAbgeschlossen;
	plcbit SetEthernetOk;
} typNutzungAllgemein;

typedef struct typBetriebsstunden
{	unsigned long FrischluftbetrStd;
	unsigned long UmluftbetrStd;
	unsigned long Ventilator1Std;
	unsigned long Ventilator2Std;
	unsigned long Kompressor1Std;
	unsigned long Kompressor2Std;
	unsigned long WarmluftofenStd;
	unsigned long HeizregisterStd;
	unsigned long ScheitholzofenStd;
	unsigned long Abtauung1Std;
	unsigned long Abtauung2Std;
	unsigned long OelsumpfheizungStd;
	unsigned long AbluftventStd;
	unsigned long Box1Std;
	unsigned long Box2Std;
	unsigned long Box3Std;
	unsigned long Box4Std;
	unsigned long Box5Std;
	unsigned long Box6Std;
	unsigned char FrischluftbetrMin;
	unsigned char UmluftbetrMin;
	unsigned char Ventilator1Min;
	unsigned char Ventilator2Min;
	unsigned char Kompressor1Min;
	unsigned char Kompressor2Min;
	unsigned char WarmluftofenMin;
	unsigned char HeizregisterMin;
	unsigned char ScheitholzofenMin;
	unsigned char Abtauung1Min;
	unsigned char Abtauung2Min;
	unsigned char OelsumpfheizungMin;
	unsigned char AbluftventMin;
	unsigned char Box1Min;
	unsigned char Box2Min;
	unsigned char Box3Min;
	unsigned char Box4Min;
	unsigned char Box5Min;
	unsigned char Box6Min;
} typBetriebsstunden;

typedef struct typServiceintervalle
{	unsigned long RestzeitKontrolleUhrzeit;
	plcbit KontrolleUhrzeitErforderlich;
} typServiceintervalle;

typedef struct typEnergiemessung
{	float LeistungAktuell;
	float EnergieGesamt;
	float EnergieTag;
} typEnergiemessung;

typedef struct typNutzungTrocknungsbilanz
{	unsigned long VentStundenBox1;
	unsigned long VentStundenBox2;
	unsigned long VentStundenBox3;
	unsigned long VentStundenBox4;
	unsigned long VentStundenBox5;
	unsigned long VentStundenBox6;
	unsigned long LuftaufbStundenBox1;
	unsigned long LuftaufbStundenBox2;
	unsigned long LuftaufbStundenBox3;
	unsigned long LuftaufbStundenBox4;
	unsigned long LuftaufbStundenBox5;
	unsigned long LuftaufbStundenBox6;
	unsigned char VentMinutenBox1;
	unsigned char VentMinutenBox2;
	unsigned char VentMinutenBox3;
	unsigned char VentMinutenBox4;
	unsigned char VentMinutenBox5;
	unsigned char VentMinutenBox6;
	unsigned char LuftaufbMinutenBox1;
	unsigned char LuftaufbMinutenBox2;
	unsigned char LuftaufbMinutenBox3;
	unsigned char LuftaufbMinutenBox4;
	unsigned char LuftaufbMinutenBox5;
	unsigned char LuftaufbMinutenBox6;
} typNutzungTrocknungsbilanz;

typedef struct typNutzungsdaten
{	struct typNutzungAllgemein Allgemein;
	struct typBetriebsstunden Bst;
	struct typBetriebsstunden BstGes;
	struct typServiceintervalle Serviceintervalle;
	struct typEnergiemessung Energiemessung;
	struct typNutzungTrocknungsbilanz Trocknungsbilanz;
} typNutzungsdaten;

typedef struct cmdLeistung
{	float DrehzahlVentilator1;
	float DrehzahlVentilator2;
	float DrehzahlKompressorModul1;
	float DrehzahlKompressorModul2;
	float DrehzahlAbluftventilator;
	float DrehzahlHeizregister;
} cmdLeistung;

typedef struct cmdAnlage
{	plcbit Test;
	plcbit Auto;
	struct cmdLeistung Leistung;
	plcbit StoppExtern;
	plcbit StartExtern;
	plcbit Start;
	plcbit Stop;
	plcbit FehlerStopp;
	plcbit FehlerModul1;
	plcbit FehlerModul2;
} cmdAnlage;

typedef struct statFehler
{	unsigned char WarnungNr;
	unsigned char FehlerNr;
	plcstring WarnungText[141];
	plcstring FehlerText[141];
	plcbit SummeFehler;
	plcbit SummeWarnung;
	plcbit SummeSystem;
} statFehler;

typedef struct statBerechnungen
{	float FrischluftSattDefizit;
	float DachluftSattDefizit;
	float TrockenluftSattDefizit;
	float AbluftSattDefizit;
	float Kanaldruck_mmWs;
} statBerechnungen;

typedef struct statRestlaufzeitenBoxen
{	unsigned short Box1Stunden;
	unsigned short Box1Minuten;
	unsigned short Box2Stunden;
	unsigned short Box2Minuten;
	unsigned short Box3Stunden;
	unsigned short Box3Minuten;
	unsigned short Box4Stunden;
	unsigned short Box4Minuten;
	unsigned short Box5Stunden;
	unsigned short Box5Minuten;
	unsigned short Box6Stunden;
	unsigned short Box6Minuten;
} statRestlaufzeitenBoxen;

typedef struct statAnlage
{	plcbit Betrieb;
	enumStatus Aktor[40];
	struct statFehler Fehler;
	float DrehzahlVentilator1;
	float DrehzahlVentilator2;
	float DrehzahlKompressorModul1;
	float DrehzahlKompressorModul2;
	float FrischluftTemperatur;
	float FrischluftFeuchte;
	float DachluftTemperatur;
	float DachluftFeuchte;
	float TrockenluftTemperatur;
	float TrockenluftFeuchte;
	float AbluftTemperatur;
	float AbluftFeuchte;
	float EintrittTemperatur;
	float EintrittFeuchte;
	float AustrittTemperatur;
	float AustrittFeuchte;
	float Kanaldruck;
	float Luftgeschwindigkeit;
	float NiederdruckModul1;
	float NiederdruckModul2;
	float HochdruckModul1;
	float HochdruckModul2;
	float LuftmengeAktuell;
	plcbit UmluftbetriebAktiv;
	plcbit FrischluftbetriebAktiv;
	float EnergieverbrTag;
	float EnergieLeistungAkt;
	float EnergieverbrGes;
	struct statBerechnungen Berechnungen;
	struct statRestlaufzeitenBoxen RestlaufzeitenBoxen;
	plcbit WetterIstSchlecht;
} statAnlage;

typedef struct typErrEx
{	plcbit Modul[65];
} typErrEx;

typedef struct typSysteminfo
{	unsigned char BatteriestatusCpu;
	unsigned short TempCpu;
	unsigned short TempEnv;
	unsigned char NodeNumber;
	unsigned long SerialNumber;
	plcstring IpAdress[21];
	struct typErrEx ErrEx[12];
	plcbit ErrorEx;
	plcstring ErrExString[31];
	plcstring ErrExStringMEM[31];
} typSysteminfo;

typedef struct typEchtzeit
{	unsigned short Jahr;
	unsigned char Monat;
	unsigned char Tag;
	unsigned char WoTag;
	unsigned char Stunde;
	unsigned char Minute;
	unsigned char Sekunde;
	unsigned short Milli;
	unsigned short Mikro;
	signed short StdMin;
} typEchtzeit;

typedef struct typAktoren
{	struct fbBoxenVentKlappen VentUndKlappen;
	struct fbBoxenAbluftkl Abluftklappe;
	struct fbBoxenAbluftvent Abluftventilator;
	struct fbEntfOelsumpfheiz OelsumpfheizungModul1;
	struct fbEntfOelsumpfheiz OelsumpfheizungModul2;
	struct fbEntfKompressor KompressorModul1;
	struct fbEntfKompressor KompressorModul2;
	struct fbBoxenWLO Warmluftofen;
	struct fbBoxenHeizreg Heizregister;
	struct fbBoxenNotstrom Notstromaggregat;
	struct fbBoxenSHO Scheitholzofen;
	struct fbBoxenKlappenanst Brandschutzklappe;
	struct fbEntfFremd EntfeuchterFremd;
} typAktoren;






__asm__(".section \".plc\"");

/* Used IEC files */
__asm__(".ascii \"iecfile \\\"Logical/Global.typ\\\" scope \\\"global\\\"\\n\"");

/* Exported library functions and function blocks */

__asm__(".previous");


#endif /* _BUR_1782306733_2_ */

