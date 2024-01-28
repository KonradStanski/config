# Config
My custom configuration management and bootstrapping tool.

# Single Command Download and Install
run `curl -fsSL https://raw.githubusercontent.com/konradstanski/config/master/bootstrap.sh | bash`

# Manual Install
run `bootstrap.sh`
This will:
- detect your operating system
- run `./install/<OS>/install.sh`
- run `./make stow <OS>`

# Cross-platform methodology:
The stow folder is divided into common, darwin, and linux.
Files that are identical in both, go into common.
If the files are only required in one platform, put them in the correct mirrored tree structure in the platform specific folder.
For example:
main.zsh loads a ~/.config/zsh/platform.zsh file.
This file is not in common, but instead is in both darwin and linux. It contains platform specific bash sourcing.
