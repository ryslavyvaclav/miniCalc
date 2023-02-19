#!/usr/bin/env python3

import tkinter as tk

class MiniCalcGUI:
    def __init__(self, master):
        # create the GUI elements
        self.label1 = tk.Label(master, text="Enter first number:")
        self.label1.pack()
        self.entry1 = tk.Entry(master)
        self.entry1.pack()
        self.label2 = tk.Label(master, text="Enter second number:")
        self.label2.pack()
        self.entry2 = tk.Entry(master)
        self.entry2.pack()
        self.label3 = tk.Label(master, text="Enter operator (+, -, *, /):")
        self.label3.pack()
        self.entry3 = tk.Entry(master)
        self.entry3.pack()
        self.button = tk.Button(master, text="Calculate", command=self.calculate)
        self.button.pack()
        self.result_label = tk.Label(master, text="")
        self.result_label.pack()

    def calculate(self):
        # get the user input
        num1 = float(self.entry1.get())
        num2 = float(self.entry2.get())
        operator = self.entry3.get()

        # perform the arithmetic operation
        if operator == "+":
            result = num1 + num2
        elif operator == "-":
            result = num1 - num2
        elif operator == "*":
            result = num1 * num2
        elif operator == "/":
            result = num1 / num2
        else:
            result = "Error: invalid operator"

        # display the result
        self.result_label.config(text="Result: " + str(result))

# create the main window and start the event loop
root = tk.Tk()
app = MiniCalcGUI(root)
root.mainloop()
