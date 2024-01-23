
SetTimer, OpenScript, 10 ; Set a timer to check the state every 10 milliseconds
ScriptActive := False ; Initial state is inactive
StartMouseX := 0 ; Global variable to store mouse X position
StartMouseY := 0 ; Global variable to store mouse Y position

Gui, Add, Text, x10 y10 w200 h30, Welcome to Jash's Macro :>
Gui, Add, Text, x10 y25 w200 h30, Make sure you have watched the tutorial on how to set up the macro!
Gui, Add, Text, x10 y40 w200 h30, Also make sure you have full Hunger before starting the macro!
Gui, Add, Text, x10 y55 w200 h30, Controls:
Gui, Add, Text, x10 y70 w200 h30, K = Start Macro
Gui, Add, Text, x10 y85 w200 h30, L = Exit Macro
Gui, Add, Text, x10 y100 w200 h30, P = Pause Macro (Doesn't work)
Gui, Show, x245 y700 w300 h115, Jash's Pull Up Macro


OpenScript:
     
    SetTitleMatchMode, 2 ; Match any part of the title
    WinActivate, % "ahk_id " Roblox ; Bring the Roblox window to the front
    WinGet, Roblox, ID, ahk_exe RobloxPlayerBeta.exe ; Get Roblox window ID
    WinMove, % "ahk_id " Roblox, , 0, 0, 810, 610 ; Move and resize the window
        	
    return




FindFood:
    if (ScriptActive) {
        
        
        Food = 1
        
        
    Loop,
        
    {
        
        ImageFileName := A_WorkingDir . "\bin\food\food" . Food . ".bmp"

        ImageSearch, FoundX, FoundY, 260, 585, 509, 618, *50 %ImageFileName%
        If ErrorLevel = 0
        {
            FoundX += 5
            MouseMove, %FoundX%, %FoundY%
            Sleep, 100
            Click
            Sleep, 100
            MouseMove, 70, 470
            Sleep, 100
            Click
            MouseMove, %FoundX%, %FoundY%
            Sleep, 2000
            Click
            Sleep, 100
            Gosub ClickDura
            
            Break
        } else {
            Food++
            if (food >= 6)
            {
                ToolTip "No Food!!"
                ;no food LOG function insert here
                Break
            }
        }
    }


    
    }
        return

hungerBar:
    if (ScriptActive) 
        ToolTip "looking if hungry"
    {
        PixelSearch,,, 190, 125, 172, 125, 0x000000, 5, Fast
        If ErrorLevel = 0
        {
            ToolTip "Is HUNGRY"
            Gosub FindFood
        } else {
            ToolTip "NOT HUNGRYYY"
        }
    }
return



ClickDura:
if (ScriptActive) {
   
    Loop,
        {
        PixelSearch,,, 190, 125, 172, 125, 0x000000, 5, Fast ; detects food bar '190' default value
        If ErrorLevel = 0
        {
            ToolTip "Is HUNGRY"
            Gosub FindFood
        } else {

            Sleep, 2000
            MouseMove, %StartMouseX%, %StartMouseY%
            Click
            ToolTip "Searching..."
            ImageSearch,imagex, imagey, 335, 340, 485, 365, *100 %A_ScriptDir%\bin\durability.bmp
            if ErrorLevel = 0
                {				
                    Sleep, 50
                    MouseMove, %imagex%, %imagey%
                    Sleep, 50
                    Click
                    Sleep, 50
                    MouseMove, %imagex%, %imagey%
                    Click
                    Gosub Train
                    Break
                }else{
                    ToolTip "Missing Dura Image"
                }
        }
            
            
        }
}

Train:
if (ScriptActive) {
    Sleep, 300
    StartTime := A_TickCount
    
    Loop,
    {
        ElapsedTime := A_TickCount - StartTime
    
        ToolTip % ElapsedTime
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\W.bmp
        if ErrorLevel = 0
        {				
            SendInput, w ;w
        }		
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\A.bmp
        if ErrorLevel = 0
        {				
            SendInput, a ;a
        }
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\S.bmp
        if ErrorLevel = 0
        {				
            Sendinput, s ;s
        }			
        ImageSearch,,, 200, 209, 590, 235, *50 %A_ScriptDir%\bin\D.bmp
        if ErrorLevel = 0
        {				
            Sendinput, d ;d
        }
        
        Sleep, 10

        
            if (ElapsedTime >= 60000)
                {
                    Gosub ClickDura
                    break
                }
                
    }
}
    return

m:: ; test to get food
    ; Call the CheckMouseClick function
    
    
return

k:: ;main function to start the training process
    ScriptActive := True ; Activate the script when you press "k"
    SetTimer, OpenScript, On ; Start the timer
    MouseGetPos, StartMouseX, StartMouseY ; Where to click to find the pull up bar
    ImageSearch,,, 70, 50, 100, 67, *50 %A_ScriptDir%\bin\chat.bmp
    if ErrorLevel = 0
        {				
            MouseMove, 82, 54
                    Sleep, 50
            Click
        }
        Sleep, 50
    Gosub ClickDura
    return

p::
    ScriptActive := False ; Deactivate the script when you press "l"
    SetTimer, OpenScript, Off ; Stop the timer
    
    return

l::ExitApp ; Press "p" to exit the script


