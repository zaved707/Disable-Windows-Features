#Requires AutoHotkey v2.0

class fileOperations {
    static takeOwnerShip(targetPath) {
        RunWait('powershell.exe -WindowStyle Hidden -Command "takeown /f \"' targetPath '\" `; icacls \"' targetPath '\" /grant:r ${env:username}:F"', ,
            "Hide")
        ; MsgBox("Donee")

    }
    static getFileName(path) {
        SplitPath path, &FileName
        return FileName
    }
    static closeProcess(path){
        ProcessClose path
    }
    static renameFileWithBakPostFix(targetPath){
        FileMove targetPath, targetPath . ".bak", 1

    }
    static removeBakPostFix(targetPath){
        FileMove targetPath ".bak",targetPath
    }


}