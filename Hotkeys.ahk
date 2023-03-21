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
*          File Name        > <!#FN> Hotkeys.ahk </#FN>                                                                
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 1.1.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/

#Include gptPS.ahk

; Define the hotkeys to toggle the ListBox
^+l::TogglePhraseSelector()
Esc::ClosePhraseSelector()
Enter::PressEnter()