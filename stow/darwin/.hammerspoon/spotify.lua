local function search()
   local app = hs.application.frontmostApplication()
   if app:name() == "Spotify" then
      app:selectMenuItem({ "Edit", "Search" })
   end
end

local SearchHK = hs.hotkey.new({ "cmd" }, "F", search)
local SpotifyWF = hs.window.filter.new("Spotify")

SpotifyWF:subscribe(hs.window.filter.windowFocused, function()
   SearchHK:enable()
end)

SpotifyWF:subscribe(hs.window.filter.windowUnfocused, function()
   SeachHK:disable()
end)
