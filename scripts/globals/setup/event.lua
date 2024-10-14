-- 事件反应
---@param evtData {triggerUnit:number,sourceUnit:number,damage:"伤害值"}
event.reactRegister(eventKind.unitHurt, function(evtData)
    local str = math.format(evtData.damage, 0)
    local u = evtData.triggerUnit
    local x, y = J.GetUnitX(u), J.GetUnitY(u)
    ttg.display(x, y, str, 0.5)
end)