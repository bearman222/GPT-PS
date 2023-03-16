; CategoryTab.ahk
#Include gptPS.ahk

class CategoryTab {
    ; Constructor that takes in a parentGui and selectedCategory
    __New(parentGui, selectedCategory) {
        items := selectedCategory.Clone()
        this.listBox := parentGui.Add("ListBox", "R" . selectedCategory.Length . " W480", items)
        this.listBox.OnEvent("DoubleClick", this.OnDoubleClick.Bind(this)) ; Bind 'this' to the method
        this.selectedIndex := -1
        return this
    }

    ; Event handler for when an item in the ListBox is double-clicked
    OnDoubleClick(eventInfo, lbobject) {
        selectedText := this.listBox.Text
        this.SubmitSelectedItem(selectedText)
    }

    ; Event handler for when Enter is pressed
    OnEnterPress() {
        selectedText := this.listBox.Text
        this.SubmitSelectedItem(selectedText)
    }

    ; Submits the selected item text
    SubmitSelectedItem(selectedText) {
        if selectedText = "" {
            ; MsgBox ("nothing selected")
        } else {
            A_Clipboard := selectedText
            ClosePhraseSelector()
            Sleep 1000
            ; Send a Ctrl+V command to paste the selected text
            Send("{Ctrl Down}v{Ctrl Up}")
        }
    }
}
