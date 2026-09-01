local state = {
    horizontal_splits = 3
}

local function debug(msg)
    local file = io.open("/tmp/hypr_layout_debug.log", "a")
    if file then
        file:write(os.date("%H:%M:%S") .. " - " .. tostring(msg) .. "\n")
        file:close()
    end
end

hl.layout.register("my3", {
    recalculate = function(ctx)
        local n = #ctx.targets
        if n == 0 then
            return
        end

        for i, target in ipairs(ctx.targets) do
            
            target:place(ctx:column(i, n))
        end
    end,
})