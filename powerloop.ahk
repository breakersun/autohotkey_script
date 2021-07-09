#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

led_rounds := 0
buzz_rounds := 0

Gui, Main:New
Gui, Add, Text,, COM Number
Gui, Add, Edit, vCOMx
Gui, Add, Text,, Buzzer
Gui, Add, DropDownList, vBuzzChoice, Yes||No
Gui, Add, Text, vLedStatus, LEDs Off XXXXXXXX
Gui, Add, Text, vBuzzStatus, Buzz Off XXXXXXXX
Gui, Add, Button, Default gStart, Start
Gui, Add, Button, gStop, Stop
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
    Gui, Submit, NoHide
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

Stop:
    goto led_off
    SetTimer, led_on, off
    goto buzz
    return



led_on:
    led_rounds += 1
    RunWait, %ComSpec% /c dtest.exe %COMx% setled on 11111 0 0 64 64, ,Hide
    SetTimer, led_on, off
    SetTimer, led_off, 20000
    GuiControl, Main: , LedStatus, % "LEDs On " led_rounds
    return

led_off:
    RunWait, %ComSpec% /c dtest.exe %COMx% setled off, ,Hide
    SetTimer, led_off, off
    SetTimer, led_on, 60000
    GuiControl, Main: , LedStatus, % "LEDs Off " led_rounds
    return

; buzz only works for 10 seconds at 90% duty cycle with below commands
buzz:
    buzz_rounds += 1
    RunWait, %ComSpec% /c dtest.exe %COMx% motor_ctl 10 90, ,Hide
    SetTimer, update_buzz_status, 10000
    GuiControl, Main: , BuzzStatus, % "Buzz On " buzz_rounds
    return

update_buzz_status:
    GuiControl, Main: , BuzzStatus, % "Buzz Off " buzz_rounds
    SetTimer, update_buzz_status, off
    return

com_fail:
    MsgBox, , , dtest error; please check UART & DUT,
    ExitApp
    return

