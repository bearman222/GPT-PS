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
*          File Name        > <!#FN> CategoryTab.ahk </#FN>                                                            
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 1.1.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/


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
