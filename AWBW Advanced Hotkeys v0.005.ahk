;==========================Hotkeys===========================
Select := "f"

Wait := "d"
Fire := "a"
Capture := "d"
Load := "s"
Unload := "s"
Repair := "a"
Hide := "s"
Supply := "d"
Join := "s"
Delete := "t"

DamageCalculator := "c"
CalculateAttacker := "a"
CalculateDefender := "d"
NextIdleUnit := "e"
EndTurn := "t"

Infantry := "a"
Mech := "s"
Recon := "d"
APC := "t"
Artillery := "y"
Tank := "q"
AntiAir := "g"
Missile := "c"
Rocket := "x"
MdTank := "w"
Piperunner := "v"
NeoTank := "e"
MegaTank := "r"

TCopter := "a"
BCopter := "s"
Fighter := "d"
Bomber := "g"
Stealth := "q"
BlackBomb := "w"

BlackBoat := "a"
Lander := "s"
Cruiser := "d"
Sub := "g"
Battleship := "y"
Carrier := "x"

CheckForUpdates := "^u"		;Ctrl + U
PauseScript :=  "^p"		;Ctrl + P
ExitScript := ">^e"		;Right Ctrl + E
ToggleDebugMode := "^+d"	;Ctrl + Shift + D

;=========================Settings===========================
SkipConfirmationMessageDelete := "false"
SkipConfirmationMessageEndTurn := "false"
SkipDayAnnouncementOnYourTurn := "true"
UsePreciseSleepMode := "true"
ScanDelayToWaitForMenusToOpenInMs := "36"

;========================Description=========================
;This script adds customizable advanced hotkeys to AWBW.
;It is written with AHK which has a few limitation like being Windows-exclusive, a little bit of setup time and a few things to look out for when using it, as it relies on pixel scans (See below for a full list of known limitations).
;My is would be to learn js and make a proper hotkey integration or inspire another developer to do so :). So feel free to improve it if you can!
;
;========================Requirements========================
;-Windows 7 or later.
;-A browser extension that allow custom scripts like Tampermonkey for installing two other required user scripts. With a quick google search the right version for any browser can be found quickly.
;-The Improved Building Menu script by steve and any script that disables anti aliasing (explanation on how to install follows).
;
;========================Installation========================
;-Install the other required user scripts with Tampermonkey (Links are below in the "Links" section).
;-To run this hotkey script the AHK compiler needs to be downloaded and installed.
;-After installation, any AHK script can be run by right clicking the .ahk file and selecting "Open" or "Run script".
;-To close the script, right click the small green H icon in the System tray (usually at the bottom right of the screen) or use the close script hotkey.
;
;=========================Features===========================
;-All Unit commands and building menu entries can be assigned to any key or key combination. Simply change the character of any keybinding in the Hotkeys section. Changes are applied automatically when the file is saved. A complete list of possible keys can be found in the links section below. If a certain hotkey should not be assigned at all, "" can be written after the equals sign.
;-The Hotkeys are case sensetive, meaning different actions can be bound to the same key. I.e one key could be used to buy an infantry when the building menu is open and the same key as the wait command hotkey if a unit is selected. Or capture and wait could be bounnd to the same key, as it probably never makes sense to use the wait command if capture is availbile. In that case capture would be the prefered action.
;-The "Selector" hotkey functions similarly to a left mouse click, but is meant as a tool to select units and producing buildings exclusively. This has the advantage that units or building menus no longer have to be closed before clicking on other units or producing buildings with overlapping menus or unit movement ranges.
;-In the settings section, various settings can be activated or deactivated, by writing "true" or "false" left to the equal sign.
;-"SkipConfirmationMessageDelete"and "SkipConfirmationMessageEndTurn" skips their confirmation message box, otherwise the hotkey as to be pressed twice. With "SkipDayAnnouncementOnYourTurn" set to "true" the day announcement will be skiped when any Hotkey is pressed. I recommended to keep that on, as the pop up can interfere with the menu detection. "DebugMode" is meant for debugging purposes. "UsePreciseSleepMode" and "ScanDelayToWaitForMenusToOpenInMs" are probably fine as they are. If you have a slow computer and run into problems, you can try to increase the wait time and set precise sleep off, which reduces the load on the CPU. The reason why a short waiting time is required in the first place is, that menus do not open immediately when clicking on something. On the other hand, a shorter time setting improves the speed of menu recognition, so that the corresponding hotkeys are activated more quickly.
;-The Script automatically checks for an update once a day. The update hotkey can also be used to search for updates manually. The keybinds and settings are kept when updating.
;
;==========================Links=============================
;-Improved Building Menu by steve: https://cdn.discordapp.com/attachments/945580784629215253/1206374723639054356/build-menu.js?ex=678ae183&is=67899003&hm=6435a995acad839a616d6b0a335aa6787448288148bb0feae6dd9804e9ebf0b0&
;-To install the improved building menu, click on the Tampermonkey extension -> "Create a new script..." -> paste the content of the link -> File -> Save. 
;-Pixel Perfector by twiggy_: https://greasyfork.org/en/scripts/460264-awbw-pixel-pefector
;-(optional)AWBW Maximize by Truniht, which i recommend to minimize the risk of missclicks: https://greasyfork.org/en/scripts/511815-awbw-maximise
;-(optional) AWBW Enhancements. Required for the damage calculator hotkey.
;-Download AHK to compile and run this script: https://www.autohotkey.com/
;-List of bindable keys: https://www.autohotkey.com/docs/v2/KeyList.htm
;
;=====================Known Limitations======================
;-As the hotkey script is based on pixel scans, it is important that the entire map is always visible and not blocked by any edge of the screen or other windows on top of it (including the damgage calculator, which can block ingame menus even outside the map). The size of the map should be reasonable, not too small and on the main monitor. The dpi-scaling (zoom) should be between 80% and 200%. The in-game zoom should be set at 1.0x at least.
;-Currently not compatible with user scripts that alters the appearance in certain ways. Custom armys may work. Cursor Coordinates are tested and not compatible at the moment. In the future I will make Cursor Coordinates compatible with an update.
;-Currently not compatible with user scripts that hides certain entries in the building menu (i.e. Piperunner and Missiles). There may also be other user script which changes the look of the game which may not be compatible.
;-Buttons that are not visiable on the screen are also not clickable for the hotkey script.
;-If you run into problems and certain hotkeys are not working, you can set "DebugMode" to "true" to check whether the script itself recognizes any errors.
;-When the script simulates input and manual input is given at the same time, the mouse might twitch or cause the browser to scroll unexpectedly.
;-Black Bomb and Stealth are the only units who can be missing from the building menu.
;-Currently in-game Error messages can interfer with the menu detection which may cause certain hotkeys to be disabled temporarily.
;-On slow computers, menu recognition is slightly slower when playing as Gray Sky, Jade Sun, Pink Cosmos and Acid Rain, as the color palette of the units conflicts with the color of the menu border. A short additional processing time is needed to distinguish menu and unit. On fast computers this just takes about 2 to 3 ms.
;
;===============Known Bugs/Missing Features=================
;-If the maximize script is used with the Windows taskbar set to hide automatically, it can sometimes cause the map to be cut off, affecting detection.
;-In rare cases on certain system or map configuration, certain hotkeys might not work. If i find anything to make them more reliable, I'll update the script.
;
;=========================Changelog==========================
;2025-01-05 v0.001
;	-First release. Creation of the basic structure and a few hotkeys to test.
;2025-01-06 v0.002
;	-Added a ReadMe part (description, installation steps etc.).
;	-Added an auto update feature.
;2025-01-06 v0.003
;	-The auto updater now keeps previous keybinds and settings.
;2025-01-12 v0.004
;	-Detection system of changes in map position and size improved.
;	-Added end turn and other QOL Hotkey.
;	-Dpi/ zoom level detection improved.
;	-If a unit is now selected without the action menu being open, it will no longer accept actions that are not available at the current mouse cursor position.
;2025-01-21 v0.005
;	-The rest of the hotkeys have been added.
;	-Added support for gridlines and the desert and DoR terrain types.
;	-Added an option to skip the day announcement at the beginning of your turn.
;	-Added detection if black bomb and/or Stealth is banned.
;
;==========================Colors============================
DarkGrasClassicColor := 12640304
LightGrasClassicColor := 14215200

DarkGrasCDesertColor := 16773746
LightGrasDesertColor := 16777085

DarkGrasDoRColor := 13793922
LightGrasDoRColor := 15173778

DarkGrasCustomColor := 0
LightGrasCustomColor := 0

GridColor := 9605802

;=======================Script start=========================
#Requires AutoHotkey v2.0
#SingleInstance Force
Critical
SetKeyDelay -1
SetMouseDelay -1
SetDefaultMouseSpeed 0
A_HotkeyInterval := 0
DirCreate A_AppData "\AWBW Advanced Hotkeys"
DirCreate A_AppData "\AWBW Advanced Hotkeys\images"
SetWorkingDir A_AppData "\AWBW Advanced Hotkeys"

ScriptVersion := "0.005"

isWaitAvailable := "false"
WaitX := 0
WaitY := 0
isFireAvailable := "false"
FireX := 0
FireY := 0
isCaptureAvailable := "false"
CaptureX := 0
CaptureY := 0
isLoadAvailable := "false"
LoadX := 0
LoadY := 0
isUnloadAvailable := "false"
UnloadX := 0
UnloadY := 0
isRepairAvailable := "false"
RepairX := 0
RepairY := 0
isHideAvailable := "false"
HideX := 0
HideY := 0
isSupplyAvailable := "false"
SupplyX := 0
SupplyY := 0
isJoinAvailable := "false"
JoinX := 0
JoinY := 0
isDeleteAvailable := "false"
DeleteX := 0
DeleteY := 0

MapX := 0
MapY := 0
MapW := 0
MapH := 0
isGameMaximized := "false"
Zoom := 0
EdgeThickness := 1
ColorFrameDistance := 3
TerrainType := 0
isGridOn := 0
VerifyMapPixelTL := 0
VerifyMapPixelBL:= 0
isMapCalibrated := "false"
CoinX := 0
CoinY := 0
TileSize := 0
DarkGrasColor := 0
LightGrasColor := 0
CalibrationCountdown := 0
SimulatingInputsNow := "false"

InGameMenuX := 0
InGameMenuY := 0
InGameMenuW := 0
InGameMenuH := 0
InGameMenuType := 0
PastInGameMenuType := 0
isUnitSelected := "false"
wasUnitSelected := "false"
NumberOfUnitMenuEntries := 1

mouseXUnitSelected := 0
mouseYUnitSelected := 0

TurnNowSkipable	 := "false"
TurnSkippedYet := "false"
YourTurn := 0
YourTurnLastScan := 0
SkipDayAnouncementX := 0
SkipDayAnouncementY := 0

UnoccupiedTileNumber := 0
UnoccupiedTileX := 0
UnoccupiedTileY := 0
NumberOfTilesX := 0
NumberOfTilesY := 0

isEnemyLockedIn := "false"
wasADifferentUnitSelected := "false"

isEndTurnConfirmationBoxOpen := "false"
isDeleteConfirmationBoxOpen := "false"
isResignConfirmationBoxOpen := "false"
MostRecentError := ""
LastKeyHeldDown := ""
ScreenBuffer := 0
PixelScan := 0
ScriptModifiedDate := FileGetTime(A_ScriptFullPath)
HalfScreenW := round(A_ScreenWidth / 2)
HalfScreenH := round(A_ScreenHeight / 2)
isScriptPaused := "false"
isDebugModeOn := "false"

if SkipConfirmationMessageDelete != "false" and SkipConfirmationMessageDelete != "true"
	SkipConfirmationMessageDelete := "false"
if SkipConfirmationMessageEndTurn != "false" and SkipConfirmationMessageEndTurn != "true"
	SkipConfirmationMessageEndTurn := "false"
if UsePreciseSleepMode != "false" and UsePreciseSleepMode != "true"
	UsePreciseSleepMode := "true"
if ScanDelayToWaitForMenusToOpenInMs = ""
	ScanDelayToWaitForMenusToOpenInMs := 36

LastUsedScriptVersion := IniRead("Info.ini", "Info", "Version" , 0)

	;if the current script version is higher than the last time the script was opened, close and delete everything from the old version
	
if LastUsedScriptVersion < ScriptVersion
{
	while WinExist("AWBW Advanced Hotkeys v" LastUsedScriptVersion ".ahk")
		WinClose "AWBW Advanced Hotkeys v" LastUsedScriptVersion ".ahk"
	Try FileDelete A_ScriptDir "\AWBW Advanced Hotkeys v" LastUsedScriptVersion ".ahk"
	IniWrite ScriptVersion, "Info.ini", "Info", "Version"
}

	;to minimize server load, only check for updates ones per day

if IniRead("Info.ini", "Info", "LastUpdateCheck" , 0) != A_YYYY "-" A_MM "-" A_DD
{
	IniWrite A_YYYY "-" A_MM "-" A_DD, "Info.ini", "Info", "LastUpdateCheck"
	CheckAndInstallUpdate("false")
}

	;reload the last army color that was used to decrease the response time for the first action taken.

ArmyColor := IniRead("Info.ini", "Info", "ArmyColor" , 0)

	;function to check and install updates. Keybinds and settings should be kept after updating.

if ArmyColor = 0
	IniWrite 0, "Info.ini", "Info", "ArmyColor"

CheckAndInstallUpdate(Notification)	
{
	whr := ComObject("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", "https://raw.githubusercontent.com/Incinerate93/AWBW-Advanced-Hotkeys/refs/heads/main/Version", true)
	whr.Send()
	whr.WaitForResponse()
	VerifiedMostRecentVersion := StrReplace(whr.ResponseText, "`n", "")
	if ScriptVersion < VerifiedMostRecentVersion
	{
		result := msgbox("An update is availiable, do you want to download the new Version now?`n`nCurrent Version:`t" " v" ScriptVersion "Availiable Version:`t" " v" VerifiedMostRecentVersion, "AWBW Advanced Hotkeys", "YesNo")
		if result = "yes"
		{
			whr.Open("GET", "https://raw.githubusercontent.com/Incinerate93/AWBW-Advanced-Hotkeys/refs/heads/main/Awbw Advanced Hotkeys v" VerifiedMostRecentVersion ".ahk", true)
			whr.Send()
			whr.WaitForResponse()
			ContentUpdatedVersion := whr.ResponseText
			
			SettingsToSave := Array("Select", "Wait", "Fire", "Capture", "Load", "Unload", "Repair", "Hide", "Supply", "Join", "Delete", "DamageCalculator", "CalculateAttacker", "CalculateDefender", "NextIdleUnit", "EndTurn", "Infantry", "Mech", "Recon",  "APC", "Artillery", "Tank", "AntiAir", "Missile", "Rocket", "MdTank", "Piperunner", "NeoTank",  "MegaTank", "TCopter", "BCopter", "Fighter", "Bomber", "Stealth",  "BlackBomb", "BlackBoat", "Lander", "Cruiser", "Sub",  "Battleship", "Carrier", "CheckForUpdates", "PauseScript", "ExitScript", "ToggleDebugMode", "SkipConfirmationMessageDelete", "SkipConfirmationMessageEndTurn", "UsePreciseSleepMode", "ScanDelayToWaitForMenusToOpenInMs")
			for n in SettingsToSave
			{
				ContentUpdatedVersion := StrReplace(ContentUpdatedVersion, "'" ' :="', "'" SettingsToSave[A_index] ' := "')
				ContentUpdatedVersion := StrReplace(ContentUpdatedVersion, "'" SettingsToSave[A_index] ' := ""', "'" SettingsToSave[A_index] ' := "' SettingsToSave[A_index] '"')
				ContentUpdatedVersion := StrReplace(ContentUpdatedVersion, "'" SettingsToSave[A_index] ' := " "', "'" SettingsToSave[A_index] ' := "' SettingsToSave[A_index] '"')
			}

			if StrLen(A_ScriptDir "\AWBW Advanced Hotkeys v" VerifiedMostRecentVersion ".ahk") > 1000
			{
				FileAppend ContentUpdatedVersion, A_ScriptDir "\AWBW Advanced Hotkeys v" VerifiedMostRecentVersion ".ahk"
				msgbox "The new version has been downloaded successfully. The script will reload now.", "AWBW Advanced Hotkeys"
				Run A_ScriptDir "\AWBW Advanced Hotkeys v" VerifiedMostRecentVersion ".ahk"
				ExitApp
			}
			else
				msgbox "The download was not successful, please try again later or check the AWBW Discord under community development.", "AWBW Advanced Hotkeys"
		}
	}
	else if Notification = "true"
		msgbox "The Script is up to date.`n`nCurrent Version: " " v" ScriptVersion, "AWBW Advanced Hotkeys"
}
					
ImageFiles := Array("DamageCalculator.png", "Resign.png", "55w41h.png", "Capture.png", "Delete.png", "Fire.png", "Hide.png", "Supply.png", "Unload.png", "Wait.png", "EndTurn.png", "Confirm.png", "220w1h.png", "1w220h.png", "90w10hBL.png", "48w1hGray.png", "Coin.png", "CoinMarked.png", "Calculator.png", "CalculatorMarked.png")

	;download necessary image files for pixel scanning

for in ImageFiles
{
	if !FileExist("images\" ImageFiles[A_index]) or FileGetSize("images\" ImageFiles[A_index]) < 24
	{
		Download "https://raw.githubusercontent.com/Incinerate93/AWBW-Advanced-Hotkeys/refs/heads/main/" ImageFiles[A_index], "images\" ImageFiles[A_index]
		if FileGetSize("images\" ImageFiles[A_index]) < 24
			msgbox "Failed to download the required image adjustment files.`n`nPlease try again later.", "AWBW Advanced Hotkeys"
	}		
}

Scan := ShinsImageScanClass()
InitializeHotkeyVariablesWithoutModifier()

CheckIfMapHasChanged()
SetTimer CheckIfMapHasChanged, 350, -1
	
SetTimer SearchUnoccupiedTerrain, 1500, -2
	
Critical "Off"

Hotif
	Try Hotkey CheckForUpdates, CheckForUpdatesPressed
	Try Hotkey PauseScript, PauseScriptPressed, "S"
	Try Hotkey ExitScript, ExitScriptPressed

Hotif 'WinActive("View Game - AWBW") && isMapCalibrated == "true"'

	Try Hotkey Wait, WaitPressed
	Try Hotkey Fire, FirePressed
	Try Hotkey Capture, CapturePressed
	Try Hotkey Load, LoadPressed
	Try Hotkey Unload, UnloadPressed
	
	Try Hotkey Repair, RepairPressed
	Try Hotkey Hide, HidePressed
	Try Hotkey Supply, SupplyPressed
	Try Hotkey Join, JoinPressed
	Try Hotkey Delete, DeletePressed
	Try Hotkey CalculateAttacker, CalculateAttackerPressed
	Try Hotkey CalculateDefender, CalculateDefenderPressed
	Try Hotkey NextIdleUnit, NextIdleUnitPressed
	Try Hotkey EndTurn, EndTurnPressed
	
	Try Hotkey Infantry, InfantryPressed
	Try Hotkey Mech, MechPressed
	Try Hotkey Recon, ReconPressed
	Try Hotkey APC, APCPressed
	Try Hotkey Artillery, ArtilleryPressed
	Try Hotkey Tank, TankPressed
	Try Hotkey AntiAir, AntiAirPressed
	Try Hotkey Missile, MissilePressed
	Try Hotkey Rocket, RocketPressed
	Try Hotkey MdTank, MdTankPressed
	Try Hotkey Piperunner, PiperunnerPressed
	Try Hotkey NeoTank, NeoTankPressed
	Try Hotkey MegaTank, MegaTankPressed
	Try Hotkey TCopter, TCopterPressed
	Try Hotkey BCopter, BCopterPressed
	Try Hotkey Fighter, FighterPressed
	Try Hotkey Bomber, BomberPressed
	Try Hotkey Stealth, StealthPressed
	Try Hotkey BlackBomb, BlackBombPressed
	Try Hotkey BlackBoat, BlackBoatPressed
	Try Hotkey Lander, LanderPressed
	Try Hotkey Cruiser, CruiserPressed
	Try Hotkey Sub, SubPressed
	Try Hotkey Battleship, BattleshipPressed
	Try Hotkey Carrier, CarrierPressed
	Try Hotkey Select, SelectPressed
	
Hotif 'WinActive("View Game - AWBW")'
	
	Try Hotkey ToggleDebugMode, ToggleDebugModePressed
	Try Hotkey DamageCalculator, DamageCalculatorPressed
	Try Hotkey "*" ToggleDebugModeNoModifier " up", ToggleDebugModeReleased
	Try Hotkey "*" SelectNoModifier " up", SelectReleased
	Try Hotkey "*" WaitNoModifier " up", WaitReleased
	Try Hotkey "*" FireNoModifier " up", FireReleased
	Try Hotkey "*" CaptureNoModifier " up", CaptureReleased
	Try Hotkey "*" LoadNoModifier " up", LoadReleased
	Try Hotkey "*" UnloadNoModifier " up", UnloadReleased
	Try Hotkey "*" RepairNoModifier " up", RepairReleased
	Try Hotkey "*" HideNoModifier " up", HideReleased
	Try Hotkey "*" SupplyNoModifier " up", SupplyReleased
	Try Hotkey "*" JoinNoModifier " up", JoinReleased
	Try Hotkey "*" DeleteNoModifier " up", DeleteReleased
	
	Try Hotkey "*" DamageCalculatorNoModifier " up",DamageCalculatorReleased
	Try Hotkey "*" CalculateAttackerNoModifier " up", CalculateAttackerReleased
	Try Hotkey "*" CalculateDefenderNoModifier " up", CalculateDefenderReleased
	Try Hotkey "*" NextIdleUnitNoModifier " up", NextIdleUnitReleased
	Try Hotkey "*" EndTurnNoModifier " up", EndTurnReleased
	
	Try Hotkey "*" InfantryNoModifier " up", InfantryReleased
	Try Hotkey "*" MechNoModifier " up", MechReleased
	Try Hotkey "*" ReconNoModifier " up", ReconReleased
	Try Hotkey "*" APCNoModifier " up", APCReleased
	Try Hotkey "*" ArtilleryNoModifier " up", ArtilleryReleased
	Try Hotkey "*" TankNoModifier " up", TankReleased
	Try Hotkey "*" AntiAirNoModifier " up", AntiAirReleased
	Try Hotkey "*" MissileNoModifier " up", MissileReleased
	Try Hotkey "*" RocketNoModifier " up", RocketReleased
	Try Hotkey "*" MdTankNoModifier " up", MdTankReleased
	Try Hotkey "*" PiperunnerNoModifier " up", PiperunnerReleased
	Try Hotkey "*" NeoTankNoModifier " up", NeoTankReleased
	Try Hotkey "*" MegaTankNoModifier " up", MegaTankReleased
	Try Hotkey "*" TCopterNoModifier " up", TCopterReleased
	Try Hotkey "*" BCopterNoModifier " up", BCopterReleased
	Try Hotkey "*" FighterNoModifier " up", FighterReleased
	Try Hotkey "*" BomberNoModifier " up", BomberReleased
	Try Hotkey "*" StealthNoModifier " up", StealthReleased
	Try Hotkey "*" BlackBombNoModifier " up", BlackBombReleased
	Try Hotkey "*" BlackBoatNoModifier " up", BlackBoatReleased
	Try Hotkey "*" LanderNoModifier " up", LanderReleased
	Try Hotkey "*" CruiserNoModifier " up", CruiserReleased
	Try Hotkey "*" SubNoModifier " up", SubReleased
	Try Hotkey "*" BattleshipNoModifier " up", BattleshipReleased
	Try Hotkey "*" CarrierNoModifier " up", CarrierReleased
	Try Hotkey "*" CheckForUpdatesNoModifier " up", CheckForUpdatesReleased
	Try Hotkey "*" PauseScriptNoModifier " up", PauseScriptReleased
	Try Hotkey "*" ExitScriptNoModifier " up", ExitScriptReleased
	Try Hotkey "*" ExitScriptNoModifier " up", ExitScriptReleased
Hotif

#Hotif
#Hotif WinActive("View Game - AWBW")
#Hotif WinActive("View Game - AWBW") && isMapCalibrated == "true"
#Hotif WinActive("View Game - AWBW") && SimulatingInputsNow == "false"

	*LButton::
	{
		global
		Critical
		if TurnNowSkipable = "true"
		{
			MouseGetPos &mouseX, &mouseY
			Click SkipDayAnouncementX, SkipDayAnouncementY
			TurnNowSkipable := "false"
			TurnSkippedYet := "true"
			mousemove mouseX, mouseY
		}
		MouseGetPos &mouseX, &mouseY
		Click "Down"
		CalibrationCountdown := 2
		if isMapCalibrated = "true"
		{
			CheckIfSthIsSelected("Mouse")
			if isDebugModeOn = "true"
			{
				DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
				PixelScan :=  round((EndTime - StartTime) / freq * 1000, 3)
			}
		}
	}

	~*LButton up::
	{
		if (isUnitSelected = "true")
			CheckIfUnitIsStillSelected()
	}

#Hotif
	~*LButton up::
	{
	}

	;Function to deselect a menu quicker. It prefers to click in a free tile. If the map size could not be determined, it defaults to just click in a corner of the opposite side of the current mouse position.

DeselectMenu()
{
	if UnoccupiedTileNumber != 0
		Click UnoccupiedTileX, UnoccupiedTileY
	else
	{
		if mouseX - MapX < TileSize + 10
			Click MapX  + MapW - 10, MapY + 10
		else
			Click MapX  + 10, MapY + 10
	}
}

	;Funtion is called when the select hotkey or left mouse button is released and a unit was selected befpre to check if the the unit hotkeys should be kept active.

CheckIfUnitIsStillSelected()
{
	global
	PreciseSleep()
	Scan.Update()
	if Scan.PixelCountRegion(1467064, MapX, MapY, MapW, MapH, variance:=0) < 48 and Scan.PixelCountRegion(1791835, MapX, MapY, MapW, MapH, variance:=0) < 48 and Scan.PixelCountRegion(2119515, MapX, MapY, MapW, MapH, variance:=0) < 48 
		isUnitSelected := "false"
}

	;Function is called when the select hotkey or left mouse button is pressed. Determines the type of menu and which options are available to unlock the corresponding hotkeys

CheckIfSthIsSelected(TypeOfSearch)
{
	global
	wasUnitSelected := isUnitSelected
	PastInGameMenuType := InGameMenuType
	InGameMenuType := 0
	isWaitAvailable := "false"
	isCaptureAvailable := "false"
	isFireAvailable := "false"
	isHideAvailable := "false"
	isRepairAvailable := "false"
	isUnloadAvailable := "false"
	isLoadAvailable := "false"
	isSupplyAvailable := "false"
	isDeleteAvailable := "false"
	isJoinAvailable := "false"
	PreciseSleep()
	MouseGetPos &mouseX, &mouseY
	if isDebugModeOn = "true"
	{
		DllCall("QueryPerformanceFrequency", "Int64*", &freq := 0)
		DllCall("QueryPerformanceCounter", "Int64*", &StartTime := 0)
		Scan.Update
		DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
		ScreenBuffer :=  round((EndTime - StartTime) / freq * 1000, 3)
	}
	else
		Scan.Update	
	if isDebugModeOn = "true"
	{
		DllCall("QueryPerformanceFrequency", "Int64*", &freq := 0)
		DllCall("QueryPerformanceCounter", "Int64*", &StartTime := 0)
	}
	CurrentUnitMovementRangeColor := 0
	if Scan.PixelCountRegion(1467064, MapX, MapY, MapW, MapH, variance:=0) >= 48
		CurrentUnitMovementRangeColor := 1467064
	else if Scan.PixelCountRegion(1791835, MapX, MapY, MapW, MapH, variance:=0) >= 48
		CurrentUnitMovementRangeColor := 1791835
	else if Scan.PixelCountRegion(2119515, MapX, MapY, MapW, MapH, variance:=0) >= 48
		CurrentUnitMovementRangeColor := 2119515
	if CurrentUnitMovementRangeColor != 0
	{
		if TypeOfSearch != "UnitCommandCheck"
		{
			mouseXUnitSelected := mouseX
			mouseYUnitSelected := mouseY
			if Scan.PixelRegion(CurrentUnitMovementRangeColor, MapX - 10, MapY - 10, MapX + MapW + 20, MapY + MapH + 20, variance:=0, &returnX:=0, &returnY:=0, "TBLR")
				MovementRangeL := returnX
			if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MapY - 10, MapX + MapW + 10 - MovementRangeL, MapY + MapH + 20, variance:=0, &returnX:=0, &returnY:=0, "LRTB")
				MovementRangeT := returnY
			if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MovementRangeT, MapX + MapW + 10 - MovementRangeL, MapY + MapH + 10 - MovementRangeT, variance:=0, &returnX:=0, &returnY:=0, "TBRL")
				MovementRangeR := returnX
			if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MovementRangeT, MovementRangeR - MovementRangeL, MapY + MapH + 10 - MovementRangeT, variance:=0, &returnX:=0, &returnY:=0, "LRBT")
				MovementRangeB := returnY
		}
		if TypeOfSearch = "UnitCommandCheck"
		{
			if Scan.PixelRegion(CurrentUnitMovementRangeColor, MapX - 10, MapY - 10, MapX + MapW + 20, MapY + MapH + 20, variance:=0, &returnX:=0, &returnY:=0, "TBLR")
			{
				if MovementRangeL != returnX
					wasADifferentUnitSelected := "true"
				else if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MapY - 10, MapX + MapW + 10 - MovementRangeL, MapY + MapH + 20, variance:=0, &returnX:=0, &returnY:=0, "LRTB")
				{
					if MovementRangeT > returnY + 15 and MovementRangeT < returnY - 15
						wasADifferentUnitSelected := "true"
					else if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MovementRangeT, MapX + MapW + 10 - MovementRangeL, MapY + MapH + 10 - MovementRangeT, variance:=0, &returnX:=0, &returnY:=0, "TBRL")
					{
						if MovementRangeR != returnX
							wasADifferentUnitSelected := "true"
						else if Scan.PixelRegion(CurrentUnitMovementRangeColor, MovementRangeL, MovementRangeT, MovementRangeR - MovementRangeL, MapY + MapH + 10 - MovementRangeT, variance:=0, &returnX:=0, &returnY:=0, "LRBT")
						{
							if MovementRangeB != returnY
								wasADifferentUnitSelected := "true"
							else
								wasADifferentUnitSelected := "false"
						}
					}
				}
			}
		}
		isUnitSelected := "true"
		return
	}
	else
		isUnitSelected := "false"
	InGameMenuX := 0
	InGameMenuY := 0
	if ArmyColor != 0 and Scan.PixelRegion(ArmyColor, MapX + ColorFrameDistance, MapY + ColorFrameDistance, MapW + 10, MapH + 10, variance:=0, &returnX:=0, &returnY:=0, "LRTB") and ArmyColor != 9934743 and ArmyColor != 12900276 and ArmyColor != 16751052  and ArmyColor != 8035601	; Fast pixel scan doesn't work for Gray Sky, Jade Sun, Pink Cosmos and Acid Rain
	{
		if Scan.PixelPosition(ArmyColor, returnX + 15, returnY + 1, variance:=0) and Scan.PixelPosition(ArmyColor, returnX + 40 , returnY + 1, variance:=0)
		{
			if Scan.PixelRegion(0, returnX - 10, returnY + 1, 10, 1, variance:=0, &returnX:=0, &returnY:=0, "RLTB")
				InGameMenuX := returnX
			if Scan.PixelRegion(0, returnX + 1, returnY - 10 , 1, 10, variance:=0, &returnX:=0, &returnY:=0, "BTLR")
				InGameMenuY := returnY
		}
	}
	if InGameMenuX = 0 or InGameMenuY = 0
	{
		if !Scan.ImageArrayRegion("images\55w41h.png", &arrayCorner, MapX + 1, MapY + 1, MapW + 56, MapH + 42, variance:=0, centerResults:=0)
		{
			MostRecentError := "No menu detected."
			return
		}
		for in arrayCorner
		{
			if !Scan.PixelPosition(0, arrayCorner[A_Index].x + EdgeThickness , arrayCorner[A_Index].y + EdgeThickness,variance:=0) and !Scan.PixelPosition(0, arrayCorner[A_Index].x - 1 , arrayCorner[A_Index].y, variance:=0)
			{
				InGameMenuX :=  arrayCorner[A_Index].x + EdgeThickness - 1
				InGameMenuY := arrayCorner[A_Index].y + EdgeThickness - 1
				ArmyColor := Scan.GetPixel(InGameMenuX + ColorFrameDistance, InGameMenuY + ColorFrameDistance, 0)
				IniWrite ArmyColor, "Info.ini", "Info", "ArmyColor"
				break
			}
			else if ArmyColor != 0 and Scan.PixelRegion(ArmyColor, arrayCorner[A_Index].x, arrayCorner[A_Index].y, 6, 6, variance:=0, &returnX:=0, &returnY:=0, "LRTB")
			{
				if Scan.PixelRegion(0, returnX - 10, returnY + 1, 10, 1, variance:=0, &returnX:=0, &returnY:=0, "RLTB")
					InGameMenuX := returnX - EdgeThickness + 1
				if Scan.PixelRegion(0, returnX + 1, returnY - 10 , 1, 10, variance:=0, &returnX:=0, &returnY:=0, "BTLR")
					InGameMenuY := returnY - EdgeThickness + 1
				break
			}
		}
	}
	if Scan.PixelRegion(0, InGameMenuX + 1, InGameMenuY + 3, A_ScreenWidth - InGameMenuX - 2, 1, variance:=0, &returnX:=0, &returnY:=0, "LRTB")
		InGameMenuW := returnX - InGameMenuX
	else
	{
		MostRecentError := "Cannot get Width of the menu "
		return
	}
	if Scan.PixelRegion(0, InGameMenuX + 1, InGameMenuY + 1, 1, A_ScreenHeight - InGameMenuY - 2, variance:=0, &returnX:=0, &returnY:=0, "LRTB")
		InGameMenuH := returnY - InGameMenuY
	else	
	{
		InGameMenuH := Scan.PixelCountRegion(0, InGameMenuX, InGameMenuY, 1, A_ScreenHeight - InGameMenuY, variance:=0)
		Counter := 0
		while !Scan.PixelPosition(0,InGameMenuX, InGameMenuY + InGameMenuH, variance:=0) and InGameMenuH > 30
			InGameMenuH--
		if InGameMenuH = 30
		{
			MostRecentError := "In game Menu detection got stuck while trying to get the menu height."
			return
		}
	}
	if InGameMenuH > 300 / 100 * Zoom
	{
		if MostRecentError = "Improved building menu missing or damage calculator obscures the view of the map."
			return
		if !Scan.PixelPosition(12226835, CoinX, CoinY,variance:=0) and !Scan.PixelPosition(16701507, CoinX + 1, CoinY,variance:=0) and !Scan.PixelPosition(2445730, CoinX, CoinY,variance:=0) and !Scan.PixelPosition(3366827, CoinX + 1, CoinY,variance:=0)
			return
		if Scan.ImageRegion("images\DamageCalculator.png", 0, 0, A_ScreenWidth, A_ScreenHeight, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
		{
			if Scan.PixelRegion(0, returnX - 1, 10, 1, returnY - 35, variance:=0, &returnX:=0, &returnY:=0, "BTLR")
			{
				if Scan.PixelRegion(0, 10, returnY + 1, returnX - 10, 1, variance:=0, &DamageCalculatorX:=0, &returnY:=0, "RLTB")
				{
					MostRecentError := "Damage calculator obscures the view of the map."
					return
				}
			}
		}
		MostRecentError := "Improved building menu missing."
		;Msgbox "It looks like the improved build menu mod is not installed, which is essential for the hotkeys to work properly. If this has been installed, it is a false positive.", "AWBW Advanced Hotkeys - Warning", "T4 262144"
		return
	}
	if InGameMenuW < 30 / 100 * (Zoom - 5) ;check if the detected Menu is too small to get the Menu type
	{
		MostRecentError := "Found menu is too small."
		return
	}
	if InGameMenuW > InGameMenuH * 1.5 and InGameMenuW > 105 / 100 * Zoom
		return
	if MostRecentError = "No menu detected."
		MostRecentError := ""
	if (TypeOfSearch = "Mouse" or TypeOfSearch = "UnitCommandCheck") and (wasUnitSelected = "true" or PastInGameMenuType = "Unit")
	{
		if !Scan.PixelRegion(0, InGameMenuX + 1, InGameMenuY + 1, round(InGameMenuW / 2), round(InGameMenuH / 2), variance:=0, &returnX:=0, &returnY:=0, "TBLR")
		{
			NumberOfFoundUnitMenuEntries := 0
			if InGameMenuH < 60 / 100 * Zoom
				NumberOfUnitMenuEntries := 1
			else if InGameMenuH < 100 / 100 * Zoom
				NumberOfUnitMenuEntries := 2
			else if InGameMenuH < 135 / 100 * Zoom
				NumberOfUnitMenuEntries := 3
			else
				NumberOfUnitMenuEntries := 4
			if NumberOfUnitMenuEntries = 1
			{
				if Scan.ImageRegion("images\Wait.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					WaitX := returnX
					WaitY := returnY
					isWaitAvailable := "true"
				}
				else if Scan.PixelRegion(7901432, round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "LRTB")
				{
					JoinX := returnX
					JoinY := returnY
					isJoinAvailable := "true"
				}
				else if Scan.PixelRegion(16466432, round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "LRTB")
				{
					LoadX := returnX
					LoadY := returnY
					isLoadAvailable := "true"
				}
				else if Scan.ImageRegion("images\Unload.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					UnloadX := returnX
					UnloadY := returnY
					isUnloadAvailable := "true"
				}
			}
			else
			{
				if Scan.ImageRegion("images\Wait.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					WaitX := returnX
					WaitY := returnY
					isWaitAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if Scan.ImageRegion("images\Capture.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					CaptureX := returnX
					CaptureY := returnY
					isCaptureAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.ImageRegion("images\Delete.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					DeleteX := returnX
					DeleteY := returnY
					isDeleteAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.ImageRegion("images\Fire.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					FireX := returnX
					FireY := returnY
					isFireAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.PixelRegion(9796437, round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "LRTB")
				{
					RepairX := returnX
					RepairY := returnY
					isRepairAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.ImageRegion("images\Unload.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					UnloadX := returnX
					UnloadY := returnY
					isUnloadAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.ImageRegion("images\Supply.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					SupplyX := returnX
					SupplyY := returnY
					isSupplyAvailable := "true"
					NumberOfFoundUnitMenuEntries++			
				}
				if NumberOfFoundUnitMenuEntries < NumberOfUnitMenuEntries and Scan.ImageRegion("images\Hide.png", round(InGameMenuX + 7 / 100 * Zoom), round(InGameMenuY + 11 / 100 * Zoom), round(InGameMenuW - 14 / 100 * Zoom), round(InGameMenuH - 22 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "LRTB")
				{
					HideX := returnX
					HideY := returnY
					isHideAvailable := "true"
					NumberOfFoundUnitMenuEntries++
				}
			}
			InGameMenuType := "Unit"
			return
		}
	}
	if InGameMenuH > 250 / 100 * Zoom and InGameMenuH < 285 / 100 * Zoom
		InGameMenuType := "Base"	
	else if Scan.PixelRegion(11394791, InGameMenuX, InGameMenuY, round(InGameMenuW / 2), round(InGameMenuH / 2), 0, &returnX:=0, &returnY:=0, "LRTB")
		InGameMenuType := "Port"
	else if Scan.PixelRegion(7969697, InGameMenuX, InGameMenuY, round(InGameMenuW / 2), round(InGameMenuH / 2), 0, &returnX:=0, &returnY:=0, "LRTB")
		InGameMenuType := "Port"
	else if Scan.PixelRegion(9089721, InGameMenuX, InGameMenuY, round(InGameMenuW / 2), round(InGameMenuH / 2), 0, &returnX:=0, &returnY:=0, "LRTB")
		InGameMenuType := "Port"
	else if Scan.PixelRegion(0, InGameMenuX + 1, InGameMenuY + 1, round(InGameMenuW / 2), round(InGameMenuH / 2), variance:=0, &returnX:=0, &returnY:=0, "TBLR") or Scan.PixelRegion(328965, InGameMenuX + 1, InGameMenuY + 1, round(InGameMenuW / 2), round(InGameMenuH / 2), variance:=0, &returnX:=0, &returnY:=0, "TBLR")
	{
		InGameMenuType := "Airport"
		if InGameMenuH > 215 / 100 * Zoom
		{
			StealthMenuSpot := 5
			BlackBombMenuSpot := 6
		}
		else if InGameMenuH < 160 / 100 * Zoom
		{
			StealthMenuSpot := 0
			BlackBombMenuSpot := 0
		}
		else
		{
			if Scan.PixelRegion(16514043, round(InGameMenuX + 8 / 100 * Zoom), round(InGameMenuY + 156 / 100 * Zoom), round(25 / 100 * Zoom), round(25 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "LRTB")
			{
				StealthMenuSpot := 0
				BlackBombMenuSpot := 5
			}
			else
			{
				StealthMenuSpot := 5
				BlackBombMenuSpot := 0
			}
		}
	}	
	else if Scan.PixelRegion(16314400, round(InGameMenuX + 8 / 100 * Zoom), round(InGameMenuY + 12 / 100 * Zoom), round(16 / 100 * Zoom), round(16 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "TBLR")
	{
		UnloadX := returnX
		UnloadY := returnY
		isUnloadAvailable := "true"
		InGameMenuType := "Unload"
	}
	else
	{
		MostRecentError := "Cannot recognize the menu type."
		return
	}
}

	;Function to buy something from the building menu and check whether you can afford it.

BuyUnitIfAffordable(MenuItemX, MenuItemY)
{
	global
	Critical
	if Scan.PixelRegion(816, MenuItemX, MenuItemY, round(16 / 100 * Zoom), round(16 / 100 * Zoom), variance:=0, &returnX:=0, &returnY:=0, "TBLR")
	{
		if Scan.PixelCountRegion(816, returnX, returnY, round(16 / 100 * Zoom), 1, variance:=0) = round(16 / 100 * Zoom)
		{
			MostRecentError := "Cannot afford unit purchase"
			return
		}
	}
	Click MenuItemX, MenuItemY
	Send "d"
	DeselectMenu()
	mousemove mouseXBuildingMenu, mouseYBuildingMenu
	InGameMenuType := 0
}

	;This function is called up when a hotkey is pressed to determine the action depending on the situation.

HotkeyPressed(ThisHotkey)
{
	global
	if isUnitSelected = "true" and (Thishotkey = Wait or Thishotkey = Capture or ThisHotkey = Fire or ThisHotkey = Load or ThisHotkey = Repair or ThisHotkey = Hide or ThisHotkey = Supply or ThisHotkey = Join or ThisHotkey = Delete)
	{
		if ThisHotkey = Fire
		{
			MouseGetPos &mouseXUnitCommand, &mouseYUnitCommand
			Click mouseXUnitCommand, mouseYUnitCommand
			PreciseSleep()
			Scan.Update()
			searchHeight := mouseYUnitCommand + 10
			while Scan.PixelRegion(ArmyColor, mouseXUnitCommand, 10, 1, searchHeight, variance:=0, &returnX:=0, &returnY:=0, "BTLR")
			{
				testY := returnY
				Counter := 1
				While Scan.PixelPosition(ArmyColor, returnX - Counter, testY,variance:=0)
					Counter++
				testX1 := Counter
				Counter := 0
				While Scan.PixelPosition(ArmyColor, returnX + Counter, testY,variance:=0)
					Counter++
				testX2 := Counter
				if testX1 + testX2 > 110 / 100 * Zoom
				{
					Click mouseXUnitCommand, mouseYUnitCommand
					return
				}
				else
					searchHeight--
			}
		}
		else if ThisHotkey = Delete
		{
			MouseGetPos &mouseX, &mouseY
			Click mouseXUnitSelected, mouseYUnitSelected
			mousemove mouseX, mouseY
		}
		else
		{
			MouseGetPos &mouseXUnitCommand, &mouseYUnitCommand
			Click mouseXUnitCommand, mouseYUnitCommand
		}
		CheckIfSthIsSelected("UnitCommandCheck")
		if isDebugModeOn = "true"
		{
			DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
			PixelScan :=  round((EndTime - StartTime) / freq * 1000, 3)
		}
		if  isUnitSelected = "true" and wasADifferentUnitSelected = "true" or isUnitSelected = "false" and InGameMenuType != "Unit" ;or isEnemyLockedIn = "true" ;InGameMenuType = "Base" or  überflüssig?
		{
			MouseGetPos &mouseX, &mouseY
			DeselectMenu()
			Click mouseXUnitSelected, mouseYUnitSelected
			mousemove mouseX, mouseY
			InGameMenuType := 0
			isUnitSelected := "true"
			return
		}
		if InGameMenuType != "Unit"
		{
			return
		}
	}
	if InGameMenuType = "Unit"
	{
		MouseGetPos &mouseX, &mouseY
		if ThisHotkey = Capture and isCaptureAvailable = "true"
			Click CaptureX, CaptureY
		else if ThisHotkey = Supply and isSupplyAvailable = "true"
			Click SupplyX, SupplyY
		else if ThisHotkey = Wait and isWaitAvailable = "true"
			Click WaitX, WaitY
		else if ThisHotkey = Load and isLoadAvailable = "true"
			Click LoadX, LoadY
		else if ThisHotkey = Unload and isUnloadAvailable = "true"
			Click UnloadX, UnloadY
		else if ThisHotkey = Repair and isRepairAvailable = "true"
			Click RepairX, RepairY
		else if ThisHotkey = Hide and isHideAvailable = "true"
			Click HideX, HideY
		else if ThisHotkey = Join and isJoinAvailable = "true"
			Click JoinX, JoinY
		else if ThisHotkey = Delete and isDeleteAvailable = "true"
		{
			Click DeleteX, DeleteY
			if SkipConfirmationMessageDelete = "true"
				SkipConfirmationMessage()
			else
				isDeleteConfirmationBoxOpen := "true"
		}
		
		else
		{
			DeselectMenu()
			Click mouseXUnitSelected, mouseYUnitSelected
			mousemove mouseX, mouseY
			InGameMenuType := 0
			isUnitSelected := "true"
			return
		}
		mousemove mouseX, mouseY	
		InGameMenuType := 0
	}
	else if ThisHotkey = Unload and InGameMenuType = "Unload"
	{
		MouseGetPos &mouseX, &mouseY
		Click UnloadX, UnloadY
		mousemove mouseX, mouseY	
		InGameMenuType := 0
	}
	else if InGameMenuType = "Base"
	{
		MouseGetPos &mouseXBuildingMenu, &mouseYBuildingMenu
		if ThisHotkey = Infantry
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 16 / 100 * Zoom))
		if ThisHotkey = Mech
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 54 / 100 * Zoom))
		if ThisHotkey = Recon
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 92 / 100 * Zoom))
		if ThisHotkey = APC
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 128 / 100 * Zoom))
		if ThisHotkey = Artillery
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 164 / 100 * Zoom))
		if ThisHotkey = Tank
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 200 / 100 * Zoom))
		if ThisHotkey = AntiAir
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 236 / 100 * Zoom))
		if ThisHotkey = Missile
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 16 / 100 * Zoom))
		if ThisHotkey = Rocket
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 54 / 100 * Zoom))
		if ThisHotkey = MdTank
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 92 / 100 * Zoom))
		if ThisHotkey = Piperunner
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 128 / 100 * Zoom))
		if ThisHotkey = NeoTank
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 164 / 100 * Zoom))
		if ThisHotkey = MegaTank
			BuyUnitIfAffordable(round(InGameMenuX + 194 / 100 * Zoom), round(InGameMenuY + 200 / 100 * Zoom))
	}
	else if InGameMenuType = "Airport"
	{
		MouseGetPos &mouseXBuildingMenu, &mouseYBuildingMenu
		if ThisHotkey = TCopter
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 16 / 100 * Zoom))
		if ThisHotkey = BCopter
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 54 / 100 * Zoom))
		if ThisHotkey = Fighter
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 92 / 100 * Zoom))
		if ThisHotkey = Bomber
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 128 / 100 * Zoom))
		if ThisHotkey = Stealth and StealthMenuSpot = 5
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 164 / 100 * Zoom))
		if ThisHotkey = BlackBomb and BlackBombMenuSpot = 5
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 164 / 100 * Zoom))
		if ThisHotkey = BlackBomb and BlackBombMenuSpot = 6
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 200 / 100 * Zoom))
	}
	else if InGameMenuType = "Port"
	{
		MouseGetPos &mouseXBuildingMenu, &mouseYBuildingMenu
		if ThisHotkey = BlackBoat
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 16 / 100 * Zoom))
		if ThisHotkey = Lander
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 54 / 100 * Zoom))
		if ThisHotkey = Cruiser
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 92 / 100 * Zoom))
		if ThisHotkey = Sub
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 128 / 100 * Zoom))
		if ThisHotkey = Battleship
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 164 / 100 * Zoom))
		if ThisHotkey = Carrier
			BuyUnitIfAffordable(round(InGameMenuX + 32 / 100 * Zoom), round(InGameMenuY + 200 / 100 * Zoom))
	}
	else if ThisHotkey = Unload
	{
		CheckIfSthIsSelected("UnitCommandCheck")
		if isDebugModeOn = "true"
		{
			DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
			PixelScan :=  round((EndTime - StartTime) / freq * 1000, 3)
		}
		if InGameMenuType = "Unload"
		{
			MouseGetPos &mouseX, &mouseY
			Click UnloadX, UnloadY
			mousemove mouseX, mouseY	
			InGameMenuType := 0
		}
	}
	else if ThisHotkey = Delete and isDeleteConfirmationBoxOpen  = "true"
	{
		if isDeleteConfirmationBoxOpen = "true"
		{
			PreciseSleep()
			Scan.Update()
			if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
			{
				Click returnX, returnY
				mousemove mouseX, mouseY
				isDeleteConfirmationBoxOpen := "false"
				return
			}
			else
			{
				DeselectMenu()
				PreciseSleep()
				Scan.Update()
				if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
				{
					Click returnX, returnY
					mousemove mouseX, mouseY
					isDeleteConfirmationBoxOpen := "false"
					return
				}
			}
		}
	}
	else if ThisHotkey = DamageCalculator
	{
		Send "c"
	}
	else if ThisHotkey = CalculateAttacker
	{
		if Scan.ImageRegion("images\DamageCalculator.png", 0, 0, A_ScreenWidth, A_ScreenHeight, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
			Send "{a down}{Click}{a up}"
	}
	else if ThisHotkey = CalculateDefender
	{
		if Scan.ImageRegion("images\DamageCalculator.png", 0, 0, A_ScreenWidth, A_ScreenHeight, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
			Send "{d down}{Click}{d up}"
	}
	else if ThisHotkey = NextIdleUnit
	{
		Send "e"
		CheckIfSthIsSelected("Mouse")
		if isDebugModeOn = "true"
		{
			DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
			PixelScan :=  round((EndTime - StartTime) / freq * 1000, 3)
		}
	}
	else if ThisHotkey = EndTurn
	{
		MouseGetPos &mouseX, &mouseY
		if isEndTurnConfirmationBoxOpen = "true"
		{
			if InGameMenuType != 0
			{
				DeselectMenu()
				PreciseSleep()
			}
			Scan.Update()
			if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
			{
				Click returnX, returnY
				mousemove mouseX, mouseY
				isEndTurnConfirmationBoxOpen := "false"
				Sleep 333
				return
			}
		}
		if isGameMaximized = "false"
		{
			if Scan.ImageRegion("images\EndTurn.png", HalfScreenW - 100, 10, HalfScreenW + 100, MapY - 10, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "RLBT")
			{
				Click returnX, returnY
				mousemove mouseX, mouseY
				isEndTurnConfirmationBoxOpen := "true"
			}
			else
			{
				LastError := "Cannot find the end turn button. [1]"
				return
			}
		}
		else
		{
			if Scan.ImageRegion("images\EndTurn.png", MapX + MapW, MapY, A_ScreenWidth - MapX - MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "RLBT")
			{
				Click returnX, returnY
				mousemove mouseX, mouseY
				isEndTurnConfirmationBoxOpen := "true"
			}
			else
			{
				MostRecentError := "Cannot find the end turn button. [2]"
				return
			}
		}
		if SkipConfirmationMessageEndTurn = "true"
		{
			SkipConfirmationMessage()
		}
	}
}

SkipConfirmationMessage()
{
	PreciseSleep()
	Scan.Update()
	if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
	{
		MouseGetPos &mouseX, &mouseY
		Click returnX, returnY
		mousemove mouseX, mouseY
	}
	else
	{
		DeselectMenu()
		PreciseSleep()
		Scan.Update()
		if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
		{
			MouseGetPos &mouseX, &mouseY
			Click returnX, returnY
			mousemove mouseX, mouseY
		}
		MostRecentError := "Cannot find the confirmation box."
		return
	}
}

SelectPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(SelectNoModifier)
	MouseGetPos &mouseX, &mouseY
	Send "d"
	if (InGameMenuType != 0 and mouseX - 4 > InGameMenuX and mouseX + 4 < InGameMenuX + InGameMenuW and mouseY - 4 > InGameMenuY and mouseY + 4 < InGameMenuY + InGameMenuH or InGameMenuType = "Unit")
		DeselectMenu()
	if mouseX < MapX or mouseX > MapX + MapW or mouseY < MapY or mouseY > MapY + MapH
		return
	Click mouseX, mouseY, "Down"
	CheckIfSthIsSelected("Selector")
	if isDebugModeOn = "true"
	{
		DllCall("QueryPerformanceCounter", "Int64*", &EndTime := 0)
		PixelScan :=  round((EndTime - StartTime) / freq * 1000, 3)
	}
}

	;Hotkey functions. The "AutoRepeatSuppression" function is used to prevent accidental button presses caused by holding a button for too long.

WaitPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(WaitNoModifier)
	HotkeyPressed(ThisHotkey)
}

FirePressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(FireNoModifier)
	HotkeyPressed(ThisHotkey)
}

CapturePressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(CaptureNoModifier)
	HotkeyPressed(ThisHotkey)
}

LoadPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(LoadNoModifier)
	HotkeyPressed(ThisHotkey)
}

UnloadPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(UnloadNoModifier)
	HotkeyPressed(ThisHotkey)
}

RepairPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(RepairNoModifier)
	HotkeyPressed(ThisHotkey)
}

HidePressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(HideNoModifier)
	HotkeyPressed(ThisHotkey)
}

SupplyPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(HideNoModifier)
	HotkeyPressed(ThisHotkey)
}

JoinPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(JoinNoModifier)
	HotkeyPressed(ThisHotkey)
}

DamageCalculatorPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(DamageCalculatorNoModifier)
	HotkeyPressed(ThisHotkey)
}

CalculateAttackerPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(CalculateAttackerNoModifier)
	HotkeyPressed(ThisHotkey)
}
CalculateDefenderPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(CalculateDefenderNoModifier)
	HotkeyPressed(ThisHotkey)
}

NextIdleUnitPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(NextIdleUnitNoModifier)
	HotkeyPressed(ThisHotkey)
}

DeletePressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(DeleteNoModifier)
	HotkeyPressed(ThisHotkey)
}

EndTurnPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(EndTurnNoModifier)
	HotkeyPressed(ThisHotkey)
}

InfantryPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(InfantryNoModifier)
	HotkeyPressed(ThisHotkey)
}

MechPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(MechNoModifier)
	HotkeyPressed(ThisHotkey)
}

ReconPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(ReconNoModifier)
	HotkeyPressed(ThisHotkey)
}

APCPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(APCNoModifier)
	HotkeyPressed(ThisHotkey)
}

ArtilleryPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(ArtilleryNoModifier)
	HotkeyPressed(ThisHotkey)
}

TankPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(TankNoModifier)
	HotkeyPressed(ThisHotkey)
}

AntiAirPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(AntiAirNoModifier)
	HotkeyPressed(ThisHotkey)
}

MissilePressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(MissileNoModifier)
	HotkeyPressed(ThisHotkey)
}

RocketPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(RocketNoModifier)
	HotkeyPressed(ThisHotkey)
}

MdTankPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(MdTankNoModifier)
	HotkeyPressed(ThisHotkey)
}

PiperunnerPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(PiperunnerNoModifier)
	HotkeyPressed(ThisHotkey)
}

NeoTankPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(NeoTankNoModifier)
	HotkeyPressed(ThisHotkey)
}

MegaTankPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(MegaTankNoModifier)
	HotkeyPressed(ThisHotkey)
}

TCopterPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(TCopterNoModifier)
	HotkeyPressed(ThisHotkey)
}

BCopterPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(BCopterNoModifier)
	HotkeyPressed(ThisHotkey)
}

FighterPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(FighterNoModifier)
	HotkeyPressed(ThisHotkey)
}

BomberPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(BomberNoModifier)
	HotkeyPressed(ThisHotkey)
}

StealthPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(StealthNoModifier)
	HotkeyPressed(ThisHotkey)
}

BlackBombPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(BlackBombNoModifier)
	HotkeyPressed(ThisHotkey)
}

BlackBoatPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(BlackBoatNoModifier)
	HotkeyPressed(ThisHotkey)
}

LanderPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(LanderNoModifier)
	HotkeyPressed(ThisHotkey)
}

CruiserPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(CruiserNoModifier)
	HotkeyPressed(ThisHotkey)
}

SubPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(SubNoModifier)
	HotkeyPressed(ThisHotkey)
}

BattleshipPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(BattleshipNoModifier)
	HotkeyPressed(ThisHotkey)
}


CarrierPressed(ThisHotkey)
{
	global
	Critical
	AutoRepeatSuppression(CarrierNoModifier)
	HotkeyPressed(ThisHotkey)
}

CheckForUpdatesPressed(ThisHotkey)
{
	global
	AutoRepeatSuppression(CheckForUpdatesNoModifier)
	CheckAndInstallUpdate("true")
}

PauseScriptPressed(ThisHotkey)
{
	global
	if isScriptPaused = "true"
	{
		isScriptPaused := "false"
		if isResignConfirmationBoxOpen = "false"
				Suspend "0"
	}	
	else
	{
		isScriptPaused := "true"
		if isResignConfirmationBoxOpen = "false"
				Suspend "1"
	}
}

ExitScriptPressed(ThisHotkey)
{
	ExitApp
}

ToggleDebugModePressed(ThisHotkey)
{
	global
	AutoRepeatSuppression(ToggleDebugModeNoModifier)
	if isDebugModeOn = "true"
	{
		isDebugModeOn := "false"
		SetTimer TooltipTimer, 0
		Tooltip
	}
	else
	{
		TooltipTimer()
		isDebugModeOn := "true"
		SetTimer TooltipTimer, 80, -3
	}
}

SelectReleased(ThisHotkey)
{
	Click "Up"
	ReleaseHotkey(SelectNoModifier)
	if (isUnitSelected = "true")
		CheckIfUnitIsStillSelected()
}

	;Release hotkey function, so that the same hotkey can be triggered again with the same keystroke.
	
WaitReleased(ThisHotkey)													
{
	ReleaseHotkey(WaitNoModifier)
}

FireReleased(ThisHotkey)													
{
	ReleaseHotkey(FireNoModifier)
}

CaptureReleased(ThisHotkey)													
{
	ReleaseHotkey(CaptureNoModifier)
}

LoadReleased(ThisHotkey)													
{
	ReleaseHotkey(LoadNoModifier)
}

UnloadReleased(ThisHotkey)													
{
	ReleaseHotkey(UnloadNoModifier)
}

RepairReleased(ThisHotkey)													
{
	ReleaseHotkey(RepairNoModifier)
}

HideReleased(ThisHotkey)													
{
	ReleaseHotkey(HideNoModifier)
}

SupplyReleased(ThisHotkey)													
{
	ReleaseHotkey(HideNoModifier)
}

JoinReleased(ThisHotkey)													
{
	ReleaseHotkey(JoinNoModifier)
}

DeleteReleased(ThisHotkey)													
{
	ReleaseHotkey(DeleteNoModifier)
}

DamageCalculatorReleased(ThisHotkey)													
{
	ReleaseHotkey(DamageCalculatorNoModifier)
}

CalculateAttackerReleased(ThisHotkey)													
{
	ReleaseHotkey(CalculateAttackerNoModifier)
}

CalculateDefenderReleased(ThisHotkey)													
{
	ReleaseHotkey(CalculateDefenderNoModifier)
}

NextIdleUnitReleased(ThisHotkey)													
{
	ReleaseHotkey(NextIdleUnitNoModifier)
}

EndTurnReleased(ThisHotkey)													
{
	ReleaseHotkey(EndTurnNoModifier)
}

InfantryReleased(ThisHotkey)													
{
	ReleaseHotkey(InfantryNoModifier)
}

MechReleased(ThisHotkey)													
{
	ReleaseHotkey(MechNoModifier)
}

ReconReleased(ThisHotkey)													
{
	ReleaseHotkey(ReconNoModifier)
}

APCReleased(ThisHotkey)													
{
	ReleaseHotkey(APCNoModifier)
}

ArtilleryReleased(ThisHotkey)													
{
	ReleaseHotkey(ArtilleryNoModifier)
}

TankReleased(ThisHotkey)													
{
	ReleaseHotkey(TankNoModifier)
}

AntiAirReleased(ThisHotkey)													
{
	ReleaseHotkey(AntiAirNoModifier)
}

MissileReleased(ThisHotkey)													
{
	ReleaseHotkey(MissileNoModifier)
}

RocketReleased(ThisHotkey)													
{
	ReleaseHotkey(RocketNoModifier)
}

MdTankReleased(ThisHotkey)													
{
	ReleaseHotkey(MdTankNoModifier)
}

PiperunnerReleased(ThisHotkey)													
{
	ReleaseHotkey(PiperunnerNoModifier)
}

NeoTankReleased(ThisHotkey)													
{
	ReleaseHotkey(NeoTankNoModifier)
}

MegaTankReleased(ThisHotkey)													
{
	ReleaseHotkey(MegaTankNoModifier)
}

TCopterReleased(ThisHotkey)													
{
	ReleaseHotkey(TCopterNoModifier)
}

BCopterReleased(ThisHotkey)													
{
	ReleaseHotkey(BCopterNoModifier)
}

FighterReleased(ThisHotkey)													
{
	ReleaseHotkey(FighterNoModifier)
}

BomberReleased(ThisHotkey)													
{
	ReleaseHotkey(BomberNoModifier)
}

StealthReleased(ThisHotkey)													
{
	ReleaseHotkey(StealthNoModifier)
}

BlackBombReleased(ThisHotkey)													
{
	ReleaseHotkey(BlackBombNoModifier)
}

BlackBoatReleased(ThisHotkey)													
{
	ReleaseHotkey(BlackBoatNoModifier)
}

LanderReleased(ThisHotkey)													
{
	ReleaseHotkey(LanderNoModifier)
}

CruiserReleased(ThisHotkey)													
{
	ReleaseHotkey(CruiserNoModifier)
}

SubReleased(ThisHotkey)													
{
	ReleaseHotkey(SubNoModifier)
}

BattleshipReleased(ThisHotkey)													
{
	ReleaseHotkey(BattleshipNoModifier)
}

CarrierReleased(ThisHotkey)													
{
	ReleaseHotkey(CarrierNoModifier)
}

CheckForUpdatesReleased(ThisHotkey)													
{
	ReleaseHotkey(CheckForUpdatesNoModifier)
}

PauseScriptReleased(ThisHotkey)													
{
	ReleaseHotkey(PauseScriptNoModifier)
}

ExitScriptReleased(ThisHotkey)													
{
	ReleaseHotkey(ExitScriptNoModifier)
}

ToggleDebugModeReleased(ThisHotkey)													
{
	ReleaseHotkey(ToggleDebugModeNoModifier)
}

	;Function to avoid duplicate inputs with a single keystroke.

AutoRepeatSuppression(HotkeyNoModifier)
{
	global
	
	if (LastKeyHeldDown = HotkeyNoModifier and !InStr(HotkeyNoModifier, "Wheel"))
		Exit
	if TurnNowSkipable = "true"
	{
		MouseGetPos &mouseX, &mouseY
		Click SkipDayAnouncementX, SkipDayAnouncementY
		TurnNowSkipable := "false"
		TurnSkippedYet := "true"
		mousemove mouseX, mouseY
	}
	LastKeyHeldDown := HotkeyNoModifier
}

	;Release hotkey function, so that the same hotkey can be triggered again with the same keystroke.

ReleaseHotkey(HotkeyNoModifier)
{
	global
	if (LastKeyHeldDown = HotkeyNoModifier)
		LastKeyHeldDown := 0
}

	;Function for determining the keybinds without modifiers. Otherwise, the auto repeat suppression function would not work for the same keys with different modifiers.

InitializeHotkeyVariablesWithoutModifier()
{
	global
	SelectNoModifier := RemoveModifier(Select)
	WaitNoModifier := RemoveModifier(Wait)
	FireNoModifier := RemoveModifier(Fire)
	CaptureNoModifier := RemoveModifier(Capture)
	LoadNoModifier := RemoveModifier(Load)
	UnloadNoModifier := RemoveModifier(Unload)
	RepairNoModifier := RemoveModifier(Repair)
	HideNoModifier := RemoveModifier(Hide)
	SupplyNoModifier := RemoveModifier(Supply)
	JoinNoModifier := RemoveModifier(Join)
	DeleteNoModifier := RemoveModifier(Delete)
	DamageCalculatorNoModifier := RemoveModifier(DamageCalculator)
	CalculateAttackerNoModifier := RemoveModifier(CalculateAttacker)
	CalculateDefenderNoModifier := RemoveModifier(CalculateDefender)
	NextIdleUnitNoModifier := RemoveModifier(NextIdleUnit)
	EndTurnNoModifier := RemoveModifier(EndTurn)
	InfantryNoModifier := RemoveModifier(Infantry)
	MechNoModifier := RemoveModifier(Mech)
	ReconNoModifier := RemoveModifier(Recon)
	APCNoModifier := RemoveModifier(APC)
	ArtilleryNoModifier := RemoveModifier(Artillery)
	TankNoModifier := RemoveModifier(Tank)
	AntiAirNoModifier := RemoveModifier(AntiAir)
	MissileNoModifier := RemoveModifier(Missile)
	RocketNoModifier := RemoveModifier(Rocket)
	MdTankNoModifier := RemoveModifier(MdTank)
	PiperunnerNoModifier := RemoveModifier(Piperunner)
	NeoTankNoModifier := RemoveModifier(NeoTank)
	MegaTankNoModifier := RemoveModifier(MegaTank)
	TCopterNoModifier := RemoveModifier(TCopter)
	BCopterNoModifier := RemoveModifier(BCopter)
	FighterNoModifier := RemoveModifier(Fighter)
	BomberNoModifier := RemoveModifier(Bomber)
	StealthNoModifier := RemoveModifier(Stealth)
	BlackBombNoModifier := RemoveModifier(BlackBomb)
	BlackBoatNoModifier := RemoveModifier(BlackBoat)
	LanderNoModifier := RemoveModifier(Lander)
	CruiserNoModifier := RemoveModifier(Cruiser)
	SubNoModifier := RemoveModifier(Sub)
	BattleshipNoModifier := RemoveModifier(Battleship)
	CarrierNoModifier := RemoveModifier(Carrier)
	CheckForUpdatesNoModifier := RemoveModifier(CheckForUpdates)
	PauseScriptNoModifier := RemoveModifier(PauseScript)
	ExitScriptNoModifier := RemoveModifier(ExitScript)
	ToggleDebugModeNoModifier := RemoveModifier(ToggleDebugMode)
}

	;Function to remove modifiers from the hotkey strings.

RemoveModifier(Key)
{
	if (Key = "")
		return ""
	ArrayObj := StrSplit(Key, A_Space)
	Key:= ArrayObj[ArrayObj.Length]
	if (SubStr(Key, -1, 1) != "!")
		Key := StrReplace(Key, "!", "")
	if (SubStr(Key, -1, 1) != "+")
		Key := StrReplace(Key, "+", "")
	if (SubStr(Key, -1, 1) != "#")
		Key := StrReplace(Key, "#", "")	
	if (SubStr(Key, -1, 1) != "^")
		Key := StrReplace(Key, "^", "")		
	if (SubStr(Key, -1, 1) != ">")
		Key := StrReplace(Key, ">", "")
	if (SubStr(Key, -1, 1) != "<")
		Key := StrReplace(Key, "<", "")
	if (SubStr(Key, -1, 1) != "*")
		Key := StrReplace(Key, "*", "")
	return Key
}

PreciseSleep()
{
	if UsePreciseSleepMode = "true"
	{
		DllCall("Winmm\timeBeginPeriod", "UInt", 7)
		DllCall("Sleep", "UInt", ScanDelayToWaitForMenusToOpenInMs)
		DllCall("Winmm\timeEndPeriod", "UInt", 7)
	}
	else
		Sleep ScanDelayToWaitForMenusToOpenInMs + 9
}

	; Function to displays some internal stats and error messages.

TooltipTimer()
{
	global
	if WinActive("View Game - AWBW")
	{
		if isMapCalibrated = "false"
		{
			MapXDisplay := 0
			MapYDisplay := 0
			MapWDisplay := 0
			MapHDisplay := 0
			NumberOfTilesXDisplay := 0
			NumberOfTilesYDisplay := 0
			ZoomDisplay := 0
		}
		else
		{
			MapXDisplay := MapX
			MapYDisplay := MapY
			MapWDisplay := MapW
			MapHDisplay := MapH
			NumberOfTilesXDisplay := NumberOfTilesX
			NumberOfTilesYDisplay := NumberOfTilesY
			ZoomDisplay := Zoom
		}
		if InGameMenuType = 0
		{
			InGameMenuXDisplay := 0
			InGameMenuYDisplay := 0
			InGameMenuWDisplay := 0
			InGameMenuHDisplay := 0
		}
		else
		{
			InGameMenuXDisplay := InGameMenuX
			InGameMenuYDisplay := InGameMenuY
			InGameMenuWDisplay := InGameMenuW
			InGameMenuHDisplay := InGameMenuH
		}
		Tooltip "Map:`t`tX: " MapXDisplay " Y: " MapYDisplay " W: " MapWDisplay " H: " MapHDisplay  "`n`t`tSize:`t`t(" NumberOfTilesXDisplay "/" NumberOfTilesYDisplay ")`n`t`tZoom:`t`t" ZoomDisplay "`n`t`tMaximized:`t" isGameMaximized  "`n`t`tCalibrated:`t" isMapCalibrated "`n`nInGameMenu:`tX: " InGameMenuXDisplay "Y: " InGameMenuYDisplay " W: " InGameMenuWDisplay " H: " InGameMenuHDisplay "`n`t`tMenuType:`t" InGameMenuType "`n`t`tisUnitSelected:`t" isUnitSelected "`n`nLatency:`t`tScreenBuffer:`t" ScreenBuffer " ms`n`t`tPixelScan:`t" PixelScan " ms`n`nMostRecentError: "  MostRecentError, A_ScreenWidth / 14 *  5 , 0
	}
	else
		Tooltip
}

	;Function to check whether the map coordinates or dimensions have changed.
	
CheckIfMapHasChanged()
{
	global
	Try
	{
		if ScriptModifiedDate != FileGetTime(A_ScriptFullPath)
		{
			Critical
			ScriptModifiedDate := FileGetTime(A_ScriptFullPath)
			Tooltip "Reloading settings...",,,2
			Sleep 333
			Tooltip ,,,2
			reload()
		}
	}
	if !WinActive("View Game - AWBW")
	{
		return
	}
	Scan.Update()
	if Scan.ImageRegion("images\DamageCalculator.png", 0, 0, A_ScreenWidth, A_ScreenHeight, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
		{
			if Scan.PixelRegion(0, returnX - 1, 10, 1, returnY - 35, variance:=0, &returnX:=0, &returnY:=0, "BTLR")
			{
				if Scan.PixelRegion(0, 10, returnY + 1, returnX - 10, 1, variance:=0, &DamageCalculatorX:=0, &returnY:=0, "RLTB")
				{
					if DamageCalculatorX < MapX + MapW
					{
						isMapCalibrated := "false"
						CalibrationCountdown := 0
						MostRecentError := "Damage calculator obscures the view of the map."
						return
					}
				}
			}
		}
	if Scan.ImageRegion("images\Confirm.png", MapX, MapY, MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
	{
		if Scan.PixelRegion(0, returnX + 1, returnY + 1, returnY + 1, 1, variance:=0, &ResignX2:=0, &returnY:=0, "LRTB")
		{
			if ResignX2 - returnX > 190 / 100 * Zoom
			{
				isResignConfirmationBoxOpen := "true"
				CalibrationCountdown := 0
				MostRecentError := "Resign window open."
				if isScriptPaused = "false"
					Suspend "1"
				return
			}
		}
	}
	else 
	{
		isResignConfirmationBoxOpen := "false"
		if isScriptPaused = "false" and A_IsSuspended
			Suspend "0"	
	}
		
	if SkipDayAnnouncementOnYourTurn = "true"
	{
		if TurnNowSkipable "true"
		{
			if !Scan.PixelPosition(816, SkipDayAnouncementX, SkipDayAnouncementY,variance:=0)
				TurnNowSkipable := "false"
		}
		if isGameMaximized = "false"
		{
			if Scan.ImageRegion("images\EndTurn.png", HalfScreenW + 100, 50, HalfScreenW - 100, MapY - 50, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "RLBT")
				YourTurn := "true"
			else
				YourTurn := "false"
		}
		else
		{
			if Scan.ImageRegion("images\EndTurn.png", MapX + MapW, MapY, A_ScreenWidth - MapX - MapW, MapH, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "RLBT")
				YourTurn := "true"
			else
				YourTurn := "false"
		}
		if YourTurnLastScan = "false" and YourTurn = "true"
			TurnSkippedYet := "false"
		
		if TurnSkippedYet = "false" and TurnNowSkipable = "false"
		{
			;if Scan.PixelRegion(816, round((MapX + MapW) / 2) - 60,  MapY, 120, MapH,  0, &SkipDayAnouncementX:=0, &SkipDayAnouncementY:=0, "TBLR") and InGameMenuType = 0
			if Scan.PixelRegion(816, MapX,  MapY, MapW, MapH,  0, &SkipDayAnouncementX:=0, &SkipDayAnouncementY:=0, "TBLR") and InGameMenuType = 0
			{
				;msgbox "found" TurnSkippedYet " " TurnNowSkipable
				TurnNowSkipable := "true"
			}
		}
		YourTurnLastScan := YourTurn
	}
	if !Scan.PixelPosition(12226835, CoinX, CoinY,variance:=0) and !Scan.PixelPosition(16701507, CoinX + 1, CoinY,variance:=0) and !Scan.PixelPosition(2445730, CoinX, CoinY,variance:=0) and !Scan.PixelPosition(3366827, CoinX + 1, CoinY,variance:=0) and (VerifyMapPixelTL != Scan.GetPixel(MapX + 1, MapY + 1, 0) or VerifyMapPixelBL != Scan.GetPixel(MapX + 1, MapY + MapH - 1, 0))
	{
		isMapCalibrated := "false"
		if !Scan.ImageRegion("images\Coin.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL") and !Scan.ImageRegion("images\CoinMarked.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL")
		{
			MostRecentError := "Something is blocking the view of the player info. [1]"
			return
		}
	}
	if isMapCalibrated = "true"
		return
	CalibrationCountdown++
	if CalibrationCountdown > 3
	{
		CalibrationCountdown := 0
		CalibrateMapCoordAndZoom()
	}
}

	;Funtion to determin the Map Coordinates and Dimensions

CalibrateMapCoordAndZoom()
{
	global
	Scan.Update()
	if !Scan.ImageRegion("images\Coin.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL") and !Scan.ImageRegion("images\CoinMarked.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL")
	{
		MostRecentError := "Something is blocking the view of the player info. [1]"
		Exit
	}
	
	if !Scan.ImageRegion("images\1w220h.png", 5, 5, A_ScreenWidth - 300, A_ScreenHeight - 300, variance:=0, &testX:=0, &testY:=0, centerResults:=0, "TBLR")
	{
		MostRecentError := "Cannot detect the left edge of the map."
		Exit
	}
	else
	{
		if Scan.PixelRegion(16448221, 50, testY, testX, 1, 0, &returnX:=0, &returnY:=0, "RLTB")
		{
			if !Scan.PixelRegion(16448221, testX, 5, 1, testY + 10, 0, &returnX:=0, &returnY:=0, "TBLR")
				return
			if !Scan.PixelRegion(16448221, testX, testY, A_ScreenWidth - returnX, 1, 0, &returnX:=0, &returnY:=0, "RLTB")
				return
			if !Scan.PixelRegion(16448221, testX, testY, 1, A_ScreenHeight - returnY, 0, &returnX:=0, &returnY:=0, "BTLR")
				return
		}	
	}
	Critical
	MouseGetPos &mouseX, &mouseY
	KeyWait "LButton", "L"
	SimulatingInputsNow := "true"
	Send "d"
	
	MouseMove A_ScreenWidth, A_ScreenHeight - 100, 0
	PreciseSleep()
	MouseMove mouseX, mouseY, 0
	PreciseSleep()
	MouseMove A_ScreenWidth, A_ScreenHeight - 100, 0
	PreciseSleep()
	Scan.Update()
	MouseMove mouseX, mouseY, 0
	
	SimulatingInputsNow := "false"
	if Scan.PixelCountRegion(16448221, 60, 10, A_ScreenWidth - 120, A_ScreenHeight - 300, variance:=0) > 200
	{
		searchX := 100
		isGameMaximized := "false"
	}
	else
	{
		searchX := 2
		isGameMaximized := "true"
	}
	if !Scan.ImageRegion("images\1w220h.png", searchX, 5, A_ScreenWidth - 300, A_ScreenHeight - 300, variance:=0, &MapX:=0, &MapY:=0, centerResults:=0, "TBLR")
	{
		MostRecentError := "Cannot detect the left edge of the map."
		Exit
	}
	;msgbox MapY
	if Scan.ImageRegion("images\220w1h.png", MapX - 2,2, A_ScreenWidth - MapX, MapY, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "TBLR")
	{
		if returnY < MapY
			MapY := returnY
	}	
	if Scan.ImageRegion("images\1w220h.png", searchX, 220, A_ScreenWidth - 300, A_ScreenHeight - 5, variance:=0, &returnX:=0, &returnY:=0, centerResults:=0, "BTLR")
	{
		MapH := returnY + 220 - MapY
		if isGameMaximized = "true"
		{
			if Scan.PixelCountRegion(0, MapX, MapY + MapH, 1, A_ScreenHeight - MapY - MapH,variance:=0) > 14
			{
				if Scan.PixelRegion(0, MapX, MapY + MapH, 1, A_ScreenHeight  - MapY - MapH, 0, &returnX:=0, &returnY:=0, "BTLR")
					MapH := returnY - MapY + 1
			}
		}
		else
		{
			if Scan.PixelRegion(16448221, MapX, MapY + MapH, 1, A_ScreenHeight - MapY - MapH, 0, &returnX:=0, &returnY:=0, "TBLR")
				MapH := returnY - MapY - 1
			else
			{
				MostRecentError := "Something is blocking the view of the bottom edge of the map."
				Exit
			}
		}
	}
	ClassicGrasPixelsNumber := Scan.PixelCountRegion(DarkGrasClassicColor, MapX + 1, MapY + 1, round(MapH / 6), MapH - 2,variance:=0)
	DesertGrasPixelsNumber := Scan.PixelCountRegion(DarkGrasCDesertColor, MapX + 1, MapY + 1, round(MapH / 6), MapH - 2,variance:=0)
	DoRGrasPixelsNumber := Scan.PixelCountRegion(DarkGrasDoRColor, MapX + 1, MapY + 1, round(MapH / 6), MapH - 2,variance:=0)
	
	if DarkGrasCustomColor != 0
		CustomGrasPixelsNumber := Scan.PixelCountRegion(DarkGrasCustomColor, MapX + 1, MapY + 1, round(MapH / 6), MapH - 2,variance:=0)
	else
		CustomGrasPixelsNumber := 0
	if ClassicGrasPixelsNumber > DesertGrasPixelsNumber + DoRGrasPixelsNumber + CustomGrasPixelsNumber
	{
		TerrainType := "Classic"
		DarkGrasColor := DarkGrasClassicColor
		LightGrasColor := LightGrasClassicColor
	}
	else if DesertGrasPixelsNumber > ClassicGrasPixelsNumber + DoRGrasPixelsNumber + CustomGrasPixelsNumber
	{
		TerrainType := "Desert"
		DarkGrasColor := DarkGrasCDesertColor
		LightGrasColor := LightGrasDesertColor
	}
	else if DoRGrasPixelsNumber > ClassicGrasPixelsNumber + DesertGrasPixelsNumber + CustomGrasPixelsNumber
	{
		TerrainType := "DoR"
		DarkGrasColor := DarkGrasDoRColor
		LightGrasColor := LightGrasDoRColor
	}
	else if CustomGrasPixelsNumber > ClassicGrasPixelsNumber + DesertGrasPixelsNumber + DoRGrasPixelsNumber
	{
		TerrainType := "Custom"
		DarkGrasColor := DarkGrasCustomColor
		LightGrasColor := LightGrasCustomColor
	}
	GridPixelsNumber :=  Scan.PixelCountRegion(GridColor, MapX + 1, MapY + 1, round(MapH / 6), MapH - 2,variance:=0)
	if GridPixelsNumber * 20 > (MapH / 6) * (MapH - 2)
		isGridOn := "true"
	else
		isGridOn := "false"
	if isGameMaximized = "false"
	{
		if Scan.PixelRegion(16448221, MapX + 10, MapY, A_ScreenWidth - MapX - 10, 1, 0, &returnX:=0, &returnY:=0, "LRTB")
			MapW := returnX - MapX - 1
		else
		{
			MostRecentError := "Cannot detect the top right corner of the map."
			Exit
		}
	}
	else
	{
		if Scan.PixelRegion(0, MapX + 10, MapY, A_ScreenWidth - MapX - 10, 1, 0, &returnX:=0, &returnY:=0, "RLTB")
		{
			MapW := returnX - MapX
			if Scan.PixelRegion(12640304, MapX + MapW + 1, MapY + 1, 3, MapH, 0, &returnX:=0, &returnY:=0, "RLTB")
			{
				MapW++
				While Scan.PixelRegion(12640304, MapX + MapW, MapY + 1, 3, MapH, 0, &returnX:=0, &returnY:=0, "TBLR") or MapW > A_ScreenWidth - MapX - 100
				{
					MapW++
				}
				While !Scan.PixelRegion(15064499, MapX + MapW, MapY + 5, 1, round(MapH / 3), 0, &returnX:=0, &returnY:=0, "TBLR") or MapW > A_ScreenWidth - MapX - 100
				{
					MapW++
				}
			}
		}
		else
		{
			MostRecentError := "Cannot detect the top edge of the map."
			Exit
		}
	}
	if MapX > HalfScreenW or MapX + MapW < HalfScreenW
	{
		MostRecentError := "Map is misaligned."
		Exit
	}
	if isGameMaximized = "true"
	{
		if Scan.ImageRegion("images\48w1hGray.png", MapX + MapW, MapY, 200, A_ScreenHeight - MapY, variance:=0, &DayCounterX:=0, &DayCounterYH:=0, centerResults:=0, "BTLR")
		{
			if Scan.PixelRegion(0, DayCounterX - 5, DayCounterYH - 5, 10, 10, 0, &returnX:=0, &returnY:=0, "LRTB")
			{
				MostRecentError := "Cannot find the day counter. [E1]"
				Exit
			}
			if Scan.PixelRegion(16777215, DayCounterX + 10, DayCounterYH, 1, 5, 0, &returnX:=0, &returnY:=0, "BTLR")
			{
				MostRecentError := "Cannot find the day counter. [E2]"
				Exit
			}
		}
		else
		{
			MostRecentError := "Cannot find the day counter. [E3]"
			Exit
		}
		while Scan.PixelPosition(8421504, DayCounterX + 10, DayCounterYH, variance:=0) and DayCounterYH > 50
			DayCounterYH--
		if Scan.PixelRegion(8421504, DayCounterX + 10, 50, 1, DayCounterYH - 50, 0, &returnX:=0, &DayCounterY:=0, "BTLR")
			 DayCounterH := DayCounterYH - DayCounterY  + 1
		else
		{
			MostRecentError := "Cannot find the day counter. [E4]"
			Exit
		}
		Zoom := round(100 / 48 * DayCounterH)
	}
	else
	{
		Zoom := 0
		if Scan.ImageRegion("images\Calculator.png", 0, 0, A_ScreenWidth, MapY, variance:=0, &CalculatorXM:=0, &CalculatorYM:=0, centerResults:=0, "BTLR") or Scan.ImageRegion("images\CalculatorMarked.png", 0, 0, A_ScreenWidth, MapY, variance:=0, &CalculatorXM:=0, &CalculatorYM:=0, centerResults:=0, "BTLR")
		{
			if Scan.PixelRegion(8947848, CalculatorXM, CalculatorYM - 100, 1, 100, 0, &CalculatorX:=0, &CalculatorY:=0, "BTLR")
			{
			}
			if Scan.PixelRegion(8947848, CalculatorXM - 100, CalculatorY + 1, 100, 1, 0, &CalculatorX:=0, &returnY:=0, "RLTB") and Scan.PixelRegion(8947848, CalculatorXM, CalculatorY + 1, 100, 1, 0, &CalculatorXW:=0, &returnY:=0, "LRTB")
			{
				CalculatorW := CalculatorXW - CalculatorX - 1
				Zoom := round((100 / 34 * CalculatorW) / 5) * 5
			}	
		}
		if Zoom = 0
		{
			if Scan.PixelRegion(16448221, 60, 100, HalfScreenW - 60, A_ScreenHeight - 200, 0, &returnX:=0, &returnY:=0, "BTLR")
				BgBeigeX := returnX
			else
			{
				MostRecentError := "The zoom level has to be between 80% and 200%. [E1]"
				Exit
			}
			if Scan.PixelRegion(16448221, HalfScreenW, 100, HalfScreenW, A_ScreenHeight - 200, 0, &returnX:=0, &returnY:=0, "BTRL")
				BgBeigeW := returnX - BgBeigeX + 1
			else
			{
				MostRecentError := "The zoom level has to be between 80% and 200%. [E2]"
				Exit
			}
			if BgBeigeW > A_ScreenWidth - 120
			{
				MostRecentError := "Zoom is too high."
				Exit
			}
			Zoom := BgBeigeW / 12
		}
	}
	if Zoom < 80 or Zoom > 210
	{
		MostRecentError := "The zoom level has to be between 80% and 200%. [E3]"
		Exit
	}
	if MostRecentError = "No menu detected."
		MostRecentError := ""
	EdgeThickness := Floor((Zoom + 6) / 100)
	if EdgeThickness = 0
		EdgeThickness := 1
	if EdgeThickness = 2
		ColorFrameDistance := 4
	else
		ColorFrameDistance := 3
	MapX := MapX + EdgeThickness - 1
	MapY := MapY + EdgeThickness - 1
	MapW := MapW - EdgeThickness
	MapH := MapH - EdgeThickness
	if isGameMaximized = "false"
	{
		if Scan.PixelCountRegion(16448221, MapX - EdgeThickness - 2, MapY, 1, MapH,variance:=0) < MapH - 50
		{
			MostRecentError := "Something is blocking the view of the left edge of the map."
			Exit
		}
		if Scan.PixelCountRegion(16448221, MapX +  MapW + EdgeThickness + 2, MapY, 1, MapH,variance:=0) < MapH - 50
		{
			MostRecentError := "Something is blocking the view of the right edge of the map."
			Exit
		}
		if Scan.PixelCountRegion(16448221, MapX, MapY - EdgeThickness - 2, MapW, 1,variance:=0) < MapW / 2
		{
			MostRecentError := "Something is blocking the view of the top edge of the map."
			Exit
		}
		if Scan.PixelCountRegion(16448221, MapX, MapY + MapH + EdgeThickness + 2, MapW, 1,variance:=0) < MapW - 50
		{
			MostRecentError := "Something is blocking the view of the bottom edge of the map."
			Exit
		}
	}
	if !Scan.ImageRegion("images\Coin.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL") and !Scan.ImageRegion("images\CoinMarked.png", 60, 60, A_ScreenWidth - 120, A_ScreenWidth - 120, variance:=0, &CoinX:=0, &CoinY:=0, centerResults:=0, "BTRL")
	{
		MostRecentError := "Something is blocking the view of the player info. [2]"
		Exit
	}
	VerifyMapPixelTL := Scan.GetPixel(MapX + 1, MapY + 1, 0)
	VerifyMapPixelBL := Scan.GetPixel(MapX + 1, MapY +MapH - 1, 0)
	LastGridLineFoundX := 0
	LastGrasFoundX := 0
	LastGrasFoundY := 0
	NumberOfTilesX := 0
	NumberOfTilesY := 0
	Counter := 1
	UnoccupiedTileNumber := 0
	MostRecentError := ""
	isMapCalibrated := "true"
	if isGridOn = "true"
	{
		searchX := MapX + 14
		while Scan.PixelRegion(GridColor, searchX, MapY + 1, 1, MapH - 10, 0, &returnX:=0, &returnY:=0, "TBLR")
		{
			searchX++
			GridPixelsAmount := Scan.PixelCountRegion(GridColor, searchX, MapY + 1, 1, MapH,variance:=0)
			if GridPixelsAmount > MapH / 2
			{
				Counter++
				if LastGridLineFoundX = 0
					LastGridLineFoundX := searchX
				else if searchX > LastGridLineFoundX + Counter
				{
					TileSize :=  searchX - LastGridLineFoundX
					if TileSize < 400
					{
						NumberOfTilesX := round(MapW  / TileSize)
						NumberOfTilesY := round(MapH / TileSize)
						TileSize := MapW / NumberOfTilesX
						SearchUnoccupiedTerrain()
						break
					}
				}
			}
		}
	}
	else if TerrainType = "Classic" or TerrainType = "Desert" or TerrainType = "Custom"
	{
		searchX := MapX + 14
		while Scan.PixelRegion(DarkGrasColor, searchX, MapY + 1, MapX + MapW - searchX, MapH - 10, 0, &returnX:=0, &returnY:=0, "TBLR")
		{
			searchX++
			DarkGrasAmount := Scan.PixelCountRegion(DarkGrasColor, searchX, MapY + 1, 1, MapH,variance:=0)
			LightGrasAmount := Scan.PixelCountRegion(LightGrasColor, searchX, MapY + 1, 1, MapH,variance:=0)
			;Tooltip DarkGrasAmount " " LightGrasAmount,,,2
			;Sleep  500
			if DarkGrasAmount > MapH / 8 and DarkGrasAmount > LightGrasAmount * 20
			{
				Counter++
				if LastGrasFoundX = 0
					LastGrasFoundX := searchX
				else if searchX > LastGrasFoundX + Counter
				{
					if Scan.PixelCountRegion(LightGrasColor, LastGrasFoundX + 14, MapY + 1, 1, MapH,variance:=0) > 0 and Scan.PixelCountRegion(LightGrasColor, searchX - 1, MapY + 1, 1, MapH,variance:=0) > 0 ; Make sure that both found dark gras lines are actually from grass tiles.
					{
						TileSize :=  searchX - LastGrasFoundX
						if TileSize < 400
						{
							NumberOfTilesX := round(MapW  / TileSize)
							NumberOfTilesY := round(MapH / TileSize)
							TileSize := MapW / NumberOfTilesX
							SearchUnoccupiedTerrain()
							break
						}
					}
				}
			}
		}
	}
	else
	{
		searchY := MapY + 14
		while Scan.PixelRegion(DarkGrasColor, MapX + 1, searchY, MapW - 10, MapY + MapH - searchY, 0, &returnX:=0, &returnY:=0, "LRTB")
		{
			searchY++
			DarkGrasAmount := Scan.PixelCountRegion(DarkGrasColor, MapX + 1, searchY, MapW, 1,variance:=0)
			LightGrasAmount := Scan.PixelCountRegion(LightGrasColor, MapX + 1, searchY, MapW, 1,variance:=0)
			;Tooltip DarkGrasAmount " " LightGrasAmount,,,2
			;Sleep  500
			if DarkGrasAmount > MapW / 10 and DarkGrasAmount > LightGrasAmount * 10
			{
				Counter++
				if LastGrasFoundY = 0
					LastGrasFoundY := searchY
				else if searchY > LastGrasFoundY + Counter
				{
					if Scan.PixelCountRegion(LightGrasColor, MapX + 1, LastGrasFoundY + 14, MapW, 1,variance:=0) > 0 and Scan.PixelCountRegion(LightGrasColor, MapX + 1, searchY - 1, MapW, 1,variance:=0) > 0 ; Make sure that both found dark gras lines are actually from grass tiles.
					{
						msgbox searchY " " LastGrasFoundY
						TileSize :=  searchY - LastGrasFoundY
						if TileSize < 400
						{
							NumberOfTilesX := round(MapW  / TileSize)
							NumberOfTilesY := round(MapH / TileSize)
							TileSize := MapW / NumberOfTilesX
							SearchUnoccupiedTerrain()
							break
						}
					}
				}
			}
		}
	}
	return
}

SearchUnoccupiedTerrain()
{
	global
	if isMapCalibrated = "false" or !WinActive("View Game - AWBW")
		return
	if UnoccupiedTileNumber != 0
	{
		if Scan.PixelRegion(0, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or  Scan.PixelRegion(7891064, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or Scan.PixelRegion(8153720, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or Scan.PixelRegion(16316528, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or Scan.PixelRegion(1446418, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or Scan.PixelRegion(328965, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") or Scan.PixelRegion(393216, MapX + 1, MapY + 1 + ((UnoccupiedTileNumber - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") ;8153720: Orange star, Blue Moon Green Earth, 1446418: Noir Eclipse, 7891064: rest 
		{
		UnoccupiedTileNumber := 0
		}
	}
	else
	{
		Loop NumberOfTilesY
		{
			if !Scan.PixelRegion(0, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and  !Scan.PixelRegion(7891064, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and !Scan.PixelRegion(8153720, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and !Scan.PixelRegion(16316528, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and !Scan.PixelRegion(1446418, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and !Scan.PixelRegion(328965, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") and !Scan.PixelRegion(393216, MapX + 1, MapY + 1 + ((A_index - 1 ) * TileSize), TileSize - 2, TileSize - 2, 0, &returnX:=0, &returnY:=0, "LRTB") ;8153720: Orange star, Blue Moon Green Earth, 1446418: Noir Eclipse, 7891064: rest 
			{
				UnoccupiedTileNumber := A_index
				UnoccupiedTileX := MapX + (TileSize / 2)
				UnoccupiedTileY := MapY + (TileSize / 2) + ((A_index - 1) * TileSize)
				break
			}	
		}
	}
}



;Image/pixel scanning class by Spawnova (5/15/22)
;https://github.com/Spawnova/ShinsImageScanClass
;
;General purpose class to scan image data for images and pixels, for ahk V2
;
;Image transparency is not handled in this class, if an image contains pixels that are not fully opaque they are simply ignored;
;which can be used to match images with portions that should be ignored by having those pixels be less than 0xFF000000
;
;I designed this class to be relatively user friendly but still maintain good performance
;I can't promise it will work for every setup, I can only confirm that it works for me on windows 10 (32 and 64 bit)
;
;All returned coordinate positions are dependant on the mode used, desktop uses screen space, client uses client space, otherwise window space
;
;Using desktop mode with windows aero enabled is much slower, try and use window/client mode where possible

class ShinsImageScanClass {

	;title								:		ahk window title or other type of identifier, leave blank or set to 0 to scan the entire desktop
	;UseClientArea_OrMainMonitor		:		UseClientArea = If a window is specified it will use the client area (generally does not include title bar and menus)
	;											Otherwise it will include the entirety of the window, which also includes extra space on the sides
	;											and bottom used for mouse dragging
	;											OrMainMonitor = Only search the main monitor, if false it will search the entire virtual desktop space (multi-monitors)
	
	__New(title:=0, UseClientArea_OrMainMonitor:=1) {
		global ShinsImageScanClass_Monitors
	
		this.AutoUpdate 		:= 0 	;when disabled, requires you to call Update() manually to refresh pixel data, useful when you need to scan multiple things on 1 frame
		
		this.UseControlClick 	:= 0  	;when enabled attempts to use ControlClick to send clicks which works for background programs
										;not all programs will respond to this however, so it may be necessary to use normal clicks which have to be foreground
										
		this.WindowScale 		:= 1	;if windows has set the desktop scaling to anything other than 100% you can adjust with this variable, for instance if windows scaling is set to 150%, set this variable to 1.5
		
		;#############################
		;	Setup internal stuff
		;#############################
		this.LoadLib("gdiplus")
		gsi := Buffer(24,0)
		NumPut("uint",1,gsi,0)
		token := 0
		DllCall("gdiplus\GdiplusStartup", "Ptr*", &token, "Ptr", gsi, "Ptr*", 0)
		this.gdiplusToken := token
		
		this.bits := (a_ptrsize == 8) ;0=32,1=64
		this.desktop := (title = 0 or title = "")
		this.UseClientArea := UseClientArea_OrMainMonitor
		this.VirtualDesktop := !UseClientArea_OrMainMonitor
		this.DesktopRegion := {x1:0,y1:0,x2:a_screenwidth,y2:a_screenheight,w:a_screenwidth,h:a_screenheight}
		this.imageCache := Map()
		this.offsetX := 0
		this.offsetY := 0
		this.hwnd := 0
		this.lastError := ""
		
		if (this.desktop) {
			coordmode "mouse","screen"
			if (!UseClientArea_OrMainMonitor) {
				ShinsImageScanClass_Monitors := []
				cbk := CallbackCreate(ShinsImageScanClass_MonitorCallback,"F")
				DllCall("EnumDisplayMonitors","Ptr",0,"Ptr",0,"ptr",cbk,"uint",0)
				if (ShinsImageScanClass_Monitors.Length > 0) {
					this.DesktopRegion := {x1:0,y1:0,x2:0,y2:0,w:0,h:0}
					for k,v in ShinsImageScanClass_Monitors {
						if (v.x1 < this.DesktopRegion.x1)
							this.DesktopRegion.x1 := v.x1
						if (v.y1 < this.DesktopRegion.y1)
							this.DesktopRegion.y1 := v.y1
						if (this.DesktopRegion.x2 < v.x2)
							this.DesktopRegion.x2 := v.x2
						if (this.DesktopRegion.y2 < v.y2)
							this.DesktopRegion.y2 := v.y2
					}
					this.DesktopRegion.w := this.DesktopRegion.x2 - this.DesktopRegion.x1
					this.DesktopRegion.h := this.DesktopRegion.y2 - this.DesktopRegion.y1
				} else {
					this.VirtualDesktop := 0
				}
			}
		} else if (UseClientArea_OrMainMonitor) {
			coordmode "mouse","client"
		} else {
			coordmode "mouse","window"
		}
			
		this.tBufferPtr := tBufferPtr := Buffer(1048576,0)
		this.dataPtr := dataPtr := Buffer(1024,0)
		
		this._scanImage := this.mcode("VVdWU4PsHItEJDSLTCQwi3wkOIt0JDyLEItZCIlEJAyJfCQEi3wkQInViXQkCMHtEDnrD4bHAAAAi3EMD7fSOfIPg7kAAACLQQQp1g+2VCQEKeuJUBAPvlQkCMcAAAAAAMdABAAAAACJWAiJcAyJUBSF/3Q7g/8BdE6D/wJ0WYP/A3Q8g/8EdGeD/wV0aoP/BnRVg/8HdXWLRCQMiUwkMIlEJDSLQUDrCo20JgAAAACLQTCDxBxbXl9d/+CNdCYAi0E86+6NdgCLQTiDxBxbXl9d/+CNdCYAi0E0g8QcW15fXf/gjXQmAItBROvGjXYAi0FM676NdgCLQUjrto12ALj+////g8QcW15fXcO4/////+vxkJCQkJCQkJCQkJCQ|V1ZTiwJEi1kQi3QkQInHwe8QQTn7D4bVAAAAi1kUD7fAOdgPg8cAAABMi1EIQSn7KcNFD7bARQ++yUnHAgAAAABFiVoIQYlaDEWJQhBFiUoUhfZ0M4P+AXRGg/4CdFGD/gN0NIP+BHRng/4FdHKD/gZ0TYP+Bw+FfQAAAEiLQXjrCmYPH0QAAEiLQVhbXl9I/+BmDx9EAABIi0Fw6+5mkEiLQWhbXl9I/+BmDx9EAABIi0FgW15fSP/gZg8fRAAASIuBgAAAAOvDDx+AAAAAAEiLgZAAAADrsw8fgAAAAABIi4GIAAAA66MPH4AAAAAAuP7///9bXl/DuP/////r9Q==")
		this._scanImageArray := this.mcode("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")
		this._scanImageArrayRegion := this.mcode("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")
		this._scanImageCount := this.mcode("VVdWU4PsPIt8JFSLRCRUi1QkWIt3BIsAi3wkUInFiXQkJIt/CMHtEIl8JBg57w+G/AQAAA+32ItEJFCJXCQMi0AMOcMPg+YEAAAp7ynYiXwkKIlEJDCE0g+EbAEAAItEJCSFwA+EYwIAAItEJDCFwA+OrQQAAI0ErQAAAADHRCQsAAAAAIlEJByLRCQYx0QkNAAAAADB4ALHRCQkAAAAAIlEJBQPtsKJbCQEicWLRCQohcAPjuoAAADHRCQgAAAAAI20JgAAAACLfCQMhf8PhKwAAACLRCQgA0QkLMdEJBAAAAAAweACi3wkVIlEJAiQi3QkBIX2dGkxyY22AAAAAItcjwiB+/////52TIt0JFCNBI0AAAAAAwaLdCQIiwQwid7B/hCJwsH6EA+20okUJInyD7byixQkKfKJ1sH+HzHyKfI56n9JD7bED7bfKdiZMdAp0DnFfDiDwQE5TCQEdZ+DRCQQAYtMJBSLRCQQAUwkCAN8JBw5RCQMD4Vw////i3wkBINEJCQBAXwkII12AINEJCABi0QkIDlEJCgPjyX///+DRCQ0AYtcJBiLRCQ0AVwkLDlEJDAPhe/+//+LRCQkg8Q8W15fXcOF9g+EbwIAAIXAD45JAwAAx0QkEAAAAADHRCQkAAAAAIksJItsJFCLXCQohdsPjrEAAADHRCQIAAAAAOsxifaNvCcAAAAAi00AjRwGgeL///8AiwyZgeH///8AOcp0U4NEJAgBi0QkCDlEJCh+dotMJAyFyXRTx0QkBAAAAACLBCSFwHQ1i1wkBIt8JFSLdCQQD6/DAd4Pr3QkGAN0JAiNPIcxwGaQi1SHCIH6/////neUg8ABOQQkdeyDRCQEAYt8JAQ5fCQMf7WLPCSDRCQkAQF8JAiDRCQIAYtEJAg5RCQof4qDRCQQAYtEJBA5RCQwD4Uw////i0QkJIPEPFteX13Di1wkMIXbD47l/v//jQStAAAAAMdEJDgAAAAAiUQkIItEJBjHRCQ0AAAAAMHgAsdEJCwAAAAAiUQkHA+2wolsJAiJxYtMJCiFyQ+OswAAAMdEJCQAAAAAjXQmAItUJAyF0g+E6wAAAItEJCQDRCQsx0QkEAAAAADB4AKLfCRUiUQkFJCLRCQIhcAPhKQAAACLXCRQi0QkFDHJAwOJRCQE6xxmkA+2xA+23ynYmTHQKdA56H87g8EBOUwkCHR2i0QkBItcjwiLBIiJ3sH+EInCwfoQD7bSiRQkifIPtvKLFCQp8onWwf4fMfIp8jnqfrSDRCQkAYtEJCQ5RCQoD49Z////g0QkOAGLXCQYi0QkOAFcJCw5RCQwD4Um////i0QkNIlEJCSLRCQkg8Q8W15fXcNmkINEJBABi0wkHItEJBABTCQUA3wkIDlEJAwPhTH///+LfCQIg0QkNAEBfCQkg0QkJAGLRCQkOUQkKA+P6f7//+uOi1QkMIXSD45x/f//x0QkBAAAAADHRCQIAAAAAItEJCiFwA+OkwAAAMcEJAAAAADrE422AAAAAIMEJAGLBCQ5RCQofneLRCQMhcB0WjH/he10S4tcJFCLRCQEixMB+A+vRCQYAwQki1wkVI00gonoD6/HjRyDMcCQjbQmAAAAAIsMhotUgwiB4f///wCB4v///wA50XWhg8ABOcV14oPHATl8JAx/qAEsJINEJAgBgwQkAYsEJDlEJCh/iYNEJAQBi0QkBDlEJDAPhU7///+LRCQIiUQkJItEJCSDxDxbXl9dw8dEJCQAAAAA6Y78///HRCQk/v///+mB/P//kJCQ|QVdBVkFVQVRVV1ZTSIPsKESLaRBFiexJideLEkSJLCRIictBi3cERQ+2yInVwe0QiXQkDEE57Q+GmwQAAEQPt/KLURRBOdYPg4sEAACJ10Ep7UQp90SJbCQIiXwkFEWEwA+ESwEAAESLVCQMRYXSD4QrAgAARItEJBRFhcAPjkgEAADHRCQQAAAAAI11/0UPttHHRCQYAAAAAMdEJAwAAAAAi0wkCIXJD47VAAAAx0QkBAAAAABmLg8fhAAAAAAARYX2D4SXAAAAi3wkBEUx5AN8JBBFMe1mDx+EAAAAAACF7XRpSWPERTHATY0ch+sDSYnAQ4tMgwiB+f////52REiLE0KNBAdBiclBwfkQiwSCRQ+2yYnCwfoQD7bSRCnKQYnRQcH5H0QxykQpykQ50n8+D7bED7bNKciZMdAp0EE5wnwsSY1AAUw5xnWjQYPFAUEB7AM8JEU57g+FgP///4NEJAwBAWwkBA8fgAAAAACDRCQEAYtEJAQ5RCQID489////g0QkGAGLDCSLRCQYAUwkEDlEJBQPhQX///+LRCQMSIPEKFteX11BXEFdQV5BX8OF9g+ERwIAAIX/D44JAwAAx0QkDAAAAAAx/0WF7Q+OuQAAAEUx2+suZg8fRAAATIsTQYnQJf///wBHiwSCQYHg////AEQ5wHRWQYPDAUU53Q+OhgAAAEKNdB0ARYX2dGdFMdJCjXQdAGYPH0QAAIXtdEyJ6EaNDBdEiRQkQQ+vwkUPr8xImEONFAtJjUyHCEEB8Q8fQACLAT3////+d4+DwgFIg8EEQTnRdetEixQkQYPCAesNZg8fhAAAAAAAQYPCAUU51n+nQYnzg0QkDAFBg8MBRTndD496////g8cBOXwkFA+FMf///+n9/v//i1QkFIXSD47x/v//x0QkGAAAAADHRCQQAAAAAMdEJBwAAAAAi0QkCIXAD47QAAAAi0QkHMdEJAQAAAAASIlcJHAB6IlEJAxmDx+EAAAAAABFhfYPhOoAAACLdCQMRTHtA3QkBEUx5GYPH4QAAAAAAIXtD4S4AAAASItEJHCJ8inqTIsASWPESY1MhwjrJ2aQD7bED7bfKdhBicJBwfofRDHQRCnQRDnIfz6DwgFIg8EEOdZ0e4nQixlBiwSAQYnbQYnCQcH7EEHB+hBFD7bbRQ+20kUp2kWJ00HB+x9FMdpFKdpFOcp+qINEJAQBi0QkBDlEJAgPj1X///9Ii1wkcINEJBgBizQki0QkGAF0JBw5RCQUD4UK////i0QkEIlEJAzp1v3//2YPH4QAAAAAAEGDxQEDNCRBAexFOe4PhS3///8BbCQEg0QkEAGDRCQEAYtEJAQ5RCQID4/x/v//65qLdCQUhfYPjpD9//9FMe1FMeREiWwkBESLLCREi1wkCEWF2w+OgwAAADH26wtmkIPGATl0JAh+dI18NQBFhfZ0W0Ux2418NQCF7XRHiehHjQwcTIsTQQ+vw0UPr81ImEKNDA5NjUSHCEEB+Q8fQACJyEGLFIJBiwCB4v///wAl////ADnCdaiDwQFJg8AEQTnJddxBg8MBRTnef6yJ/oNEJAQBg8YBOXQkCH+MQYPEAUQ5ZCQUD4Vg////RItsJAREiWwkDOnS/P//x0QkDAAAAADpxfz//8dEJAz+////6bj8//+QkJCQkJCQkJCQkA==")
		this._scanImageCountRegion := this.mcode("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")
		this._scanImageRegion := this.mcode("VVdWU4PsLItEJESLfCRYi0wkXItcJECLbCRIi1QkVIlEJBCLRCRMiXwkGIt8JGCJTCQciUQkCItEJFCJfCQMhcB5BAHF99iF0nkGAVQkCPfahe0PiNcBAACLTCQIhckPiMsBAACLTCQQiwmJz8HvEDn4D4yYAQAAD7fJOcoPjI0BAACLcwiJdCQUif45fCQUD4KKAQAAi3sMOc8Pgn8BAAAB6ANUJAgp8It0JBQpyonxg+kBOcaLdCQID0LBOdeNT/8PQtGLSwSJcQQx9oXAD0jGhdKJKQ9I1olBCA+2RCQYiVEMiUEQD75EJByJQRSLRCQMhcB0YYN8JAwBD4SGAAAAg3wkDAIPhJMAAACDfCQMA3Rcg3wkDAQPhLkAAACDfCQMBQ+ExgAAAIN8JAwGD4SLAAAAg3wkDAcPhfcAAACLRCQQiVwkQIlEJESLQ3DrFo20JgAAAACLTCQQiVwkQIlMJESLQ1CDxCxbXl9d/+CLRCQQiVwkQIlEJESLQ2jr5o20JgAAAACLRCQQiVwkQIlEJESLQ2CDxCxbXl9d/+CLRCQQiVwkQIlEJESLQ1iDxCxbXl9d/+CQjbQmAAAAAItEJBCJXCRAiUQkRItDeOuWjbQmAAAAAItEJBCJXCRAiUQkRIuDiAAAAOl4////kItEJBCJXCRAiUQkRIuDgAAAAOlg////ifaNvCcAAAAAuPz///+DxCxbXl9dw412ALj+////6+6J9o28JwAAAAC4/f///+veuP/////r15CQ|QVVBVFVXVlOLRCRYRItUJGCLXCRoRItcJHCLdCR4hcB5BUEBwPfYRYXSeQZFAdFB99pFhcAPiFUBAABFhckPiEwBAABEiyJFieVBwe0QRDnoD4wZAQAARQ+35EU54g+MDAEAAIt5EEQ57w+CEAEAAItpFEQ55Q+CBAEAAEQBwEUByg+220UPvttEKehFKeJEjWf/OceNff9BD0LERDnVRA9C10iLeQhEiQdFMcCFwEEPSMBFhdJEiU8ERQ9I0IlfEIlHCESJVwxEiV8UhfZ0MIP+AXRLg/4CdFaD/gN0MYP+BHRsg/4FdHeD/gZ0UoP+Bw+FoAAAAEiLQXjrBw8fAEiLQVhbXl9dQVxBXUj/4JBIi0Fw6+5mLg8fhAAAAAAASItBaFteX11BXEFdSP/gkEiLQWBbXl9dQVxBXUj/4JBIi4GAAAAA67sPH4AAAAAASIuBkAAAAOurDx+AAAAAAEiLgYgAAADrmw8fgAAAAAC4/P///1teX11BXEFdw2aQuP7////r7mYPH4QAAAAAALj9////6964/////+vXkJA=")
		this._scanPixel := this.mcode("V1ZTi1QkEItMJBiLXCQci3IMi0IEi3oID7bJiXAMi3QkFMcAAAAAAMdABAAAAACJeAiJcBCJSBSF23UMW4tCEF5f/+CNdCYAg/sBdDOD+wJ0PoP7A3Qhg/sEdFSD+wV0X4P7BnQ6g/sHdV1bi0IgXl//4JCNdCYAW4tCHF5f/+Bbi0IYXl//4JCNtCYAAAAAW4tCFF5f/+CQjbQmAAAAAFuLQiReX//gkI20JgAAAABbi0IsXl//4JCNtCYAAAAAW4tCKF5f/+BbuP////9eX8OQkJCQkJCQkJCQkJCQkJA=|TItREEiLQQhIxwAAAAAATIlQCEUPtsCJUBBEiUAURYXJdQ1I/2EYZg8fhAAAAAAAQYP5AXQyQYP5AnQ0QYP5A3QeQYP5BHQ4QYP5BXQ6QYP5BnQkQYP5B3UySP9hOGaQSP9hMA8fQABI/2EoDx9AAEj/YSAPH0AASP9hQA8fQABI/2FQDx9AAEj/YUi4/////8OQkJCQkJCQkJCQkJCQkA==")
		this._scanPixelCount := this.mcode("VVdWU4PsJIt0JDiLRCRAi0wkPIteCIt2DIgEJIlcJBCJdCQYhMAPhOQAAACF9g+OTAEAAInIx0QkHAAAAAAx9sH4EMdEJBQAAAAAD7bAiUQkBA+2xYlEJAiNBJ0AAAAAiUQkIA+2wYlEJAyQjXQmAItMJBCFyX5ui0QkOItcJByLTCQgiwCNFJ0AAAAAjSwIjRwQAdWNdgCLEw+2zitMJAiJ0A+20onPwfgQwf8fD7bAK0QkBDH5KfmJx8H/HzH4Kfg4yA9HyCtUJAyJ18H/HzH6Kfo40Q9D0TgUJIPe/4PDBDnddbKDRCQUAYtMJBCLRCQUAUwkHDlEJBgPhW////+DxCSJ8FteX13DkI10JgCLVCQYhdJ+aInYMe0x/zH2weACiQQkjXYAjbwnAAAAAItEJBCFwH4xi0QkOI0crQAAAACLEI0EGgMUJAHTjXYAixCB4v///wA50Q+UwoPABA+20gHWOcN154PHAQNsJBA5fCQYdbqDxCSJ8FteX13Dg8QkMfZbifBeX13DkJCQkA==|QVdBVkFVQVRVV1ZTSIPsGItBFESLcRCJRCQMSYnNRInFRYTAD4S+AAAAhcAPjgoBAACJ1w+2xkSJ80Ux/8H/EEGJxEUx0g+2ykAPtv8PHwBFhfZ+bEGJ2UmLdQBFKfGQRInIixSGD7bGRCngQYnAQcH4H0QxwEQpwEGJwInQD7bSwfgQD7bAKfhBicNBwfsfRDHYRCnYRDjAQQ9GwCnKQYnQQcH4H0QxwkQpwjjQD0LCQDjFQYPa/0GDwQFEOct1n0GDxwFEAfNEOXwkDHWBRInQSIPEGFteX11BXEFdQV5BX8MPH0QAAEGJw4XAfk1FifEx20Ux0mYPH4QAAAAAAEWF9n4qRInITYtFAEQp8JCJwUGLDIiB4f///wA5yg+UwYPAAQ+2yUEBykQ5yHXhg8MBRQHxQTnbdcbrk0Ux0uuOkJCQkJCQkJCQkJCQkJCQ")
		this._scanPixelCountRadius := this.mcode("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")
		this._scanPixelCountRegion := this.mcode("VVdWU4PsKItEJEyLdCREi1wkVItUJEABxotMJFCIHCSJdCQUhcB5DItEJESJdCREiUQkFIt0JEgBzol0JBCFyXkMi0QkSIl0JEiJRCQQi0wkRIXJD4jGAQAAi0QkSIXAD4i6AQAAi0QkPItMJBSLbCQQi3AIOc6NRv+JdCQYD0fBiUQkFInHi0QkPItADI1I/znoD0fNiUwkEITbD4TuAAAAOUwkSA+NagEAAInQD690JEjB6BAPtsCJRCQED7bGiUQkCItEJESJdCQcMfbB4AKJRCQkjQS9AAAAAIlEJCAPtsKJRCQMifaNvCcAAAAAi0QkFDlEJER9bItEJDyLXCQkiyiLRCQcweACAcMB6wNsJCABxY12AIsTD7bOK0wkCInQD7bSic/B+BDB/x8PtsArRCQEMfkp+YnHwf8fMfgp+DjID0fIK1QkDInXwf8fMfop+jjRD0PROBQkg97/g8MEOd11sotcJBiDRCRIAQFcJByLRCQQO0QkSA+Fb////4nwg8QoW15fXcOQjXQmADlMJEgPjXwAAACLRCREi3wkSItsJEjB4AIPr/6JRCQEi0QkFMHgAokEJDHAjXQmAIt0JBQ5dCREfTeLdCQ8i0wkBIsejTS9AAAAAAHxAdkDHCQB3o10JgCLGYHj////ADnaD5TDg8EED7bbAdg58XXng8UBA3wkGDlsJBB1soPEKFteX13Dg8QoMcBbXl9dw7j9////6Vn///+QkJCQkJA=|QVdBVkFVQVRVV1ZTSIPsGIuEJJAAAABBicREiUQkcESLhCSAAAAARIt0JHBIiUwkYIuMJIgAAABFAcZFhcB5DUSLRCRwRIl0JHBFicZGjTwJhcl5CUSJyUWJ+UGJz4tMJHCFyQ+IggEAAEWFyQ+IeQEAAEiLdCRgi14QjUv/RDnziVwkCEQPRvGLThREjUH/RDn5RQ9G+ITAD4TZAAAARTn5D409AQAAi3wkcIneidUPtsZBD6/xwe0QQYnFD7baRCn3QA+27THAiXwkDEQB9kQ5dCRwfXlIi3wkYItMJAxIiz9EjRQxZg8fhAAAAAAARInSiwyXD7bVRCnqQYnQQcH4H0QxwkQpwkGJ0InKD7bJwfoQD7bSKepBidNBwfsfRDHaRCnaRDjCQQ9G0CnZQYnIQcH4H0QxwUQpwTjKD0LRQTjUg9j/QYPCAUQ51nWgQYPBAQN0JAhFOc8PhW////9Ig8QYW15fXUFcQV1BXkFfw2YPH0QAAEU5+X1oQYnaid6LXCRwSItsJGBFD6/Ri3wkcDHARCnzRQHyDx9EAABEOfd9L0yLXQBCjQwTDx8AQYnIR4sEg0GB4P///wBEOcJBD5TAg8EBRQ+2wEQBwEE5ynXcQYPBAUEB8kU5z3XA6Xz///8xwOl1////uP3////pa////5CQkJCQkJCQkJA=")
		this._scanPixelArrayRegion := this.mcode("VbqQ0AMAV1ZTg+wkgXwkVJDQAwAPTlQkVItEJEiLXCRQi3QkOIt8JDyJVCQYi1QkQItsJESIXCQLi0wkTAHCiRQkhcB5C4tEJECJVCRAiQQkjRQpiVQkIIXJeQiJ6InViUQkIItEJECFwA+IoAEAAIXtD4iYAQAAiwwki0YIOciNUP+LRgwPR9GLTCQgiRQkOciNUP8PR9GJVCQghNsPhOwAAAA51Q+NYAEAAIn4x0QkHAAAAADB6BAPtsCJRCQMifgPtsSJRCQQifgPtsCJRCQUiwQkOUQkQA+NlQAAAIsGi1wkQIlEJATrDZCNdCYAg8MBORwkdHyLRgiLfCQED6/FAdiLFIeJ0Q+2xitEJBAPttLB+RAPtskrTCQMic/B/x8x+Sn5icfB/x8x+Cn4OMgPR8grVCQUidfB/x8x+in6ONEPQ9E4VCQLcqSJ2ItWBItMJBzB4BAB6IkEijlMJBgPhJkAAACDRCQcAYPDATkcJHWEg8UBOWwkIA+FUf///4tEJBzrfYn2jbwnAAAAADtsJCB9djHJiwQkOUQkQH1Oix6LRCRAiVwkBOsLjXYAg8ABOQQkdDeLVgiLXCQED6/VAcKLFJOB4v///wA5+nXficKLXgTB4hAB6okUizlMJBh0HIPBAYPAATkEJHXJg8UBOWwkIHWgicjrCI10JgCLRCQYg8QkW15fXcMxwOv0uP3////r7ZCQkJCQkJCQkA==|QVdBVkFVQVRVV1ZTSIPsGL+Q0AMAi6wkmAAAAESLlCSAAAAAi4QkkAAAAIH9kNADAA9P70GJxkSJRCRwi1wkcESLhCSIAAAARAHTRYXSeQxEi1QkcIlcJHBEidNDjTQIiXQkDEWFwHkLRYnIQYnxRIlEJAxEi0QkcEWFwA+IrQEAAEWFyQ+IpAEAAESLQRCLdCQMRY1Q/0E52ESLQRRBD0baRY1Q/0E58EQPR9ZEiVQkDITAD4TmAAAARTnRD41oAQAAQYnUD7bGMf8PtvJBwewQQYnHRQ+25DlcJHAPjaUAAABMiylEi1QkcOsQDx8AQYPCAUQ50w+EiwAAAItBEEEPr8FEAdBBi1SFAInQwfgQD7bARCngQYnAQcH4H0QxwEQpwEGJwA+2xg+20kQp+EGJw0HB+x9EMdhEKdhEOMBBD0bAKfJBidBBwfgfRDHCRCnCONAPQsJBOMZyk0SJ0kyLQQiJ+MHiEEQBykGJFIA5/Q+EoAAAAEGDwgGDxwFEOdMPhXX///9Bg8EBRDlMJAwPhUL///+J+Ot/Dx9EAABEidZFOdEPjX8AAABEi1wkcDH/QTnbfU5MixFEidjrB4PAATnDdD9Ei0EQRQ+vwUEBwEeLBIJBgeD///8AQTnQdd5BicRMi2kIQYn4QcHkEEUBzEeJZIUAOf10HIPAAYPHATnDdcFBg8EBRDnOdaSJ+OsHDx9EAACJ6EiDxBhbXl9dQVxBXUFeQV/DMcDr67j9////6+SQkJCQkJCQkJCQ")
		this._scanPixelPosition := this.mcode("VVdWU4tUJBSLdCQci0wkGItCCIt8JCCLXCQkOfAPho0AAAA5egwPhoQAAAAPr8eLEgHwvgEAAACLFIKJ0CX///8AOch0WTH2hNt0U4nPD7bricYPttLB7xDB/hAPtsSJ+w+2+yn+iffB/x8x/in+D7b5D7bNKfqJ18H/HzH6Kfo51g9N1inIicHB+R8xyCnIOcIPTcI5xQ+dwA+2wInGW4nwXl9dw412AI28JwAAAAC+/v///+vokJCQkJCQkJCQ|i0EQRItUJChEOcAPhp8AAABEOUkUD4aVAAAARA+vyEiLAUUByEKLDIBBuAEAAACJyCX///8AOdB0aEUxwEWE0nRgRQ+2ykGJ0kGJwA+2yUHB6hBBwfgQD7bERQ+20kUp0EWJwkHB+h9FMdBFKdBED7bSD7bWRCnRQYnKQcH6H0Qx0UQp0UE5yEEPTcgp0Jkx0CnQOcEPTMhFMcBBOclBD53ARInAw2YuDx+EAAAAAABBuP7////r6pCQkJCQkJCQ")
		this._scanPixelRegion := this.mcode("VVdWU4PsHIt8JDSLXCQ4i1QkQItEJDCLdCQ8i2wkRIl8JAiLfCRIjQwaiXwkDIt8JEyF0nkGidqJy4nRjVQ1AIXteQaJ9YnWieqF2w+I3gAAAIX2D4jWAAAAOUgID0ZICDlQDA9GUAyJ1YtQBIlyBIt0JAiJSggPtkwkDIkaiWoMiXIQiUoUhf90NYP/AXRQg/8CdFuD/wN0NoP/BHRxg/8FdHyD/wZ0V4P/Bw+FiwAAAIlEJDCLQCDrDJCNdCYAiUQkMItAEIPEHFteX13/4IlEJDCLQBzr7o20JgAAAACJRCQwi0AYg8QcW15fXf/giUQkMItAFIPEHFteX13/4IlEJDCLQCTrvo20JgAAAACJRCQwi0As666NtCYAAAAAiUQkMItAKOuejbQmAAAAALj9////g8QcW15fXcO4/////+vxkJCQkJCQkJCQkJCQ|VlOLRCQ4RItcJECLXCRIi3QkUEaNFACFwHkJRInARYnQQYnCQ40EC0WF23kJRYnLQYnBRInYRYXAD4jhAAAARYXJD4jYAAAARDlREEQPRlEQD7bbOUEUD0ZBFEWJ00GJwkiLQQhEiQBEiUgERIlYCESJUAyJUBCJWBSF9nQyg/4BdE2D/gJ0WIP+A3Qzg/4EdG6D/gV0eYP+BnRUg/4HD4WDAAAASItBOFteSP/gZpBIi0EYW15I/+APH4AAAAAASItBMFteSP/gDx+AAAAAAEiLQShbXkj/4A8fgAAAAABIi0EgW15I/+APH4AAAAAASItBQFteSP/gDx+AAAAAAEiLQVBbXkj/4A8fgAAAAABIi0FIW15I/+APH4AAAAAAuP3///9bXsO4/////+v2kA==")
		
		this.AppendFunc(0,"VVdWU4PsHItEJDCLQASLOItoBItYCItIEIk8JIt4DItAFIl8JBiJRCQEhcAPjr4AAAA5/Q+NlgAAAInIiVwkCMHoEA+2wIlEJAwPtsWJRCQQD7bBiUQkFIs0JItEJAg5xn1gi0QkMItQCIsAD6/VjTyQixS3idHB+RAPtskrTCQMicjB+B8xwSnBD7bGK0QkEA+20onDwfsfMdgp2DnBD0zIK1QkFInTwfsfMdop2jnRD03ROVQkBH0mg8YBOXQkCHWvg8UBOWwkGHWMjXQmALj/////6w+J9o28JwAAAADB5hCNBC6DxBxbXl9dw2aQO2wkGH3ai3wkMDkcJH05i1cIiwcPr9WNNJCLBCTrCJCDwAE5w3QhixSGgeL///8AOcp17IPEHMHgEFsB6F5fXcONtCYAAAAAg8UBOWwkGHW5642QkJCQkJCQkJCQkJCQ|QVdBVkFVQVRVV1ZTSIPsGEiLQQiLaBSLOESLWAREi1AIRItoDItYEIXtD47AAAAARTnrD42PAAAAD7bHQYncRA+2y4lEJAxBwewQRQ+25EQ5131mRItxEEyLOYn7RQ+v80KNBDNBixSHQYnQQcH4EEUPtsBFKeBEicDB+B9BMcBBKcAPtsYrRCQMD7bSicbB/h8x8CnwQTnAQQ9NwEQpyonWwf4fMfIp8jnQD0zCOcV9HoPDAUE52nWnQYPDAUU53XWMDx9EAAC4/////+sIkMHjEEKNBBtIg8QYW15fXUFcQV1BXkFfww8fhAAAAAAARTnrfdNEOdd9PkSLQRBMiwmJ+EUPr8PrDw8fgAAAAACDwAFBOcJ0IEKNFABBixSRgeL///8AOdp15sHgEEQB2OulZg8fRAAAQYPDAUU53XW064WQkJCQkJCQkJCQkJCQ")
		this.AppendFunc(1,"VVdWU4PsKItsJDyLRQSLeAiLEItwDItYBItIEItAFIl8JAiD7wGJFCSJdCQgiUQkBIl8JAyFwA+OywAAADnzD42jAAAAiciJXCQcwegQD7bAiUQkEA+2xYlEJBSNQv+JRCQkD7bBiUQkGIt8JAg5PCR9Y4tUJBwPr1UIi0UAi3QkDI08kIsUt4nRwfkQD7bJK0wkEInIwfgfMcEpwQ+2xitEJBQPttKJw8H7HzHYKdg5wQ9MyCtUJBiJ08H7HzHaKdo50Q9N0TlUJAR9I4PuATt0JCR1r4NEJBwBi0QkHDlEJCB1hY12ALj/////6wuQi1wkHMHmEI0EHoPEKFteX13DjbYAAAAAO1wkIH3ajXr/i3QkCDk0JH0+i1UIi0UAD6/TjTSQi0QkDOsLjXQmAIPoATn4dCGLFIaB4v///wA5ynXsg8QoweAQAdhbXl9dw420JgAAAACDwwE5XCQgdbDrhZCQkJCQkJCQkJCQkJA=|QVdBVkFVQVRVV1ZTSIPsGEiLQQiLcAiLWBSLOESLSAREi2AMRItAEESNbv+F2w+O7AAAAEU54Q+NswAAAESJwESJxQ+2xMHtEIlEJASNR/9AD7btiUQkDEEPtsCJRCQIOfd9dUSLcRBMizlFiepFD6/xQ40EMkGLFIdBidBBwfgQRQ+2wEEp6ESJwMH4H0ExwEEpwA+2xitEJAQPttJBicNBwfsfRDHYRCnYQTnARA9MwCtUJAhBidNBwfsfRDHaRCnaQTnQQQ9N0DnTfTJBg+oBRDtUJAx1mUGDwQFFOcwPhXr///9mLg8fhAAAAAAAuP/////rEWYPH4QAAAAAAEHB4hBDjQQKSIPEGFteX11BXEFdQV5BX8MPH4AAAAAARTnhfcuNX/859308RItREEyLGUSJ6EUPr9HrCw8fQACD6AE52HQhQo0UEEGLFJOB4v///wBEOcJ15sHgEEQByOumZg8fRAAAQYPBAUU5zHW36Xr///+QkJCQkJCQkJCQ")
		this.AppendFunc(2,"VVdWU4PsIItsJDSLVQSLAotyFIt6BItaCIkEJItCDItKEIl0JAiNUP+JVCQEhfYPjtMAAAA5xw+NowAAAI1H/4lcJAyJRCQcicjB6BAPtsCJRCQQD7bFiUQkFA+2wYlEJBiLNCSLRCQMOcZ9X4tUJAQPr1UIi0UAjTyQixS3idHB+RAPtskrTCQQicjB+B8xwSnBD7bGK0QkFA+20onDwfsfMdgp2DnBD0zIK1QkGInTwfsfMdop2jnRD03ROVQkCH0tg8YBOXQkDHWvg2wkBAGLRCQEO0QkHHWHkI10JgC4/////+sSifaNvCcAAAAAi0QkBMHmEAHwg8QgW15fXcONtCYAAAAAOcd91IPvAYl8JAiLfCQEORwkfTyLVQiLRQAPr9eNNJCLBCTrCo12AIPAATnDdCGLFIaB4v///wA5ynXsg8QgweAQWwH4Xl9dw420JgAAAACD7wE7fCQIdbbpev///5CQkJCQkJCQkJA=|QVdBVkFVQVRVV1ZTSIPsGEiLQQhEi0AMi2gUiziLUAREi1AIRItIEEGNWP+F7Q+O3AAAAEQ5wg+NowAAAI1C/0WJzIlEJAxEichBwewQRQ+2yQ+2xEUPtuRBicdEOdd9b0SLQRBIizFBiftED6/DQ40EA4sUhonQwfgQD7bARCngQYnFQcH9H0Qx6EQp6EGJxQ+2xg+20kQp+EGJxkHB/h9EMfBEKfBBOcVBD03FRCnKQYnVQcH9H0Qx6kQp6jnQD0zCOcV9KUGDwwFFOdp1n4PrATtcJAx1gw8fgAAAAAC4/////+sRZg8fhAAAAAAAQcHjEEGNBBtIg8QYW15fXUFcQV1BXkFfww8fgAAAAABEOcJ9y41y/0Q51307RItBEEyLGYn4RA+vw+sMDx9AAIPAAUE5wnQgQo0UAEGLFJOB4v///wBEOcp15cHgEAHY66ZmDx9EAACD6wE583W56Xz///+QkJCQkJCQkJCQkJA=")
		this.AppendFunc(3,"VVdWU4PsKIt8JDyLXwSLcwiLUwyLK4tDBIl0JAyLSxCD7gGLWxSJdCQQjXL/iWwkBIlcJAiJNCSF2w+O0AAAADnQD42oAAAAg+gBiUQkJInIwegQD7bAiUQkFA+2xYlEJBiNRf+JRCQgD7bBiUQkHItcJAw5XCQEfWKLFCQPr1cIiweLXCQQjSyQi1SdAInRwfkQD7bJK0wkFInIwfgfMcEpwQ+2xitEJBgPttKJxsH+HzHwKfA5wQ9MyCtUJByJ1sH+HzHyKfI50Q9N0TlUJAh9LYPrATtcJCB1roMsJAGLBCQ7RCQkdYeNtCYAAAAAuP/////rEYn2jbwnAAAAAIsEJMHjEAHYg8QoW15fXcM50H3cjWj/i0QkBIlsJAiLLCSNcP+LXCQMOVwkBH05i1cIiwcPr9WNHJCLRCQQ6weD6AE58HQhixSDgeL///8AOcp17IPEKMHgEFsB6F5fXcONtCYAAAAAg+0BO2wkCHW06Xr///+QkJCQkJCQkJCQ|QVdBVkFVQVRVV1ZTSIPsGEiLQQiLeAhEi0AMi3AUiyiLUASLWBBEjW//RY1Y/4X2D47aAAAARDnCD42hAAAAjUL/QYncRA+2y4lEJAwPtsdBwewQiUQkBI1F/0UPtuSJRCQIOf19bUSLcRBMizlFiepFD6/zQ40EMkGLFIdBidBBwfgQRQ+2wEUp4ESJwMH4H0ExwEEpwA+2xitEJAQPttKJw8H7HzHYKdhBOcBED0zARCnKidPB+x8x2inaQTnQRA9MwkQ5xn0nQYPqAUQ7VCQIdaFBg+sBRDtcJAx1hJC4/////+sRZg8fhAAAAAAAQcHiEEONBBpIg8QYW15fXUFcQV1BXkFfww8fgAAAAABEOcJ9y41y/0SNVf85/X04RItBEEyLCUSJ6EUPr8PrCIPoAUQ50HQgQo0UAEGLFJGB4v///wA52nXmweAQRAHY66ZmDx9EAABBg+sBQTnzdbvpev///5CQkJCQkJCQkJA=")
		this.AppendFunc(4,"VVdWU4PsIItEJDSLWASLewSLSwiLA4trDIl8JASLexSNcf+JNCSLUxCJfCQIhf8PjrsAAAA5yA+NowAAAIPoAYlEJBiJ0MHoEA+2wIlEJAwPtsaJRCQQD7bCiUQkFDlsJAR9a4tEJDSLEItACIP4AQ+F8gAAAIsEJI08gotEJASLDIcPtt0rXCQQidrB+h8x0ynTicoPtsnB+hAPttIrVCQMidbB/h8x8inyOdMPTNorTCQUic7B/h8x8SnxOcsPTcs5TCQIfXSDwAE5xXWxgywkAYsEJDtEJBh1go10JgC4/////+tdifaNvCcAAAAAOch97IPoAY00tQAAAACJRCQIi0QkBDnofUaLTCQ0i3wkNItZCIs/jQw3g/sBdBDpvAAAAI10JgCDwAE5xXQhixyBgeP///8AOdp17IsUJMHiEAHQg8QgW15fXcONdCYAgywkAYPuBIsEJDtEJAh1oul7////jXYAi3QkBI08hQAAAACJfCQcD6/GAwQkjTyCifCLD4nLwfsQD7bbK1wkDInawfofMdMp0w+21StUJBAPtsmJ1sH+HzHyKfI50w9M2itMJBSJysH6HzHRKdE5yw9NyzlMJAgPjW////+DwAEDfCQcOcV1quny/v//jXYAjQydAAAAAA+v2AMcJI08n+sTjbYAAAAAg8ABAc85xQ+ES////4sfgeP///8AOdN15+km////kJCQkJCQkJCQkA==|QVdBVkFVQVRVV1ZTSIPsGEiLQQhEi1AIi3gURIsIRItYBESLQAyLUBBBjUL/hf8PjrsAAABFOdEPjaoAAABBjXH/idWJdCQIwe0QD7b2D7bSQA+27UGJ90U5w315RItpEEyLIUWJ2UGD/QEPhe8AAABGjRQIQ4sclA+290GJ8kUp+kSJ1sH+H0Ex8kEp8kSJ1kGJ2g+220HB+hBFD7bSQSnqRYnVQcH9H0Ux6kUp6kQ51kQPTdYp04newf4fMfMp80E52kQPTNNEOdd9aEGDwQFFOch1m4PoATtEJAgPhXX///8PH0QAALj/////60yQRTnRffNBjXn/RTnDfVKLaRBIixlFidmD/QF0FenfAAAADx+AAAAAAEGDwQFFOch0L0aNFAhGixSTQYHi////AEQ50nXjweAQRAHISIPEGFteX11BXEFdQV5BX8MPH0AAg+gBOfh1ouuPDx+AAAAAAEUPr81EiVwkDEWNNAFFidlFifJDixyUQYnbD7b3D7bbQcH7EEUPtttBKetFidpBwfofRTHTRSnTQYnyRSn6RInWwf4fQTHyQSnyRTnTRQ9M2inTQYnaQcH6H0Qx00Qp00E520QPTNtEOd8PjWX///9Bg8EBRQHuRTnIdZREi1wkDOnw/v//Zi4PH4QAAAAAAESJ3g+v9QHG6xVmDx9EAABBg8EBAe5FOcgPhEH///9BifJGixSTQYHi////AEE50nXe6Q7///+QkJCQkJCQkJA=")
		this.AppendFunc(5,"VVdWU4PsJItsJDiLRQSLcASLOItQCItYDIl0JASLcBCLQBSJPCSJVCQciUQkCIXAD47aAAAAOdcPjbIAAACJ8IlcJAzB6BAPtsCJRCQQifAPtsSJRCQUifAPtsCJRCQYi3wkBItEJAw5x31ui0UIi1UAjTSFAAAAAA+vxwMEJIl0JCCNNIKLFonRwfkQD7bJK0wkEInIwfgfMcEpwQ+2xitEJBQPttKJw8H7HzHYKdg5wQ9MyCtUJBiJ08H7HzHaKdo50Q9N0TlUJAh9M4PHAQN0JCA5fCQMdayDBCQBiwQkOUQkHA+Fdf///5CNdCYAuP/////rEYn2jbwnAAAAAIsEJMHgEAH4g8QkW15fXcM5FCR924tMJAQ52X1Li0UIi1UAjTyFAAAAAA+vwQMEJI0MgotUJATrEI20JgAAAACDwgEB+TnTdB+LASX///8AOfB17IsEJIPEJFteweAQX10B0MONdCYAgwQkAYsEJDlEJBx1oOl2////kJCQkJCQ|QVdBVkFVQVRVV1ZTSIPsGEiLQQiLaBREixCLWAREi2gIRItIDESLWBCF7Q+O3wAAAEU56g+NpgAAAESJ2EWJ3A+2xEHB7BCJRCQIQQ+2w0UPtuSJRCQMRDnLfXJEi3EQQYnbTIs5id9FD6/eRQHTRInYQYsUh0GJ0EHB+BBFD7bARSngRInAwfgfQTHAQSnAD7bGK0QkCA+20onGwf4fMfAp8EE5wEQPTMArVCQMidbB/h8x8inyQTnQRA9MwkQ5xX0tg8cBRQHzQTn5daFBg8IBRTnVdYBmDx+EAAAAAAC4/////+sRZg8fhAAAAAAAQcHiEEGNBDpIg8QYW15fXUFcQV1BXkFfww8fgAAAAABFOep9y0Q5y30+i3EQidpIizlBidgPr9ZEAdLrDg8fAEGDwAEB8kU5wXQdidCLBIcl////AEQ52HXmQcHiEEONBALrpA8fQABBg8IBRTnVdbTpev///5CQkJCQkJCQkJA=")
		this.AppendFunc(6,"VVdWU4PsKItEJDyLWASLewyLSwiLcwSLaxSLA4tTEIl8JAyNWf+D7wGJdCQEiRwkiXwkCIXtD47EAAAAOcgPjbQAAACD6AGJRCQgidDB6BAPtsCJRCQQD7bGiUQkFI1G/4lEJBwPtsKJRCQYi3wkDDl8JAR9a4tEJDyLEItACIP4AQ+F+AAAAIsEJI08gotEJAiLDIcPtt0rXCQUidrB+h8x0ynTicoPtsnB+hAPttIrVCQQidbB/h8x8inyOdMPTNorTCQYic7B/h8x8SnxOcsPTcs5zX18g+gBOUQkHHWxgywkAYsEJDtEJCAPhXr///+NtgAAAAC4/////+tdkDnIffSD6AGJ34lEJBCLRCQEwecCjUj/i1wkDDlcJAR9R4tEJDyLKItwCItEJAiNXD0Ag/4BdBDpxAAAAI10JgCD6AE5wXQhizSDgeb///8AOfJ17IsUJMHiEAHQg8QoW15fXcONdCYAgywkAYPvBIsEJDlEJBB1n+l7////jXYAjQyFAAAAAPfZiUwkJItMJAgPr8EDBCSNPIKJyIsPicvB+xAPttsrXCQQidrB+h8x0ynTD7bVK1QkFA+2yYnWwf4fMfIp8jnTD0zaK0wkGInKwfofMdEp0TnLD03LOc0PjW////+D6AEDfCQkO0QkHHWq6er+//+J9o28JwAAAACNHLUAAAAAD6/wAzQk99uNbLUA6xCNdgCD6AEB3TnID4RD////i3UAgeb///8AOdZ15ukd////kJCQkJCQkJCQ|QVdBVkFVQVRVV1ZTSIPsGEiLQQhEi1gMi1AIRItQFIs4i3AEi1gQQY1r/41C/0WF0g+O2QAAADnXD43BAAAAD7bXg+8BRA+2+0GJ9UGJ1o1W/4l8JASJ34kUJMHvEEAPtv9FOd0PjYQAAABEi2EQSIsxiepBg/wBD4UCAQAASIlMJGBEjQQQQoschg+2z0GJyUUp8UWJyEHB+B9FMcFFKcFBidgPtttBwfgQRQ+2wEEp+EWJxEHB/B9FMeBFKeBFOcFFD03BRCn7QYncQcH8H0Qx40Qp40E52EQPTMNFOcJ9coPqATkUJHWZSItMJGCD6AE7RCQED4Vm////Dx9AALj/////61JmDx+EAAAAAAA5133sg+8BRI1W/0Q53n1QRItpEEyLCYnqQYP9AXQR6ewAAAAPH0AAg+oBQTnSdDBEjQQQR4sEgUGB4P///wBEOcN15MHgEAHQSIPEGFteX11BXEFdQV5BX8NmDx9EAACD6AE5+HWk64cPH4AAAAAAQQ+v1ESJXCQMSIlMJGBEiWwkCI0cAonqQYndRYnoQoschkGJ2Q+2zw+220HB+RBFD7bJQSn5RYnIQcH4H0UxwUUpwUGJyEUp8EWJw0HB+x9FMdhFKdhFOcFFD0zIRCn7QYnYQcH4H0Qxw0Qpw0E52UQPTMtFOcoPjVf///+D6gFFKeU7FCR1k0SLbCQIRItcJAxIi0wkYOnT/v//Dx9AAEGJ7EUPr+VBAcTrEw8fQACD6gFFKexEOdIPhDH///9FieBHiwSBQYHg////AEE52HXe6f3+//+QkJCQkJCQkJA=")
		this.AppendFunc(7,"VVdWU4PsLItsJECLRQSLeAyLMItQBItICItYEItAFIl8JBCD7wGJNCSJVCQIiUwkIIlEJAyJfCQEhcAPjt8AAAA5zg+NtwAAAInYwegQD7bAiUQkFA+2x4lEJBiNQv+JRCQoD7bDiUQkHIt8JBA5fCQIfXSLRQiLdCQEjRSFAAAAAPfaD6/GAwQkiVQkJItVAI08gosXidHB+RAPtskrTCQUicjB+B8xwSnBD7bGK0QkGA+20onDwfsfMdgp2DnBD0zIK1QkHInTwfsfMdop2jnRD03ROVQkDH01g+4BA3wkJDt0JCh1rIMEJAGLBCQ5RCQgD4Vx////jbQmAAAAALj/////6xGJ9o28JwAAAACLBCTB4BAB8IPELFteX13DOQwkfduNev+LdCQQOXQkCH1Oi0UIi1UAjTSFAAAAAA+vRCQEAwQk996NDIKLVCQE6w+NtgAAAACD6gEB8Tn6dB+LASX///8AOdh17IsEJIPELFteweAQX10B0MONdCYAgwQkAYsEJDlEJCB1m+lu////kJCQkJCQkJCQkJCQkJA=|QVdBVkFVQVRVV1ZTSIPsGEiLQQiLaAyLeBREiwhEi2AERItoCItYEI11/4X/D47tAAAARTnpD420AAAAidjB6BAPtsCJBCQPtseJRCQEQY1EJP+JRCQMD7bDiUQkCEE57H17RItxEEGJ8kyLOYnzRQ+v1kUBykSJ0EGLFIdBidBBwfgQRQ+2wEQrBCREicDB+B9BMcBBKcAPtsYrRCQED7bSQYnDQcH7H0Qx2EQp2EE5wEQPTMArVCQIQYnTQcH7H0Qx2kQp2kE50EEPTdA5130ug+sBRSnyO1wkDHWYQYPBAUU5zQ+Fc////w8fRAAAuP/////rEWYPH4QAAAAAAEHB4RBBjQQZSIPEGFteX11BXEFdQV5BX8MPH4AAAAAARTnpfctBjXwk/0E57H1BRItREInyTIsZQYnwQQ+v0kQByusQDx9AAEGD6AFEKdJBOfh0HInQQYsEgyX///8AOdh15UHB4RBDjQQB65sPHwBBg8EBRTnNdbHpcv///5CQ")
		
		
		this.AppendFunc(8,"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")
		this.AppendFunc(9,"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")
		this.AppendFunc(10,"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")
		this.AppendFunc(11,"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")
		this.AppendFunc(12,"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")
		this.AppendFunc(13,"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")
		this.AppendFunc(14,"VVdWU4PsUItEJGSLQASLWAyLeASLUAiLCItoEItAFIl8JCyJ34lcJDiNcv+D7wGJRCQ8i0QkaIl0JBCLGIl8JECJ2IlcJDTB+BCJRCREi0QkaItABIXtD4UUAQAAhcAPhLMDAAA50Q+NngMAAA+3w4t8JCzB6xCLbCRkiUQkFInwweAeiVwkDI1cGv8p8IlEJBiNQf+JRCQgjUf/iUQkHIt8JDg5fCQsD436BAAAi0QkQIlEJAjrOpCNtCYAAAAAiwwkD69NCIHi////AIt1AAHBiwyOgeH///8AOcp0XYNsJAgBi0QkCDtEJBwPhLYEAACLRCQUhcB0WMdEJAQAAAAAi3wkDIX/dDmLTCQEi3QkCItUJBiLRCQQD6/5Ac6JNCQB+ot8JGiNPJeQjXQmAItUhwiB+v////53hIPAATnDde2DRCQEAYt8JAQ5fCQUf7CLRCQ8hcAPhYoEAACLRCQQweAQA0QkCIPEUFteX13DhcAPhG0BAAA50Q+NigIAAInYi3QkaA+324lsJAzB6BCJXCQkA1wkOInHiUQkFItEJBCJXCRMi2wkZPfYjQSGiUQkKIn4jXw6/8HgAol8JASNef+JRCQci0QkLIl8JEiD6AGJRCQwi3wkODl8JCwPjZsDAACLRCRMg+gBiUQkGItEJECJRCQgkI20JgAAAACLfCQkhf8PhKQAAACLRCQgi3wkKIlEJAiQjbQmAAAAAIt0JBSF9nRxi0wkEI10JgCLXI8Igfv////+dlSLRCQID69FCInei1UAwf4QAciLBIKJwsH6EA+20okUJInyD7byixQkKfKJ1sH+HzHyKfKLdCQMOfIPj+0CAAAPtsQPtt8p2Jkx0CnQOfAPj9gCAACDwQE5TCQEdZeDRCQIAQN8JByLRCQIOUQkGA+FcP///4tcJDyF2w+EfAMAAA+3RCREi3wkEA+3VCQ0ZtHoAfhm0erB4BAPt9IDRCQgg8RQWwHQXl9dwznRD40dAQAAidgPt/uNWf/B6BCJfCQgA3wkOIlEJAjB4AKJRCQYi0QkLIlcJCiD6AGJfCQwiUQkJIt8JDg5fCQsD43LAAAAi0QkMIPoAYlEJBSLRCRAiUQkHItMJCCFyQ+E4wEAAItEJByLfCRoiUQkDJCNtCYAAAAAi1QkCIXSD4SsAQAAi1wkZItEJAwxyYsTD69DCANEJBCNBIKJRCQE6yWNtCYAAAAAD7bED7bfKdiZMdAp0Dnofz+DwQE7TCQID4RqAQAAi0QkBItcjwiLBIiJ3sH+EInCwfoQD7bSiRQkifIPtvKLFCQp8onWwf4fMfIp8jnqfrCDbCQcAYtEJByDbCQUATtEJCQPhUj///+DbCQQAYtEJBA7RCQoD4UU////g8RQuP////9bXl9dwznRfe+J2A+3+8HoEIl8JAiLfCRkicWNQf+JRCQUi0QkLIPoAYlEJAyLXCQ4OVwkLA+NggEAAItEJECJRCQE6xuQjbQmAAAAAINsJAQBi0QkBDtEJAwPhF0BAACLRCQIhcB0YMcEJAAAAACF7XRIixwki0QkBIsXAdgPr0cIA0QkEI00gonYi1wkaA+vxY0cgzHAjbYAAAAAiwyGi1SDCIHh////AIHi////ADnRdZmDwAE56HXigwQkAYscJDlcJAh/p4tsJDyF7Q+EPgEAAA+3RCREi3wkEA+3VCQ0ZtHoAfhm0erB4BAPt9IDRCQEg8RQWwHQXl9dw420JgAAAACDRCQMAQN8JBiLRCQMOUQkFA+FMf7//4tEJDyFwA+E1wAAAA+3RCREi3wkEA+3VCQ0ZtHoAfhm0erB4BAPt9IDRCQcg8RQWwHQXl9dw412AINsJCABi0QkIINsJBgBO0QkMA+FgPz//4NsJBABi0QkEINEJCgEg2wkBAE7RCRID4U6/P//6Wn+//+NtgAAAACDbCQQAYPrAYtEJBCBbCQY////PztEJCAPhdr6///pQP7//5CNdCYAg2wkEAGLRCQQO0QkFA+FXf7//+kj/v//D7dEJESLfCQQD7dUJDRm0egB+GbR6sHgEA+30gNEJAiDxFBbAdBeX13Di0QkEMHgEANEJByDxFBbXl9dw4tEJBDB4BADRCQEg8RQW15fXcOLRCQQweAQA0QkIIPEUFteX13DkJCQkJA=|QVdBVkFVQVRVV1ZTSIPsSEmJ10iLUQhJicpBiz+LchSLWgxEi3IEi0oIiXwkIESLShCLAol0JCyJ/sH+EIlcJCiD6wFBi1cEiXQkNI1x/0SJdCQkiVwkMEWFyQ+FvQAAAIXSD4QqAwAAOcgPjRgDAACD6AFED7fvwe8QQYPuAYlEJAyJ/USNX/+LfCQoOXwkJA+NaQQAAESLZCQw6zRmkEGLehCJ040UBoHj////AEEPr/gB10mLEosUuoHi////ADnTdEdBg+wBRTn0D4QuBAAARYXtD4QCBAAARTHJhe0PhOoDAACJ6EeNBAxBD6/BSJhJjQyHMcAPH4QAAAAAAItUgQiB+v////53lEiNUAFJOcMPhLcDAABIidDr4oXSD4RCAQAAOcgPjVsCAACD6AGJ+Q+3/4lEJBjB6RCJfCQQA3wkKEGJzYl8JByNef+LRCQki0wkKDnID41YAwAAg+gBi0wkHIlEJBSLRCQwRI1x/4lEJAxmLg8fhAAAAAAARItEJBBFhcAPhKsAAACLbCQMRTHkDx8ARYXtD4SJAAAASWPEMdJJjQyH6wcPH0AASInCi1yRCIH7/////nZiRYtCEI0EFkGJ20HB+xBED6/FRQ+220EBwEmLAkKLBIBBicBBwfgQRQ+2wEUp2EWJw0HB+x9FMdhFKdhFOcgPj50CAAAPtsQPtt8p2EGJwEHB+B9EMcBEKcBEOcgPj38CAABIjUIBSDnXdYaDxQFFAexBOe4PhV////+LTCQshckPhBkDAAAPt0QkNA+3bCQgZtHoZtHtAfAPt+3B4BADRCQMAejphwIAADnID40ZAQAAg+gBQYn+D7f/iUQkOItEJCRBwe4QiXwkGAN8JCiD6AGJfCQ8iUQkHIt8JCg5fCQkD43WAAAAi0QkPIPoAYlEJAyLRCQwiUQkFEGNBDaJRCQQDx+AAAAAAItUJBiF0g+EngEAAESLZCQURTHtDx9AAEWF9g+EdwEAAEGLehBJY8VJiypJjVyHCEEPr/xEjQQ3A3wkEOstZi4PH4QAAAAAAA+2xA+2zSnImTHQKdBEOch/QkGDwAFIg8MERDnHD4QtAQAARInAiwuLRIUAQYnLicJBwfsQwfoQRQ+22w+20kQp2kGJ00HB+x9EMdpEKdpEOcp+rINsJBQBi0QkFINsJAwBO0QkHA+FTP///4PuATt0JDgPhQ////+4/////+lcAQAAOch98oPoAUQPt+fB7xCJRCQMi0QkJESNcP+LTCQoOUwkJA+NXQEAAItsJDBEjSw36w8PHwCD7QFEOfUPhEQBAABFheR0UzHbhf90RYn4RI1MHQBNixoPr8NFD69KEEiYQo0MDk2NRIcIRQHpkInIQYsUg0GLAIHi////ACX///8AOcJ1sIPBAUmDwARBOcl13IPDAUE53H+vRItMJCxFhckPhBsBAAAPt0QkNGbR6AHwweAQAcUPt0QkIGbR6A+3wAHo6ZQAAAAPH0QAAEUB9UGDxAFEOWQkDA+Fbv7//4tEJCyFwA+EzAAAAA+3RCQ0D7dsJCBm0ehm0e0B8A+37cHgEANEJBQB6OtRZpCDbCQMAUGD7gGLRCQMO0QkFA+Fyfz//4PuATt0JBgPhYv8///pwP7//w8fgAAAAABBg8EBRTnND48B/P//RItUJCxFhdJ1Q4nwweAQRAHgSIPESFteX11BXEFdQV5BX8OD7gE7dCQMD4V8+///6Xf+//9mDx9EAACD7gE7dCQMD4WI/v//6V/+//8Pt0QkNGbR6AHwweAQQQHED7dEJCBm0egPt8BEAeDrpYnwweAQA0QkFOuaifDB4BAB6OuRifDB4BADRCQM64aQkJCQkJCQ")
		this.AppendFunc(15,"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")	

		this._cacheTargetImageFile := this.mcode("U4tMJBQPr0wkEIXJfiGLRCQIi1QkDI0ciI20JgAAAACLCIPABIPCBIlK/DnYdfG4AQAAAFvDkJCQkJCQkJCQkA==|RQ+vwUWFwH50TI1JD0GNQP9JKdFJg/kedm6D+AN2aUWJwTHAQcHpAknB4QQPH0AA8w9vBAEPEQQCSIPAEEw5yHXuRInAg+D8QfbAA3QvQYnBRosUiUaJFIpEjUgBRTnIfhtNY8mDwAJGixSJRokUikE5wH4ISJiLDIGJDIK4AQAAAMMPH0QAAEGJwDHADx8ARIsMgUSJDIJJicFIg8ABTTnBdey4AQAAAMOQkJCQkJA=")
		
		this.scanTypes := Map()
		this.scanTypes["LRTB"] := 0
		this.scanTypes["RLTB"] := 2
		this.scanTypes["LRBT"] := 1
		this.scanTypes["RLBT"] := 3
		this.scanTypes["TBRL"] := 7
		this.scanTypes["TBLR"] := 6
		this.scanTypes["BTRL"] := 5
		this.scanTypes["BTLR"] := 4
		this.scanTypes[0] := 0

		if (!this.desktop and !this.hwnd := winexist(title)) {
			msgbox "Could not find window: " title "!`n`nScanner will not function!"
			return
		}
		gw := gh := 0
		if (!this.GetRect(&gw,&gh))
			return
		
		this.width := gw
		this.height := gh
		this.srcDC := DllCall("GetDCEx", "Ptr", this.hwnd,"Uint",0,"Uint",(this.UseClientArea ? 0 : 1))
		this.dstDC := DllCall("CreateCompatibleDC", "Ptr", 0)
		NumPut("Ptr",this.tBufferPtr.ptr,this.dataPtr,(this.bits ? 8 : 4))
		this.CreateDIB()
		
	}
	
	
	;####################################################################################################################################################################################################################################
	;Image
	;
	;image				:				Path to image file
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;&returnX			:				Variable to store the x result into
	;&returnY			:				Variable to store the y result into
	;centerResults		:				Return the results centered on the image
	;scanDir			:				Scanning direction, default = LRTB (scan left to right, from top to bottom)
	;
	;return				;				Returns 1 if the image was found; 0 otherwise
	
	Image(image,variance:=0,&returnX:=0,&returnY:=0,centerResults:=0,scanDir:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update()
		data := DllCall(this._ScanImage,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"uchar",variance,"uchar",centerResults,"int",this.scanTypes[scanDir],"cdecl int")
		if (data >= 0) {
			this.MapCoords(data,&returnX,&returnY)
			return 1
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;ImageRegion
	;
	;image				:				Path to image file
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;&returnX			:				Variable to store the x result into
	;&returnY			:				Variable to store the y result into
	;centerResults		:				Return the results centered on the image
	;scanDir			:				Scanning direction, default = LRTB (scan left to right, from top to bottom)
	;
	;return				;				Returns 1 if the image was found in the specified region; 0 otherwise
	
	ImageRegion(image,x1,y1,w,h,variance:=0,&returnX:=0,&returnY:=0,centerResults:=0,scanDir:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		data := DllCall(this._ScanImageRegion,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"uchar",centerResults,"int",this.scanTypes[scanDir],"cdecl int")
		if (data >= 0) {
			this.MapCoords(data,&returnX,&returnY)
			return 1
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;ImageCount
	;
	;image				:				Path to image file
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns the amount of images found; 0 otherwise
	
	ImageCount(image,variance:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update()
		c := DllCall(this._ScanImageCount,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"uchar",variance,"cdecl int")
		return (c > 0 ? c : 0)
	}
	
	
	;####################################################################################################################################################################################################################################
	;ImageCountRegion
	;
	;image				:				Path to image file
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns the amount of images found in the specified region; 0 otherwise
	
	ImageCountRegion(image,x1,y1,w,h,variance:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		c := DllCall(this._ScanImageCountRegion,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"cdecl int")
		return (c > 0 ? c : 0)
	}


	;####################################################################################################################################################################################################################################
	;ImageClosestToPoint
	;
	;image				:				Path to image file
	;pointX				:				x position of the point
	;pointY				:				y position of the point
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;&returnX			:				Variable to store the x result into
	;&returnY			:				Variable to store the y result into
	;centerResults		:				Value between 0-1, if enabled the positions returned will be centered as oposed to top left of the target image
	;									This also affects distance calculations for closest image
	;MaxRadius			:				Maximum circular radius to search in; lower values require images to be closer to the point
	;
	;return				;				Returns 1 if an image was found close enough to the point; 0 otherwise
	
	ImageClosestToPoint(image,pointX,pointY,variance:=0,&returnX:=0,&returnY:=0,centerResults:=0,maxRadius:=9999) {
		if (!c := this.ImageArray(image,&a,variance,centerResults))
			return 0
		min := maxRadius
		i := 0
		loop c {
			xd := (a[a_index].x/this.windowScale) - pointX
			yd := (a[a_index].y/this.windowScale) - pointY
			dist := sqrt(xd*xd + yd*yd)
			if (dist < min) {
				min := dist
				i := a_index
			}
		}
		if (i = 0)
			return 0
		returnX := a[i].x
		returnY := a[i].y
		return 1
	}
	
	
	;####################################################################################################################################################################################################################################
	;ImageArray
	;
	;image				:				Path to image file
	;&array				:				An array which will hold all the image locations (first element would be array[1].x and array[1].y)
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;centerResults		:				Value between 0-1, if enabled the positions returned will be centered as oposed to top left of the target image
	;
	;return				;				Returns 1 (and updates &array) if any number of images were found; 0 otherwise
	
	ImageArray(image,&array,variance:=0,centerResults:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update()
		count := DllCall(this._ScanImageArray,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"uchar",variance,"uchar",centerResults,"cdecl int")
		if (count > 0) {
			array := []
			loop count {
				this.MapCoords(NumGet(this.tBufferPtr,(a_index-1)*4,"uint"),&x,&y)
				array.push({x:x,y:y})
			}
			return count
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;ImageArrayRegion
	;
	;image				:				Path to image file
	;&array				:				An array which will hold all the image locations (first element would be array[1].x and array[1].y)
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;centerResults		:				Value between 0-1, if enabled the positions returned will be centered as oposed to top left of the target image
	;
	;return				;				Returns 1 (and updates &array) if any number of images were found in the specified region; 0 otherwise
	
	ImageArrayRegion(image,&array,x1,y1,w,h,variance:=0,centerResults:=0) {
		if (!this.CacheImage(image))
			return 0
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		count := DllCall(this._ScanImageArrayRegion,"Ptr",this.dataPtr,"Ptr",this.imageCache[image],"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"uchar",centerResults,"cdecl int")
		if (count > 0) {
			array := []
			loop count {
				this.MapCoords(NumGet(this.tBufferPtr,(a_index-1)*4,"uint"),&x,&y)
				array.push({x:x,y:y})
			}
			return count
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;Pixel
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;&returnX			:				Variable to store the x result into
	;&returnY			:				Variable to store the y result into
	;scanDir			:				Scanning direction, default = LRTB (scan left to right, from top to bottom)
	;
	;return				;				Returns 1 if pixel was found; 0 otherwise
	
	Pixel(color,variance:=0,&returnX:=0,&returnY:=0,scanDir:=0) {
		if (this.AutoUpdate)
			this.Update()
		data := DllCall(this._ScanPixel,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"uchar",variance,"int",this.scanTypes[scanDir],"cdecl int")
		if (data >= 0) {
			this.MapCoords(data,&returnX,&returnY)
			return 1
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;PixelRegion
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;&returnX			:				Variable to store the x result into
	;&returnY			:				Variable to store the y result into
	;scanDir			:				Scanning direction, default = LRTB (scan left to right, from top to bottom)
	;
	;return				;				Returns 1 if a pixel inside the specified region was found; 0 otherwise
	
	PixelRegion(color,x1,y1,w,h,variance:=0,&returnX:=0,&returnY:=0,scanDir:=0) {
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		data := DllCall(this._ScanPixelRegion,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"int",this.scanTypes[scanDir],"cdecl int")
		if (data >= 0) {
			this.MapCoords(data,&returnX,&returnY)
			return 1
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;PixelPosition
	;
	;color				:				Color of pixel to match at a given position(can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;pointX				:				X position
	;pointY				:				Y position
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns 1 if the color matched at the specified position; 0 otherwise
	
	PixelPosition(color,pointX,pointY,variance:=0) {
		if (this.AutoUpdate)
			this.Update()
		c := DllCall(this._ScanPixelPosition,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"uint",pointX,"uint",pointY,"uint",variance,"cdecl int")
		return (c == 1 ? 1 : 0)
	}
	
	
	;####################################################################################################################################################################################################################################
	;PixelCount
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns the amount of matching pixels; 0 otherwise
	
	PixelCount(color,variance:=0) {
		if (this.AutoUpdate)
			this.Update()
		c := DllCall(this._ScanPixelCount,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"uchar",variance,"cdecl int")
		return (c > 0 ? c : 0)
	}
	
	
	;####################################################################################################################################################################################################################################
	;PixelCountRegion
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns the amount of matching pixels in the specified region; 0 otherwise
	
	PixelCountRegion(color,x1,y1,w,h,variance:=0) {
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		c := DllCall(this._ScanPixelCountRegion,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"cdecl int")
		return (c > 0 ? c : 0)
	}
	
	
	
	;####################################################################################################################################################################################################################################
	;PixelCountRadius
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;pointX				:				X position
	;pointY				:				Y position
	;radius				:				Radius to search in
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;
	;return				;				Returns the amount of matching pixels in a specified radius; 0 otherwise
	
	PixelCountRadius(color,pointX,pointY,radius,variance:=0) {
		if (this.AutoUpdate)
			this.Update()
		c := DllCall(this._ScanPixelCountRadius,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"uint",pointX,"uint",pointY,"uint",radius,"uchar",variance,"cdecl int")
		return (c > 0 ? c : 0)
	}
	
	
	;####################################################################################################################################################################################################################################
	;PixelArrayRegion
	;
	;color				:				Color of pixel to find (can be in 0xRRGGBB or 0xAARRGGBB format; alpha is ignored)
	;x1					:				Top left starting x position
	;y1					:				Top left starting y position
	;w					:				Width of pixels to search, starting from x1
	;h					:				Height of pixels to search, starting from y1
	;variance			:				Value between 0-255, determines how close/far pixels must be to match the target color
	;maxResults			:				Maximum amount of results to find anything above 250k will be ignored
	;
	;return				;				Returns the amount of matching pixels in the specified region; 0 otherwise
	
	PixelArrayRegion(color,&array,x1,y1,w,h,variance:=0,maxResults:=1000) {
		if (this.AutoUpdate)
			this.Update(x1,y1,w,h)
		count := DllCall(this._ScanPixelArrayRegion,"Ptr",this.dataPtr,"Uint",color&0xFFFFFF,"int",(this.autoUpdate?0:x1),"int",(this.autoUpdate?0:y1),"int",w,"int",h,"uchar",variance,"uint",maxResults,"cdecl int")
		if (count > 0) {
			array := []
			loop count {
				this.MapCoords(NumGet(this.tBufferPtr,(a_index-1)*4,"uint"),&x,&y)
				array.push({x:x,y:y}) ;for large amounts of results, like 50k+ becomes a bottleneck to add to array
			}
			return count
		}
		return 0
	}
	
	
	;####################################################################################################################################################################################################################################
	;GetPixel
	;
	;pointX				:				X position
	;pointY				:				Y position
	;suppressWarning    :               Enable/Disable warning message when scanning outside the region
	;
	;return				;				Returns the pixel at the pointX,pointY location
	
	GetPixel(pointX,pointY,suppressWarning:=0) {
		if (this.AutoUpdate)
			this.Update()
		pointX<<=0,pointY<<=0
		if (pointX < 0 or pointY < 0 or pointX >= this.width or pointY >= this.height) {
			if (!suppressWarning)
				msgbox "Cannot get a pixel at position: " pointX "," pointY " as it lies outside of the source region!`n`nYou can disable this warning using the 3rd param of GetPixel()"
			return 0
		}
		return NumGet(this.temp0,(pointX+pointY*this.width)*4,"uint") & 0xFFFFFF
	}
	
	
	;####################################################################################################################################################################################################################################
	;SaveImage
	;
	;name				:				Name to save to file to
	;x					:				X pos of region
	;y					:				Y pos of region
	;w					:				Width of region, defaults to entire image
	;h					:				Height of region, defaults to entire image
	;
	;notes				;				Saves the current pixel buffer to a png image
	
	SaveImage(name,x:=0,y:=0,w:=0,h:=0) {
		if (!InStr(name,".png"))
			name .= ".png"
		if (this.desktop or this.CheckWindow()) {
			bm := 0
			if (x!=0 or y!=0 or w!=0 or h!=0) {
				dstDC := DllCall("CreateCompatibleDC", "Ptr", 0)
				bi := Buffer(40,0), _scan := 0
				NumPut("int",w,bi,4),NumPut("int",-h,bi,8),NumPut("uint",40,bi,0),NumPut("ushort",1,bi,12),NumPut("ushort",32,bi,14)
				hbm := DllCall("CreateDIBSection", "Ptr", dstDC, "Ptr", bi.ptr, "uint", 0, "Ptr*", &_scan, "Ptr", 0, "uint", 0, "Ptr")
				DllCall("SelectObject", "Ptr", dstDC, "Ptr", hbm)
				DllCall("gdi32\BitBlt", "Ptr", dstDC, "int", 0, "int", 0, "int", (w=0?this.width:w), "int", (h=0?this.height:h), "Ptr", this.srcDC, "int", x, "int", y, "uint", 0xCC0020) ;40
				DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "Ptr", hbm, "Ptr", 0, "Ptr*", &bm)
			} else {
				if (this.desktop and this.virtualDesktop)
					DllCall("gdi32\BitBlt", "Ptr", this.dstDC, "int", 0, "int", 0, "int", this.width, "int", this.height, "Ptr", this.srcDC, "int", this.desktopRegion.x1, "int", this.desktopRegion.y1, "uint", 0xCC0020) ;40
				else
					DllCall("gdi32\BitBlt", "Ptr", this.dstDC, "int", 0, "int", 0, "int", this.width, "int", this.height, "Ptr", this.srcDC, "int", 0, "int", 0, "uint", 0xCC0020) ;40
				DllCall("gdiplus\GdipCreateBitmapFromHBITMAP", "Ptr", this.hbm, "Ptr", 0, "Ptr*", &bm)
			}
		
		
			;largely borrowed from tic function, encoder stuff is a pain
			nCount := nSize := 0
			DllCall("gdiplus\GdipGetImageEncodersSize", "uint*", &nCount, "uint*", &nSize)
			ci := Buffer(nSize)
			DllCall("gdiplus\GdipGetImageEncoders", "uint", nCount, "uint", nSize, "Ptr", ci)
			if !(nCount && nSize) {
				msgbox "Problem getting encoder information"
				return 0
			}
			Loop nCount {
				sString := StrGet(NumGet(ci, (idx := (48+7*A_PtrSize)*(A_Index-1))+32+3*A_PtrSize,"ptr"),,"UTF-16") ;Thanks tic, this particularily confused me!
				if (InStr(sString, "*.PNG")) {
					pCodec := ci.ptr + idx
					break
				}
			}
			if (!pCodec) {
				msgbox "Problem finding png codec"
				return 0
			}
			v := DllCall("gdiplus\GdipSaveImageToFile", "Ptr", bm, "Ptr", StrPtr(name), "Ptr", pCodec, "uint", 0)
		} else {
			msgbox "Unable to save image: " name "`n`nIs the window minimized?"
		}
	}
	
	
	;####################################################################################################################################################################################################################################
	;Click
	;
	;pointX				:				X position to click
	;pointY				:				Y position to click
	;button				:				Type of click (left,right,middle)
	;
	;return				;				Returns 1 on success; 0 otherwise
	;
	;notes				:				ControlClick will not work for every application
	
	Click(pointX,pointY,button:="left") {
		if (this.UseControlClick) {
			ControlClick("x" pointX " y" pointY,"ahk_id " this.hwnd,,button,,"NA D")
			sleep 50
			ControlClick("x" pointX " y" pointY,"ahk_id " this.hwnd,,button,,"NA U")
		} else {
			if (!WinActive("ahk_id " this.hwnd)) {
				msgbox "Attempting to click in target window but it is not active!`n`nIf you want to click inactive windows set 'UseControlClick' to true after initializing the class"
				return 0
			}
			click pointX,pointY,button
		}
		return 1
	}
	
	
	;####################################################################################################################################################################################################################################
	;ClickDrag
	;
	;pointX1			:				X position to start click
	;pointY1			:				Y position to start click
	;pointX2			:				X position to end click
	;pointY2			:				Y position to end click
	;button				:				Type of click (left,right,middle)
	;
	;return				;				Returns 1 on success; 0 otherwise
	;
	;notes				:				ControlClick will not work for every application
	
	ClickDrag(pointX1,pointY1,pointX2,pointY2,button:="left") {
		if (this.UseControlClick) {
			t := "ahk_id " this.hwnd
			ControlClick("x" pointX1 " y" pointY1,"ahk_id " this.hwnd,,button,,"NA D")
			sleep 10
			ControlClick("x" pointX2 " y" pointY2,"ahk_id " this.hwnd,,button,,"NA U")
		} else {
			if (!WinActive("ahk_id " this.hwnd)) {
				msgbox "Attempting to click in target window but it is not active!`n`nIf you want to click inactive windows set 'UseControlClick' to true after initializing the class"
				return 0
			}
			MouseClickDrag button,pointX1,pointY1,pointX2,pointY2
		}
		return 1
	}
	
	
	;####################################################################################################################################################################################################################################
	;ClickRegion
	;
	;pointX				:				X position to click
	;pointY				:				Y position to click
	;w					:				Width of region
	;h					:				Height of region
	;button				:				Type of click (left,right,middle)
	;
	;return				;				Returns 1 on success; 0 otherwise
	;
	;notes				:				Clicks randomly within the specified region
	
	ClickRegion(pointX,pointY,w,h,button:="left") {
		this.CheckRegion(&pointX,&pointY,&w,&h)
		pointX += Random(w)
		pointY += Random(h)
		return this.Click(pointX,pointY,button)
	}
	
	
	;####################################################################################################################################################################################################################################
	;GetImageDimensions
	;
	;image				:				Image file
	;&w					:				Variable to store the width result into
	;&h					:				Variable to store the height result into
	;
	;return				;				Returns void
	;
	;notes				:				Gets the width/height of a cached image
	
	GetImageDimensions(image,&w, &h) {
		if (!this.imageCache[image]) {
			this.cacheImage(image)
		}
		w := numget(this.imageCache[image],2,"ushort")
		h := numget(this.imageCache[image],0,"ushort")
	}
	
	
	
	SetTargetImageFile(image) {
		if (image = "") {
			msgbox "Error, expected resource image path but empty variable was supplied!"
			return 0
		}
		if (!FileExist(image)) {
			msgbox "Error finding resource image: '" image "' does not exist!"
			return 0
		}
		bm := w := h := 0
		DllCall("gdiplus\GdipCreateBitmapFromFile", "Str", image, "Ptr*", &bm)
		DllCall("gdiplus\GdipGetImageWidth", "Ptr", bm, "Uint*", &w)
		DllCall("gdiplus\GdipGetImageHeight", "Ptr", bm, "Uint*", &h)
		this.srcDC := DllCall("CreateCompatibleDC", "Ptr", 0)
		this.width := w
		this.height := h
		bi := Buffer(40,0)
		_scan := 0
		NumPut("int",w,bi,4)
		NumPut("int",-h,bi,8)
		NumPut("uint",40,bi,0)
		NumPut("ushort",1,bi,12)
		NumPut("ushort",32,bi,14)
		this.hbm2 := DllCall("CreateDIBSection", "Ptr", this.srcDC, "Ptr", bi.ptr, "uint", 0, "Ptr*", &_scan, "Ptr", 0, "uint", 0, "Ptr")
		this.temp02 := _scan
		NumPut("Ptr",_scan,this.dataPtr,0)
		NumPut("uint",this.width,this.dataPtr,(this.bits ? 16 : 8))
		NumPut("uint",this.height,this.dataPtr,(this.bits ? 20 : 12))
		DllCall("SelectObject", "Ptr", this.srcDC, "Ptr", this.hbm2)
		
		
		r := Buffer(16,0)
		NumPut("uint",w,r,8)
		NumPut("uint",h,r,12)
		bmdata := Buffer(32,0)
		DllCall("Gdiplus\GdipBitmapLockBits", "Ptr", bm, "Ptr", r, "uint", 3, "int", 0x26200A, "Ptr", bmdata)
		scan := NumGet(bmdata, 16, "Ptr")
		if (!dllcall(this._cacheTargetImageFile,"ptr",scan,"ptr",_scan,"int",w,"int",h,"cdecl int")) {
			msgbox "Problem caching target image file!"
			return 0
		}
		DllCall("Gdiplus\GdipBitmapUnlockBits", "Ptr", bm, "Ptr", bmdata)
		DllCall("gdiplus\GdipDisposeImage", "ptr", bm)
		this.CreateDib()
		this.AutoUpdate := 0
		this.Update()
		return 1
	}
	
	
	
	
	
	
	
	
	
	
	
	
	;########################################## 
	;  internal functions used by the class
	;########################################## 
	CheckRegion(&x, &y, &w, &h) {
		if (w < 0) {
			w := -w
			x -= w
		}
		if (h < 0) {
			h := -h
			y -= h
		}
	}
	CheckWindow() {
	
		if (this.UseClientArea and !this.GetClientRect(&w,&h))
			return 0
		else if (!this.UseClientArea and !this.GetWindowRect(&w,&h))
			return 0
			
		if (w != this.width or h != this.height) {
			this.width := w
			this.height := h
			DllCall("DeleteObject","Ptr",this.hbm)
			this.CreateDIB()
		}
		return 1
	}
	MapCoords(d,&x,&y) {
		x := (this.offsetX + (d>>16)) * this.WindowScale
		y := (this.offsetY + (d&0xFFFF)) * this.WindowScale
	}
	CreateDIB() {
		bi := Buffer(40,0)
		NumPut("int",this.width,bi,4)
		NumPut("int",-this.height,bi,8)
		NumPut("uint",40,bi,0)
		NumPut("ushort",1,bi,12)
		NumPut("ushort",32,bi,14)
		_scan := 0
		this.hbm := DllCall("CreateDIBSection", "Ptr", this.dstDC, "Ptr", bi.ptr, "uint", 0, "Ptr*", &_scan, "Ptr", 0, "uint", 0, "Ptr")
		this.temp0 := _scan
		NumPut("Ptr",_scan,this.dataPtr,0)
		NumPut("uint",this.width,this.dataPtr,(this.bits ? 16 : 8))
		NumPut("uint",this.height,this.dataPtr,(this.bits ? 20 : 12))
		DllCall("SelectObject", "Ptr", this.dstDC, "Ptr", this.hbm)
	}
	__Delete() {
		DllCall("gdiplus\GdiplusShutdown", "Ptr*", this.gdiplusToken)
	}
	CacheImage(image) {
		if (this.imageCache.has(image))
			return 1
		if (image = "") {
			msgbox "Error, expected resource image path but empty variable was supplied!"
			return 0
		}
		if (!FileExist(image)) {
			msgbox "Error finding resource image: '" image "' does not exist!"
			return 0
		}
		bm := w := h := 0
		DllCall("gdiplus\GdipCreateBitmapFromFile", "Str", image, "Ptr*", &bm)
		DllCall("gdiplus\GdipGetImageWidth", "Ptr", bm, "Uint*", &w)
		DllCall("gdiplus\GdipGetImageHeight", "Ptr", bm, "Uint*", &h)
		r := Buffer(16,0)
		NumPut("uint",w,r,8)
		NumPut("uint",h,r,12)
		bmdata := Buffer(32,0)
		DllCall("Gdiplus\GdipBitmapLockBits", "Ptr", bm, "Ptr", r, "uint", 3, "int", 0x26200A, "Ptr", bmdata)
		scan := NumGet(bmdata, 16, "Ptr")
		p := DllCall("GlobalAlloc", "uint", 0x40, "ptr", 16+((w*h)*4), "ptr")
		NumPut("uint",(w<<16)+h,p,0)
		loop ((w*h)*4)
			NumPut("uchar",NumGet(scan,a_index-1,"uchar"),p,a_index+7)
		loop (w*h)
			if (NumGet(scan,(a_index-1)*4,"uint") < 0xFF000000) {
				NumPut("uint",1,p+4,0)
				break
			}
		DllCall("Gdiplus\GdipBitmapUnlockBits", "Ptr", bm, "Ptr", bmdata)
		DllCall("gdiplus\GdipDisposeImage", "ptr", bm)
		this.ImageCache[image] := p
		return 1
	}
	Update(x:=0,y:=0,w:=0,h:=0,applyOffset:=1) {
		if (this.desktop) {
			DllCall("gdi32\BitBlt", "Ptr", this.dstDC, "int", 0, "int", 0, "int", (!w||w>this.desktopRegion.w?this.desktopRegion.w:w), "int", (!h||h>this.desktopRegion.h?this.desktopRegion.h:h), "Ptr", this.srcDC, "int", this.desktopRegion.x1+x, "int", this.desktopRegion.y1+y, "uint", 0xCC0020) ;40
		} else if (this.CheckWindow()) {
			DllCall("gdi32\BitBlt", "Ptr", this.dstDC, "int", 0, "int", 0, "int", (!w||w>this.width?this.width:w), "int", (!h||h>this.height?this.height:h), "Ptr", this.srcDC, "int", x, "int", y, "uint", 0xCC0020) ;40
		} else { 
			return 0
		}
		if (applyOffset) {
			this.offsetX := x, this.offsetY := y
		} else {
			this.offsetX := this.offsetY := 0
		}
	}
	GetRect(&w, &h) {
		if (this.desktop) {
			w := this.desktopRegion.w
			h := this.desktopRegion.h
			return 1
		}
		if (this.UseClientArea) {
			if (!this.GetClientRect(&w,&h)) {
				msgbox "Problem with Client rectangle dimensions, is window minimized?`n`nScanner will not function!`n`n" this.lastError
				return 0
			}
		} else {
			if (!this.GetWindowRect(&w,&h)) {
				msgbox "Problem with Window rectangle dimensions, is window minimized?`n`nScanner will not function!`n`n" this.lastError
				return 0
			}
		}
		return 1
	}
	GetClientRect(&w, &h) {
		buff := Buffer(32,0)
		if (!DllCall("GetClientRect", "Ptr", this.hwnd, "Ptr", buff))
			return this.err(-1,"Call to GetClientRect failed for hwnd: " this.hwnd)
		w := NumGet(buff,8,"int")
		h := NumGet(buff,12,"int")
		if (w <= 0 or h <= 0)
			return this.err(-2,"GetClientRect returned invalid dimensions (" w "," h ") for hwnd: " this.hwnd)
		return 1
	}
	GetWindowRect(&w, &h) {
		buff := Buffer(32,0)
		if (!DllCall("GetWindowRect", "Ptr", this.hwnd, "Ptr", buff))
			return this.err(-1,"Call to GetWindowRect failed for hwnd: " this.hwnd)
		x := NumGet(buff,0,"int")
		y := NumGet(buff,4,"int")
		w := NumGet(buff,8,"int") - x
		h := NumGet(buff,12,"int") - y
		if (w <= 0 or h <= 0)
			return this.err(-2,"GetWindowRect returned invalid dimensions (" w "," h ") for hwnd: " this.hwnd)
		return 1
	}
	AppendFunc(pos,str) {
		p := this.mcode(str)
		pp := (this.bits ? 24 : 16) + (pos * a_ptrSize)
		NumPut("ptr",p,this.dataPtr,pp)
	}
	Mcode(str) {
		local pp := 0, op := 0
		s := strsplit(str,"|")
		if (s.length != 2)
			return
		if (!DllCall("crypt32\CryptStringToBinary", "str", s[this.bits+1], "uint", 0, "uint", 1, "ptr", 0, "uint*", &pp, "ptr", 0, "ptr", 0))
			return
		p := DllCall("GlobalAlloc", "uint", 0, "ptr", pp, "ptr")
		if (this.bits)
			DllCall("VirtualProtect", "ptr", p, "ptr", pp, "uint", 0x40, "uint*", &op)
		if (DllCall("crypt32\CryptStringToBinary", "str", s[this.bits+1], "uint", 0, "uint", 1, "ptr", p, "uint*", &pp, "ptr", 0, "ptr", 0))
			return p
		DllCall("GlobalFree", "ptr", p)
	}
	LoadLib(lib*) {
		for k,v in lib
			if (!DllCall("GetModuleHandle", "str", v, "Ptr"))
				DllCall("LoadLibrary", "Str", v) 
	}
	Err(v,r) {
		this.lastError := r
		return v
	}
}

ShinsImageScanClass_MonitorCallback(a,b,c,d) {
	global ShinsImageScanClass_Monitors
	x1 := numget(c+0,0,"int")
	y1 := numget(c+0,4,"int")
	x2 := numget(c+0,8,"int")
	y2 := numget(c+0,12,"int")
	w := x2-x1
	h := y1-y1
	ShinsImageScanClass_Monitors.push({a:a,b:b,c:c,d:d,x1:x1,y1:y1,x2:x2,y2:y2,w:w,h:h})
	return 1
}