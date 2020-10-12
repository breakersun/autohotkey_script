
#IfWinActive ahk_exe emStudio.exe
XButton1::Send {Alt down}{Left}{Alt up}
XButton2::Send {Alt down}{Right}{Alt up}
#IfWinActive

#IfWinActive ahk_exe FoxitReader.exe
XButton1::Send {Alt down}{Left}{Alt up}
XButton2::Send {Alt down}{Right}{Alt up}
#IfWinActive

#IfWinActive ahk_exe stvdebug.exe
XButton1::Send {Ctrl down}{Shift down}{Tab down}{Tab up}{Ctrl up}{Shift up}
XButton2::Send {Ctrl down}{Tab down}{Tab up}{Ctrl up}
#IfWinActive ahk_exe stvdebug.exe