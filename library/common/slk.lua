--- 根据名称创建单位
---@param whichPlayer Player
---@param name string
---@param x number
---@param y number
---@param facing number
---@return number
function slk.createUnit(whichPlayer, name, x, y, facing)
    local u = J.CreateUnit(whichPlayer:handle(), J.C2I(slk.n2i(name)), x, y, facing)
    J.HandleRef(u)
    return u
end

--- 注销单位
---@param whichUnit number
---@return void
function slk.removeUnit(whichUnit)
    J.HandleUnRef(whichUnit)
    J.RemoveUnit(whichUnit)
end

--- 根据名称创建物品
---@param name string
---@param x number
---@param y number
---@param facing number
---@return number
function slk.createItem(name, x, y)
    local it = J.CreateItem(J.C2I(slk.n2i(name)), x, y)
    J.HandleRef(it)
    return it
end

--- 注销物品
---@param whichItem number
---@return void
function slk.removeItem(whichItem)
    J.HandleUnRef(whichItem)
    J.RemoveUnit(whichItem)
end
