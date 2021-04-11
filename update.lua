function love.update(dt)
        if love.keyboard.isDown("d") then
		Player.X = Player.X + (Player.Speed * dt)
	end
	if love.keyboard.isDown("a") then
		Player.X = Player.X - (Player.Speed * dt)
	end
	if love.keyboard.isDown("w") then
		Player.Y = Player.Y - (Player.Speed * dt)
	end
	if love.keyboard.isDown("s") then
		Player.Y = Player.Y + (Player.Speed * dt)
    end
    if love.mouse.isDown(1) then
        Firing = true
        print("b")
    end

    if Player.X <= 10 then --border
		Player.X = 10
	end
	if Player.X >= (love.graphics.getWidth() - 10) then --border
		Player.X = (love.graphics.getWidth() - 10)
	end
	if Player.Y <= 10 then --border
		Player.Y = 10
	end
	if Player.Y >= (love.graphics.getHeight() - 10) then --border
		Player.Y = (love.graphics.getHeight() - 10)
    end


    --Mouse Position and player angle
    MouseX = love.mouse.getX()
    MouseY = love.mouse.getY()
    Angle = math.atan2(MouseY - Player.Y, MouseX - Player.X)
    

    --Bullet timer and bullet movement
    if Timer > CoolDown then
        CanShoot = true
        Timer = 0
    end
    Timer = Timer + dt
    
    if BulletFired == true then

        Bullet.X = Bullet.X + (math.cos(AngleB) * Bullet.Speed * dt) --math.cos and math.sin works in radians not degrees
        Bullet.Y = Bullet.Y + (math.sin(AngleB) * Bullet.Speed * dt)
    end

    --[[for i=#Bullets, 1, -1 do
        local Bullet = Bullets[i]
        Bullet.X = Bullet.X + (math.cos(AngleB) * Bullet.Speed * dt) --math.cos and math.sin works in radians not degrees
        Bullet.Y = Bullet.Y + (math.sin(AngleB) * Bullet.Speed * dt)
    end]]
    

    for i=#Enemies, 1, -1 do
        --Bullet Collision
        local Enemy = Enemies[i]
        if BBEE(Bullet.X, Bullet.Y, Bullet.Width, Bullet.Height, Enemy.X, Enemy.Y, 20, 20) then
            print("hit")
            table.remove(Enemies, i)
            table.remove(Bullets, i)
            Score = Score + 1
            print(Score)
            if Score > HighScore then
                HighScore = HighScore + 1
            end
        end
        --Enemy Collision
        Player.CollideWidth = 20
        Player.CollideHeight = 20
        Enemy.CollideWidth = 20
        Enemy.CollideHeight = 20


        if EEPP(Enemy.X, Enemy.Y, Enemy.CollideWidth, Enemy.CollideHeight, Player.X, Player.Y, Player.CollideWidth, Player.CollideHeight) then
            Player.Health = Player.Health - (10*dt)
        end
        --Enemy angle and chase
        Enemy.Angle = math.atan2(Player.Y - Enemy.Y, Player.X - Enemy.X)
        Enemy.X = Enemy.X + (math.cos(Enemy.Angle) * Enemy.Speed * dt)
        Enemy.Y = Enemy.Y + (math.sin(Enemy.Angle) * Enemy.Speed * dt)

    end
    
    
    Difficulty = 0.01 +((love.timer.getTime() - StartTime) / 1000) 
    print(Difficulty)

    --Spawns zombies
    if math.random() < Difficulty then
        local Enemy = {}
        Enemy.X = math.random(0, love.graphics.getWidth())
        Enemy.Y = math.random(0, love.graphics.getHeight())
        Enemy.Height = 85
        Enemy.Width = 90
        Enemy.Speed = 30
        Enemy.Angle = 0
        table.insert(Enemies, Enemy)
    end

    if Score > 30 then
        UnlockedWeapon = 2
    end
    if Score > 60 then
        UnlockedWeapon = 3
    end
end