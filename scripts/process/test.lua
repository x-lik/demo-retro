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
    
    local id1 = slk.n2i("新圣骑士")
    local id2 = slk.n2i("新死亡骑士")
    bubble.u1 = J.CreateUnit(Player(1):handle(), J.C2I(id1), 0, 0, 270)
    J.HandleRef(bubble.u1)
    bubble.u2 = J.CreateUnit(Player(2):handle(), J.C2I(id2), 0, 0, 270)
    J.HandleRef(bubble.u2)
    
    -- 注册原始伤害事件
    registerUnitDamaged(bubble.u1)
    registerUnitDamaged(bubble.u2)
    
    local it1 = slk.n2i("新铁剑")
    local it2 = slk.n2i("新铁盾")
    bubble.it1 = J.CreateItem(J.C2I(it1), 0, 0, 270)
    J.HandleRef(bubble.it1)
    J.UnitAddItem(bubble.u1, bubble.it1)
    bubble.it2 = J.CreateItem(J.C2I(it2), 0, 0, 270)
    J.HandleRef(bubble.it2)
    J.UnitAddItem(bubble.u2, bubble.it2)
end

function process:onOver()
    sound.bgmStop()
    local bubble = self:bubble()
    J.HandleUnRef(bubble.u1)
    J.RemoveUnit(bubble.u1)
    J.HandleUnRef(bubble.u2)
    J.RemoveUnit(bubble.u2)
    J.HandleUnRef(bubble.it1)
    J.RemoveItem(bubble.it1)
    J.HandleUnRef(bubble.it2)
    J.RemoveItem(bubble.it2)
end
