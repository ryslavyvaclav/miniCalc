import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

class MiniCalcWindow(Gtk.Window):

    def __init__(self):
        Gtk.Window.__init__(self, title="miniCalc")

        # create input fields and labels
        self.num1_entry = Gtk.Entry()
        self.num2_entry = Gtk.Entry()
        self.operator_combo = Gtk.ComboBoxText()
        self.operator_combo.insert(0, "+", "+")
        self.operator_combo.insert(1, "-", "-")
        self.operator_combo.insert(2, "*", "*")
        self.operator_combo.insert(3, "/", "/")
        self.result_label = Gtk.Label()

        # create button and connect signal
        self.calculate_button = Gtk.Button(label="Calculate")
        self.calculate_button.connect("clicked", self.on_calculate_button_clicked)

        # create layout
        grid = Gtk.Grid()
        grid.attach(Gtk.Label("Number 1:"), 0, 0, 1, 1)
        grid.attach(self.num1_entry, 1, 0, 1, 1)
        grid.attach(Gtk.Label("Number 2:"), 0, 1, 1, 1)
        grid.attach(self.num2_entry, 1, 1, 1, 1)
        grid.attach(Gtk.Label("Operator:"), 0, 2, 1, 1)
        grid.attach(self.operator_combo, 1, 2, 1, 1)
        grid.attach(self.calculate_button, 0, 3, 2, 1)
        grid.attach(self.result_label, 0, 4, 2, 1)
        self.add(grid)

    def on_calculate_button_clicked(self, widget):
        # get input values
        num1 = float(self.num1_entry.get_text())
        num2 = float(self.num2_entry.get_text())
        operator = self.operator_combo.get_active_text()

        # perform calculation
        if operator == "+":
            result = num1 + num2
        elif operator == "-":
            result = num1 - num2
        elif operator == "*":
            result = num1 * num2
        elif operator == "/":
            result = num1 / num2

        # display result
        self.result_label.set_text("Result: {:.2f}".format(result))

win = MiniCalcWindow()
win.connect("destroy", Gtk.main_quit)
win.show_all()
Gtk.main()
