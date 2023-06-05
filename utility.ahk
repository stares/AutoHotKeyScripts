; Toggle key Press of j
!+j::
    RepeatKeyJ := !RepeatKeyJ
    If RepeatKeyJ {
        SetTimer, SendTheKeyJ, 2000	; The "2000" here is the number of milliseconds between repeats.
        SetTimer, SendTheKeyK, Off
    }
    Else
        SetTimer, SendTheKeyJ, Off
Return

SendTheKeyJ:
    SendInput, j
Return

; Toggle key press of k
!+k::
    RepeatKeyK := !RepeatKeyK
    If RepeatKeyK {
        SetTimer, SendTheKeyK, 2000	; The "2000" here is the number of milliseconds between repeats.
        SetTimer, SendTheKeyJ, Off
    }
    Else
        SetTimer, SendTheKeyK, Off
Return

SendTheKeyK:
    SendInput, k
Return

; Right Shift for toggle input method
RShift::
    KeyWait, RShift
    If (A_TimeSinceThisHotkey < 200)
        Send, #{Space}
Return

; control + right click = middle button
^RButton::MButton

; Microsoft Whiteboard
!z:: ; The ! symbol represents the Alt key, so this line means "when Alt+Z is pressed"
Send, !w1 ; Send the Alt+W+1 key combination
return ; End of the hotkey definition

; Disable RShift hotkey for TeamViewer
#IfWinActive, ahk_exe TeamViewer.exe
  RShift::return
#IfWinActive

; Win+n to open IP-guard
#n::
Run, "D:\USDAgent.exe"
return

; Maximize windows
^+`:: ; This is a hotkey (Ctrl+Shift+`). Change it to your liking.
WinGetActiveStats, Title, Width, Height, X, Y
WinSet, Style, ^0xC00000 ; Remove title bar.

SysGet, Mon1, Monitor, 1 ; fetch monitor 1 dimensions
SysGet, Mon2, Monitor, 2 ; fetch monitor 2 dimensions
; MsgBox, % "Mon1: " Mon1Left ", " Mon1Top ", " Mon1Right ", " Mon1Bottom
; MsgBox, % "Mon2: " Mon2Left ", " Mon2Top ", " Mon2Right ", " Mon2Bottom

SysGet, MonitorCount, MonitorCount
if (MonitorCount > 1) ; check if monitors have same resolution
{
    TotalWidth := Mon1Right - Mon2Left ; total width calculation
    TotalHeight := Mon1Bottom - Mon1Top ; total height calculation
    TaskBarOffset := 41
    GapOffset := 7
    ; MsgBox, %Mon1Left% %Mon1Top% %TotalWidth% %TotalHeight%
    WinMove, %Title%,, Mon2Left - GapOffset, Mon2Top, TotalWidth + 2 * GapOffset, TotalHeight - TaskBarOffset ; Move and resize.
}
else ;
{
    WinMaximize, %Title% ; maximize the window
}
return