#!/usr/bin/env python3
import subprocess
import sys
import tty
import termios


# Config Options:
command = ['a4c', 'create', '-p', 'eos-trunk']

flags = [
   {
      "desc": "The name of the project. Ex: konrad.<proj>.0",
      "flag": "-c",
   },
   {
      "desc": "The name of the container. Ex: <issue_name>",
      "flag": "-n",
   }
]

def main():
   for flag in flags:
      print(f"{flag['desc']}\n> ", end='')
      try:
         value = input()
      except KeyboardInterrupt:
         sys.exit(0)
      command.append(flag['flag'])
      command.append(value)
      # clear 2 lines and return cursor to original position
      sys.stdout.write(f"\033[F\033[K")
      sys.stdout.write(f"\033[F\033[K")
   print(command)
   subprocess.run(command)

if __name__ == "__main__":
    main()
