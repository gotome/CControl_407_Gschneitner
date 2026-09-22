#define _DEFAULT_INCLUDE
#include <bur\plctypes.h>
#include "C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/Sitemanage/Clientst.h"
#line 1 "C:/SharedFolder/CControl/Logical/Sitemanager/Sitemanager/Client.nodebug"
#line 7 "C:/SharedFolder/CControl/Logical/Sitemanager/Sitemanager/Client.st"
void _CYCLIC __BUR__ENTRY_CYCLIC_FUNCT__(void){{


(loc_EMailAlarmierungEin=Betriebsparameter.Fernalarmierung.EMailAlarmierungEin);
{int zzIndex; plcstring* zzLValue=(plcstring*)EMail[0]; plcstring* zzRValue=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[0]; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)EMail[1]; plcstring* zzRValue=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[1]; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)EMail[2]; plcstring* zzRValue=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[2]; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)EMail[3]; plcstring* zzRValue=(plcstring*)Betriebsparameter.Fernalarmierung.MailAdresse[3]; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};



if((((unsigned long)VC_HANDLE==(unsigned long)0))){
(VC_HANDLE=VA_Setup(1,"Visu"));
}

if(hmiButtons.QuitFehler){
(loc_FehlerAusgelesen=0);
}

if((gStatusAnlage.Fehler.SummeFehler&(loc_FehlerAusgelesen^1)&loc_EMailAlarmierungEin)){
(Access_Status=VA_Saccess(1,VC_HANDLE));
if((((unsigned long)(unsigned short)Access_Status==(unsigned long)(unsigned short)0))){
(AlarmLen=80);
(cSeparator=45);
(uiAlarmType=1);
(cDateTimeFormat=6);

(GetActAlarmList_Status=VA_GetActAlarmList(1,VC_HANDLE,((unsigned long)(&AlarmString)),((unsigned long)(&AlarmLen)),uiAlarmType,cSeparator,cDateTimeFormat));

if((((unsigned long)(unsigned short)GetActAlarmList_Status==(unsigned long)(unsigned short)0))){
(loc_FehlerAusgelesen=1);
{int zzIndex; plcstring* zzLValue=(plcstring*)EMailText; plcstring* zzRValue=(plcstring*)AlarmString; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(Send=1);
}
VA_Srelease(1,VC_HANDLE);
}
}


(IP_ADRESS=((unsigned long)(&Betriebsparameter.Allgemein.DefaultGateway)));

(IP_PORT=26864);

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)SLASH; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UseComma=0);
{int zzIndex; plcstring* zzLValue=(plcstring*)CommaString; plcstring* zzRValue=(plcstring*)""; for(zzIndex=0; zzIndex<0l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};


if(((__AS__STRING_CMP(EMail[0],"")!=0))){
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(LEFTBRACKET,EMail[0]); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
if((((__AS__STRING_CMP(EMail[1],"")==0))&((__AS__STRING_CMP(EMail[2],"")==0))&((__AS__STRING_CMP(EMail[3],"")==0)))){
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,resultString); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[1],"")!=0))){
if(UseComma){
{int zzIndex; plcstring* zzLValue=(plcstring*)CommaString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,EMail[1]); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
if((((__AS__STRING_CMP(EMail[2],"")==0))&((__AS__STRING_CMP(EMail[3],"")==0)))){
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,resultString); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[2],"")!=0))){
if(UseComma){
{int zzIndex; plcstring* zzLValue=(plcstring*)CommaString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,EMail[2]); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
if(((__AS__STRING_CMP(EMail[3],"")==0))){
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,resultString); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UseComma=1);
}

if(((__AS__STRING_CMP(EMail[3],"")!=0))){
if(UseComma){
{int zzIndex; plcstring* zzLValue=(plcstring*)CommaString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)COMMA; for(zzIndex=0; zzIndex<1l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,EMail[3]); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)resultString; plcstring* zzRValue=(plcstring*)CONCAT(resultString,RIGHTBRACKET); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,resultString); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(UseComma=1);
}

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,SLASH); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};

{int zzIndex; plcstring* zzLValue=(plcstring*)Sendstring; plcstring* zzRValue=(plcstring*)CONCAT(Sendstring,EMailText); for(zzIndex=0; zzIndex<255l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};


switch(Client.sStep){


case 0:{if(Send){
(ErrNr=0);
{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)""; for(zzIndex=0; zzIndex<0l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(Client.sStep=1);
}



}break;case 1:{(Client.TcpOpen_0.enable=1);
(Client.TcpOpen_0.pIfAddr=0);
(Client.TcpOpen_0.port=26864);
(Client.TcpOpen_0.options=0);
TcpOpen(&Client.TcpOpen_0);

if((((unsigned long)(unsigned short)Client.TcpOpen_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=5);
}else if((((unsigned long)(unsigned short)Client.TcpOpen_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpOpen_0.status);
(Client.sStep=100);
}



}break;case 5:{(Client.linger_opt.lLinger=0);
(Client.linger_opt.lOnOff=1);

(Client.TcpIoctl_0.enable=1);
(Client.TcpIoctl_0.ident=Client.TcpOpen_0.ident);
(Client.TcpIoctl_0.ioctl=tcpSO_LINGER_SET);
(Client.TcpIoctl_0.pData=((unsigned long)(&Client.linger_opt)));
(Client.TcpIoctl_0.datalen=8);
TcpIoctl(&Client.TcpIoctl_0);

if((((unsigned long)(unsigned short)Client.TcpIoctl_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=10);
}else if((((unsigned long)(unsigned short)Client.TcpIoctl_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpIoctl_0.status);
(Client.sStep=100);
}


}break;case 10:{
(Client.TcpClient_0.enable=1);
(Client.TcpClient_0.ident=Client.TcpOpen_0.ident);
(Client.TcpClient_0.portserv=IP_PORT);
(Client.TcpClient_0.pServer=IP_ADRESS);
TcpClient(&Client.TcpClient_0);

if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=20);
}else if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else if((((unsigned long)(unsigned short)Client.TcpClient_0.status==(unsigned long)(unsigned short)tcpERR_INVALID))){
(ErrNr=Client.TcpClient_0.status);
{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_INVALID, Fehler Verbindungsaufbau"; for(zzIndex=0; zzIndex<37l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
(Client.sStep=40);
}else{
(ErrNr=Client.TcpClient_0.status);
(Client.sStep=100);
}

}break;case 20:{
(Client.TcpSend_0.enable=1);
(Client.TcpSend_0.ident=Client.TcpOpen_0.ident);
(Client.TcpSend_0.pData=((unsigned long)(&Sendstring)));
(Client.TcpSend_0.datalen=LEN(Sendstring));
(Client.TcpSend_0.flags=0);
TcpSend(&Client.TcpSend_0);

if((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=40);
}else if((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else if(((((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)tcpERR_SENTLEN))|(((unsigned long)(unsigned short)Client.TcpSend_0.status==(unsigned long)(unsigned short)tcpERR_NOT_CONNECTED)))){
switch(Client.TcpSend_0.status){
case 32606:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge."; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32609:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle)."; for(zzIndex=0; zzIndex<62l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;}
(ErrNr=Client.TcpSend_0.status);
(Client.sStep=40);
}else{
(ErrNr=Client.TcpSend_0.status);
(Client.sStep=100);
}

}break;case 40:{
(Client.TcpClose_0.enable=1);
(Client.TcpClose_0.ident=Client.TcpOpen_0.ident);
(Client.TcpClose_0.how=0);
TcpClose(&Client.TcpClose_0);

if((((unsigned long)(unsigned short)Client.TcpClose_0.status==(unsigned long)(unsigned short)0))){
(Client.sStep=0);
(Send=0);
}else if((((unsigned long)(unsigned short)Client.TcpClose_0.status==(unsigned long)(unsigned short)ERR_FUB_BUSY))){

}else{
(ErrNr=Client.TcpClose_0.status);
(Client.sStep=100);
}


}break;case 100:{
switch(ErrNr){
case 32600:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_INVALID_IDENT Der angegebene Ident ist nicht zulässig."; for(zzIndex=0; zzIndex<58l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32601:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_NOMORE_IDENTS, Es konnte kein weiterer Ident reserviert werden."; for(zzIndex=0; zzIndex<67l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32602:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_ALREADY_EXIST, Es existiert bereits ein Socket, der auf diese Portnummer"; for(zzIndex=0; zzIndex<76l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32603:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_PARAMETER, Ungültige Parameter."; for(zzIndex=0; zzIndex<35l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32604:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_INVALID_IOCTL, Ungültiges IO-Control."; for(zzIndex=0; zzIndex<41l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32606:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge."; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32607:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_WOULDBLOCK, Daten konnten nicht in den Sendepuffer des Sockets übernommen werden."; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32608:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_INVALID, Fehler Verbindungsaufbau"; for(zzIndex=0; zzIndex<37l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32609:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle)."; for(zzIndex=0; zzIndex<62l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32650:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_SOCKET_CREATE, Ressourcenproblem im System. Es konnte kein Socket mehr angelegt werden."; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32651:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_SOCKET_BIND, Problem beim Binden an die Portnummer bzw. an die ermittelte Ip-Adresse"; for(zzIndex=0; zzIndex<80l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32612:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_INTERFACE, Die angegebene Interface-Adresse ist ungültig."; for(zzIndex=0; zzIndex<61l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 32699:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_SYSTEM, Interner Fehler beim Senden."; for(zzIndex=0; zzIndex<40l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 65534:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_FUB_ENABLE_FALSE, Fub nicht enabled. FUB enablen."; for(zzIndex=0; zzIndex<53l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;case 65535:{{int zzIndex; plcstring* zzLValue=(plcstring*)ErrorText; plcstring* zzRValue=(plcstring*)"ERR_FUB_BUSY, Fub arbeitet noch."; for(zzIndex=0; zzIndex<32l && zzRValue[zzIndex]!=0; zzIndex++) zzLValue[zzIndex] = zzRValue[zzIndex]; zzLValue[zzIndex] = 0;};
}break;}
(Send=0);
(Client.sStep=0);
}break;}


}imp1_case15_6:imp1_endcase15_0:;}
#line 241 "C:/SharedFolder/CControl/Logical/Sitemanager/Sitemanager/Client.nodebug"

void __AS__ImplInitClient_st(void){}

signed long __AS__STRING_CMP(char* pstr1, char* pstr2)
{while (*pstr1 != 0 && *pstr1 == *pstr2){ pstr1++;pstr2++; } return (*pstr1 == 0 && *pstr2 != 0) ? -1 : (*pstr1 != 0 && *pstr2 == 0) ? 1 : *pstr1 - *pstr2;}

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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.typ\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Types.typ\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.fun\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/CControl.fun\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Temp/Includes/AS_TempDecl/4_07_Plus/GlobalComponents/MpComponents.var\\\" scope \\\"global\\\"\\n\"");
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
__asm__(".ascii \"iecfile \\\"Logical/Libraries/MpBase/MpBase.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Libraries/CControl/Constants.var\\\" scope \\\"global\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.typ\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"Logical/Sitemanager/Sitemanager/Client.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"iecfile \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/Sitemanage/Client.st.var\\\" scope \\\"local\\\"\\n\"");
__asm__(".ascii \"plcreplace \\\"C:/SharedFolder/CControl/Temp/Objects/4_07_Plus/4PPC30_0702_21B/Sitemanage/Client.st.c\\\" \\\"C:/SharedFolder/CControl/Logical/Sitemanager/Sitemanager/Client.st\\\"\\n\"");
__asm__(".previous");

__asm__(".section \".plciec\"");
__asm__(".ascii \"plcdata_const 'Client'\\n\"");
__asm__(".ascii \"plcdata_const 'SLASH'\\n\"");
__asm__(".ascii \"plcdata_const 'LEFTBRACKET'\\n\"");
__asm__(".ascii \"plcdata_const 'RIGHTBRACKET'\\n\"");
__asm__(".ascii \"plcdata_const 'COMMA'\\n\"");
__asm__(".ascii \"plcdata_const 'ERR_FUB_BUSY'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_SENTLEN'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_INVALID'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpERR_NOT_CONNECTED'\\n\"");
__asm__(".ascii \"plcdata_const 'tcpSO_LINGER_SET'\\n\"");
__asm__(".previous");
