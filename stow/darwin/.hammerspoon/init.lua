hs.console.clearConsole()
hs.alert.show("Config loaded")

-- relaod settings
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
  hs.reload()
end)

-- Open iterm window
hs.hotkey.bind({ "cmd", "ctrl" }, "T", function()
  hs.osascript.applescript([[
    tell application "iTerm2"
      set newWindow to (create window with default profile)
    end tell
  ]])
end)

-- Open new chrome window
hs.hotkey.bind({ "cmd", "ctrl" }, "G", function()
  hs.execute('open -na "Google Chrome" --args --profile-directory="Default"')
end)

-- Open new finder window
hs.hotkey.bind({ "cmd" }, "E", function()
  hs.osascript.applescript([[
    set myTarget to ((path to documents folder) as text)
    tell application "Finder" 
      set myW to make new Finder window
      set target of myW to myTarget
      activate
    end tell
  ]])
end)

require("chrome")

print("************CONFIG LOADED************")
