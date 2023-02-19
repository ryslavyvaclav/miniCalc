#!/bin/bash

echo "*** miniCalc ***"
echo

while true; do
    read -p "Enter first number: " num1
    read -p "Enter operator (+, -, *, /): " op
    read -p "Enter second number: " num2

    if [[ -z $op ]]; then
        echo "Error: operator not specified."
        continue
    fi

    if [[ $operator == "+" || $operator == "-" || $operator == "*" || $operator == "/" ]]; then
        echo "Error: invalid operator."
        continue
    fi

    if ! [[ $num1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: invalid first number."
        continue
    fi

    if ! [[ $num2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: invalid second number."
        continue
    fi

    if [[ $op == "/" && $num2 == "0" ]]; then
        echo "Error: division by zero."
        continue
    fi

    break
done

case $op in
    "+")
        result=$(echo "$num1 + $num2" | bc)
        ;;
    "-")
        result=$(echo "$num1 - $num2" | bc)
        ;;
    "*")
        result=$(echo "$num1 * $num2" | bc)
        ;;
    "/")
        result=$(echo "$num1 / $num2" | bc)
        ;;
esac

echo
echo "$num1 $op $num2 = $result"
echo
