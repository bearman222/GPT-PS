; File: gptPS.ahk
; Description: This file contains the main script for the GPT Phrase Selector application, which creates a GUI to manage categories and listboxes and includes event handlers for user interactions.
; Author: B. Eskind

#SingleInstance Force
#Include splash.ahk
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk

global myGui, myGuiTabs, tabControl, isListBoxesShown := true

; Initialize the application with dependencies
Initialize(categories) {
    global myGui, myGuiTabs, tabControl, isListBoxesShown := true
    ShowSplashScreen()
    ; Delay the execution of OpenOrShowPhraseSelector() until the splash screen disappears
    SetTimer OpenOrShowPhraseSelector, -2500
}

; Open or show the Phrase Selector GUI
OpenOrShowPhraseSelector() {
    global myGui, isListBoxesShown

    ; Create a new GUI instance
    CreatePhraseSelectorGui(categories)

    ; Show the GUI, set focus and enable the Escape and Enter hotkeys
    myGui.Show("AutoSize")
    SetFocusToActiveListBox()
    EnableHotkeys("On")

    ; Set the flag to indicate that the ListBox is shown
    isListBoxesShown := true
}

; Create the GUI with the tab control and tabs
CreatePhraseSelectorGui(categories) {
    global myGui, myGuiTabs, tabControl
    keycat := []
    for key in categories {
        keycat.Push(key)
    }

    ; Create the GUI instance
    myGui := Gui("+AlwaysOnTop", "GPT Phrase Select")
    myGui.SetFont("S12")

    ; Add the tab control and tabs to the GUI
    myGuiTabs := []
    tabControl := myGui.Add("Tab3", , keycat)
    for key, value in categories {
        tabControl.UseTab(key)
        newTab := CategoryTab(myGui, value)
        myGuiTabs.Push(newTab)
    }
}

; Toggle the GUI
TogglePhraseSelector() {
    global isListBoxesShown
    if (!isListBoxesShown) { 
        OpenOrShowPhraseSelector()
    } else {
        ClosePhraseSelector()
    }
}

; Close the GUI and disable the Escape and Enter hotkeys
ClosePhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Hide()
    ; Disable the Escape and Enter hotkeys
    EnableHotkeys("Off")
    isListBoxesShown := false
}

; Set the focus to the ListBox of the active tab
SetFocusToActiveListBox() {
    global myGuiTabs, tabControl
    activeTabIndex := tabControl.Value
    activeTab := myGuiTabs[activeTabIndex]
    activeTab.listBox.Focus()
}

; Close event handler
myGui_Close() {
    ; Disable the Escape and Enter hotkeys
    EnableHotkeys('Off')

    ; Show a confirmation prompt
    result := MsgBox("Are you sure you want to close GPT Phrase Select?",, "y/n")

    ; If the user selects "No", show the GUI again and do not exit the script
    if (result = "No") {
        OpenOrShowPhraseSelector()
        return true  ; true = 1
    }

    ; Close the GUI and exit the script if the user selects "Yes"
    ClosePhraseSelector()
    ExitApp
}

PressEnter() {
    global myGuiTabs, tabControl
    activeTabIndex := tabControl.Value
    activeTab := myGuiTabs[activeTabIndex]
    activeTab.OnEnterPress()
}

EnableHotkeys(state := "On") {
    if (state != "On" && state != "Off") {
        MsgBox("Invalid parameter. Use 'On' or 'Off'.")
        return
    }
    ; Enable or disable the Escape and Enter hotkeys based on the state parameter
    Hotkey "Esc", state
    Hotkey "Enter", state
}

Initialize(categories)