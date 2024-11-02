local damageFlow = Flow("damage")

--- 伤害为0中止
damageFlow:abort(function(data)
    return data.damage <= 0
end)

local tgr = J.CreateTrigger()
J.HandleRef(tgr)
J.TriggerAddCondition(tgr, J.Condition(function()
    local evtData = {
        triggerUnit = J.GetTriggerUnit(),
        sourceUnit = J.GetEventDamageSource(),
        damage = J.GetEventDamage(),
    }
    dump(evtData)
    damageFlow:run(evtData)
end))

function registerUnitDamaged(whichUnit)
    if J.GetUnitAbilityLevel(whichUnit, LK_SLK_ID_ABILITY_LOCUST) <= 0 then
        J.TriggerRegisterUnitEvent(tgr, whichUnit, EVENT_UNIT_DAMAGED)
    end
    return false
end