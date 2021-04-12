--Bullet and Enemy
function BBEE(x1, y1 , w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    y1 + h1 > y2
end

--Enemy and Player
function EEPP(x1, y1 , w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
    x1 + w1 > x2 and
    y1 < y2 + h2 and
    y1 + h1 > y2
end

--[[function EEPP2(Ex, Ey,Px, Py)
    if Ex == Px + 10 then
    Damaging = true
    elseif Ey == Py + 10 then
    Damaging = true
    elseif Ex == Px - 10 then
    Damaging = true
    elseif Ey == Py -10 then
    Damaging = true
    end
end
]] -- did not end up using