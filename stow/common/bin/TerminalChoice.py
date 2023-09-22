import subprocess
import sys
import tty
import termios


class CommandChooser():
    # Constructor
    def __init__(self):
        # Command to get the list of options
        self.get_options_command = [
            'echo', 'Number Option\n1: Option1\n2: Option2\n3: Option3']
        # Command to choose an option (ie. attach to a container)
        self.choose_option_command = ['echo', 'You chose option']
        # Wether to ignore the first few lines (usually a header)
        self.ignore_first_n_lines = 1
        # Index of the option id in the option string (the id is used in the choose_command)
        self.option_id_index = 0
        # Splitting character for the option string
        self.option_split_char = ':'
        # Shell true or false (used for commands with weird escape sequences that need to be a single string)
        self.shell = False

    # Get the list of options

    def get_options(self):
        options = subprocess.run(self.get_options_command, shell=self.shell,
                                 capture_output=True).stdout.strip().decode('utf-8')
        options = options.split('\n')
        return options

    def print_options(self, options, selected_index):
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
    def getch(self):
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

        option_id = options[selected_index].split(self.option_split_char)[0]
        # connect to the session using the number
        print(f"You Chose Option {option_id}")
        subprocess.run(self.choose_option_command + [option_id])


# A NIFTY INTERPRETATION
#!/usr/bin/env python3


# import curses
# import subprocess

# def get_sessions():
#     # query tmux for available sessions
#     sessions = subprocess.run(['tmux', 'list-sessions'], capture_output=True).stdout.strip().decode('utf-8')
#     # split the sessions string by newline to get a list of sessions
#     sessions = sessions.split('\n')
#     # return the list of sessions
#     return sessions

# def print_sessions(stdscr, sessions, selected_index):
#     # move the cursor to the top left corner
#     stdscr.move(0, 0)
#     # print each session on its own line
#     for i, session in enumerate(sessions):
#         # if the current index is the selected index, mark it with a ">" and print it in bold
#         if i == selected_index:
#             stdscr.addstr(f'> {session}\n', curses.A_BOLD)
#         else:
#             stdscr.addstr(f'  {session}\n')
#     # refresh the screen to show the printed text
#     stdscr.refresh()

# def main(stdscr):
#     # get the available sessions
#     sessions = get_sessions()
#     # keep track of the selected session
#     selected_index = 0
#     # print the sessions in place
#     while True:
#         print_sessions(stdscr, sessions, selected_index)
#         # get user input
#         user_input = stdscr.getch()
#         # if the user pressed the up arrow, decrement the selected index (unless it's already 0)
#         if user_input == curses.KEY_UP:
#             if selected_index > 0:
#                 selected_index -= 1
#         # if the user pressed the down arrow, increment the selected index (unless it's already the last index)
#         elif user_input == curses.KEY_DOWN:
#             if selected_index < len(sessions) - 1:
#                 selected_index += 1
#         # if the user pressed enter, connect to the selected session and break out of the loop
#         elif user_input == curses.KEY_ENTER or user_input == 10:
#             # get the selected session's number
#             session_num = sessions[selected_index].split(':')[0]
#             # connect to the session using the number
#             subprocess.run(['tmux', 'attach-session', '-t', session_num])
#             break
#         # if the user pressed the esc key, break out of the loop
#         elif user_input == 27:
#             break


# if __name__ == '__main__':
#     # initialize curses
#     curses.wrapper(main)
