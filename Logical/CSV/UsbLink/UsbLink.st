

PROGRAM _INIT

	//Name des File- Devices
	strcpy(ADR(FileDevice), ADR('usb_device'));
	
	step	:= WAIT;
	
	
END_PROGRAM
	
PROGRAM _CYCLIC
	
	//Wenn Kopiebefehl von Datenaufzeichung -> Device erstellen
	IF (EDGEPOS(CSV01.SW.EXT_DirCopy_HAND_T)) OR (EDGEPOS(hmiButtons.ParameterVonUsbLaden)) OR (EDGEPOS(hmiButtons.DatenaufzeichnungAufUsb)) OR
		(EDGEPOS(hmiButtons.ParameterAufUsbKopieren)) THEN
		usbCmdCreateUsbDevice	:= TRUE;
	END_IF
	
	
	CASE step OF
 	
		//***************************************************************************************************************************************************
		WAIT:
			
		
			IF (usbCmdCreateUsbDevice) THEN
				step := CREATE_NODE_ID_LIST;
			ELSE
				step := WAIT;
			END_IF
				
		
		//***********************************************************************************************************************************************
		CREATE_NODE_ID_LIST:
			
			UsbNodeListGet_0.enable 					:= TRUE;
			UsbNodeListGet_0.pBuffer 					:= ADR(node_id_buffer);
			UsbNodeListGet_0.bufferSize 				:= SIZEOF(node_id_buffer);  
			UsbNodeListGet_0.filterInterfaceClass 		:= asusb_CLASS_MASS_STORAGE;
			UsbNodeListGet_0.filterInterfaceSubClass 	:= 0; 
			UsbNodeListGet_0;
			
			//Fertig
			IF UsbNodeListGet_0.status = 0 THEN
				step 	:= READ_DEVICE_DATA; 
				//Arbeitet noch
			ELSIF UsbNodeListGet_0.status = ERR_FUB_BUSY THEN
				step 	:= CREATE_NODE_ID_LIST;  
				//Fehler
			ELSE
				step 	:= ERROR_CASE;  
			END_IF;


		//********************************************************************************************************************************************
		READ_DEVICE_DATA: 
						
			UsbNodeGet_0.enable 		:= TRUE;
			UsbNodeGet_0.nodeId 		:= node_id_buffer[node];
			UsbNodeGet_0.pBuffer 		:= ADR(usb_data_buffer[node]); 
			UsbNodeGet_0.bufferSize 	:= SIZEOF (usb_data_buffer[node]); 
			UsbNodeGet_0;
	
			//Fertig
			IF UsbNodeGet_0.status = 0 THEN  	
				node := node + 1; 
				IF node = UsbNodeListGet_0.listNodes THEN 
					node := 0;
					step := GET_DESCRIPTOR; 
				END_IF
				//Arbeitet noch
			ELSIF UsbNodeGet_0.status = ERR_FUB_BUSY THEN
				step := READ_DEVICE_DATA;  
				//Fehler
			ELSE
				step := ERROR_CASE;  
			END_IF
			
		
		//*******************************************************************************************************************************************************************
		GET_DESCRIPTOR:
					
			UsbDescriptorGet_0.enable 				:= TRUE;
			UsbDescriptorGet_0.nodeId 				:= node_id_buffer[node]; 
			UsbDescriptorGet_0.requestType 			:= 0;  
			UsbDescriptorGet_0.descriptorType 		:= 1;  
			UsbDescriptorGet_0.languageId 			:= 0;  
			UsbDescriptorGet_0.pBuffer 				:= ADR(device_descriptor[node]); 
			UsbDescriptorGet_0.bufferSize 			:= SIZEOF(device_descriptor[node]);  
			UsbDescriptorGet_0;
	
			//Fertig
			IF UsbDescriptorGet_0.status = 0 THEN
				node := node + 1;  
				IF node = UsbNodeListGet_0.listNodes THEN 
					node := 0;
					step := CREATE_FILE_DEVICE;  
				END_IF
				//Arbeitet noch
			ELSIF UsbDescriptorGet_0.status = ERR_FUB_BUSY THEN
				step := GET_DESCRIPTOR;  
				//Fehler
			ELSE
				step := ERROR_CASE;  
			END_IF


		//*************************************************************************************************************************************************************************************************
		CREATE_FILE_DEVICE:  
						
			strcpy(ADR(device_name), ADR(FileDevice));
			strcpy(ADR(device_param), ADR('/DEVICE='));		
			strcat(ADR(device_param), ADR(usb_data_buffer[0].ifName));
	
			DevLink_0.enable 			:= TRUE;
			DevLink_0.pDevice 			:= ADR(device_name); 
			DevLink_0.pParam 			:= ADR(device_param); 
			DevLink_0;
			
			//Fertig
			IF DevLink_0.status = 0 THEN
				step := FINISH;
			//Arbeitet noch
			ELSIF DevLink_0.status = ERR_FUB_BUSY THEN
				step := CREATE_FILE_DEVICE;
			//Device existiert bereits -> Unlink
			ELSIF DevLink_0.status = 20730 THEN
				step	:= UNLINK_DEVICE;
			//Fehler
			ELSE
				step := ERROR_CASE; 
			END_IF;
											
		
		//**************************************************************************************************************************************
		UNLINK_DEVICE: 
					
			DevUnlink_0.enable 	:= TRUE;
			DevUnlink_0.handle 	:= DevLink_0.handle; 
			DevUnlink_0;

			IF DevUnlink_0.status = 0 THEN
				step := FINISH;  
			ELSIF DevUnlink_0.status = ERR_FUB_BUSY THEN
				step := CREATE_NODE_ID_LIST; 
			ELSE
				step := ERROR_CASE; 
			END_IF
			   																									

		//************************************************************************************************************************************************
		FINISH:  
			
			usbCmdCreateUsbDevice := FALSE;
			step := WAIT;
			
															

		//******************************************************************************************************************************************
		ERROR_CASE:	
			
			usbCmdCreateUsbDevice	:= FALSE;
			step	:= WAIT;
				
	END_CASE



END_PROGRAM
