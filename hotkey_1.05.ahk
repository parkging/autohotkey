;WIN:#, ctrl:^, alt:!, shift:+
#MaxHotkeysPerInterval 150
#NoTrayIcon
#SingleInstance force

*CapsLock::sgn:=1
*CapsLock up::sgn:=0
sc1F1::Key("AppsKey")
!WheelDown::SendInput {PgDn}
!WheelUp::SendInput {PgUp}
<#F11::Volume_Down
<#F12::Volume_Up
<#F10::Volume_Mute
>+Enter::alttab

!`::Send {LAlt Down}{LShift Down}{ESC}{LShift Up}{LAlt Up}

;!ESC::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinSet, Bottom, , ahk_id %KDE_id%
;return
;!`::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinActivate,ahk_id %KDE_id%
;    Send {LAlt Down}{LShift Down}{ESC}{LShift Up}{LAlt Up}
;return

;~WheelUp::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinActivate,ahk_id %KDE_id%
;return
;
;~WheelDown::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinActivate,ahk_id %KDE_id%
;return



;#ESC::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinSet, Bottom, , ahk_id %KDE_id%
;return
;#`::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinActivate,ahk_id %KDE_id%
;    Send {LAlt Down}{LShift Down}{ESC}{LShift Up}{LAlt Up}
;return


;MButton::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinSet, Bottom, , ahk_id %KDE_id%
;return
;+MButton::
;    MouseGetPos,DKE_X1,KDE_Y1,KDE_id
;    WinActivate,ahk_id %KDE_id%
;    Send {LAlt Down}{LShift Down}{ESC}{LShift Up}{LAlt Up}
;return

<#WheelDown::alttab
<#WheelUp::shiftalttab
;<#WheelDown::<#t
;<#WheelUp::<#+t
#Insert::Winset, Alwaysontop, , A
~<#PgDn::alttab
~<#PgUp::shiftalttab

;#ESC::!ESC
;#`::!+ESC

;#n::Send {LAlt Down}{Space Down}{Space Up}{LAlt Up}{s}{right down}{right up}{down down}{down Up}
;#m::Send {LAlt Down}{Space Down}{Space Up}{LAlt Up}{m}{right}{left}


^!Left::^!Left
^!right::^!right
^!down::^!down
^!up::^!up

#enter::
WinGet MX, MinMax, A
   If MX
        WinRestore A
   Else WinMaximize A
return


#Delete:: Send {LAlt down}{F4}{LAlt up}
#Home:: WinMaximize, A
#End::    Send {LWin down}{Down}{LWin up}
;#Space:: Send {LAlt down}{Space}{n}{LAlt up}
#Space:: WinMinimize, A
;#z::
;  Toggle := !Toggle
;  If !Toggle
;    WinRestore, A
;  else
;    WinMaximize, A
;  return

>+backspace::Browser_Back
>+delete::Send {Ctrl Down}{w}{Ctrl Up}
;>+F12::Send {LWin Down}{tab}{LWin Up}

;PrintScreen::NumLock
;ScrollLock::NumpadDiv
;Pause::NumpadMult
;NumLock::Delete
;Insert::PrintScreen
;Delete::Insert
;Home::ScrollLock
;End::Home
;PgUp::Pause
;PgDn::PgUp
;NumpadDiv::End
;NumpadMult::PgDn

+insert::+insert
!insert::!insert
^insert::^insert
insert::^c
PrintScreen::^v

^`::^+tab
#q::Send {LAlt down}{F4}{LAlt up}
!`::!+ESC
#w::#t

>+PgUp::home
>+PgDn::End

#if sgn
{

;!WheelDown::Volume_Down
;!WheelUp::Volume_Up
;    #WheelDown::Volume_Down
;    #WheelUp::Volume_Up

	tab::enter

	#tab::
	WinGet MX, MinMax, A
	   If MX
     	   WinRestore A
	   Else WinMaximize A
	return
	
	-::NumpadDiv
	=::NumpadMult

	v::^v
	c::^c
	x::^x
	z::^z
	y::^y
	f::^f

	tab & WheelDown::down
	tab & WheelUp::up
	WheelDown::right
	WheelUp::left

	space::AppsKey
	Esc::CapsLock
	backspace::^backspace
	`::delete

	3::End
	1::Home
	
	sc027::^right
;	f::^right
	9::^home
	m::^end

	0::end
	8::home

	e::pgdn
	q::pgup

	o::pgdn
	u::pgup

	a::left
	s::down
	d::right
	w::up

	;vi모드
	h::left
	j::down
	k::up
	l::right
	g::^left
	i::up
	
	;h::^left
	;j::left
	;k::down
	;l::right
	;i::up
	
	2::^+up
;	x::^+down
	#w::#up
	
} 

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

;vim모드
;$*h::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {Left}
;else 
;{
;    if GetkeyState("Shift", "P") = 1
;        SendInput, +{h}
;    else 
;        SendInput, {h}
;}
;return
;
;$*j::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {Down}
;else
;{
;    if GetkeyState("Shift", "P") = 1
;        SendInput, +{j}
;    else
;        SendInput, {j}
;}
;return
;
;$*k::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {Up}
;else
;    if GetkeyState("Shift", "P") = 1
;        SendInput, +{k}
;    else
;        SendInput, {k}
;return
;
;$*l::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {Right}
;else
;     if GetkeyState("Shift", "P") = 1
;        SendInput, +{l}
;    else
;        SendInput, {l}
;   
;    
;return
;
;$*i::
;if GetKeyState("CapsLock", "T") = 1
;    SetCapslockState, off
;else
;      if GetkeyState("Shift", "P") = 1
;        SendInput, +{i}
;    else
;        SendInput, {i}
;return
;
;$*f::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {PgDn}
;else
;      if GetkeyState("Shift", "P") = 1
;        SendInput, +{f}
;    else
;        SendInput, {f}
;return
;
;$*b::
;if GetKeyState("CapsLock", "T") = 1
;    SendInput, {PgUp}
;else
;      if GetkeyState("Shift", "P") = 1
;        SendInput, +{b}
;    else
;        SendInput, {b}
;return
;
;$Esc::
;if GetKeyState("CapsLock", "T") = 1
;    SetCapslockState, off
;else
;    SendInput, {Esc}
;return
;
;$Rshift:: ; short tap trigger
;  Send,{Rshift Down} 
;  KeyWait, Rshift, t0.2 ; t0.x = short click time
;  If ErrorLevel  {
;    KeyWait, Rshift
;  }
;  Else If(A_PriorKey = "Rshift") { ;check prior key
;    If (0){ ; current_layer!="layer_normal") {
;      SetCapslockState, off
;    }
;    Else{
;      SetCapslockState, on
;    }
;  }
;  Send,{Rshift Up}
;  Return




;;;;;;;;;;;;;;;;;;;;;;;;;;;;like mac start;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	capslock::
	KeyWait, capslock
	if A_TimeSinceThisHotkey >= 250 ; in milliseconds.
	SetCapsLockState % !GetKeyState("CapsLock", "T")
	else
	Send, {vk15sc1F2}
	return
	
	;LAlt::LCtrl
	
	#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
	; #Warn  ; Enable warnings to assist with detecting common errors.
	SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
	SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
	$!c::
		Send {Ctrl Down}{c}{Ctrl Up}
	Return
	$!v::
		Send {Ctrl Down}{v}{Ctrl Up}
	Return
	$!w::
		Send {Ctrl Down}{w}{Ctrl Up}
	Return
	$!q::
		Send {Ctrl Down}{F4}{Ctrl Up}
	Return
	$!t::
		Send {Ctrl Down}{t}{Ctrl Up}
	Return
	$!s::
		Send {Ctrl Down}{s}{Ctrl Up}
	Return
	$!l::
		Send {Ctrl Down}{l}{Ctrl Up}
	Return
	$!z::
		Send {Ctrl Down}{z}{Ctrl Up}
	Return
	$!x::
		Send {Ctrl Down}{x}{Ctrl Up}
	Return
	$!a::
		Send {Ctrl Down}{a}{Ctrl Up}
	Return
	$!f::
		Send {Ctrl Down}{f}{Ctrl Up}
	Return
	$!n::
		Send {Ctrl Down}{n}{Ctrl Up}
	Return
	$!e::
		Send {Ctrl Down}{e}{Ctrl Up}
	Return
	$!,::
		Send {Ctrl Down}{,}{Ctrl Up}
	Return

	$!Left::
		Send {Home}
	Return
	$!Right::
		Send {End}
	Return
	
	$!+Left::
		Send {Shift Down}{Home}{Shift Up}
	Return
	$!+Right::
		Send {Shift Down}{End}{Shift Up}
	Return
	
	$!+Up::
		Send {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
	Return
	$!+Down::
		Send {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}
	Return
	
	$!Home::
		Send {Ctrl Down}{Home}{Ctrl Up}
	Return
	$!End::
		Send {Ctrl Down}{End}{Ctrl Up}
	Return
	$!+Home::
		Send {Ctrl Down}{Shift Down}{Home}{Shift Up}{Ctrl Up}
	Return
	$!+End::
		Send {Ctrl Down}{Shift Down}{End}{Shift Up}{Ctrl Up}
	Return
	
	$!+=::
		Send {Ctrl Down}{Shift Down}{=}{Shift Up}{Ctrl Up}
	Return
	$!+-::
		Send {Ctrl Down}{Shift Down}{-}{Shift Up}{Ctrl Up}
	Return
	
	
	
	$#Left::
		Send {Ctrl Down}{Left}{Ctrl Up}
	Return
	$#Right::
		Send {Ctrl Down}{Right}{Ctrl Up}
	Return
	$#+Left::
		Send {Ctrl Down}{Shift Down}{Left}{Shift Up}{Ctrl Up}
	Return
	$#+Right::
		Send {Ctrl Down}{Shift Down}{Right}{Shift Up}{Ctrl Up}
	Return
	
	$#Up::
		Send {Alt Down}{Up}{Alt Up}
	Return
	$#Down::
		Send {Alt Down}{Down}{Alt Up}
	Return
	
	$#BackSpace::
		Send {Ctrl Down}{BackSpace}{Ctrl Up}
	Return
	
	$^p::
		Send {Up}
	Return
	$^n::
		Send {Down}
	Return
	$^f::
		Send {right}
	Return
	$^b::
		Send {left}
	Return
	$^e::
		Send {End}
	Return
	$^a::
		Send {Home}
	Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;like mac end;;;;;;;;;;;;;;;;;;;;;;;;;;;;
