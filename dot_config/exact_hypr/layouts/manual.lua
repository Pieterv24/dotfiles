-- ===== STATE MANAGEMENT =====
-- Maintains the layout state across updates
local state = {
    order = {},           -- Track the order of windows in the layout
    split = {},           -- Store split direction (h/v) for each window
    default_split = "h",  -- Default split direction is horizontal
}

-- Get a unique identifier for a target (window or placeholder)
-- Uses stable_id if window exists, otherwise uses index
local function target_id(target)
    local window = target.window
    return window and tostring(window.stable_id) or tostring(target.index)
end

-- Find and return the ID of the currently active/focused window
local function active_id(ctx)
    for _, target in ipairs(ctx.targets) do
        local window = target.window
        if window and window.active then
            return target_id(target)
        end
    end

    return state.order[#state.order]
end

-- Helper function to find the index of a value in a table
local function index_of(tbl, value)
    for i, v in ipairs(tbl) do
        if v == value then
            return i
        end
    end
end

-- Synchronize the window order state with current context
-- Removes closed windows from tracking and adds new windows
local function sync_order(ctx)
    local present = {}
    local targets = {}

    -- Map current targets by their ID
    for _, target in ipairs(ctx.targets) do
        local id = target_id(target)
        present[id] = true
        targets[id] = target
    end

    -- Preserve order of existing windows, remove closed ones
    local old_order = state.order
    state.order = {}

    for _, id in ipairs(old_order) do
        if present[id] then
            table.insert(state.order, id)
        else
            state.split[id] = nil  -- Clean up split info for closed windows
        end
    end

    -- Add new windows that aren't in our order yet
    local focused = active_id(ctx)
    for _, target in ipairs(ctx.targets) do
        local id = target_id(target)
        if not index_of(state.order, id) then
            -- Insert after focused window, or at the end
            local after = focused and index_of(state.order, focused)
            table.insert(state.order, after and (after + 1) or (#state.order + 1), id)
        end
    end

    return targets
end

-- Recursively place windows in a chain, splitting the available area
-- Based on the split direction stored for each window
local function place_chain(ctx, targets, ids, area, i)
    if i > #ids then
        return
    end

    local target = targets[ids[i]]
    if not target then
        return
    end

    -- Last window gets the remaining area
    if i == #ids then
        target:place(area)
        return
    end

    -- Get split direction for this window (horizontal or vertical)
    local split = state.split[ids[i]] or state.default_split
    if split == "v" then
        -- Vertical split: place current window on top, recurse with bottom area
        target:place(ctx:split(area, "top", 0.5))
        place_chain(ctx, targets, ids, ctx:split(area, "bottom", 0.5), i + 1)
    else
        -- Horizontal split: place current window on left, recurse with right area
        target:place(ctx:split(area, "left", 0.5))
        place_chain(ctx, targets, ids, ctx:split(area, "right", 0.5), i + 1)
    end
end

-- Move the currently active window in the order by a delta (-1 or +1)
local function move_active(ctx, delta)
    local id = active_id(ctx)
    local i = id and index_of(state.order, id)
    local j = i and (i + delta)

    -- Check bounds to ensure valid swap
    if not i or j < 1 or j > #state.order then
        return
    end

    -- Swap positions in the order
    state.order[i], state.order[j] = state.order[j], state.order[i]
end

-- ===== LAYOUT REGISTRATION =====
-- Register the "manual" layout with Hyprland
hl.layout.register("manual", {
    -- Called when the layout needs to be recalculated (e.g., window added/removed)
    recalculate = function(ctx)
        local targets = sync_order(ctx)  -- Update window tracking
        place_chain(ctx, targets, state.order, ctx.area, 1)  -- Place all windows
    end,

    -- Handle layout-specific commands
    layout_msg = function(ctx, msg)
        local id = active_id(ctx)  -- Get the currently focused window
        local command = msg:match("^(%S+)")  -- Extract the command

        -- Handle split direction commands for current window
        if command == "splith" or command == "h" then
            if id then
                state.split[id] = "h"
            end
        elseif command == "splitv" or command == "v" then
            if id then
                state.split[id] = "v"
            end
        elseif command == "splittoggle" or command == "toggle" then
            -- Toggle split direction between horizontal and vertical
            if id then
                state.split[id] = state.split[id] == "v" and "h" or "v"
            end
        elseif command == "promote" then
            -- Move active window to the front of the layout
            local i = id and index_of(state.order, id)
            if i then
                table.remove(state.order, i)
                table.insert(state.order, 1, id)
            end
        elseif command == "swapnext" then
            -- Swap active window with the next window
            move_active(ctx, 1)
        elseif command == "swapprev" then
            -- Swap active window with the previous window
            move_active(ctx, -1)
        elseif command == "rotate" then
            -- Rotate all split directions (h→v, v→h) for all windows
            for k, v in pairs(state.split) do
                state.split[k] = v == "v" and "h" or "v"
            end
            state.default_split = state.default_split == "v" and "h" or "v"
        else
            return "manual: expected splith, splitv, splittoggle, promote, swapnext, swapprev, or rotate"
        end

        return true
    end,
})