I_Icon=C:\Users\ASUS\Pictures\Saved Pictures\segger.png
IfExist, %I_Icon%
Menu, Tray, Icon, %I_Icon%

#Persistent
SetTimer, Alert1, 500
return

Alert1:
ControlClick, x694 y150, J-Link V6.98c Warning
return