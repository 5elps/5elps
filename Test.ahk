#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Define an array of questions and corresponding answers
questions := [
    ["What is 5 + 5?", "10"],
    ["Who wrote 'Hamlet'?", "William Shakespeare"],
    ["What is the capital of Australia?", "Canberra"],
    ["How many sides does a triangle have?", "3"],
    ["Who painted the Mona Lisa?", "Leonardo da Vinci"],
    ["What year did World War II end?", "1945"]
]

; GUI Definition
Gui, Add, Text, x10 y10 w300 h20, Random Question:
Gui, Add, Text, x10 y30 w300 h20, (Click 'Get Random Question' button)
Gui, Add, Button, x10 y70 w150 h30 gGetRandomQuestion, Get Random Question
Gui, Add, Text, x10 y110 w100 h20, Your Answer:
Gui, Add, Edit, x10 y140 w300 h20 vUserAnswer
Gui, Add, Button, x10 y170 w100 h30 gSubmit, Submit Answer
Gui, Add, Edit, x10 y210 w300 h100 vAnswerBox readonly

; Show GUI
Gui, Show, w330 h350, Q&A Interface
Return

GetRandomQuestion:
    Random, randIndex, 1, questions.MaxIndex()
    selectedQuestion := questions[randIndex][1]
    GuiControl,, Text2, % selectedQuestion
Return

Submit:
    Gui, Submit, NoHide
    GuiControlGet, UserAnswer,, UserAnswer
    
    ; Find the correct answer corresponding to the selected question
    selectedQuestion := GuiControlGet("Text2")
    correctAnswer := ""
    Loop, % questions.MaxIndex()
    {
        if (questions[A_Index][1] = selectedQuestion)
        {
            correctAnswer := questions[A_Index][2]
            break
        }
    }

    ; Compare user's answer with correct answer
    if (StrLower(UserAnswer) = StrLower(correctAnswer))
        Answer := "Correct!"
    else
        Answer := "Incorrect. The correct answer is: " . correctAnswer
    
    ; Display the answer
    GuiControl,, AnswerBox, %Answer%
Return

GuiClose:
    ExitApp
Return
