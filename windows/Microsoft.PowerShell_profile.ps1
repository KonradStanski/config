# SET THEME
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme fish

# ALIASES

function touch([string]$filename) {
	if ("$filename" -eq "") {
		Write-Host "Filename cannot be empty"
	}
	else {
		New-Item -ItemType file "$filename"
	}
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


