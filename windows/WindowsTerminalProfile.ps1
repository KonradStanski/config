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

function loc() {
    Get-ChildItem . -Include *.* -Recurse | ForEach-Object { (Get-Content $_).Count } | measure-object -sum -Average -Maximum -Minimum
    Get-ChildItem -re -in "*.*" |
    Foreach-Object { 
        $fileStats = Get-Content $_.FullName | Measure-Object -line
        $linesInFile = $fileStats.Lines
        Write-Host "$linesInFile = $_" 
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

function exp() {
	explorer .
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
