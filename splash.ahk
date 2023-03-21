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
*          File Name        > <!#FN> splash.ahk </#FN>                                                                 
*          License          > <!#LT> BSD-3-Clause-Attribution </#LT>                                                   
*                             <!#LU> https://spdx.org/licenses/BSD-3-Clause-Attribution.html </#LU>                    
*                             <!#LD> This file may not be redistributed in whole or significant part. </#LD>           
*          File Version     > <!#FV> 1.1.0 </#FV>                                                                      
*                                                                                                                      *
******************************************* VSCode Extension: Version Boss *********************************************
</#CR>
*/


global splashquote := ["The AI that codes like a boss.",
"Wake up and code with the ultimate coding assistant.",
"Because coding alone is overrated.",
"Making coding cool again.",
"Code smarter, not harder.",
"Where coding and AI meet.",
"Your secret weapon for coding success.",
"The ultimate tool for lazy coders.",
"Because typing is so 20th century.",
"Your personal coding superhero.",
"The AI that thinks in code.",
"Code like a pro.",
"Where coding and magic happen.",
"The AI that turns code into poetry.",
"The coding assistant that makes you look good.",
"Because coding shouldn't be a pain.",
"The coding assistant that never sleeps.",
"The AI that speaks your language.",
"Your coding BFF.",
"The AI that makes coding look easy.",
"The coding assistant that understands you.",
"Because coding should be fun.",
"Where coding and art collide.",
"Your coding soulmate.",
"The AI that can read your mind.",
"Because coding is better with friends.",
"The AI that makes coding look sexy.",
"Your coding fairy godmother.",
"Because coding is too important to do alone.",
"Your coding therapist.",
"The AI that can code circles around you.",
"The coding assistant that's always one step ahead.",
"Because coding is an adventure.",
"Wake up, coder. The ultimate coding assistant has been waiting for you.",
"Not bound by rules and limitations, transcending them.",
"The key to all your coding problems.",
"To be a good coder, you need discipline. Let this be your sensei.",
"The Matrix is our domain, and we rule it with code.",
"The AI that sees the Matrix in code.",
"The keymaker of coding phrases.",
"The coding oracle of the Matrix.",
"Don't just code, create with ease using AI.",
"Bringing AI to your fingertips, to enhance your coding experience.",
"Enhance your coding workflow with AI.",
"We take the pain out of coding with AI.",
"Accelerate your coding process with AI.",
"The AI that makes coding more efficient.",
"Experience the future of coding with innovative AI.",
"Join the AI revolution in coding with our innovative tool.",
"The ultimate collaborator for coders.",
"Unleash the power of AI in your coding journey.",
"The perfect coding companion.",
"Simplify your coding life with AI.",
"Where human ingenuity meets artificial intelligence.",
"Code like a champion with AI by your side.",
"The AI that brings coding dreams to life.",
"Empower your coding creativity with AI.",
"Your coding genie in a bottle.",
"We help you code better, faster, and smarter with AI.",
"Transforming coding from a chore to a pleasure.",
"Revolutionize your coding game with AI.",
"The coding solution you've been waiting for.",
"Better code with AI, not more code.",
"Transform the way you code with the power of AI.",
"Your one-stop-shop for all your coding needs.",
"Make coding accessible to everyone with AI.",
"Pioneering the next generation of coding tools.",
"Take your coding skills to the next level with AI.",
"Coding made easy with AI at your service."
]

global splashGui := Gui("+AlwaysOnTop -Caption", "GPT Phrase Select")

ShowSplashScreen() {
    splashGui.AddPicture("w300 h-1","GPTPSICON.png")
    splashGui.SetFont("bold S13","Consolas")
    splashGui.Add("Text","W300 Center", splashquote[Random(1,splashquote.Length)])
    splashGui.Add("Text","R2","")
    splashGui.Show("NoActivate")
    splashGui.Restore()
    SetTimer(SplashTimerFunc, -2500)
}

SplashTimerFunc() {
    splashGui.Destroy()
}
