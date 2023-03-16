global splashquote := ["GPT PS: the AI that codes like a boss.",
                "Wake up and code with GPT PS.",
                "GPT PS: the coding assistant of your dreams.",
                "GPT PS: your coding genie in a bottle.",
                "GPT PS: because coding alone is overrated.",
                "GPT PS: making coding cool again.",
                "Code smarter, not harder with GPT PS.",
                "GPT PS: where coding and AI meet.",
                "GPT PS: your secret weapon for coding success.",
                "GPT PS: the ultimate tool for lazy coders.",
                "GPT PS: because typing is so 20th century.",
                "GPT PS: your personal coding superhero.",
                "GPT PS: the AI that thinks in code.",
                "Code like a pro with GPT PS.",
                "GPT PS: where coding and magic happen.",
                "GPT PS: the AI that turns code into poetry.",
                "GPT PS: the coding assistant that makes you look good.",
                "GPT PS: because coding shouldn't be a pain.",
                "GPT PS: the coding assistant that never sleeps.",
                "GPT PS: the AI that speaks your language.",
                "GPT PS: your coding BFF.",
                "GPT PS: the AI that makes coding look easy.",
                "GPT PS: the coding assistant that understands you.",
                "GPT PS: because coding should be fun.",
                "GPT PS: where coding and art collide.",
                "GPT PS: your coding soulmate.",
                "GPT PS: the AI that can read your mind.",
                "GPT PS: because coding is better with friends.",
                "GPT PS: the AI that makes coding look sexy.",
                "GPT PS: your coding fairy godmother.",
                "GPT PS: because coding is too important to do alone.",
                "GPT PS: your coding therapist.",
                "GPT PS: the AI that can code circles around you.",
                "GPT PS: the coding assistant that's always one step ahead.",
                "GPT PS: because coding is an adventure.",
                "Wake up, coder. GPT PS has been waiting for you.",
                "GPT PS is not bound by rules and limitations, it transcends them.",
                "GPT PS is the key, Neo. It's the solution to all your coding problems.",
                "To be a good coder, you need discipline. Let GPT PS be your sensei.",
                "GPT PS: the Matrix is our domain, and we rule it with code.",
                "GPT PS: the AI that sees the Matrix in code.",
                "GPT PS: the keymaker of coding phrases.",
                "GPT PS: the coding oracle of the Matrix.",
            ]

global splashGui := Gui("+AlwaysOnTop -Caption", "GPT Phrase Select")

ShowSplashScreen(message, duration) {
    splashGui.AddPicture("w300 h-1","GPTPSICON.png")
    splashGui.SetFont("bold S13","Consolas")
    splashGui.Add("Text","W300 Center", message)
    splashGui.Add("Text","R2","")
    splashGui.Show("NoActivate")
    splashGui.Restore()
    SetTimer(SplashTimerFunc, duration*1000)
}

SplashTimerFunc() {
    splashGui.Destroy()
}

ShowSplashScreen(splashquote[Random(1,splashquote.Length)], 2)
