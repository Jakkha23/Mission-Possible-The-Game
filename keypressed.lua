
function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       love.event.quit()
    elseif key == "tab" then
        love.load()
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
		print("" ..AMMUNITION)
    end
    if WEAPON<0 then
        WEAPON = WEAPON +1
    end
    if WEAPON == 0 then
        AMMUNITION = 0
        FULL_AMMUNITION = 0
		PlayerIMG = love.graphics.newImage("pictures/protagonist_noweapon_2x.png")
    end
    if WEAPON == 1 then
        AMMUNITION = 10
        FULL_AMMUNITION = 10
        Weapon1equip:play()
        Gunshot = Weapon1shot
		PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon1_2x.png")
    end
	if WEAPON == 2 then
		AMMUNITION = 25
        FULL_AMMUNITION = 25
        Weapon2equip:play()
        Gunshot = Weapon2shot
		PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon2_2x.png")
	end
	if WEAPON == 3 then
		AMMUNITION = 30
        FULL_AMMUNITION = 30
        Weapon3equip:play()
        Gunshot = Weapon3shot
		PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon3_2x.png")
	end
	if WEAPON == 4 then
		AMMUNITION = 8
    	FULL_AMMUNITION = 8
        if Soundplayed ~= 4 then
            Weapon4equip:play()
            Soundplayed = 4
        end
        Gunshot = Weapon4shot
		PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon4_2x.png")
	end
	if WEAPON == 5 then
		AMMUNITION = 10
        FULL_AMMUNITION = 10
        Weapon5equip:play()
        Gunshot = Weapon5shot
		PlayerIMG = love.graphics.newImage("pictures/protagonist_weapon5_2x.png")
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
