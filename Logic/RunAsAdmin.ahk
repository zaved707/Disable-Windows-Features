#Requires AutoHotkey v2.0

if !A_IsAdmin {
    Run('*RunAs "' A_AhkPath '" /restart "' A_ScriptFullPath '"')
    ExitApp()
}