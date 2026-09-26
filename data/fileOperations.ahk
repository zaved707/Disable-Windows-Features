#Requires AutoHotkey v2.0

class fileOperations {
    static takeOwnerShip(TargetPath) {
        RunWait('powershell.exe -WindowStyle Hidden -Command "takeown /f \"' TargetPath '\" `; icacls \"' TargetPath '\" /grant:r ${env:username}:F"', ,
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
    static renameFileWithBakPostFix(Targetpath){
        FileMove TargetPath, TargetPath . ".bak", 1

    }

}