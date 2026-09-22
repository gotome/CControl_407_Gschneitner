<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio Version=4.7.7.74 SP?>
<SwConfiguration CpuAddress="SL1" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1">
    <Task Name="eUhr" Source="Util.eUhr.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="UsbLink" Source="CSV.UsbLink.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#2">
    <Task Name="hmiMain" Source="Visualisierung.hmiMain.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="System" Source="Util.System.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="StartStopp" Source="Steuerung.StartStopp.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="mappPara" Source="Util.mappPara.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#3">
    <Task Name="ioHB3000" Source="IO.ioHB3000.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="aktorenMap" Source="IO.aktorenMapping.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="boxenMappi" Source="IO.boxenMapping.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Ablaufstrg" Source="Ablaufsteuerung.Ablaufstrg.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Leistung" Source="Regelung.Leistung.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Sitemanage" Source="Sitemanager.Sitemanager.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#4">
    <Task Name="Nutzung" Source="Util.Nutzung.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Alarm" Source="Alarmsystem.Alarm.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Berechnung" Source="Berechnung.Berechnung.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#5">
    <Task Name="Energiemes" Source="IO.Energiemessung.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="hmiConnect" Source="Visualisierung.hmiConnect.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#6">
    <Task Name="CSV01_EXT" Source="CSV.CSV01_EXT.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="CSV01_PRG" Source="CSV.CSV01_PRG.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8" />
  <DataObjects>
    <DataObject Name="CSV01_CFG" Source="CSV.CSV01_CFG.dob" Memory="UserROM" Language="Simple" />
  </DataObjects>
  <VcDataObjects>
    <VcDataObject Name="Visu" Source="Visualisierung.Visu.dob" Memory="UserROM" Language="Vc" WarningLevel="2" />
  </VcDataObjects>
  <Libraries>
    <LibraryObject Name="operator" Source="Libraries.operator.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="standard" Source="Libraries.standard.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="LascoMath" Source="Libraries.LascoMath.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LascoReg" Source="Libraries.LascoReg.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LascoTrock" Source="Libraries.LascoTrock.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LascoUtil" Source="Libraries.LascoUtil.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LaEntfV2" Source="Libraries.LaEntfV2.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LascoBoxen" Source="Libraries.LascoBoxen.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="LoopConR" Source="Libraries.LoopConR.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="brsystem" Source="Libraries.brsystem.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="asstring" Source="Libraries.asstring.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="FileIO" Source="Libraries.FileIO.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="DataObj" Source="Libraries.DataObj.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsARCfg" Source="Libraries.AsARCfg.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="visapi" Source="Libraries.visapi.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsUSB" Source="Libraries.AsUSB.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="dvframe" Source="Libraries.dvframe.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="IecCheck" Source="Libraries.IecCheck.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="AsTCP" Source="Libraries.AsTCP.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="MpFile" Source="Libraries.MpFile.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpBase" Source="Libraries.MpBase.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="MpRecipe" Source="Libraries.MpRecipe.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="CControl" Source="Libraries.CControl.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="CSV" Source="CSV.Library.CSV.lby" Memory="UserROM" Language="IEC" Debugging="true" />
  </Libraries>
</SwConfiguration>