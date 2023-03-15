#SingleInstance Force
#Include splash.ahk
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk
#Include ListBoxEventHandlers.ahk

; creates a gui
global myGui := Gui("+AlwaysOnTop", "GPT Phrase Select")
myGui.SetFont ("S11")
global myGuiTabs := []

keycat := []
for key in categories {
    keycat.InsertAt(0,key)
}

tabControl := myGui.Add("Tab3",  , keycat)

    ; add the new tabs to the gui
    for key, value in categories {
    tabControl.UseTab(key)
    newTab := CategoryTab(myGui, value,  key)
    myGuiTabs.push(newTab)
}

global isListBoxesShown := false

; Show the GUI and enable the Escape hotkey
ShowPhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Show("AutoSize")
    ; Enable the Escape hotkey when the window is shown
    Hotkey "Esc", "On"
    isListBoxesShown := true
}

; Close the GUI and disable the Escape hotkey
ClosePhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Minimize()
    ; Disable the Escape hotkey when the window is closed
    Hotkey "Esc", "Off"
    isListBoxesShown := false
}

; Toggle the GUI
TogglePhraseSelector() {
    global isListBoxesShown
    if (!isListBoxesShown) { 
        ShowPhraseSelector()
    } else {
        ClosePhraseSelector()
    }
}