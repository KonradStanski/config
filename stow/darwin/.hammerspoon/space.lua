-- Set up the logger
local log = hs.logger.new('WindowMover', 'info')

-- Function to get spaceId by space name
function getSpaceIdByName(spaceName)
    local spaceNames = hs.spaces.missionControlSpaceNames()
    for uuid, desktops in pairs(spaceNames) do
        log.i("UUID: " .. uuid) -- Log the UUID
        for index, name in pairs(desktops) do
            log.i("Index: " .. index .. ", Name: " .. tostring(name)) -- Log the index and name
            if name == spaceName then
                log.i("Found spaceId for " .. spaceName .. ": " .. index)
                return index
            end
        end
    end
    log.w("Space not found: " .. spaceName)
    return nil
end

-- Function to move focused window to a specific space
function moveFocusedWindowToSpace(spaceNumber)
    local spaceName = "Desktop " .. spaceNumber
    log.i("Attempting to move window to " .. spaceName)
    local spaceId = getSpaceIdByName(spaceName)
    if spaceId then
        local focusedWindow = hs.window.focusedWindow()
        if focusedWindow then
            log.i("Moving window " .. focusedWindow:title() .. " to spaceId " .. spaceId)
            hs.spaces.moveWindowToSpace(focusedWindow:id(), spaceId)
        else
            log.w("No focused window")
            hs.alert.show("No focused window")
        end
    else
        log.w("Space not found: " .. spaceName)
        hs.alert.show("Space not found: " .. spaceName)
    end
end

-- Bind keys cmd + shift + 1-6
for i = 1, 6 do
    hs.hotkey.bind({"cmd", "shift"}, tostring(i), function()
        log.i("Hotkey pressed: cmd + shift + " .. i)
        moveFocusedWindowToSpace(i)
    end)
end

