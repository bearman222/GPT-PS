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
*          File Version     > <!#FV> 1.1.1 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

#SingleInstance Force
#Include splash.ahk
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk
Persistent
OnExit ExitHandler ; register the function with the OnExit command

ExitHandler(ExitReason, ExitCode) {
    ; MsgBox("Script is exiting. Reason: " . ExitReason . ", Code: " . ExitCode)
    EnableHotkeys("Off")
}

global myGui, myGuiTabs, tabControl, isListBoxesShown := false


; Initialize the application with dependencies
Initialize(categories) {
    EnableHotkeys("Off")
    ShowSplashScreen()
    ; Delay the execution of OpenOrShowPhraseSelector() until the splash screen disappears
    SetTimer OpenOrShowPhraseSelector, -2500
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
    ; Register the Close event handler for the GUI
    myGui.OnEvent("Close", GuiClose)
    myGui.onevent('size', gui_size)
}


; Open or show the Phrase Selector GUI
OpenOrShowPhraseSelector() {
    global myGui, isListBoxesShown

    ; Create a new GUI instance
    CreatePhraseSelectorGui(categories)

    ; Show the GUI, set focus and enable the Escape and Enter hotkeys
    myGui.Show("Restore")
    isListBoxesShown := true
    SetFocusToActiveListBox()
    EnableHotkeys("On")
}


; Close the Phrase Selector GUI
ClosePhraseSelector() {
    global myGui, isListBoxesShown
    myGui.Show("Hide")
    isListBoxesShown := false
    EnableHotkeys("Off")

}


; Toggle the phrase selector GUI
TogglePhraseSelector() {
    global isListBoxesShown
    if (!isListBoxesShown) {
        OpenOrShowPhraseSelector()
    } else {
        ClosePhraseSelector()
    }
}


; GUI Event handler for minimize, maximize, change size event
Gui_Size(GuiObj, MinMax, Width, Height) {
    ; interrupt other threads to ensure the resize event is handled correctly
    Critical "Off"
    Sleep -1
    if (MinMax == -1) {
        ClosePhraseSelector()
    }
}


; Terminate gptPS Script and close
GuiClose(thisGui) {
    ; Hide the gui window so it doesn't block the msgbox due to z-order
    ClosePhraseSelector()
    ; Show a confirmation prompt before closing the GUI
    if (MsgBox("Are you sure you want to close GPT Phrase Select?","Close gptPS?", "y/n 0x40000") = "No") {
        ; If the user selects "No", cancel the close event and show the GUI again
        thisGui.CancelClose := true
        OpenOrShowPhraseSelector()
        return true  ; true = 1
    }
    ; The user selected to close the app
    ExitApp
}


; Set the focus to the ListBox of the active tab
SetFocusToActiveListBox() {
    global myGuiTabs, tabControl
    activeTabIndex := tabControl.Value
    activeTab := myGuiTabs[activeTabIndex]
    activeTab.listBox.Focus()
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
