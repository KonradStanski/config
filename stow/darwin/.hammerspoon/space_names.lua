-- Function to flash the current desktop name or ID
function flashDesktopNameOrID()
    local screen = hs.screen.primaryScreen()
    local currentSpaceID = hs.spaces.activeSpaceOnScreen(screen)
    local spaceName = hs.settings.get("spaceNames_" .. tostring(currentSpaceID)) or "Desktop ID: " .. tostring(currentSpaceID)
    
    -- Show the alert with the space name or ID for a short duration
    hs.alert.show(spaceName, { atScreenEdge = 2 }, screen, 0.5)
end

-- Function to rename the current desktop
function renameCurrentDesktop()
    local screen = hs.screen.primaryScreen()
    local currentSpaceID = hs.spaces.activeSpaceOnScreen(screen)
    local currentName = hs.settings.get("spaceNames_" .. tostring(currentSpaceID)) or "Desktop ID: " .. tostring(currentSpaceID)
    
    -- Prompt for a new name
    local button, newSpaceName = hs.dialog.textPrompt("Rename Desktop", "Enter a new name for this space:", currentName, "OK", "Cancel")
    if button == "OK" and newSpaceName ~= "" then
        hs.settings.set("spaceNames_" .. tostring(currentSpaceID), newSpaceName)
        hs.alert.show("Desktop renamed to: " .. newSpaceName)
    end
end

-- Bind the space change event to flashDesktopNameOrID function
hs.spaces.watcher.new(function()
    flashDesktopNameOrID()
end):start()

-- Hotkey to rename the current desktop (Ctrl+Alt+R)
hs.hotkey.bind({"ctrl", "alt"}, "R", function()
    renameCurrentDesktop()
end)

