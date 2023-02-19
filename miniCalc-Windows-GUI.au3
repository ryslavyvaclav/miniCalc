#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; Create the GUI window
Global $hWnd = GUICreate("miniCalc", 300, 200)

; Create the input fields
Global $num1Label = GUICtrlCreateLabel("First number:", 10, 10, 80, 20)
Global $num1Input = GUICtrlCreateInput("", 100, 10, 100, 20)

Global $opLabel = GUICtrlCreateLabel("Operator (+, -, *, /):", 10, 40, 120, 20)
Global $opInput = GUICtrlCreateInput("", 140, 40, 60, 20)

Global $num2Label = GUICtrlCreateLabel("Second number:", 10, 70, 80, 20)
Global $num2Input = GUICtrlCreateInput("", 100, 70, 100, 20)

; Create the calculate button
Global $calculateBtn = GUICtrlCreateButton("Calculate", 100, 120, 100, 30)

; Show the GUI window
GUISetState(@SW_SHOW, $hWnd)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit

        Case $calculateBtn
            ; Get the input values
            Local $num1 = GUICtrlRead($num1Input)
            Local $op = GUICtrlRead($opInput)
            Local $num2 = GUICtrlRead($num2Input)

            ; Validate the input values
            If $num1 = "" Or $op = "" Or $num2 = "" Then
                MsgBox(16, "Error", "Please enter all values.")
                ContinueLoop
            EndIf

            If Not StringRegExp($num1, "^-?\d+(\.\d+)?$") Then
                MsgBox(16, "Error", "Invalid first number.")
                ContinueLoop
            EndIf

            If $op <> "+" And $op <> "-" And $op <> "*" And $op <> "/" Then
                MsgBox(16, "Error", "Invalid operator.")
                ContinueLoop
            EndIf

            If Not StringRegExp($num2, "^-?\d+(\.\d+)?$") Then
                MsgBox(16, "Error", "Invalid second number.")
                ContinueLoop
            EndIf

            If $op = "/" And $num2 = "0" Then
                MsgBox(16, "Error", "Division by zero.")
                ContinueLoop
            EndIf

            ; Calculate the result
            Local $result
            Switch $op
                Case "+"
                    $result = $num1 + $num2
                Case "-"
                    $result = $num1 - $num2
                Case "*"
                    $result = $num1 * $num2
                Case "/"
                    $result = $num1 / $num2
            EndSwitch

            ; Show the result
            MsgBox(64, "Result", $num1 & " " & $op & " " & $num2 & " = " & $result)

    EndSwitch
WEnd
