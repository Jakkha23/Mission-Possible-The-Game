function love.draw()
	love.graphics.print("MISSION POSSIBLE - THE GAME", 200, 0)
	love.graphics.print("This is your character.\nMove him around with W,A,S,D .", 610,12)
	love.graphics.print("switch weapons with \nq/e or 1-9", 610,50)
	love.graphics.print("shoot with the left mouse button \nreload by pressing 'r' ", 610, 90)
	love.graphics.line(600, 0, 600, 600)
	love.graphics.draw(playerIMG, playerx, playery, angle, 1, 1, playerWidth, playerHeight)
	
end
