global splashquote := ["The AI that codes like a boss.",
"Wake up and code with the ultimate coding assistant.",
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
