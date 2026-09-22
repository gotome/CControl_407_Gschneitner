(********************************************************************
 * COPYRIGHT -- LASCO Heu- und Forsttechnik GmbH
 ********************************************************************
 * Programm: System
 * Datei: System.st
 * Autor: Rudolf Lachner
 * Erstellt: 16. Januar 2014
 ********************************************************************
 * Implementierung des Programms System
 ********************************************************************)

PROGRAM _CYCLIC


	//Ticks generieren
	//****************
	fbLascoZdxx_0(IN 	:= hmiStatus.CurPage);
	bildTick			:= fbLascoZdxx_0.Q;
	fbLascoZdxx_1(IN	:= Echtzeit.Sekunde);
	sekTick				:= fbLascoZdxx_1.Q;
	
	//Name der Schnittstelle
	strcpy(ADR(Device), ADR('IF3'));
	
	
	//Konfiguration der IP- Adresse
	//*****************************

	IF (EDGEPOS(hmiButtons.IpParameterSetzen)) THEN
		Nutzungsdaten.Allgemein.SetEthernetOk	:= FALSE;
		CfgSetIPAddr_status         	:= ERR_FUB_BUSY;
		CfgSetDefaultGateway_status 	:= ERR_FUB_BUSY;
		CfgSetSubnetMask_status     	:= ERR_FUB_BUSY;
		CfgSetHostName_status       	:= ERR_FUB_BUSY;
	END_IF
	
	
	//Ethernetparameter setzen
	//************************
	IF (hmiButtons.IpParameterSetzen) THEN
	
		//IP- Adresse bei Init
		IF (CfgSetIPAddr_status <> 0) THEN
			CfgSetIPAddr_0(enable 	:= TRUE, pDevice := ADR(Device), pIPAddr := ADR(Betriebsparameter.Allgemein.IPAdresse) , Option := 1);
			CfgSetIPAddr_status		:= CfgSetIPAddr_0.status;
		END_IF	
		
		//Subnet Maske
		IF (CfgSetIPAddr_status = 0) AND (CfgSetSubnetMask_status <> 0) THEN
			CfgSetSubnetMask_0(enable 	:= TRUE, pDevice := ADR(Device), pSubnetMask := ADR(Betriebsparameter.Allgemein.SubnetMask), Option := 1);
			CfgSetSubnetMask_status		:= CfgSetSubnetMask_0.status;
		END_IF
		
		//Default Gateway
		IF (CfgSetIPAddr_status = 0) AND (CfgSetSubnetMask_status = 0) AND (CfgSetDefaultGateway_status <> 0) THEN
			CfgSetDefaultGateway_0(enable 	:= TRUE, pDevice := ADR(Device), pGateway := ADR(Betriebsparameter.Allgemein.DefaultGateway), Option := 1);
			CfgSetDefaultGateway_status		:= CfgSetDefaultGateway_0.status;
		END_IF
		
		//Host- Name
		IF (CfgSetHostName_status <> 0) THEN
			CfgSetHostName_0(enable := TRUE, pHostName := ADR(Betriebsparameter.Allgemein.HostName), Option := 1);
			CfgSetHostName_status	:= CfgSetHostName_0.status;
		END_IF
		
		//Konfiguration abschlieﬂen
		IF (CfgSetIPAddr_status = 0) AND (CfgSetDefaultGateway_status = 0) AND (CfgSetSubnetMask_status = 0) AND (CfgSetSubnetMask_status = 0) THEN
			hmiButtons.IpParameterSetzen     				:= FALSE;
			Nutzungsdaten.Allgemein.SetEthernetOk		:= TRUE;
		END_IF
	END_IF
	
	(*
	//Ethernetparameter auslesen
	//**************************
	IF (hmiStatus.hmiCurPage = _650_SYS) AND (bildTick) THEN 
		loc_GetEthernet 			:= TRUE;
		CfgGetIPAddr_status         := ERR_FUB_BUSY;
		CfgGetDefaultGateway_status := ERR_FUB_BUSY;
		CfgGetSubnetMask_status     := ERR_FUB_BUSY;
		CfgGetHostName_status       := ERR_FUB_BUSY;
	END_IF
	
	TON_10ms_0(IN := loc_GetEthernet, PT := 2 * 100);

  
	IF loc_GetEthernet THEN 
		
		hmiActions.cmdSetIpAddress	:= FALSE;
		
		//IP- Adresse
		IF CfgGetIPAddr_status <> 0 THEN
			CfgGetIPAddr_0(enable 	:= TRUE, pDevice := ADR(Device), pIPAddr := ADR(Betriebsparameter.Allgemein.IPAdresse), Len := INT_TO_USINT(LEN(Betriebsparameter.Allgemein.IPAdresse) + 1));
			CfgGetIPAddr_status		:= CfgGetIPAddr_0.status;
		END_IF
		
		//Subnet Maske
		IF CfgGetSubnetMask_status <> 0 THEN
			CfgGetSubnetMask_0(enable 	:= TRUE, pDevice := ADR(Device), pSubnetMask := ADR(Betriebsparameter.Allgemein.SubnetMask), Len := INT_TO_USINT(LEN(Betriebsparameter.Allgemein.SubnetMask) + 1));
			CfgGetSubnetMask_status		:= CfgGetSubnetMask_0.status;
		END_IF
		
		//Default Gateway
		IF CfgGetDefaultGateway_status <> 0 THEN
			CfgGetDefaultGateway_0(enable 	:= TRUE, pDevice := ADR(Device), pGateway := ADR(Betriebsparameter.Allgemein.DefaultGateway), Len := INT_TO_USINT(LEN(Betriebsparameter.Allgemein.DefaultGateway) + 1));
			CfgGetDefaultGateway_status		:= CfgGetDefaultGateway_0.status;
		END_IF
		
		//Host Name
		IF CfgGetHostName_status <> 0 THEN
			CfgGetHostName_0(enable := TRUE, pHostName := ADR(Betriebsparameter.Allgemein.HostName), Len := INT_TO_USINT(LEN(Betriebsparameter.Allgemein.HostName) + 1));
			CfgGetHostName_status	:= CfgGetHostName_0.status;
		END_IF
		
		IF (CfgGetIPAddr_status = 0) AND (CfgGetDefaultGateway_status = 0) AND (CfgGetSubnetMask_status = 0) AND (CfgGetHostName_status = 0) THEN
			loc_GetEthernet		:= FALSE;
		ELSIF TON_10ms_0.Q THEN
			loc_GetEthernet	:= FALSE;
		END_IF
	END_IF*)
	
END_PROGRAM
