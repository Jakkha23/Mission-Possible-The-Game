function love.load() --startup
    Background = love.graphics.newImage("pictures/background.png")
    PlayerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
    EnemyIMG = love.graphics.newImage("pictures/enemy.png")
    CursorIMG = love.graphics.newImage("pictures/crosshair.png")
    BulletIMG = love.graphics.newImage("pictures/bullet.png")
    love.mouse.setVisible(false)
    love.mouse.setGrabbed(true)
    PlayerX = 300
    PlayerY = 300
    EnemyX = 500
    EnemyY = 500
    Speed = 100
    Weapon = 0
    Ammunition = 0
    BulletSpeed = 1000
    Timer = 0
    CoolDown = 0
    PlayerHeight = 85
    PlayerWidth = 90
    EnemyHeight = 85
    EnemyWidth = 90
    MouseX = 0
    MouseY = 0
    love.window.setMode(0,0)
    Speed = 100
    end
    

function love.keypressed(key, scancode, isrepeat) --keybinds
    if key == "escape" then
        love.event.quit()
    end
    if key == "g" then --prints number of equiped weapon
        print(Weapon)
    end
    if key == "e" then
        if Weapon <5 then
            Weapon = Weapon + 1
            print("You have equiped weapon number:" ..Weapon)
        end
        GunCheck()
    end
    if key == "q" then
        if Weapon > 0 then
            Weapon = Weapon - 1
            print("You have equiped weapon number:" .. Weapon)
        end
        GunCheck()
    end
    if key == "r" then
        GunReload:play()
        Ammunition = 10
    end
end

function GunCheck() --checks equiped weapon and assigns, image, sound and ammunition
    if Weapon == 0 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
    elseif Weapon == 1 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon1_2x.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon1_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon1equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon1reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.55
        BulletSpeed = 900
        GunEquip:play()
        Ammunition = 10
    elseif Weapon == 2 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon2_2x.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon2_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon2equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon2reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.1
        GunEquip:play()
        Ammunition = 30
    elseif Weapon == 3 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon3_2x.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon3_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon3equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon3reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 0.2
        GunEquip:play()
        Ammunition = 30
    elseif Weapon == 4 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon4_2x.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon4_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon4equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon4reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet.png")
        CoolDown = 1.1
        BulletSpeed = 700
        GunEquip:play()
        Ammunition = 8

    elseif Weapon == 5 then
        PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon5_2x.png")
        Gunshot = love.audio.newSource("music&soundeffects/weapon5_soundeffect.mp3", "static")
        GunEquip = love.audio.newSource("music&soundeffects/weapon5equip.mp3", "static")
        GunReload = love.audio.newSource("music&soundeffects/weapon5reload.mp3", "static")
        BulletIMG = love.graphics.newImage("pictures/bullet5.png")
        CoolDown = 1.2
        BulletSpeed = 2000
        GunEquip:play()
        Ammunition = 5
    end
end


function love.mousepressed(x, y, button, istouch, presses)
    if button == (1) and OutOfAmmo == false then
        if Weapon == 1 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        elseif Weapon == 4 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        elseif Weapon == 5 then
            if CanShoot == true then
                SingleShot()
                CanShoot = false
            end
        end
    end
end
    
function SingleShot()
    print ("mousebutton1pressed")
    Ammunition = Ammunition - 1
    if Ammunition == 0 then
        OutOfAmmo = true
    end
    print (Ammunition)
    if Weapon > 0 then
        Gunshot:play()
        CanShoot = false
    end
    BulletX = PlayerX
    BulletY = PlayerY
    BulletWidth = 10
    BulletHeight = 10
    AngleB = (math.atan2(MouseY - PlayerY, MouseX - PlayerX)) --Bullet is now angled correctly (radians)
    BulletFired = true
end

function love.draw()
    for i = 0, love.graphics.getWidth() / Background:getWidth() do
        for j = 0, love.graphics.getHeight() / Background:getHeight() do
            love.graphics.draw(Background, i * Background:getWidth(), j * Background:getHeight())
        end
    end
    love.graphics.draw(PlayerIMG, PlayerX, PlayerY, Angle, 1, 1, PlayerWidth, PlayerHeight)
    love.graphics.draw(EnemyIMG, EnemyX, EnemyY, Angle2, 1, 1, EnemyWidth, EnemyHeight)
    love.graphics.draw(CursorIMG, love.mouse.getX()-7, love.mouse.getY()-7)

    --testing bullet stuff
    if BulletFired == true then
        love.graphics.draw(BulletIMG, BulletX, BulletY, AngleB, 1, 1, BulletWidth, BulletHeight)
    end
end

function love.update(dt)
	if love.keyboard.isDown("d") then
		PlayerX = PlayerX + (Speed * dt)
	end
	if love.keyboard.isDown("a") then
		PlayerX = PlayerX - (Speed * dt)
	end
	if love.keyboard.isDown("w") then
		PlayerY = PlayerY - (Speed * dt)
	end
	if love.keyboard.isDown("s") then
		PlayerY = PlayerY + (Speed * dt)
    end
    if PlayerX <= 10 then
		PlayerX = 10
	end
	if PlayerX >= (love.graphics.getWidth() - 10) then
		PlayerX = (love.graphics.getWidth() - 10)
	end
	if PlayerY <= 10 then
		PlayerY = 10
	end
	if PlayerY >= (love.graphics.getHeight() - 10) then
		PlayerY = (love.graphics.getHeight() - 10)
    end
    MouseX = love.mouse.getX()
    MouseY = love.mouse.getY()
    Angle = math.atan2(MouseY - PlayerY, MouseX - PlayerX)
    Angle2 = math.atan2(PlayerY - EnemyY, PlayerX - EnemyX)

    --bullet stuff
    if Timer > CoolDown then
            CanShoot = true
            Timer = 0
        end
        print(Timer)
    Timer = Timer + dt
    if BulletFired == true then
        
        
        BulletX = BulletX + (math.cos(AngleB) * BulletSpeed * dt) --math.cos and math.sin works in radians not degrees
        BulletY = BulletY + (math.sin(AngleB) * BulletSpeed * dt)
    end
    
end
