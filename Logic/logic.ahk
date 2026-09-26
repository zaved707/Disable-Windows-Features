#Requires AutoHotkey v2.0

#Include ..\data\fileOperations.ahk

handleDisableSearchButtonPress(TargetPath, *) {
    ; TargetPath := "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
    fileOperations.takeOwnerShip(TargetPath)
    ; getFileName
    FileName := fileOperations.getFileName(TargetPath)
    ; close the process
    fileOperations.closeProcess(FileName)
    ; rename the file
    fileOperations.renameFileWithBakPostFix(TargetPath)
    ; MsgBox("hi")
}
