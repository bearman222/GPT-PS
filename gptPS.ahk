; File: gptPS.ahk
; Description: This file contains the main script for the GPT Phrase Selector application, which creates a GUI to manage categories and listboxes and includes event handlers for user interactions.
; Author: B. Eskind

#SingleInstance Force
#Include splash.ahk
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk
; #Include ListBoxEventHandlers.ahk

; Creates a GUI
global myGui := Gui("+AlwaysOnTop", "GPT Phrase Select")
myGui.SetFont("S11")
global myGuiTabs := []

keycat := []
for key in categories {
    keycat.Push(key)
}

global tabControl := myGui.Add("Tab3", , keycat)

; Add the new tabs to the GUI
for key, value in categories {
    tabControl.UseTab(key)
    newTab := CategoryTab(myGui, value)
    myGuiTabs.Push(newTab) ; Updated to use Push()
}

global isListBoxesShown := false

; Show the GUI and enable the Escape and Enter hotkeys
ShowPhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Show("AutoSize")
    ; Enable the Escape and Enter hotkeys when the window is shown
    Hotkey "Esc", "On"
    Hotkey "Enter", "On"
    isListBoxesShown := true
}

; Close the GUI and disable the Escape and Enter hotkeys
ClosePhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Minimize()
    ; Disable the Escape and Enter hotkeys when the window is closed
    Hotkey "Esc", "Off"
    Hotkey "Enter", "Off"
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

PressEnter() {
    global myGuiTabs, tabControl
    activeTabIndex := tabControl.Value
    activeTab := myGuiTabs[activeTabIndex]
    activeTab.OnEnterPress()
}
