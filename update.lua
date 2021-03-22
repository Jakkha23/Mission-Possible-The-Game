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
	if love.mouse.isDown(1) then -- add firerate for different weapons
		if WEAPON >0 then
				AMMUNITION = AMMUNITION -1
	print("firing!")
	Gunshot:play()
		end
end
	if playerx <= 0 then
		playerx = 0
	end
	if playerx >= (love.graphics.getWidth() - 40) then
		playerx = (love.graphics.getWidth() - 40)
	end
	if playery <= 0 then
		playery = 0
	end
	if playery >= (love.graphics.getHeight() - 40) then
		playery = (love.graphics.getHeight() - 40)
	end
	local mousex = love.mouse.getX( )
	local mousey = love.mouse.getY( )
	angle = math.atan2(mousey - playery, mousex - playerx)
end