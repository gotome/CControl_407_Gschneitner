(*============================================================================================================================================================================*)
(*================================================ STRUKTUREN IO-MODULE =====================================================================================================*)

TYPE
	modAP3131 : 	STRUCT 
		PmeanT : INT;
		QmeanT : INT;
		SmeanT : INT;
		PFmeanT : INT;
		AenergyT : DINT;
		RenergyT : DINT;
		SAenergyT : UDINT;
		TrigDFT : BOOL;
		EnabEnergy : BOOL;
		ClearEnergy : BOOL;
		ForceEnergy : BOOL;
		RBClearEnergy : BOOL;
		ModulOk : BOOL;
	END_STRUCT;
	modBR7300 : 	STRUCT 
		ModulOk : BOOL;
	END_STRUCT;
	modCM8281 : 	STRUCT 
		di01 : BOOL;
		di02 : BOOL;
		di03 : BOOL;
		di04 : BOOL;
		do01 : BOOL;
		do02 : BOOL;
		ai01 : INT;
		ao01 : INT;
		StatusInput01 : USINT;
		ModulOk : BOOL;
	END_STRUCT;
	modAO2622 : 	STRUCT 
		ao01 : INT;
		ao02 : INT;
		ModulOk : BOOL;
	END_STRUCT;
	modAI4622 : 	STRUCT 
		ai01 : INT;
		ai02 : INT;
		ai03 : INT;
		ai04 : INT;
		StatusInput01 : USINT;
		ModulOk : BOOL;
	END_STRUCT;
	modAI8321 : 	STRUCT 
		ai01 : INT;
		ai02 : INT;
		ai03 : INT;
		ai04 : INT;
		ai05 : INT;
		ai06 : INT;
		ai07 : INT;
		ai08 : INT;
		StatusInput01 : USINT;
		StatusInput02 : USINT;
		ModulOk : BOOL;
	END_STRUCT;
	modDO9322 : 	STRUCT 
		do01 : BOOL;
		do02 : BOOL;
		do03 : BOOL;
		do04 : BOOL;
		do05 : BOOL;
		do06 : BOOL;
		do07 : BOOL;
		do08 : BOOL;
		do09 : BOOL;
		do10 : BOOL;
		do11 : BOOL;
		do12 : BOOL;
		ModulOk : BOOL;
	END_STRUCT;
	modDO8322 : 	STRUCT 
		do01 : BOOL;
		do02 : BOOL;
		do03 : BOOL;
		do04 : BOOL;
		do05 : BOOL;
		do06 : BOOL;
		do07 : BOOL;
		do08 : BOOL;
		ModulOk : BOOL;
	END_STRUCT;
	modDI9371 : 	STRUCT 
		di01 : BOOL;
		di02 : BOOL;
		di03 : BOOL;
		di04 : BOOL;
		di05 : BOOL;
		di06 : BOOL;
		di07 : BOOL;
		di08 : BOOL;
		di09 : BOOL;
		di10 : BOOL;
		di11 : BOOL;
		di12 : BOOL;
		ModulOk : BOOL;
	END_STRUCT;
	modDIF371 : 	STRUCT 
		di01 : BOOL;
		di02 : BOOL;
		di03 : BOOL;
		di04 : BOOL;
		di05 : BOOL;
		di06 : BOOL;
		di07 : BOOL;
		di08 : BOOL;
		di09 : BOOL;
		di10 : BOOL;
		di11 : BOOL;
		di12 : BOOL;
		di13 : BOOL;
		di14 : BOOL;
		di15 : BOOL;
		di16 : BOOL;
		ModulOk : BOOL;
	END_STRUCT;
	modAT2222 : 	STRUCT 
		at01 : INT;
		at02 : INT;
		StatusInput01 : USINT;
		ModulOk : BOOL;
	END_STRUCT;
END_TYPE
