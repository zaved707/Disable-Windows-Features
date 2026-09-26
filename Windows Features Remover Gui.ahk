#Requires AutoHotkey v2.0

takeOwnerShip(TargetPath){
    RunWait('powershell.exe -WindowStyle Hidden -Command "takeown /f \"' TargetPath '\" `; icacls \"' TargetPath '\" /grant:r ${env:username}:F"', , "Hide")
    ; MsgBox("Donee")

}
getFileName(path){
    SplitPath path, &FileName
    return FileName
}
handleDisableSearchButtonPress(TargetPath , *){
    ; TargetPath := "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
    takeOwnerShip(TargetPath)
    ; getFileName
    SplitPath TargetPath , &FileName
    ; close the process
    ProcessClose FileName
    ; rename the file
    FileMove TargetPath, TargetPath . ".bak" , 1
    ; MsgBox("hi")
}
if !A_IsAdmin {
    Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"')
    ExitApp()
}
allFeatures := [
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe",
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe",
    "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe",
    "D:\Desktop\deadman.txt"
]
myGui := Gui("", "Windows Features Remover")
myGui.Add("Text" ,"w250" , "Select function")
for index,item in allFeatures{
    fileName := getFileName(item)
    ; myGui.Add("Text" , " " , fileName)
    Button := myGui.Add("Button" , " ", fileName )
    Button.OnEvent("Click", handleDisableSearchButtonPress.Bind(item))
}


; disableSearchButton := myGui.Add("Button" , " ", "Disable Search Host")
; disableSearchButton.OnEvent("Click", handleDisableSearchButtonPress)

myGui.Show()