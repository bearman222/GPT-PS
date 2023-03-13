#SingleInstance Force
#Include categories.ahk
#Include Hotkeys.ahk
#Include CategoryTab.ahk
#Include ListBoxEventHandlers.ahk

; creates a gui
global myGui := Gui("+AlwaysOnTop", "GPT Phrase Select")
myGui.SetFont ("S12")
global myGuiTabs := []

keycat := []
for key in categories {
    keycat.InsertAt(0,key)
    ; MsgBox (key)
}

tabControl := myGui.Add("Tab3",  , keycat)

; loop through the categories dictionary
for key, value in categories {
    tabControl.UseTab(key)
    ; add a new tab to the gui
    ; listBox := myGui.Add("ListBox","R20 W400",value)
    newTab := CategoryTab(myGui, value,  key)
    myGuiTabs.push(newTab)

}

; show the gui
ShowPhraseSelector() {
    global myGui
    myGui.Show("AutoSize")
}

ShowPhraseSelector()
