; File: ListBoxEventHandlers.ahk
; Description: This file defines a class that adds event handlers for a ListBox control to submit the selected text to the clipboard and parent GUI.
; Author: B. Eskind
; Date: March 10, 2023

class ListBoxEventHandlers {
    ; Constructor that takes in a ListBox control and adds the event handlers.
    __New(listBox) {
    ; Store a reference to the ListBox control.
    this.listBox := listBox
    ; Add the OnSelChange event handler, which is triggered when a different item is selected in the ListBox.
    this.listBox.OnEvent("Change", this.SubmitSelectedItem)
    ; Initialize the selected index to -1.
    this.selectedIndex := -1
    return this
    }

; Event handler for when an item in the ListBox is double-clicked or Enter is pressed.
SubmitSelectedItem(eventInfo) {
    if this.Text = "" {
        ; MsgBox ("nothing selected")
    } else {
        A_Clipboard := this.Text
        ; Get a reference to the parent Gui of the ListBox control.
        GuiObj  := this.Gui
        ; Submit the parent Gui of the ListBox control.
        GuiObj.Submit()
        ; Wait for 1 second.
        Sleep 1000
        ; Send a Ctrl+V command to paste the selected text.
        Send("{Ctrl Down}v{Ctrl Up}")

        }
    }
}