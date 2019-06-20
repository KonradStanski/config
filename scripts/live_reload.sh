#!/bin/bash
browser-sync --version

if [ "$#" -eq 0 ]; then
  echo "Start Local Live Server"
  browser-sync start --server
elif [ "$#" -eq 1 ]; then
  echo Start Project in: $1
  mkdir $1
  touch $1/index.html
  touch $1/script.js
  touch $1/style.css
  cd $1
  echo "<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<p>Sample Page</p>
</body>
</html>" >> index.html
  echo 'console.log("Test Log")' >> script.js
  browser-sync start --server
else
  echo "Too many arguments, please specify only 1 project folder"
  echo $*
fi
