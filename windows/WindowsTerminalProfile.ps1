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

function extract-audio([string]$infile, [string]$outfile) {
	if ("$infile" -eq "") {
		Write-Host "Please provide an input video file"
	}
	else {
		if ("$outfile" -eq "") {
			Write-Host "Please provide an output filename"
		}
		else {
			ffmpeg -i "$infile" -f mp3 -ab 192000 -vn "$outfile"
		}
	}
}

function gdone([string]$msg) {
	git add .
	git commit --message $msg
	git push
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
