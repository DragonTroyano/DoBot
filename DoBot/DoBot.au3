#include <Misc.au3>

HotKeySet("{F4}", "ExitProg")
HotKeySet("{F5}", "StartStop")

Dim $on
Dim $topGame
Dim $bottomGame
Dim $topMap
Dim $bottomMap
Dim $conf
$on = False
$topGame = Null
$bottomGame = Null
$topMap = Null
$bottomMap = Null
$conf = False

While 1
   If ($conf == False) Then
	  config()
   Else
	  While $On = True
	  ;$cross = PixelSearch(0,100,1675,1010,0x505CAB)
	  $cross = PixelSearch($topMap[0],$topMap[1],$bottomMap[0],$bottomMap[1],0x505CAB)
	  $findBox = false
		 if (IsArray($cross)) then
			$pxs = PixelSearch(0,100,1675,1010,0xF8B95F, 14); Recherche des bonus box
			If isArray($pxs) then
			   $findBox = true
			   MouseClick("left",((@DesktopWidth/2)-150),(@DesktopHeight/2)); Stabilisation du vaiseau
			   Sleep(600)
			   While $findBox
				  $pxs = PixelSearch(0,100,1675,1010,0xF8B95F, 14); Recherche des bonus box
				  If isArray($pxs) then
					 $findBox = true
					 MouseClick("Left",$pxs[0],$pxs[1])
					 Sleep(1500)
				  Else
					 $findBox = false
				  EndIf
			   WEnd
			EndIf
		 Else
			MouseMove(Random($topMap[0],$bottomMap[0]),Random($topMap[1],$bottomMap[1]), 0)
			MouseClick("Left")
			MouseMove($topGame[0],$topGame[1], 0)
			sleep(1000)
		 EndIf
	  WEnd
	  Sleep(100)
   EndIf
 WEnd

 Func config()
   MsgBox(0, "Game", "Define the game zone, clic on top-left corner")
   While ($conf == False)
	  If (_IsPressed(01)) Then
		 If ($topGame == Null) Then
			$topGame = MouseGetPos()
		 ElseIf ($bottomGame == Null) Then
			MsgBox(0, "Game", "Define the game zone, clic on bottom-right corner")
			$bottomGame = MouseGetPos()
		 ElseIf ($topMap == Null) Then
			MsgBox(0, "Mini Map", "Define the mini map zone, clic on top-left corner")
			$topMap = MouseGetPos()
		 ElseIf ($bottomMap == Null) Then
			MsgBox(0, "Mini Map", "Define the mini map zone, clic on bottom-right corner")
			$bottomMap = MouseGetPos()
		 ElseIf (IsArray($topGame) And IsArray($bottomGame) And IsArray($topMap) And IsArray($bottomMap)) Then
			$conf = True
		 EndIf
	  EndIf
   WEnd
EndFunc

Func StartStop()
    If $On = False Then
        $On = True
    Else
        $On = False
    EndIf
EndFunc

Func ExitProg()
    Exit 0
EndFunc