Set WshShell = WScript.CreateObject("WScript.Shell")

URL = "<display URL>"

' Wait 30 seconds to let computer load
WScript.Sleep 30000

Do

    ' Check whether the Flight Monitoring Edge window already exists
    If WshShell.AppActivate("<tab title>") Then

        ' Edge is already open - use the existing tab
        WScript.Sleep 1000

        WshShell.SendKeys "^l"
        WScript.Sleep 500

        WshShell.SendKeys URL
        WScript.Sleep 500

        WshShell.SendKeys "{ENTER}"

    Else

        ' Edge is not open - launch it with the saved SmartBag URL
        WshShell.Run "microsoft-edge:" & URL, 1, False

    End If

    ' Wait 15 seconds for the saved table/search to load
    WScript.Sleep 15000

    ' Press Down Arrow nine times
    For i = 1 To 9
        WshShell.SendKeys "{DOWN}"
        WScript.Sleep 2000
    Next

    ' Wait approximately 5 minutes
    WScript.Sleep 287000

Loop
