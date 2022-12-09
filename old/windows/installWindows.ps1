# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Productivity
choco install googlechrome
choco install foxitreader
# choco install google-drive-file-stream
choco install googledrive
choco install spotify

# SDK's
choco install jre8
choco install python

# Dev tools
choco install microsoft-windows-terminal
choco install git
choco install openssh
choco install vscode
choco install curl
choco install wget
choco install yarn
choco install postman
choco install github-desktop
choco install nvm
choco install mongodb
choco install notepadplusplus
choco install docker-cli
choco install docker-desktop
choco install awscli
choco install redis-64
choco install make

# Misc Utility
choco install ffmpeg
choco install 7zip
choco install vlc
# choco install malwarebytes
choco install autohotkey
choco install calibre
choco install windirstat
choco install sysinternals
choco install qbittorrent
choco install pandoc
choco install powertoys
choco install rufus
choco install pdfsam
choco install procmon
choco install obs-studio
choco install virtuawin
# choco install geogebra-geometry
choco install everything
# choco install clover

# Communications
choco install microsoft-teams
choco install zoom
choco install slack
choco install discord

# Copy Settings
Copy-Item "./virtuawin.cfg" -Destination "$env:APPDATA/VirtuaWin"
Copy-Item "./Microsoft.PowerShell_profile.ps1" -Destination "$PROFILE"
