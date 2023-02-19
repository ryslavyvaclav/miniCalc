#!/bin/bash

# get user input
read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operator (+, -, *, /): " operator

# perform arithmetic operation using bc
result=$(echo "$num1 $operator $num2" | bc)

# print the result
echo "Result: $result"
