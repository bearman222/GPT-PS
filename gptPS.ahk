/*
<!#CR>
************************************************************************************************************************
*                                               ByteForge Copyright ©                                                  *
* -------------------------------------------------------------------------------------------------------------------- *
*          Company Name     > ByteForge                                                                                *
*          Company Email    > admin@byteforge.app                                                                      *
*          Company Websites > http://www.byteforge.app                                                                 *
* -------------------------------------------------------------------------------------------------------------------- *
*                                           File and License Informations                                              *
* -------------------------------------------------------------------------------------------------------------------- *
*          File Name        > <!#FN> gptPS.ahk </#FN>                                                                  
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 1.0.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

#SingleInstance Force
#Include splash.ahk
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk

; Creates a GUI
global myGui := Gui("+AlwaysOnTop", "GPT Phrase Select")
myGui.SetFont("S12")
global myGuiTabs := []
myGui.OnEvent("Close", myGui_Close)

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

; Set the focus to the ListBox of the active tab
SetFocusToActiveListBox() {
    global myGuiTabs, tabControl
    activeTabIndex := tabControl.Value
    activeTab := myGuiTabs[activeTabIndex]
    activeTab.listBox.Focus()
}

; Close event handler
myGui_Close(thisGui) {
    ; Disable the Escape and Enter hotkeys when the window is closed
    Hotkey "Esc", "Off"
    Hotkey "Enter", "Off"

    ; Hide the GUI temporarily
    thisGui.Hide()

    ; Show a confirmation prompt
    result := MsgBox("Are you sure you want to close GPT Phrase Select?",, "y/n")

    ; If the user selects "No", show the GUI again and do not exit the script
    if (result = "No") {
        thisGui.Show()
        return true  ; true = 1
    }

    ; Exit the script if the user selects "Yes"
    ExitApp
}


; Show the GUI and enable the Escape and Enter hotkeys
ShowPhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Show("AutoSize")
    ; Enable the Escape and Enter hotkeys when the window is shown
    Hotkey "Esc", "On"
    Hotkey "Enter", "On"
    isListBoxesShown := true
    ; Set the focus to the ListBox of the active tab
    SetFocusToActiveListBox()
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
