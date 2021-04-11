function love.keypressed(key, scancode, isrepeat) --keybinds
    if key == "escape" then
        love.event.quit()
    end
    if key == "g" then --prints number of equiped weapon
        print(Weapon)
    end
    if key == "e" then
        if Weapon < UnlockedWeapon then
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
    if key == "tab" then
        love.load()
    end
end
