#!/bin/bash
if [ "$#" -eq 0 ]; then
  echo "Start Local Live Server"
  chromium-browser
  python -m SimpleHTTPServer &
  chromium-browser http://localhost:8000
elif [ "$#" -eq 1 ]; then
  echo Start Project in: $1
  mkdir $1
  touch $1/index.html
  touch $1/script.js
  touch $1/style.css
  cd $1
  echo '<!DOCTYPE html>
<html lang=en>
<head>
  <meta charset=UTF-8>
  <title>Document</title>
  <script type="text/javascript" src="http://livejs.com/live.js"></script>
  <script type=text/javascript src=script.js></script>
</head>
<body>
  <p>Test Page</p>
</body>
</html>' >> index.html
  echo 'console.log("Test Log")' >> script.js
  python -m SimpleHTTPServer &
  chromium-browser http://localhost:8000
else
  echo "Too many arguments, please specify only 1 project folder"
  echo $*
fi