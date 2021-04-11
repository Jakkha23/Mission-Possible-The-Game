require("update")
require("keybinds")
require("collision")

function love.load() --startup
    Background = love.graphics.newImage("pictures/background.png")
    PlayerIMG = love.graphics.newImage("pictures/heronoweapon.png")
    EnemyIMG = love.graphics.newImage("pictures/enemy.png")
    CursorIMG = love.graphics.newImage("pictures/crosshair.png")
    BulletIMG = love.graphics.newImage("pictures/bullet.png")
    
    love.mouse.setVisible(false)
    love.mouse.setGrabbed(true)
    love.window.setMode(0,0) --fullscreen

--player
    Player = {}
    Player.X = 300
    Player.Y = 300
    Player.Height = 50
    Player.Width = 50
    Player.Speed = 100
    Player.Health = 100
--Weapon
    Bullets = {}

    Bullet = {}
    Bullet.X = 0
    Bullet.Y = 0
    Bullet.Height = 5
    Bullet.Width = 5
    Bullet.Speed = 2000

    Weapon = 0
    Ammunition = 10
    Timer = 0.55
    CoolDown = 0.55



--Enemies
    Enemies = {}
--Mouse
    MouseX = 0
    MouseY = 0

    math.randomseed(os.time())
    Score = 0
    HighScore = 0
    Difficulty = 0.01
    StartTime  = love.timer.getTime() + 0
    UnlockedWeapon = 1
end


    
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


function love.mousepressed(x, y, button, istouch, presses)
    if button == (1)then
        if Weapon == 1 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        elseif Weapon == 2 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        elseif Weapon == 3 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        end
    end
end


function SingleShot()
    print ("Firing!")
    Ammunition = Ammunition - 1
    print (Ammunition)
    if Weapon > 0 then
        Gunshot:play()
        CanShoot = false
    end
    Bullet.X = Player.X
    Bullet.Y = Player.Y
    AngleB = (math.atan2(MouseY - Player.Y, MouseX - Player.X)) --Bullet is now angled correctly (radians)
    BulletFired = true
end



function love.draw()
    for i = 0, love.graphics.getWidth() / Background:getWidth() do --repeats background
        for j = 0, love.graphics.getHeight() / Background:getHeight() do
            love.graphics.draw(Background, i * Background:getWidth(), j * Background:getHeight())
        end
    end
    love.graphics.draw(PlayerIMG, Player.X, Player.Y, Angle, 1, 1, Player.Width, Player.Height)

    love.graphics.draw(CursorIMG, love.mouse.getX()-7, love.mouse.getY()-7)

    --bullet angle
   --[[ for i=1, #Bullets, 1 do
        local Bullet = Bullets[i]
        love.graphics.draw(BulletIMG, Bullet.X, Bullet.Y, AngleB, 1, 1, Bullet.Width, Bullet.Height)
    end]]
    if BulletFired == true then
        love.graphics.draw(BulletIMG, Bullet.X, Bullet.Y, AngleB, 1, 1, Bullet.Width, Bullet.Height)
    end 

    for i=1, #Enemies, 1 do
        --Bullet Collision
        local Enemy = Enemies[i]
    love.graphics.draw(EnemyIMG, Enemy.X, Enemy.Y, Enemy.Angle, 1, 1, Enemy.Width, Enemy.Height)
    end
    love.graphics.setNewFont(20)
    love.graphics.print("Score: " .. Score, 20, 20)
    love.graphics.print("Health: " .. Player.Health, love.graphics.getWidth() - 120, 20)
    love.graphics.print("Weapon: " .. Weapon, love.graphics.getWidth() - 120, 40)
    love.graphics.print("Ammunition" .. Ammunition, love.graphics.getWidth() - 120, 60)
    love.graphics.print("Unlocked Weapons:  1,", 20, 40)
    love.graphics.print("Unlock Weapons by earning score", 20, 60)

    --blood stuff
    --if Bullet.X == Enemy.X +- 10 then

        
    --end
    if Player.Health < 0 then
        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", 0,0, love.graphics.getWidth(), love.graphics.getHeight())
        love.graphics.setColor(1,1,1)
        love.graphics.print("GAME OVER", 100, 100)
        love.graphics.print("Score: " .. Score, 100, 120)
        
        love.graphics.print("Press 'tab' to restart, Press 'Esc' to quit.", 100, 140)
    end

    if UnlockedWeapon >= 2 then
        love.graphics.setNewFont(20)
        love.graphics.print("2,", 260, 40)
        love.graphics.print("switch weapons with Q/E", 20, 80)
    end
    if UnlockedWeapon >= 3 then
        love.graphics.setNewFont(20)
        love.graphics.print("3,", 290, 40)
    end
end
