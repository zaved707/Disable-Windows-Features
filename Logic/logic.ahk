#Requires AutoHotkey v2.0

#Include ..\data\fileOperations.ahk

class logic {
    static getItemStatus(targetPath) {
        if  FileExist(targetPath){
            return 1
        }
        else if FileExist(targetPath ".bak"){
            return 0
        }
        else return -1
    }
    
    static setUpCheckbox(checkbox,targetPath){
        status := logic.getItemStatus(targetPath)
        checkbox.Value := status
        checkbox.Enabled := status != -1

    }
    static disableExe(targetPath) {
        ; targetPath := "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
        fileOperations.takeOwnerShip(targetPath)
        ; getFileName
        FileName := fileOperations.getFileName(targetPath)
        ; close the process
        fileOperations.closeProcess(FileName)
        ; rename the file
        fileOperations.renameFileWithBakPostFix(targetPath)
        
        
    }
    static enableExe(targetPath){
        fileOperations.takeOwnerShip(targetPath ".bak")
        fileOperations.removeBakPostFix(targetPath)
    }
}
