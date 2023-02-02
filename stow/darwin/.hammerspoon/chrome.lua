local function nextTab()
   local app = hs.application.frontmostApplication()
   if app:name() == "Google Chrome" then
      app:selectMenuItem({ "Tab", "Select Next Tab" })
   end
end

local function previousTab()
   local app = hs.application.frontmostApplication()
   if app:name() == "Google Chrome" then
      app:selectMenuItem({ "Tab", "Select Previous Tab" })
   end
end

local function historyBack()
   local app = hs.application.frontmostApplication()
   if app:name() == "Google Chrome" then
      app:selectMenuItem({ "History", "Back" })
   end
end

local function historyForward()
   local app = hs.application.frontmostApplication()
   if app:name() == "Google Chrome" then
      app:selectMenuItem({ "History", "Forward" })
   end
end

local function duplicateTab()
   local app = hs.application.frontmostApplication()
   if app:name() == "Google Chrome" then
      app:selectMenuItem({ "Tab", "Duplicate Tab" })
   end
end

local NextTabHK = hs.hotkey.new({ "shift" }, "Right", nextTab)
local PreviousTabHK = hs.hotkey.new({ "shift" }, "Left", previousTab)
local HistoryBackHK = hs.hotkey.new({ "cmd" }, "J", historyBack)
local HistoryForwardHK = hs.hotkey.new({ "cmd" }, "K", historyForward)
local DuplicateTabHK = hs.hotkey.new({ "cmd" }, "D", duplicateTab)

-- Initialize a Google Chrome window filter
local GoogleChromeWF = hs.window.filter.new("Google Chrome")

-- Subscribe to when your Google Chrome window is focused and unfocused
GoogleChromeWF:subscribe(hs.window.filter.windowFocused, function()
   -- Enable hotkey in Google Chrome
   NextTabHK:enable()
   PreviousTabHK:enable()
   HistoryBackHK:enable()
   HistoryForwardHK:enable()
   DuplicateTabHK:enable()
end)

GoogleChromeWF:subscribe(hs.window.filter.windowUnfocused, function()
   -- Disable hotkey when focusing out of Google Chrome
   NextTabHK:disable()
   PreviousTabHK:disable()
   HistoryBackHK:disable()
   HistoryForwardHK:disable()
   DuplicateTabHK:disable()
end)
