#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Gui, New
Gui, Add, Text,, COM Number
Gui, Add, Edit, vCOMx
Gui, Add, Text,, Buzzer
Gui, Add, DropDownList, vBuzzChoice, Yes||No
Gui, Add, Button, Default gStart, Start
Gui, Show
return

Start:
Gui, Submit
MsgBox, , , Test Starting On %COMx%,

RunWait, %ComSpec% /c dtest.exe %COMx% haptic_test run, ,Hide
RunWait, %ComSpec% /c dtest.exe %COMx% charge_control off, ,Hide
RunWait, %ComSpec% /c dtest.exe %COMx% setled off, ,Hide
SetTimer, led_on, 500
if (%BuzzChoice% = "Yes")
{
    SetTimer, buzz, 70000
}
return

led_on:
RunWait, %ComSpec% /c dtest.exe %COMx% setled on 11111 0 0 64 64, ,Hide
SetTimer, led_on, off
SetTimer, led_off, 20000
return

led_off:
RunWait, %ComSpec% /c dtest.exe %COMx% setled off, ,Hide
SetTimer, led_off, off
SetTimer, led_on, 60000
return

; buzz only works for 10 seconds at 90% duty cycle with below commands
buzz:
RunWait, %ComSpec% /c dtest.exe %COMx% motor_ctl 10 90, ,Hide
return

