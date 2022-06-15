#Persistent
SetCapsLockState, AlwaysOff
; ----------------
; Input method control
; ----------------
; XXX: https://r.nf/smbrx4
SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}
;Capslock & i::^' ; NOTE: ctrl + ' is used to invoke sogouwubi
Capslock & u::SetInputLang(0x0409) ; English
Capslock & space::#space ; toggle input method
; ----------------
; Copy & paste
; ----------------
;Capslock & v::Send {Shift down}{Ins}{Shift up}
;Capslock & c::Send {Ctrl down}{Ins}{Ctrl up}
;Capslock & e::^+!v ; call utools clipboard
; ----------------
; Run taskmrg
; ----------------
;Capslock & m::Run "C:\Windows\system32\taskmgr.exe"
; ----------------
; Reload ahk scripts
; ----------------
Capslock & r::Reload
; ----------------
; Left, Down, Up, Right
; ----------------
Capslock & h::Send {Blind}{Left DownTemp}
Capslock & h up::Send {Blind}{Left Up}
Capslock & j::Send {Blind}{Down DownTemp}
Capslock & j up::Send {Blind}{Down Up}
Capslock & k::Send {Blind}{Up DownTemp}
Capslock & k up::Send {Blind}{Up Up}
Capslock & l::Send {Blind}{Right DownTemp}
Capslock & l up::Send {Blind}{Right Up}
; ----------------
; Home End
; ----------------
Capslock & b::SendInput {Blind}{Home DownTemp}
Capslock & b up::SendInput {Blind}{Home Up}
Capslock & f::SendInput {Blind}{End DownTemp}
Capslock & f up::SendInput {Blind}{End Up}
; ----------------
; PgUp PgDn
; ----------------
Capslock & `;::SendInput {Blind}{PgUp DownTemp}
Capslock & `; up::SendInput {Blind}{PgUp Up}
Capslock & '::SendInput {Blind}{PgDn DownTemp}
Capslock & ' up::SendInput {Blind}{PgDn Up}
; ----------------
; Esc
; ----------------
;Capslock & `::SendInput {Blind}{Esc DownTemp}
;Capslock & ` up::SendInput {Blind}{Esc Up}
;Capslock & Tab::SendInput {Blind}{Esc DownTemp}
;Capslock & Tab up::SendInput {Blind}{Esc Up}
;Capslock & Enter::SendInput {Blind}{Esc DownTemp}
;Capslock & Enter up::SendInput {Blind}{Esc Up}
; ----------------
; BS Del
; ----------------
Capslock & y::SendInput {Blind}{BS DownTemp}
Capslock & y up::SendInput {Blind}{BS Up}
Capslock & d::SendInput {Blind}{Del DownTemp}
Capslock & d up::SendInput {Blind}{Del Up}
Capslock & BS::SendInput {Blind}{Del DownTemp}
Capslock & BS up::SendInput {Blind}{Del Up}
; ----------------
; Capslock toggle
; ----------------
Capslock & Esc::SendInput {Blind}{Capslock DownTemp}
Capslock & Esc up::SendInput {Blind}{Capslock Up}
; ----------------
; Insert
; ----------------
Capslock & \::SendInput {Blind}{Insert DownTemp}
Capslock & \ up::SendInput {Blind}{Insert Up}
; ----------------
; Fn
; ----------------
Capslock & 1::SendInput    {Blind}{F1 DownTemp}
Capslock & 1 up::SendInput {Blind}{F1 Up}
Capslock & 2::SendInput    {Blind}{F2 DownTemp}
Capslock & 2 up::SendInput {Blind}{F2 Up}
Capslock & 3::SendInput    {Blind}{F3 DownTemp}
Capslock & 3 up::SendInput {Blind}{F3 Up}
Capslock & 4::SendInput    {Blind}{F4 DownTemp}
Capslock & 4 up::SendInput {Blind}{F4 Up}
Capslock & 5::SendInput    {Blind}{F5 DownTemp}
Capslock & 5 up::SendInput {Blind}{F5 Up}
Capslock & 6::SendInput    {Blind}{F6 DownTemp}
Capslock & 6 up::SendInput {Blind}{F6 Up}
Capslock & 7::SendInput    {Blind}{F7 DownTemp}
Capslock & 7 up::SendInput {Blind}{F7 Up}
Capslock & 8::SendInput    {Blind}{F8 DownTemp}
Capslock & 8 up::SendInput {Blind}{F8 Up}
Capslock & 9::SendInput    {Blind}{F9 DownTemp}
Capslock & 9 up::SendInput {Blind}{F9 Up}
Capslock & 0::SendInput    {Blind}{F10 DownTemp}
Capslock & 0 up::SendInput {Blind}{F10 Up}
Capslock & -::SendInput    {Blind}{F11 DownTemp}
Capslock & - up::SendInput {Blind}{F11 Up}
Capslock & =::SendInput    {Blind}{F12 DownTemp}
Capslock & = up::SendInput {Blind}{F12 Up}
