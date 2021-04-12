function GunCheck() --checks equiped weapon and assigns, image, sound and ammunition

    if Weapon == 0 then
        PlayerIMG = love.graphics.newImage("pictures/heronoweapon.png")
    elseif Weapon == 1 then
        PlayerIMG = love.graphics.newImage("pictures/heroweapon1.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon1_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon1equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon1reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.55
        Bullet.Speed = 1000
        Bullet.Height = 10
        Bullet.Width = 10
        GunEquip:play()
        StartAmmunition = 10
    elseif Weapon == 4 then
        PlayerIMG = love.graphics.newImage("pictures/heroweapon2.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon2_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon2equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon2reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.1
        GunEquip:play()
        StartAmmunition = 30
    elseif Weapon == 5 then
        PlayerIMG = love.graphics.newImage("pictures/heroweapon3.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon3_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon3equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon3reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.2
        GunEquip:play()
        StartAmmunition = 30
    elseif Weapon == 2 then
        PlayerIMG = love.graphics.newImage("pictures/heroweapon4.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon4_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon4equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon4reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet4v2.png")
        CoolDown = 1.1
        Bullet.Speed = 1700
        Bullet.Width = 20
        Bullet.Height = 20
        GunEquip:play()
        StartAmmunition = 8
    elseif Weapon == 3 then
        PlayerIMG = love.graphics.newImage("pictures/heroweapon5.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon5_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon5equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon5reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet5.png")
        Bullet.Width = 25
        Bullet.Height = 25
        Bullet.Speed = 500
        CoolDown = 1.2
        GunEquip:play()
        StartAmmunition = 5
    end
end