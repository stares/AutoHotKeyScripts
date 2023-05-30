set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") > %SCRIPT%

echo sLinkFile = "C:\\AutoHotKeyScripts\\sc_utility.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\\AutoHotKeyScripts\\utility.ahk" >> %SCRIPT%
echo oLink.WorkingDirectory = "C:\\AutoHotKeyScripts" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo sLinkFile = "C:\\AutoHotKeyScripts\\sc_emacs_autohotkey.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\\AutoHotKeyScripts\\emacs_autohotkey.ahk" >> %SCRIPT%
echo oLink.WorkingDirectory = "C:\\AutoHotKeyScripts" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

echo sLinkFile = "C:\\AutoHotKeyScripts\\sc_go_to_desktops.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "C:\\AutoHotKeyScripts\\VD.ahk-class_VD\\go_to_desktops.ahk" >> %SCRIPT%
echo oLink.WorkingDirectory = "C:\\AutoHotKeyScripts\\VD.ahk-class_VD" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%

copy "C:\\AutoHotKeyScripts\\run_script.bat" "%USERPROFILE%\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup"