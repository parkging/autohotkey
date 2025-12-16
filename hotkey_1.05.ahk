;WIN:#, ctrl:^, alt:!, shift:+ 
#MaxHotkeysPerInterval 150
;#NoTrayIcon
#SingleInstance force


#enter::
WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
return



#if 
Key(key) {
	SendInput {blind}{%key%}
}

Key_repeat(pfx,key) {
	SendInput {blind}%pfx%{%key%}
}

RButton::
If GetKeyState("LButton", "P")
{
    Send, !{Right}
    Return
}
CoordMode, Mouse, Screen
MouseGetPos, X1, Y1
Loop
{
    If Not GetKeyState("RButton", "P")
        Break
    If GetKeyState("LButton", "P")
    {
        Send, !{Left}
        Return
    }
    MouseGetPos, X2, Y2
    gsize := 100
    diffX := X2 - X1
    diffY := Y2 - Y1
    distX := Abs(diffX)
    distY := Abs(diffY)
    If (diffX < -gsize and distY < gsize)
        cmd = ^#{Left}
    Else If (diffX > gsize and distY < gsize)
        cmd = ^#{Right}
    Else If (diffY < -gsize and distX < gsize)
        cmd = #{tab}
    Else If (diffY > gsize and distX < gsize)
        cmd = #{down}
        ;WinMinimize, A

    Else
        cmd = {RButton}
    Sleep, 50
}
Send, %cmd%
Return



*CapsLock::RCtrl
<^Up::Send {LWin down}{tab}{LWin up}
<^F3::Send {LWin down}{t}{LWin up}
>^q::Send {Alt Down}{F4}{Alt Up}
>+enter::AltTab
>+BackSpace::Browser_Back
AppsKey::Send {vk15sc1F2}
AppsKey & ESC::CapsLock
<^Left::Send {LWin down}{Ctrl Down}{Left}{Ctrl Up}{LWin up}
<^Right::Send {LWin down}{Ctrl Down}{Right}{Ctrl Up}{LWin up}
#IfWinNotActive ahk_class SunAwtFrame
>^]::Send {Browser_Forward}
>^[::Send {Browser_Back}
#IfWinNotActive
>^+[::Send {Shift Down}{Ctrl Down}{tab}{Ctrl Up}{Shift Up}
>^+]::Send {Ctrl Down}{tab}{Ctrl Up}
!left::Send {Ctrl Down}{left}{Ctrl Up}
!Right::Send {Ctrl Down}{right}{Ctrl Up}
!BackSpace::Send {Ctrl Down}{BackSpace}{Ctrl Up}
>^BackSpace::!BackSpace
!Delete::Send {Ctrl Down}{Delete}{Ctrl Up}
!+left::Send {Shift Down}{Ctrl Down}{left}{Ctrl Up}{Shift Up}
!+Right::Send {Shift Down}{Ctrl Down}{right}{Ctrl Up}{Shift Up}
>^left::SendInput {home}
>^right::SendInput {end}
>^+left::SendInput {Shift Down}{home}{Shift Up}
>^+right::SendInput {Shift Down}{end}{Shift Up}
>^Tab::SendInput {RCtrl Down}{Alt Down}{Tab}{Alt Up}{RCtrl Up}
>^g::SendInput {Alt Down}{g}{Alt up}
>^+g::SendInput {Shift Down}{Alt Down}{g}{Alt up}{Shift Down}
<^+r::Send {Alt Down}{Shift Down}{r}{Shift Up}{Alt Up}
<^+d::Send {Alt Down}{Shift Down}{d}{Shift Up}{Alt Up}
<^r::Send {Alt Down}{r}{Alt Up}
<^d::Send {Alt Down}{d}{Alt Up}
<^a::SendInput {Home}
<^e::SendInput {End}
<^f::SendInput {right}
<^b::SendInput {left}
<^n::SendInput {down}
<^p::SendInput {up}
!<^a::SendInput {Home}
!<^e::SendInput {End}
!<^f::SendInput {right}
!<^b::SendInput {left}
!<^n::SendInput {down}
!<^p::SendInput {up}


