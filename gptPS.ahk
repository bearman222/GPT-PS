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

; show the gui
ShowPhraseSelector() {
    global myGui
    myGui.Show("AutoSize")
}

