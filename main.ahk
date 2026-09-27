#Requires AutoHotkey v2.0

#Include Logic\logic.ahk
#Include Logic\RunAsAdmin.ahk
#Include gui\functions.ahk


allFeatures := [
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe",
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe",
    "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe",
    "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe",
    ; "D:\Desktop\deadass.txt"
]
myGui := Gui("", "Windows Features Remover")
myGui.SetFont("s14", "Segoe UI")
myGui.Add("Text" ,"w250" , "Select function")
featureControls := []
for index,targetPath in allFeatures{
    status := logic.getItemStatus(targetPath)
    fileName := fileOperations.getFileName(targetPath)
    ; myGui.Add("Text" , " " , fileName)
    checkbox := myGui.Add("Checkbox", "x10 check3 ",fileName)
    logic.setUpCheckbox(checkbox, targetPath)
    checkbox.OnEvent("click", handleCheckmarkClick.Bind(targetPath))
    ; myGui.Add("Text" ,"", checkbox.Value)
    ; Button := myGui.Add("Button" , "yp x+0", fileName )
    ; Button.OnEvent("Click", handleDisableSearchButtonPress.Bind(targetPath))
    featureControls.Push({
        targetPath: targetPath,
        checkbox: checkbox,
    })
}
handleCheckmarkClick(targetPath,checkbox, *){
    ; MsgBox("hiii" targetPath )
    status:= logic.getItemStatus(targetPath)
    checkbox.Value := status
    if (status == 1){
        ; MsgBox("Yes")
        logic.disableExe(targetPath)

    }else if (status == 0){
        logic.enableExe(targetPath)
        
    }
    logic.setUpCheckbox(checkbox,targetPath)
    
}
refreshCheckmarks(){
    for i in featureControls{
        logic.setUpCheckbox(i.checkbox, i.targetPath)
    }

}

; disableSearchButton := myGui.Add("Button" , " ", "Disable Search Host")
; disableSearchButton.OnEvent("Click", handleDisableSearchButtonPress)

myGui.Show()