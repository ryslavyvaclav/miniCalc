ConsoleWrite("Made with <3 by Ryslavy Vaclav" & @CRLF)

While True
    ; Display the menu of available operations
    ConsoleWrite("Select an operation:" & @CRLF)
    ConsoleWrite("[+] Addition" & @CRLF)
    ConsoleWrite("[-] Subtraction" & @CRLF)
    ConsoleWrite("[*] Multiplication" & @CRLF)
    ConsoleWrite("[/] Division" & @CRLF)
    ConsoleWrite("[q] Quit" & @CRLF)

    ; Read the user's choice of operation
    $choice = InputBox("Calculator", "Select an operation (e.g. +, -, *, /):")
    If @error Then
        ; Exit the program if the user clicks the "Cancel" button
        Exit
    EndIf

    If $choice = "q" Then
        ; Exit the program if the user chooses to quit
        Exit
    EndIf

    ; Read the two operands
    $operand1 = InputBox("Calculator", "Enter the first operand:")
    If @error Then
        ; Exit the program if the user clicks the "Cancel" button
        Exit
    EndIf

    $operand2 = InputBox("Calculator", "Enter the second operand:")
    If @error Then
        ; Exit the program if the user clicks the "Cancel" button
        Exit
    EndIf

    ; Perform the selected operation
    Switch $choice
        Case "+"
            $result = $operand1 + $operand2
        Case "-"
            $result = $operand1 - $operand2
        Case "*"
            $result = $operand1 * $operand2
        Case "/"
            If $operand2 = 0 Then
                MsgBox(16, "Calculator", "Error: division by zero")
            Else
                $result = $operand1 / $operand2
            EndIf
        Case Else
            MsgBox(16, "Calculator", "Error: invalid choice")
    EndSwitch

    ; Display the result
    MsgBox(64 + 4096, "Calculator", "Result: " & $result)
WEnd
