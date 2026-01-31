scaling = 1
selected_colour = Color.new(115, 136, 145)

dofile("app0:/game.lua")

function drawSettings(selected)

    drawBackground()

    local scaling_x = 300
    local scaling_y = 108
    local option2_x = 300
    local option2_y =  108 + 20 + Graphics.getImageHeight(scaling)


    --because settings
    local background_colour = Color.new(115, 136, 145, 200)
    Graphics.fillRect(280, 680, 58, 486, background_colour)
    
    --scaling
    if (selected == scaling) then
        selectImage(scaling, scaling_x, scaling_y)
    else
        Graphics.drawImage(scaling_x, scaling_y, scaling)
    end

    --option2
    if (selected == option2) then
        selectImage(option2, option2_x, option2_y)
    else
        Graphics.drawImage(option2_x, option2_y, option2)
    end

end

function selectImage (img, x, y)

    Graphics.fillRect(x,x + Graphics.getImageWidth(img), y, y + Graphics.getImageHeight(img), selected_colour)
    Graphics.drawImage(x, y, img)
end



function settingsMenu ()
    -- draw grey settings rectangle
    Graphics.initBlend()


    scaling = Graphics.loadImage("app0:/files/scaling.png")
    option2 = Graphics.loadImage("app0:/files/option2.png")

    local selected = scaling

    drawSettings(selected)


    Graphics.termBlend()--ended drawing and sended to the buffer
    Screen.flip()--displaying graphics



    -- selection logic


    pad = Controls.read()

    while (not (Controls.check (pad, SCE_CTRL_CIRCLE))) do 
        pad = Controls.read()
        if (Controls.check (pad, SCE_CTRL_DOWN) and selected == scaling) then
            selected = option2
            Graphics.initBlend()
            drawSettings(option2)
            Graphics.termBlend()--ended drawing and sended to the buffer
            Screen.flip()--displaying graphics

        elseif (Controls.check (pad, SCE_CTRL_UP) and selected == option2) then
            selected = scaling
            Graphics.initBlend()
            drawSettings(scaling)
            Graphics.termBlend()--ended drawing and sended to the buffer
            Screen.flip()--displaying graphics

        else
        end

    end


    Graphics.freeImage(scaling)
    Graphics.freeImage(option2)

end

function drawMainMenu (play, settings)


    Graphics.initBlend()
    drawBackground()

    --play button
    local play_colour = Color.new(76, 175, 80)
    Graphics.fillRect(scaling * 50, scaling * 150, scaling * 464, scaling * 514, play_colour)
    Graphics.drawImage(50,464, play)

    --settings buttom
    local settings_colour = Color.new(255, 235, 59)
    Graphics.fillRect(scaling * 200, scaling * 300, scaling * 464, scaling * 514, settings_colour)
    Graphics.drawImage(200,464, settings)


    Graphics.termBlend()--ended drawing and sended to the buffer
    Screen.flip()--displaying graphics

end


function mainMenu ()

    play = Graphics.loadImage("app0:/files/play.png")
    settings = Graphics.loadImage("app0:/files/settings.png")

    drawMainMenu(play, settings)

    pad = Controls.read()

    while (not (Controls.check (pad, SCE_CTRL_CROSS))) do 
        pad = Controls.read()
        if Controls.check (pad, SCE_CTRL_SQUARE) then
            settingsMenu()
            drawMainMenu(play, settings)
        end
    end

    Graphics.freeImage (play)
    Graphics.freeImage (settings)
end
mainMenu()
playGame()