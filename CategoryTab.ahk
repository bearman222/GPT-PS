#Include gptPS.ahk
#Include ListBoxEventHandlers.ahk

class CategoryTab {
    __New(parentGui, selectedCategory, tabIndex) {
        items := selectedCategory.Clone()
        this.listBox := parentGui.Add("ListBox","R" . selectedCategory.Length . " W400", items)
        this.handlers := ListBoxEventHandlers(this.listBox)
        this.selectedIndex := -1
        return this
    }

}
