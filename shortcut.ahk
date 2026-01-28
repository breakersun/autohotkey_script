
::;date::
FormatTime, CurrentDateTime,, yyyy-MM-dd hh:mm:ss
SendInput %CurrentDateTime%
return

::;ip::
SendInput, %A_IPAddress1%`n%A_IPAddress2%
return

::;br::
SendInput Best Regards.`nLeo Sun
return
