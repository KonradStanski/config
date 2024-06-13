import subprocess
import sys
import tty
import termios


class CommandChooser():
    # Constructor
    def __init__(self):
        # Command to get the list of options
        self.get_options_command = 'echo "Number Option\n1: Option1\n2: Option2\n3: Option3"'
        # formatted string option command
        self.choose_option_command = "echo, you chose option {}"
        # Wether to ignore the first few lines (usually a header)
        self.ignore_first_n_lines = 1
        # Index of the option id in the option string (the id is used in the choose_command)
        self.option_id_index = 0
        # Splitting character for the option string
        self.option_split_char = ':'
        # Text to use as options instead of a command
        self.options_text = None

    # Get the list of options
    def get_options(self) -> list[str]:
        if self.options_text:
            return self.options_text.split('\n')
        # allow for a function to be passed to get the options
        if callable(self.get_options_command):
            return self.get_options_command()
        options = subprocess.run(self.get_options_command, shell=True,
                                 capture_output=True).stdout.strip().decode('utf-8')
        options = options.split('\n')
        return options

    def print_options(self, options: list[str], selected_index: int) -> None:
        _, width = subprocess.run(['stty', 'size'], capture_output=True).stdout.decode('utf-8').split()
        width = int(width)
        # truncate the options to the width of the terminal
        options = [option[:width-2] for option in options]
        for i, option in enumerate(options):
            if i == selected_index:
                print(f"\033[1m> {option}\033[0m")
            else:
                print(f"  {option}")

    # Read user input using getch()
    def getch(self) -> str:
        # Save the current terminal settings
        old_settings = termios.tcgetattr(sys.stdin)
        try:
            # Set the terminal to raw mode
            tty.setraw(sys.stdin.fileno())
            # Read a single character from the user
            ch = sys.stdin.read(1)
            # Check for escape sequences
            if ch == "\x1b":
                # Read the next two characters
                ch = ch + sys.stdin.read(2)
                if ch == "\x1b":
                    # if it was just an escape key, exit
                    sys.exit(0)
        finally:
            # Restore the terminal settings
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_settings)
        return ch

    def run(self):
        options = self.get_options()
        if len(options) == 0:
            print("No options found")
            sys.exit(0)
        selected_index = self.ignore_first_n_lines
        self.print_options(options, selected_index)

        while True:
            # https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#cursor-controls
            # Move the cursor back to the beginning of the line
            sys.stdout.write(f"\033[{len(options)}A")
            self.print_options(options, selected_index)

            # Read a single character from the user
            ch = self.getch()

            # Handle the arrow keys
            if ch == "\x1b[A" or ch == "k":
                # Up arrow
                selected_index = max(
                    self.ignore_first_n_lines, selected_index - 1)
            elif ch == "\x1b[B" or ch == "j":
                # Down arrow
                selected_index = min(len(options) - 1, selected_index + 1)
            elif ch == "\r":
                # Enter key
                break
            elif ch == "q":
                sys.exit(0)
        # Execute Choose chosen option in command
        option_id = options[selected_index].split(self.option_split_char)[self.option_id_index].strip()
        command = self.choose_option_command.format(option_id)
        print(f"You Chose Option {option_id}, running command: {command}")
        subprocess.run(command, shell=True)
