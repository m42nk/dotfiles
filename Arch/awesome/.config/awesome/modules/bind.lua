local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local keygroups = {}
local alias ={
    ["LMB"]=1,
    ["MMB"]=2,
    ["RMB"]=3,
    ["MWU"]=4,
    ["MWD"]=5,
    ["Super"]="Mod4",
}
local name = {
    "LMB",
    "MMB",
    "RMB",
    "MWU",
    "MWD",
}
function split(str, sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    str:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end
function map(tbl, f) local t = {} for k,v in ipairs(tbl) do t[k] = f(v) end return t end
local function FixKey(bind) return alias[bind] or bind end
local function FixBinding(bind)
    local obind = bind
    if type(bind) == "string" then
        bind = split(bind,"+") 
    end
    bind = map(bind, FixKey)
    return bind
end
local function FixDoc(doc)
    if type(doc) == "string" then
        local p1, p2 = doc:match("([^:]*): *(.*)")
        doc = {group=p1, description=p2}
    end
    return doc
end
local function Button(mods, button, action, doc)
    local buttonname = name[button] or button
    if doc then
        hotkeys_popup.add_hotkeys({
            [doc.group] = {{
                modifiers = mods,
                keys = {
                    [buttonname] = doc.description
                }
            }}
        })
    end
    return awful.button(mods, button, action)
end

function FixSet(set)
    if set == nil then set = false end
    if set == false then set = "key" end
    if set == true then set = "button" end
    return set
end

function GetGroup(group, set)
    set = FixSet(set)
    if not keygroups[group] then
        keygroups[group] = {}
        keygroups[group]["key"] = gears.table.join()
        keygroups[group]["button"] = gears.table.join()
    end
    if not keygroups[group][set] then
        keygroups[group]["key"][set] = gears.table.join()
    end
    return keygroups[group][set]
end

function SetGroup(group, bind, set)
    set = FixSet(set)
    local grp = GetGroup(group, set)
    table.insert(grp, bind)
end

function BindToGroup(group, rbindings, action, doc)
    local bindings = FixBinding(rbindings)
    local documentation = FixDoc(doc)
    local binding = table.remove(bindings)
    local is_mouse = type(binding) == "number"
    local bind = {bindings, binding, action, documentation}
    SetGroup(group, bind, is_mouse)
    return bind
end

local module = {}

--- Add key alias.
-- @param string source The source key (eg: "Super").
-- @param string target The target key (eg: "Mod4").
function module.alias(source, target)
    alias[source] = target
end

--- Add a key binding to a group.
-- @param string group The group name to add binding (eg: "root").
-- @param string binding The key combination in string form (eg: "Mod4+Control+r").
-- @param string action The function to execute (eg: awesome.restart).
-- @param string documentation The documentation to display (eg: "Awesome: reload awesome").
function module.set(group, binding, action, documentation)
    if type(group) ~= "string" then
        documentation = action
        action = binding
        binding = group
        group = "any"
    end
    return BindToGroup(group, binding, action, documentation)
end

--- Bind some variables to a function.
-- @param string func The function to use (eg: awful.client.floating.toggle).
-- @param any ... The parameters to bind to the function (eg: client).
-- @return The function with parameters bound.
function module.bind(func, ...)
    local object = {...}
    return function(...)
        return func(table.unpack(object), ...)
    end
end

--- Get a group of bindings.
-- @param string group The group to use (eg: "root").
-- @param string set The set to use between "key" and "button" (eg: "key").
-- @param any ... The parameters to bind to all functions of the set (eg: client).
-- @return The group of bindings.
function module.get(group, set, ...)
    local group = GetGroup(group, set)
    local new_group = gears.table.join()

    for _, def in ipairs(group) do
        local new_function = def[3]
        if ... then
            new_function = module.bind(def[3], ...)
        end
        local is_mouse = type(def[2]) == "number"
        local bind = is_mouse 
            and Button(def[1], def[2], new_function, def[4])
            or awful.key(def[1], def[2], new_function, def[4])
        def[4] = nil
        new_group = gears.table.join(new_group, bind)
    end
    return new_group
end

return module
