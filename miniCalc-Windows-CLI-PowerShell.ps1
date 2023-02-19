# get user input
$num1 = Read-Host "Enter first number"
$num2 = Read-Host "Enter second number"
$operator = Read-Host "Enter operator (+, -, *, /)"

# perform arithmetic operation
switch ($operator) {
    "+" { $result = $num1 + $num2 }
    "-" { $result = $num1 - $num2 }
    "*" { $result = $num1 * $num2 }
    "/" { $result = $num1 / $num2 }
    default { $result = "Error: invalid operator" }
}

# print the result
Write-Host "Result: $result"
