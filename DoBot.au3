#include<img/img.au3>

HotKeySet("{F4}", "ExitProg")
HotKeySet("{F5}", "StartStop")

Dim $On
$On = False

MsgBox(0,'Config map', 'Select top left corner of minimap')
$x = MouseGetPos()

While 1
    While $On = True
	  $cross = PixelSearch(0,100,1675,1010,0x505CAB)
	  $findBox = false
	  if (IsArray($cross)) then
		 $pxs = PixelSearch(0,100,1675,1010,0xF8B95F, 14); Recherche des bonus box
		 If isArray($pxs) then
			$findBox = true
			MouseClick("left",((@DesktopWidth/2)-150),(@DesktopHeight/2)); Stabilisation du vaiseau
			Sleep(600)
			MouseClick("left",((@DesktopWidth/2)+150),(@DesktopHeight/2)); Stabilisation du vaiseau
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
		 MouseMove(Random(1480,1656),Random(836,942), 0)
		 MouseClick("Left")
		 MouseMove(0,0, 0)
		 sleep(1000)
	  EndIf
    WEnd
    Sleep(100)
 WEnd

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