#Requires AutoHotkey v2.0

#Include Logic\logic.ahk
#Include Logic\RunAsAdmin.ahk


allFeatures := [
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe",
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe",
    "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe",
    "D:\Desktop\deadman.txt"
]
myGui := Gui("", "Windows Features Remover")
myGui.Add("Text" ,"w250" , "Select function")
for index,item in allFeatures{
    fileName := fileOperations.getFileName(item)
    ; myGui.Add("Text" , " " , fileName)
    Button := myGui.Add("Button" , " ", fileName )
    Button.OnEvent("Click", handleDisableSearchButtonPress.Bind(item))
}


; disableSearchButton := myGui.Add("Button" , " ", "Disable Search Host")
; disableSearchButton.OnEvent("Click", handleDisableSearchButtonPress)

myGui.Show()