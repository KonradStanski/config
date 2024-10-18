from __future__ import annotations
import subprocess
import sys
import tty
import termios

class CommandChooser():
    # Constructor
    def __init__(self,
                 get_options_command: str | callable[[], list[str]] = 'echo "op1\nop2\nop3"',
                 execute_command: str = 'echo "You chose option {}"',
                 ignore_first_n_lines: int = 1,
                 key_index: int = 0,
                 split_char: str = ':',
                 multi_select: bool = False):
        # Command to get the list of options
        self.get_options_command = get_options_command
        # formatted string option command
        self.execute_command = execute_command
        # Wether to ignore the first few lines (usually a header)
        self.ignore_first_n_lines = ignore_first_n_lines
        # Index of the argument to use in the execute command
        self.key_index = key_index
        # Splitting character for the option string
        self.split_char = split_char
        # select multiple options
        self.multi_select = multi_select

    # Get the list of options
    def get_options(self) -> list[str]:
        if callable(self.get_options_command):
            return self.get_options_command()
        else:
            return subprocess.run(self.get_options_command, shell=True, capture_output=True).stdout.strip().decode('utf-8').split('\n')

    def print_options(self, options: list[str], current_index: int, selected_indices: set[int]) -> None:
        _, width = subprocess.run(['stty', 'size'], capture_output=True).stdout.decode('utf-8').split()
        width = int(width)
        # truncate the options to the width of the terminal
        options = [option[:width-2] for option in options]
        for i, option in enumerate(options):
            option = option.strip()
            if i == current_index:
                if self.multi_select and i in selected_indices:
                    print(f"\033[1m>X{option}\033[0m")
                else:
                    print(f"\033[1m> {option}\033[0m")
            else:
                if self.multi_select and i in selected_indices:
                    print(f" X{option}")
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

    def execute_chosen_command(self, index: int, options: list[str]):
        option_tokens = options[index].split(self.split_char)
        option_tokens = [string for string in option_tokens if string]
        option_id = option_tokens[self.key_index].strip()
        command = self.execute_command.format(option_id)
        print(f"You Chose Option {option_id}, running command: {command}")
        subprocess.run(command, shell=True)

    def run(self):
        options = self.get_options()
        if len(options) == 0:
            print("No options found")
            sys.exit(0)
        selected_index = self.ignore_first_n_lines
        selected_indices = set()
        self.print_options(options, selected_index, selected_indices)

        while True:
            # https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#cursor-controls
            # Move the cursor back to the beginning of the line
            sys.stdout.write(f"\033[{len(options)}A")
            self.print_options(options, selected_index, selected_indices)
            ch = self.getch()
            if ch == "\x1b[A" or ch == "k": # Up arrow \ k
                selected_index = max(
                    self.ignore_first_n_lines, selected_index - 1)
            elif ch == "\x1b[B" or ch == "j": # Down arrow \ j
                selected_index = min(len(options) - 1, selected_index + 1)
            elif ch == " ": # Space key
                if self.multi_select:
                    if selected_index in selected_indices:
                        selected_indices.remove(selected_index)
                    else:
                        selected_indices.add(selected_index)
                else:
                    break
            elif ch == "\r": # Enter key
                break
            elif ch == "q": # q or esc key
                sys.exit(0)
        # Execute Choose chosen option in command
        if self.multi_select:
            selected_indices.add(selected_index)
            for index in selected_indices:
                self.execute_chosen_command(index, options)
        else:
            self.execute_chosen_command(selected_index, options)
