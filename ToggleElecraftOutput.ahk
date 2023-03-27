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
; Creator:  Michael Urspringer (DG3NAB)
; Version:  1.0
;###################################################################################

; Open Windows Sound Preferences
Run, mmsys.cpl,,UseErrorLevel,soundpid

; Wait until the window has been opened and make sure it is the active window
WinWait ahk_pid %soundpid%,,2

if not WinExist("Sound","Wiedergabe")
    {
    MsgBox, Sound preferences could not be opened. Script will be aborted.
    Exit, 1
    }    

; Now send the necessary keystrokes to perform the task (needs to be adapted to your environment!):

; Change to tab "Aufnahme"
Send, ^{Tab}
Sleep 200

; Change to device "Elecraft KX2 (from TRX)
Send, {Down}
Sleep 200
Send, {Down}
Sleep 200
Send, {Down}

; Select this device
Sleep 200
Send, {Space}

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
