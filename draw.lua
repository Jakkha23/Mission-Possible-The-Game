function love.draw()
	love.graphics.print("MISSION POSSIBLE - THE GAME", love.graphics.getWidth()- love.graphics.getWidth()/2, 0)
	love.graphics.line(love.graphics.getWidth() - love.graphics.getWidth()/20, 0, love.graphics.getWidth() - love.graphics.getWidth()/20, love.graphics.getHeight())
	love.graphics.line(love.graphics.getWidth()/20, 0,love.graphics.getWidth()/20, love.graphics.getHeight())
	love.graphics.draw(PlayerIMG, playerx, playery, angle, 1, 1, playerWidth, playerHeight)
end


function Bullet()
	function love.draw()
	love.graphics.print("MISSION POSSIBLE - THE GAME", love.graphics.getWidth()- love.graphics.getWidth()/2, 0)
	love.graphics.line(love.graphics.getWidth() - love.graphics.getWidth()/20, 0, love.graphics.getWidth() - love.graphics.getWidth()/20, love.graphics.getHeight())
	love.graphics.line(love.graphics.getWidth()/20, 0,love.graphics.getWidth()/20, love.graphics.getHeight())
	love.graphics.draw(PlayerIMG, playerx, playery, angle, 1, 1, playerWidth, playerHeight)
	love.graphics.line(playerx, playery, Mousex, Mousey)
	end
end

