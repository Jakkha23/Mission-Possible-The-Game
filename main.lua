require("update")
require("keybinds")
require("collision")

function love.load() --startup
    Background = love.graphics.newImage("pictures/background.png")
    PlayerIMG = love.graphics.newImage("pictures/heronoweapon.png")
    EnemyIMG = love.graphics.newImage("pictures/enemy.png")
    CursorIMG = love.graphics.newImage("pictures/crosshair.png")
    BulletIMG = love.graphics.newImage("pictures/bullet.png")
    Music = love.audio.newSource("music&soundeffects/Bjorn Lynne - Secret Agent.mp3", "static")
    Music:play()
    
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

require("gunproperties")
    



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
    love.graphics.print("Health: " .. Player.Health, love.graphics.getWidth() - 170, 20)
    love.graphics.print("Weapon: " .. Weapon, love.graphics.getWidth() - 170, 40)
    love.graphics.print("Ammunition: " .. Ammunition, love.graphics.getWidth() - 170, 60)
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
