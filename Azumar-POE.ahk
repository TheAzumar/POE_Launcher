;--POE-Launcher ---------------------
;------------------------------------
;Writen By: TheAzumar
;Contact Info: TheAzumar@gmail.com
;------------------------------------
;lots of help from Peared's forum post
;https://www.autohotkey.com/boards/viewtopic.php?f=6&t=3851&start=200
;------------------------------------

;------------------------------------
;Script settings
;------------------------------------	

	#SingleInstance,force,ignore
	#NoEnv
	SetWorkingDir, %A_ScriptDir%

;------------------------------------
;Icon Settings
;------------------------------------	
	I_Icon = BI-Icon.png
	
	ICON [I_Icon] 
	if I_Icon <>
	IfExist, %I_Icon%
	
	Menu, Tray, Icon, %I_Icon% 

;------------------------------------
; --CHANGE GUITITLE, COLORS, and tooltip
;------------------------------------

	GUITITLE := "Azumar's POE Launcher"
	transparent := 220			;GUI transparancy
		
	color1:="e29317"			;title background color
	color2:="e29317"			;title top border 1
	color3:="e29317"			;title top border 2
	color4:="284f0f"			;title bottom border
	color5:="284f0f"			;left inside border
	color6:="e29317"			;left outside border
	color7:="284f0f"			;right inside border
	color8:="e29317"			;right outside border
	color9:="284f0f"			;M_I top edge color (h=3px w=maxGUIwidth)
	color10:="e29317"			;M_I partCover1, to cover vertical lines 
	color11:="e29317"			;M_I partCover2, same as above
	color12:="000000"			;Title & Text
	color13:="e29317"  			;Gui background color
	color14:="e29317"			;Statusbar color
	Menu, Tray, Tip, %GUITITLE%	;Tooltip same as gui title
	
;------------------------------------
; --SET W/H OF YOUR GUI
;------------------------------------

	width := "800"  			;GUI width
	height:= "485"				;GUI height

;------------------------------------
; SIZE OF PROGRESS BARS IN CORRECT W/H RATIO
; DO NOT EDIT IF YOU WANT TU USE TEMPATE AS IS
;------------------------------------

	W1 := width - 7,w2 := width - 5,w3 := width - 3,w4 := width - 72
	,w6:= width -50,w7:= width - 34,w5 := (width-72) //2,h1 := height - 50
	,h3 := height - 20,h2 := height - 17,mipart := (width-70) //2

;------------------------------------

	gui, destroy
	gui, +lastfound +AlwaysOnTop
	Gui, Margin, 0, 0
	gui, color, %color13%, %color13%
	WinSet, Transparent,%transparent%
	gui, -caption 
	Gui, Add, Progress,+E0x20 x-1 y0 w%width%+2 h30 Background%color1% Disabled 			;title
	Gui, Add, Progress,+E0x20 x-1 y-1 w%width% h3 Background%color2% Disabled 				;title top border 1
	Gui, Add, Progress,+E0x20 x-1 y1 w%width% h2 Background%color3% Disabled 				;title top border 2
	Gui, Add, Progress,+E0x20 x2 y30 w%w2% h3 Background%color4% Disabled 					;title bottom border
	Gui, Add, Progress,+E0x20 x2 y30 w2 h%h1% Background%color5% Disabled 					;left inside border
	Gui, Add, Progress,+E0x20 x0 y3 w2 h%height% Background%color6% Disabled 				;left outside border
	Gui, Add, Progress,+E0x20 x%w2% y30 w2 h%h1% Background%color7% Disabled 				;right inside border
	Gui, Add, Progress,+E0x20 x%w3% y3 w2 h%height% Background%color8% Disabled 			;right outside border
	Gui, Add, Progress,+E0x20 x2 y%h3% w%w2% h3 Background%color9% Disabled 				;M_I top edge
	Gui, Add, Progress,+E0x20 x%w4% y%h2% w5 h33 Background%color10% Disabled 				;M_I part Cover1  
	Gui, Add, Progress,+E0x20 x%w5%-72 y%h2% w4 h25 Background%color11% Disabled 			;M_I part Cover2
	gui, font, Q5 c%color12% bold s12,  													;color & size of following 
	Gui, Add, Text, +E0x20 0x200 x%w7% y2 w15 h15 BackgroundTrans Center gguiclose , x  	;x to close gui
	Gui, Add, Text, +E0x20 0x200 x%w6% y6 w15 h15 BackgroundTrans Center gminimize , -	 	; - to min gui
	gui, font, Q5 c%color12% bold s14,  													;color & size GuiTitle

;------------------------------------
; Title with text and a g-label to enable winmove.
;------------------------------------

	Gui, Add, Text, +E0x20 0x200 x0 y0 w%width% h22 BackgroundTrans Center gGuiMove , %guititle%   
	gui, Font, Q5 s09 w500, Verdana 														;Menu-text color/font


;------------------------------------
;ADD YOUR GUI CONTROLS UNDER HERE 
;------------------------------------
	
	Gui, Add, Picture, , loader.jpg
	Gui, Add, Progress, w300 h12 x470 y80 Background%color13% Center cPurple vMyProgress, -smooth
	GuiControl,, MyProgress, 0  												; Set the current position to 1%.
	gui, Font, Q5 s9 bold w670,													;M_I Font
	Gui, Add, Text, w300 h16 x470 y60 Center HwndTextControl, Initializing
	Gui, add, StatusBar, background%color14% -theme    							;M_I-backgroundcolor -theme is crucial
	SB_SetParts(mipart, mipart)													;M_I split into 3 parts, 
	SB_SetText("Ver 1.0" ,3)													;M_I set Version of your project here
	SB_SetText("  TheAzumar@gmail.com"a,1)						
	SB_SetText("Milestone Interactive",2)
	Menu, tray, Color, %color13%												;Tray menu bg-color same as background
	winset, region, w%width% h%height%+5 0-0 R35-35								;Trim GUI Borders and round of corners 35px radius  
	gui, show, w%width% h%height%												;Make Gui Visible.
	gui, +lastfound
	SoundPlay, start.mp3,
	Sleep,2000
	GuiControl, Text, % TextControl,   Authorizing.
	GuiControl,, MyProgress, 1  						; Set the current position to 1%.
	Sleep,500
	GuiControl, Text, % TextControl,  Authorizing..
	GuiControl,, MyProgress, 2  						; Set the current position to 2%.
	Sleep,500
	GuiControl, Text, % TextControl, Authorizing...
	GuiControl,, MyProgress, 3  						; Set the current position to 3%.
	Sleep,500
	GuiControl, Text, % TextControl, 
	Sleep,600
	GuiControl, Text, % TextControl, Authorized
	Sleep,1000
	GuiControl, Text, % TextControl, 
	Sleep,500
	GuiControl, Text, % TextControl, Authorized
	GuiControl,, MyProgress, 4.5  						; Set the current position to 4.5%.
	Sleep,1050
	GuiControl, Text, % TextControl, Thank You
	Sleep,1000
	GuiControl, Text, % TextControl,
	Sleep,500

;------------------------------------
;Trade_Macro
;------------------------------------
	
	Run,MI-trademacro.lnk
	GuiControl, Text, % TextControl, Trade Macro Loading...

;------------------------------------
;Sleep 5 seconds and adjust progress bar	
;------------------------------------	

	GuiControl,, MyProgress, 6.6  						; Set the current position to 6.6%.	
	Sleep,1000
	GuiControl,, MyProgress, 13.2  						; Set the current position to 13.2%.	
	Sleep,1000
	GuiControl,, MyProgress, 19.8  						; Set the current position to 19.8%.	
	Sleep,1000
	GuiControl,, MyProgress, 26.4  						; Set the current position to 26.4%.	
	Sleep,1000
	GuiControl,, MyProgress, 33  						; Set the current position to 33%.	
	Sleep,1000

;------------------------------------	
;Mercury_Trade	
;------------------------------------	

	Run,MI-mercurytrade.jar																				
	GuiControl, Text, % TextControl, Mercury Trade Loading...

;------------------------------------	
;Sleep 2 seconds and adjust progress bar	
;------------------------------------	

	GuiControl,, MyProgress, 39.6  						; Set the current position to 39.6%.
	Sleep,1000																							
	GuiControl,, MyProgress, 46.2  						; Set the current position to 46.2%.
	Sleep,1000

;------------------------------------	
;POE-Steam
;------------------------------------	

	Run,MI-POE.url																						
	GuiControl, Text, % TextControl, POE Loading...

;------------------------------------	
;Sleep 1 second and adjust progress bar
;------------------------------------	
																						
	GuiControl,, MyProgress, 52.8  						; Set the current position to 52.8%.
	Sleep,1000

;------------------------------------	
;Companion	
;------------------------------------	

	Run,MI-Companion.lnk																				
	GuiControl, Text, % TextControl, Companion Loading...

;------------------------------------	
;Sleep 7 seconds and adjust progress bar	
;------------------------------------	
																						
	GuiControl,, MyProgress, 59.4  						; Set the current position to 59.4%.
	Sleep,1000
	GuiControl,, MyProgress, 66  						; Set the current position to 66%.
	Sleep,1000
	GuiControl,, MyProgress, 72.6  						; Set the current position to 72.6%.
	Sleep,1000
	GuiControl,, MyProgress, 79.2  						; Set the current position to 79.6%.
	Sleep,1000
	GuiControl,, MyProgress, 85.8  						; Set the current position to 85.8%.
	Sleep,1000
	GuiControl,, MyProgress, 92.4  						; Set the current position to 92.4%.
	Sleep,1000
	GuiControl,, MyProgress, 99  						; Set the current position to 99%.
	Sleep,500
	GuiControl,, MyProgress, 100						; set the current position to 100%
	Sleep,1000

;------------------------------------	
;Finish & close script	
;------------------------------------	

	Sleep,500
	ExitApp
	return

;------------------------------------
;Minimize Gui
;------------------------------------

	minimize:
	winminimize,
	return

;------------------------------------
;Drag
;------------------------------------

	GuiMove:     		
	PostMessage, 0xA1, 2
	sleep 75
	winset, redraw
	return

;------------------------------------
;Exit App,
;------------------------------------

	GuiEscape:		
	GuiClose:
	ButtonCancel:
	ExitApp