#IfWinActive ahk_exe cmd.exe
::e2cmd::"D:\CSR_uEnergy_SDK-2.6.1.7\tools\bin\e2cmd.exe"
::commander::"G:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\commander\commander.exe"
#IfWinActive

::~~date::
Send, %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%

; ^0::
; clipboard = %A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%
