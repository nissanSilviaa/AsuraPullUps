;Written by jash2260 on discord﻿
SetTimer, OpenScript, 10 
ScriptActive := False 
StartMouseX := 0 
StartMouseY := 0 
macVersion := "v1.5"

Gui, Add, Text, x10 y10 w200 h30, Welcome to Jash's Macro (Version: %macVersion%) :>
Gui, Add, Text, x10 y25 w200 h30, Make sure you have watched the tutorial on how to set up the macro!
Gui, Add, Text, x10 y40 w200 h30, Also make sure you have full Hunger before starting the macro!
Gui, Add, Text, x10 y55 w200 h30, Controls:
Gui, Add, Text, x10 y70 w200 h30, K = Start Macro
Gui, Add, Text, x10 y85 w200 h30, L = Exit Macro
Gui, Add, Text, x10 y100 w200 h30, P = Pause Macro (Doesn't work)
Gui, Show, x245 y700 w300 h115, Jash's Pull Up Macro


OpenScript:
     
    SetTitleMatchMode, 2 
    WinActivate, % "ahk_id " Roblox 
    WinGet, Roblox, ID, ahk_exe RobloxPlayerBeta.exe 
    WinMove, % "ahk_id " Roblox, , 0, 0, 810, 610 
        	
    return




FindFood:
    if (ScriptActive) {
        
        
        Food = 1
        
        
    Loop
        
    {
        
        ImageFileName := A_WorkingDir . "\bin\food\food" . Food . ".bmp"

        ImageSearch, FoundX, FoundY, 260, 585, 509, 618, *100 %ImageFileName%
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
            Goto ClickDura
            
            Break
        } else {
            Food++
            if (food >= 6)
            {
                ToolTip "No Food!!"
                ;no food LOG function insert here
                break
            }
        }
    }
    return


    
    }
        return

Train:
if (ScriptActive) {
    Sleep, 300
    StartTime := A_TickCount
    ToolTip "FEAR NISSAN SILVIA ON ASURA!"
    Loop
    {
        ElapsedTime := A_TickCount - StartTime
    
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\W.bmp
        if ErrorLevel = 0
        {				
            SendInput, w 
        }		
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\A.bmp
        if ErrorLevel = 0
        {				
            SendInput, a 
        }
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\S.bmp
        if ErrorLevel = 0
        {				
            Sendinput, s 
        }			
        ImageSearch,,, 200, 209, 590, 235, *70 %A_ScriptDir%\bin\D.bmp
        if ErrorLevel = 0
        {				
            Sendinput, d 
        }
        
        Sleep, 10

        
            if (ElapsedTime >= 60000)
                {
                    Goto ClickDura
                    break
                }
                
    }
}
    return


ClickDura:
if (ScriptActive) {
   
    Loop
        {
        PixelSearch,,, 190, 125, 172, 125, 0x000000, 30, Fast ; detects food bar '190' default value
        If ErrorLevel = 0
        {
            ToolTip "Is HUNGRY"
            Goto FindFood
        } else {
             
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
                    Goto Train
                    break
                }else{
                    ToolTip "Missing Dura Image"
                    
                }
        }
            
            
        }
}
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
    Goto ClickDura
    return

p::
    ScriptActive := False ; Deactivate the script when you press "p"
    SetTimer, OpenScript, Off ; Stop the timer
    
    return

l::ExitApp ; Press "l" to exit the script

