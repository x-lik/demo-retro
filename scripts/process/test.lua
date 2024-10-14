local process = Process("test")

function process:onStart()
    
    print("Hello, XLIK!")
    echo("你好，XLIK！")
    
    --- bgm 播放
    sound.bgm("xlik")
    time.setTimeout(20, function()
        sound.bgm("ArthasTheme")
    end)
    
    --- 双英对打
    local bubble = self:bubble()
    
    bubble.u1 = slk.createUnit(Player(1), "新圣骑士", 0, 0, 270)
    bubble.u2 = slk.createUnit(Player(2), "新死亡骑士", 0, 0, 270)
    -- 注册原始伤害事件
    registerUnitDamaged(bubble.u1)
    registerUnitDamaged(bubble.u2)
    
    bubble.it1 = slk.createItem("新铁剑", 0, 0)
    J.UnitAddItem(bubble.u1, bubble.it1)
    bubble.it2 = slk.createItem("新铁盾", 0, 0)
    J.UnitAddItem(bubble.u2, bubble.it2)
end

function process:onOver()
    sound.bgmStop()
    local bubble = self:bubble()
    slk.removeUnit(bubble.u1)
    slk.removeUnit(bubble.u2)
    slk.removeItem(bubble.it1)
    slk.removeItem(bubble.it2)
end
