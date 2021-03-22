function love.load()
	playerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
	playerx = 300
	playery = 300
	speed = 100
	Bulletspeed = 200
	playerHeight = 85
	playerWidth = 90
	WEAPON = 0
	AMMUNITION = 0
	FULL_AMMUNITION = 0
	Mousex = 0
	Mousey = 0
end

love.window.setMode(0,0) -- window is set to fullscreen

--music and sound
music = love.audio.newSource("music&soundeffects/Bjorn Lynne - Secret Agent.mp3", "stream")
music:play()
Weapon1shot = love.audio.newSource("music&soundeffects/weapon1_soundeffect.mp3", "static")
Weapon2shot = love.audio.newSource("music&soundeffects/weapon2_soundeffect.mp3", "static")
Weapon3shot = love.audio.newSource("music&soundeffects/weapon3_soundeffect.mp3", "static")
Weapon4shot = love.audio.newSource("music&soundeffects/weapon4_soundeffect.mp3", "static")
Weapon5shot = love.audio.newSource("music&soundeffects/weapon5_soundeffect.mp3", "static")
Weapon1equip = love.audio.newSource("music&soundeffects/Weapon1equip.mp3", "static")
Weapon2equip = love.audio.newSource("music&soundeffects/Weapon2equip.mp3", "static")
Weapon3equip = love.audio.newSource("music&soundeffects/Weapon3equip.mp3", "static")
Weapon4equip = love.audio.newSource("music&soundeffects/Weapon4equip.mp3", "static")
Weapon5equip = love.audio.newSource("music&soundeffects/Weapon5equip.mp3", "static")

require("draw") -- imports graphics

require("keypressed") -- imports if statements (contains keybinds)

require("update") --imports 'update' file