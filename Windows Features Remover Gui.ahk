#Requires AutoHotkey v2.0
if !A_IsAdmin {
    Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"')
    ExitApp()
}
allFeatures := [
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe",
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe",
    "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe"
]

myGui := Gui("", "Windows Features Remover")
myGui.Add("Text" ,"w250" , "hello")
disableSearchButton := myGui.Add("Button" , " ", "Disable Search Host")
disableSearchButton.OnEvent("Click", handleDisableSearchButtonPress)

takeOwnerShip(TargetPath){
    RunWait('powershell.exe -WindowStyle Hidden -Command "takeown /f \"' TargetPath '\" `; icacls \"' TargetPath '\" /grant:r ${env:username}:F"', , "")
    MsgBox("Donee")

}
handleDisableSearchButtonPress(*){
    TargetPath := "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
    takeOwnerShip(TargetPath)
    ; getFileName
    SplitPath TargetPath , &FileName
    ; close the process
    ProcessClose FileName
    ; rename the file
    FileMove TargetPath, TargetPath . ".bak" , 1
    MsgBox("hi")
}

myGui.Show()