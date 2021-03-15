function love.load( )
	playerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
	playerx = 300
	playery = 300
	speed = 80
	playerHeight = 85
	playerWidth = 90
	WEAPON = 0
	AMMUNITION = 0
	FULL_AMMUNITION = 0
	width = love.graphics.getWidth
end
--window size
love.window.setMode(0,0)

--music
music = love.audio.newSource("Bjorn Lynne - Secret Agent.mp3", "stream")
music:play()

function love.draw()
	love.graphics.print("MISSION POSSIBLE - THE GAME", 200, 0)
	love.graphics.print("This is your character.\nMove him around with W,A,S,D .", 610,12)
	love.graphics.print("switch weapons with \nq/e or 1-9", 610,50)
	love.graphics.print("shoot with 'space' \nreload by pressing 'r' ", 610, 90)
	love.graphics.line(600, 0, 600, 600)
	love.graphics.draw(playerIMG, playerx, playery, angle, 1, 1, playerWidth, playerHeight)
	
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    elseif key == "tab" then
        PLAYER_X = 10
        PLAYER_Y = 40
        WEAPON = 0
        print("game was restarted")
    elseif key == "0" then
        WEAPON = 0
    elseif key == "1" then
        WEAPON = 1
	elseif key == "2" then
		WEAPON = 2
	elseif key == "3" then
		WEAPON = 3
	elseif key == "4" then
		WEAPON = 4
	elseif key == "5" then
		WEAPON = 5
    elseif key == "q" then
        WEAPON = WEAPON -1
    elseif key == "e" then
        WEAPON = WEAPON +1
    elseif key == "r" then
		print("weapon is realoading...")
        AMMUNITION = FULL_AMMUNITION
        print("weapon fully loaded")
	elseif key == "space" then
		print("firing! bullets= ".. AMMUNITION .. "")
	end
    if WEAPON<0 then
        WEAPON = WEAPON +1
    end
    if WEAPON == 0 then
        AMMUNITION = 0
        FULL_AMMUNITION = 0
		playerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
    end
    if WEAPON == 1 then
        AMMUNITION = 10
        FULL_AMMUNITION = 10
		playerIMG = love.graphics.newImage("pictures/protagonist_weapon1_2x.png")
    end
	if WEAPON == 2 then
		AMMUNITION = 25
        FULL_AMMUNITION = 25
		playerIMG = love.graphics.newImage("pictures/protagonist_weapon2_2x.png")
	end
	if WEAPON == 3 then
		AMMUNITION = 30
        FULL_AMMUNITION = 30
		playerIMG = love.graphics.newImage("pictures/protagonist_weapon3_2x.png")
	end
	if WEAPON == 4 then
		AMMUNITION = 8
    	FULL_AMMUNITION = 8
		playerIMG = love.graphics.newImage("pictures/protagonist_weapon4_2x.png")
	end
	if WEAPON == 5 then
		AMMUNITION = 10
        FULL_AMMUNITION = 10
		playerIMG = love.graphics.newImage("pictures/protagonist_weapon5_2x.png")
	end
    if WEAPON>5 then -- change if more wapons are added
    WEAPON = WEAPON -1  
    end
    if WEAPON >= 1 and AMMUNITION<= 0 then
        print("out of ammo")
    if AMMUNITION<0 then
        AMMUNITION = AMMUNITION +1
    end
    end
end

function love.update(dt)
	if love.keyboard.isDown("d") then
		playerx = playerx + (speed * dt)
	end
	if love.keyboard.isDown("a") then
		playerx = playerx - (speed * dt)
	end
	if love.keyboard.isDown("w") then
		playery = playery - (speed * dt)
	end
	if love.keyboard.isDown("s") then
		playery = playery + (speed * dt)
	end
	if love.keypressed == "space" then
        AMMUNITION = AMMUNITION -1
    end
	if playerx <= 0 then
		playerx = 0
	end
	if playerx >= (600 - playerWidth) then
		playerx = (600 - playerWidth)
	end
	if playery <= 0 then
		playery = 0
	end
	if playery >= (600 - playerHeight) then
		playery = (600 - playerHeight)
	end
	local mousex = love.mouse.getX( )
	local mousey = love.mouse.getY( )
	angle = math.atan2(mousey - playery, mousex - playerx)
end
