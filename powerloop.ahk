#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

Gui, New
Gui, Add, Text,, COM Number
Gui, Add, Edit, vCOMx
Gui, Add, Text,, Buzzer
Gui, Add, DropDownList, vBuzzChoice, Yes||No
Gui, Add, Button, Default gStart, Start
Gui, Add, Button, gInfo, Info
Gui, Show
return

Info:
Run, https://portal-useast.labcollab.net/https/issues.labcollab.net/browse/MAGIC-1876
info_text = 
(
    See MAGIC-1876
    The test loop behavior would be like this
    1. turn on five BLUE LEDs for 20 seconds and off for 60 seconds.
    2. turn on the motor for 10 seconds and off for 60 seconds
    3. keep the accelerometer working in the background
    4. keep the BLE advertising working in the background

    The working conditions for all related peripherals:
    - LEDs: duty cycle as 50`%
    - motor: duty cycle as 90`%, and frequency as 20Khz
    - BLE advertising: interval as 1 second, and transmit power as +4dBm
)
msgbox %info_text%
return

Start:
Gui, Submit
MsgBox, , , Test Starting On %COMx%,

SetTimer, com_fail, 20000
RunWait, %ComSpec% /c dtest.exe %COMx% haptic_test run, ,Hide
RunWait, %ComSpec% /c dtest.exe %COMx% charge_control off, ,Hide
RunWait, %ComSpec% /c dtest.exe %COMx% setled off, ,Hide
SetTimer, com_fail, Off

if(BuzzChoice = "Yes")
{
    SetTimer, buzz, 70000
}
SetTimer, led_on, 500
return

led_on:
SplashTextOn, , , Blue LEDs Light On
RunWait, %ComSpec% /c dtest.exe %COMx% setled on 11111 0 0 64 64, ,Hide
SetTimer, led_on, off
SetTimer, led_off, 20000
return

led_off:
SplashTextOn, , , All LEDs Light Off
RunWait, %ComSpec% /c dtest.exe %COMx% setled off, ,Hide
SetTimer, led_off, off
SetTimer, led_on, 60000
return

; buzz only works for 10 seconds at 90% duty cycle with below commands
buzz:
SplashTextOn, , , Buzzing
RunWait, %ComSpec% /c dtest.exe %COMx% motor_ctl 10 90, ,Hide
return

com_fail:
MsgBox, , , dtest error; please check UART & DUT,
ExitApp
return

