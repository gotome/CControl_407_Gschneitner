(********************************************************************
* EMAIL Client für Sitemanager
*
* AUTH: ErKai KATOMA 20210516
*********************************************************************)

PROGRAM _CYCLIC
	
	//Betriebsparameter übergeben
	loc_EMailAlarmierungEin := Betriebsparameter.Fernalarmierung.EMailAlarmierungEin;
	EMail[0] := Betriebsparameter.Fernalarmierung.MailAdresse[0];
	EMail[1] := Betriebsparameter.Fernalarmierung.MailAdresse[1];
	EMail[2] := Betriebsparameter.Fernalarmierung.MailAdresse[2];
	EMail[3] := Betriebsparameter.Fernalarmierung.MailAdresse[3];
	
	//1. Alarm aus Visu auslesen
	//**************************
	IF VC_HANDLE = 0 THEN
		VC_HANDLE := VA_Setup(1, 'Visu');
	END_IF
		
	IF hmiButtons.QuitFehler THEN
		loc_FehlerAusgelesen	:= FALSE;
	END_IF

	IF gStatusAnlage.Fehler.SummeFehler AND NOT loc_FehlerAusgelesen AND loc_EMailAlarmierungEin THEN
		Access_Status := VA_Saccess(1, VC_HANDLE);
		IF Access_Status = 0 THEN
			AlarmLen 			:= 80;
			cSeparator 			:= 45; //Bindestrich
			uiAlarmType 		:= 1; //Ersten Alarm auslesen
			cDateTimeFormat 	:= 6; //Kein Datum, keine Uhrzeit
					
			GetActAlarmList_Status := VA_GetActAlarmList(1, VC_HANDLE, (ADR(AlarmString)), (ADR(AlarmLen)), uiAlarmType, cSeparator, cDateTimeFormat);
					
			IF GetActAlarmList_Status = 0 THEN
				loc_FehlerAusgelesen	:= TRUE;
				EMailText				:= AlarmString;
				Send					:= TRUE;
			END_IF
			VA_Srelease(1, VC_HANDLE);
		END_IF
	END_IF
		
	
	IP_ADRESS := ADR(Betriebsparameter.Allgemein.DefaultGateway);
	//IP_ADRESS := ADR('10.0.0.1');
	IP_PORT := 26864;

	Sendstring:=SLASH;
	UseComma:=FALSE;
	CommaString:='';
	
		
	IF EMail[0] <> '' THEN
		resultString:= CONCAT(LEFTBRACKET, EMail[0]);
		IF EMail[1]='' AND EMail[2]='' AND EMail[3]='' THEN
			resultString:= CONCAT(resultString, RIGHTBRACKET);
		END_IF;
		
		Sendstring:= CONCAT(Sendstring, resultString);
		UseComma:=TRUE;
	END_IF;
	
	IF EMail[1] <> '' THEN
		IF UseComma THEN
			CommaString:=COMMA;
			resultString:= COMMA;
		END_IF;
		resultString:= CONCAT(resultString, EMail[1]);
		IF EMail[2]='' AND EMail[3]='' THEN
			resultString:= CONCAT(resultString, RIGHTBRACKET);
		END_IF;
		
		Sendstring:= CONCAT(Sendstring,resultString);
		UseComma:=TRUE;
	END_IF;
	
	IF EMail[2] <> '' THEN
		IF UseComma THEN
			CommaString:=COMMA;
			resultString:= COMMA;
		END_IF;
		resultString:= CONCAT(resultString, EMail[2]);
		IF EMail[3]='' THEN
			resultString:= CONCAT(resultString, RIGHTBRACKET);
		END_IF;
		
		Sendstring:= CONCAT(Sendstring,resultString);
		UseComma:=TRUE;
	END_IF;	
	
	IF EMail[3] <> '' THEN
		IF UseComma THEN
			CommaString:=COMMA;
			resultString:= COMMA;
		END_IF;
		resultString:= CONCAT(resultString, EMail[3]);
		resultString:= CONCAT(resultString, RIGHTBRACKET);
		Sendstring:= CONCAT(Sendstring,resultString);
		UseComma:=TRUE;
	END_IF;
	
	Sendstring:= CONCAT(Sendstring,SLASH);
	
	Sendstring:= CONCAT(Sendstring,EMailText);
	
	
	CASE Client.sStep OF
 	
		
		0:	IF Send THEN
				ErrNr:=0;
				ErrorText:='';
				Client.sStep := 1;
			END_IF;
			
		
		(*Open*)
		 1: Client.TcpOpen_0.enable := 1;	
			Client.TcpOpen_0.pIfAddr := 0;  
			Client.TcpOpen_0.port := 26864;  
			Client.TcpOpen_0.options := 0;	
			Client.TcpOpen_0;  
						
			IF Client.TcpOpen_0.status = 0 THEN  
				Client.sStep := 5;											
			ELSIF Client.TcpOpen_0.status = ERR_FUB_BUSY THEN  
			  (*nicht feritg*)
			ELSE  
				ErrNr:= Client.TcpOpen_0.status;
				Client.sStep := 100;
			END_IF 
		
			
			(*Set Linger*)
		 5: Client.linger_opt.lLinger := 0; 
			Client.linger_opt.lOnOff := 1; 
				 
		 	Client.TcpIoctl_0.enable := 1;
			Client.TcpIoctl_0.ident := Client.TcpOpen_0.ident; 
			Client.TcpIoctl_0.ioctl := tcpSO_LINGER_SET; 
			Client.TcpIoctl_0.pData := ADR(Client.linger_opt);
			Client.TcpIoctl_0.datalen := SIZEOF(Client.linger_opt);
   			Client.TcpIoctl_0;	    
		
			IF Client.TcpIoctl_0.status = 0 THEN  
				Client.sStep := 10;											
			ELSIF Client.TcpIoctl_0.status = ERR_FUB_BUSY THEN  
			  (* hmhm.... *)
			ELSE  
				ErrNr:= Client.TcpIoctl_0.status;
				Client.sStep := 100;
			END_IF
		
		
		10: (* Connect*)					
			Client.TcpClient_0.enable := 1;
			Client.TcpClient_0.ident := Client.TcpOpen_0.ident;  
			Client.TcpClient_0.portserv := IP_PORT;  
			Client.TcpClient_0.pServer := IP_ADRESS;  
			Client.TcpClient_0;  
			
			IF Client.TcpClient_0.status = 0 THEN  
				Client.sStep := 20;	
			ELSIF Client.TcpClient_0.status = ERR_FUB_BUSY THEN  	
			  (* dudu.... *)
			ELSIF Client.TcpClient_0.status = tcpERR_INVALID THEN  
				ErrNr:= Client.TcpClient_0.status;
				ErrorText:= 'ERR_INVALID, Fehler Verbindungsaufbau';
				Client.sStep := 40;
			ELSE  
				ErrNr:= Client.TcpClient_0.status;
				Client.sStep := 100;
			END_IF
		
		20: (* Send*)
			Client.TcpSend_0.enable := 1;				
			Client.TcpSend_0.ident := Client.TcpOpen_0.ident;  
			Client.TcpSend_0.pData := ADR(Sendstring);  
			Client.TcpSend_0.datalen := LEN(Sendstring);  											
			Client.TcpSend_0.flags := 0;
			Client.TcpSend_0;  
				
			IF Client.TcpSend_0.status = 0 THEN  
				Client.sStep := 40;
			ELSIF Client.TcpSend_0.status = ERR_FUB_BUSY THEN  	
			  (* lala..... *)
			ELSIF (Client.TcpSend_0.status = tcpERR_SENTLEN) OR (Client.TcpSend_0.status = tcpERR_NOT_CONNECTED) THEN 
				CASE Client.TcpSend_0.status OF
					tcpERR_SENTLEN: ErrorText:= 'ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge.';
					tcpERR_NOT_CONNECTED: ErrorText:= 'ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle).'; 
				END_CASE
				ErrNr:= Client.TcpSend_0.status;
				Client.sStep := 40;
			ELSE  
				ErrNr:= Client.TcpSend_0.status;
				Client.sStep := 100;
			END_IF				
						
		40: (* Close *)
			Client.TcpClose_0.enable := 1;
			Client.TcpClose_0.ident := Client.TcpOpen_0.ident; 
			Client.TcpClose_0.how := 0;
			Client.TcpClose_0; 
	
			IF Client.TcpClose_0.status = 0 THEN  
				Client.sStep := 0;
				Send:=FALSE;
			ELSIF Client.TcpClose_0.status = ERR_FUB_BUSY THEN  
				(*tütü... *)
			ELSE  
				ErrNr:= Client.TcpClose_0.status;
				Client.sStep := 100;
			END_IF
			
		(*Error*)
		100: 
			CASE ErrNr OF
				32600: ErrorText:= 'ERR_INVALID_IDENT Der angegebene Ident ist nicht zulässig.';
				32601: ErrorText:= 'ERR_NOMORE_IDENTS, Es konnte kein weiterer Ident reserviert werden.';
				32602: ErrorText:= 'ERR_ALREADY_EXIST, Es existiert bereits ein Socket, der auf diese Portnummer';
				32603: ErrorText:= 'ERR_PARAMETER, Ungültige Parameter.';
				32604: ErrorText:= 'ERR_INVALID_IOCTL, Ungültiges IO-Control.';
				32606: ErrorText:= 'ERR_SENTLEN Die, übernommene Datenlänge entspricht nicht der angegebenen Datenlänge.';
				32607: ErrorText:= 'ERR_WOULDBLOCK, Daten konnten nicht in den Sendepuffer des Sockets übernommen werden.';
				32608: ErrorText:= 'ERR_INVALID, Fehler Verbindungsaufbau';
				32609: ErrorText:= 'ERR_NOT_CONNECTED, Die Verbindung wurde beendet (Gegenstelle).'; 
				32650: ErrorText:= 'ERR_SOCKET_CREATE, Ressourcenproblem im System. Es konnte kein Socket mehr angelegt werden.';  
				32651: ErrorText:= 'ERR_SOCKET_BIND, Problem beim Binden an die Portnummer bzw. an die ermittelte Ip-Adresse';
				32612: ErrorText:= 'ERR_INTERFACE, Die angegebene Interface-Adresse ist ungültig.';
				32699: ErrorText:= 'ERR_SYSTEM, Interner Fehler beim Senden.'; 
				65534: ErrorText:= 'ERR_FUB_ENABLE_FALSE, Fub nicht enabled. FUB enablen.';
				65535: ErrorText:= 'ERR_FUB_BUSY, Fub arbeitet noch.';
			END_CASE
			Send:=FALSE;
			Client.sStep:=0;
	END_CASE		


END_PROGRAM


