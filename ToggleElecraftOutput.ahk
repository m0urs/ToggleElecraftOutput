;###################################################################################
; Toggles "Dieses Gerät als Wiedergabequelle verwenden" for a certain device
;
; This autohotkey script toggles the setting "Dieses Gerät als Wiedergabequelle
; verwenden" for the sound device where my Elecraft KX2 transceivers output is
; connected.
;
; I am using this script to switch on and off the forwarding of the transceiver 
; output to my USB headset cvonnected to my PC.
;
; I am using an autohotkey script because I did not find any other possibility
; to change this setting.
;
; Caution: You need to adapt the keystrokes to your environment, so please use the
; script only as an example!
;
; To compile that script to an EXE file use "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
;
; Creator:  Michael Urspringer (DG3NAB)
; Version:  1.1c
;###################################################################################

; Function to get the currently selected text
GetSelectedText() {
    tmp = %ClipboardAll% ; save clipboard
    Clipboard := "" ; clear clipboard
    Send, ^c ; simulate Ctrl+C (=selection in clipboard)
    ClipWait, 0, 1 ; wait until clipboard contains data
    selection = %Clipboard% ; save the content of the clipboard
    Clipboard = %tmp% ; restore old content of the clipboard
    return selection
    }

; The device name of the device you want to modify later (only used to check if the correct device is selected)
devicename := "Elecraft KX2"

; Open Windows Sound Preferences
Run, mmsys.cpl,,UseErrorLevel,soundpid

; Wait until the window has been opened and make sure it is the active window
WinWait, Sound,,5

if not WinExist("Sound","Wiedergabe") or ErrorLevel
    {
    MsgBox, Sound preferences could not be opened. Script will be aborted.
    Exit, 1
    }
Else
    WinActivate

; Now send the necessary keystrokes to perform the task (needs to be adapted to your environment!):

; Change to tab "Aufnahme"
Send, ^{Tab}
Sleep 200

; Change to device "Elecraft KX2"
Send, {Down}
Sleep 200
Send, {Home}
Sleep 200
Send, {Down}
Sleep 200

; Select this device
Sleep 200
Send, {Space}

; Check if it is the correct device
if (GetSelectedText() != devicename) or ErrorLevel
    {
    MsgBox, Sound preferences could not be opened. Script will be aborted. %result%
    Exit, 1
    }

; Switch to tab "Abhören"
Sleep 200
Send, ^{Tab}

; Toggle the setting "Dieses Gerät als Wiedergabequelle verwenden"
Sleep 200
Send, {Space}

; Confirm Settings and exit sound preference app
Sleep 200
Send, {Enter}
Sleep 200
Send, {Enter}

; Exit script
Exit, 0
