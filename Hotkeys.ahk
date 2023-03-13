; File: Hotkeys.ahk
; Description: This script defines hotkeys for a GUI that lets users select phrases, and toggles the GUI with Ctrl+Shift+L.
; Author: B. Eskind
; Date: March 10, 2023

#Include ListBoxEventHandlers.ahk
#Include gptPS.ahk
global isListBoxesShown := false

; Define the hotkeys to toggle the ListBox and submit the selected text
^+l:: {
    global isListBoxesShown
    if (!isListBoxesShown) { 
        ShowPhraseSelector()
        isListBoxesShown := true
    } else {
        isListBoxesShown := false
    }
    return
}
