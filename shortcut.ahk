#IfWinActive ahk_exe cmd.exe
::e2cmd::"D:\CSR_uEnergy_SDK-2.6.1.7\tools\bin\e2cmd.exe"
::commander::"G:\SiliconLabs\SimplicityStudio\v5\developer\adapter_packs\commander\commander.exe"
#IfWinActive


::~~date::
FormatTime, CurrentDateTime,, yyyy-MM-dd hh:mm:ss
SendInput %CurrentDateTime%
return