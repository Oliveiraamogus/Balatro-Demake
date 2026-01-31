background = Graphics.loadImage("app0:/files/background.png")
imageFile = Graphics.loadImage("app0:/files/objecto.jpg")

joystick_x = 0
joystick_y = 0
x = 0
y = 0




function drawBackground()
    Graphics.drawImage(0,0,background)

end


selected_colour = Color.new(115, 136, 145, 200)
menu_colour = Color.new(115, 136, 145, 240)
dofile("app0:/deck.lua")
deck = getDeck()
dofile("app0:/hands.lua")
hands = getHands()
play_deck = {}
discard_deck = {}
number_of_cards = 9 --normalmente 52
number_of_cards_left = 9 --normalmente 52
seed = 0
hand = {}
highlighted = nil
selected = {}
jockers = {}
handsize = 8 --normaly 8
discards = 3
default_hand_value = 4
nhands = 4
money = 4
blind = 1
ante = 1
score = 0


function drawNumber(x, y, colour, n)
    local number_str = tostring(n)
    local digits = {}
    for i in string.gmatch(number_str, "%d") do
        table.insert(digits, tonumber(i))
    end
    spacing = 15
    for i = 1, #digits do
        if (digits[i] == 1) then
            Graphics.fillRect(x+1, x + 8, y+2, y + 5, colour)
            Graphics.fillRect(x+5, x + 8, y, y + 23, colour)
            Graphics.fillRect(x, x + 13, y + 21, y + 23, colour)
        elseif (digits[i] == 2) then
            Graphics.fillRect(x+2, x + 10, y+1, y + 3, colour)
            Graphics.fillRect(x+3, x + 9, y, y, colour)
            Graphics.fillRect(x + 1, x + 3, y + 3, y + 5, colour)
            Graphics.fillRect(x + 9, x + 12, y + 3, y + 12, colour)
            Graphics.fillRect(x + 7, x + 10, y + 11, y + 14, colour)
            Graphics.fillRect(x + 5, x + 8, y + 13, y + 17, colour)
            Graphics.fillRect(x + 2, x + 6, y + 25, y + 23, colour)
            Graphics.fillRect(x, x + 1, y + 18, y + 23, colour)
            Graphics.fillRect(x + 7, x + 12, y + 20, y + 23, colour)
        elseif (digits[i] == 3) then
            Graphics.fillRect(x+3, x + 11, y, y + 4, colour)
            Graphics.fillRect(x+1, x + 4, y + 2, y + 6, colour)
            Graphics.fillRect(x + 10, x + 13, y + 2, y + 8, colour)
            Graphics.fillRect(x + 5, x + 11, y + 8, y + 13, colour)
            Graphics.fillRect(x + 10, x + 13, y + 10, y + 21, colour)
            Graphics.fillRect(x + 1, x + 4, y + 17, y + 20, colour)
            Graphics.fillRect(x + 3, x + 11, y + 19, y + 22, colour)
        elseif (digits[i] == 4) then
            Graphics.fillRect(x+2, x + 4, y, y + 12, colour)
            Graphics.fillRect(x+8, x + 11, y, y + 23, colour)
            Graphics.fillRect(x, x + 13, y + 21, y + 23, colour)
        elseif (digits[i] == 5) then
            Graphics.fillRect(x, x + 13, y, y + 4, colour)
            Graphics.fillRect(x, x + 4, y + 5, y + 12, colour)
            Graphics.fillRect(x + 5, x + 9, y + 12, y + 23, colour)
            Graphics.fillRect(x + 9, x + 11, y, y + 20, colour)
            Graphics.fillRect(x, x + 11, y + 18, y + 23, colour)
        elseif (digits[i] == 6) then
            Graphics.fillRect(x + 2, x + 11, y, y + 4, colour)
            Graphics.fillRect(x + 8, x + 12, y + 5, y + 6, colour)
            Graphics.fillRect(x, x + 3, y + 2, y + 20, colour)
            Graphics.fillRect(x + 9, x + 12, y, y + 21, colour)
            Graphics.fillRect(x + 4, x + 11, y + 8, y + 12, colour)
            Graphics.fillRect(x + 1, x + 11, y + 18, y + 22, colour)
        elseif (digits[i] == 7) then
        elseif (digits[i] == 8) then
        elseif (digits[i] == 9) then
        elseif (digits[i] == 0) then
        end
        x = x + spacing
    end
end

function drawPlayBackground ()
    drawBackground()
    --desenhar espaço cartas
    Graphics.fillRect(256, 256 + 542, 323, 323 + 120,selected_colour)

    --desenhar espaço info sobre blind
    Graphics.fillRect(0, 250, 0, 544, selected_colour)
    
    --desenhar espaço jockers
    Graphics.fillRect(260, 260 + 425, 32, 32 + 110, selected_colour)
end

function drawShopBackground ()

end

function drawHand()
    space_each_card = math.floor(542/handsize)

    for i = 1, handsize do


        if (hand[i] == nil) then

        elseif (hand[i] == highlighted and hand[i] == selected[i]) then
            Graphics.fillRect(256 + ((i - 1) * space_each_card) - 5, 256 + ((i - 1) * space_each_card) + 5 + 80, 172 - 5, 172 + 108 + 5, selected_colour)
            Graphics.drawImage(256 + ((i - 1) * space_each_card), 172, hand[i][4])
        elseif (hand[i] == highlighted) then
            Graphics.drawImage(256 + ((i - 1) * space_each_card), 280, hand[i][4])
        elseif (hand[i] == selected[i]) then
            Graphics.drawImage(256 + ((i - 1) * space_each_card), 172, hand[i][4])
        else
            Graphics.drawImage(256 + ((i - 1) * space_each_card), 323, hand[i][4])
        end
    end
end

function releaseHand()
    local card = nil
    for i = 1, handsize do
        card = card_to_image(hand[i])
        Graphics.freeImage(card)
    end
end

function drawRound() 
    drawPlayBackground()

    --hands, money, discrds, etc.
    Graphics.fillRect(44, 263, 209, 249, menu_colour)--score
    drawNumber(44 + 15, 263 + 5, Colour.new(255, 255, 255), score)
    Graphics.fillRect(44, 263, 255, 366, menu_colour)-- hand and chips x mult
    --chips
    -- x
    --mult
    Graphics.fillRect(44, 117, 398, 456, Colour.new(255, 76, 64))-- run info
    Graphics.fillRect(44, 117, 466, 546, Colour.new(255, 152, 0))--options
    Graphics.fillRect(129, 192, 398, 427, menu_colour)--hands
    drawNumber(147, 413, Colour.new(0, 147, 255), nhands)--number of hands
    Graphics.fillRect(129, 192, 495, 546, menu_colour)--ante
    --number of antes
    Graphics.fillRect(129, 263, 436, 488, menu_colour)--money
    --number of money
    Graphics.fillRect(199, 263, 495, 546, menu_colour)--round
    --round number
    Graphics.fillRect(199, 263, 436, 488, menu_colour)--discards
    --number of discards


    --missing draw for info like money, blind, nhands left...

end

function startGame ()
    --seed = math.random(999999)
    --math.randomseed(seed)
    
end

function getHand ()
    for i = 1, handsize do
        if(hand[i] == nil and number_of_cards_left ~= 0) then
            hand[i] = table.remove(play_deck, number_of_cards_left)
            number_of_cards_left = number_of_cards_left - 1
        end
    end
end

function selectHighlightedCard()
    selectedCount = 0
    for i = 1, handsize do
        if(selected[i] ~= nil) then
            selectedCount = selectedCount + 1
        end
    end
    for i = 1, handsize do
        if (highlighted == hand[i]) then
            if (selected[i] == highlighted) then
                selected[i] = nil
            elseif (selectedCount < 5) then
                selected[i] = hand[i]
            end
        end
    end

end

function playCards()
    --[[
    ->high card

    ->pair

    ->tree of a kind

    ->4 of a kind
    ->2 pair
    
    ->full house
    ->flush
    ->straight
    ->straight flush
    ->5 of a kind
    ->flush house
    ->flush five
    ]]

    local number_of_selected = 0
    local cards = {}
    for i = 1, handsize do
        if (selected[i] ~= nil ) then
            number_of_selected = number_of_selected + 1
            cards[number_of_selected] = selected[i]
        end
    end

    if (number_of_selected = 1) then
        --highcard          mult     *  hand score + card score
        score = score + (hands[1][1] * (hands[1][2] + cards[1][1]))
    elseif (number_of_selected = 2) then
        --pair
        score = score + (hands[1][1] * (hands[1][2] + cards[1][1] + card[2][1]))
    elseif (number_of_selected = 3) then
        score = score + (hands[1][1] * (hands[1][2] + cards[1][1] + card[2][1] + card[3][1]))
    elseif(number_of_selected = 4) then
        -- rest of the hands, including the previous ones aswell
    else

    end
end

function discard()
    for i = 1, handsize do
        if(selected[i] ~= nil) then
            hand[i] = nil
            for j = 1, number_of_cards do
                if(discard_deck[j] == nil) then
                    discard_deck[j] = selected[i]
                    selected[i] = nil
                    j = number_of_cards
                end
            end
        end
    end



end

function startRound () 

    -- Fisher-Yates shuffle algorithm
    for i = number_of_cards, 1, -1 do
        local j = math.random(i)
        play_deck[i] = table.remove(deck, j)
    end
end


function playRound ()
    startRound() 
    Graphics.initBlend()
    drawRound()
    getHand()
    highlighted = hand[1]
    drawHand()
    Graphics.termBlend()--ended drawing and sended to the buffer
    Screen.flip()--displaying graphics

    pad = Controls.read ()

    while ((not Controls.check(pad, SCE_CTRL_CIRCLE)) and not (number_of_cards_left == 0 and highlighted == nil)) do--nhands > 0 and score < get_blind_amount(ante)) do
        pad = Controls.read ()
        joystick_x, joystick_y = Controls.readLeftAnalog()
        System.wait(99999)


        if (Controls.check(pad, SCE_CTRL_CROSS)) then
               selectHighlightedCard()
            
            Graphics.initBlend()
            drawRound()
            drawHand()
            Graphics.termBlend()--ended drawing and sended to the buffer
            Screen.flip()--displaying graphics
            --releaseHand()
        end

        if Controls.check(pad, SCE_CTRL_LEFT) or (joystick_x < 108) then
            if (hand[1] == highlighted) then

            elseif (handsize > 1) then
                
                for i = 2, handsize do
                    if (highlighted == hand[i]) then
                        local j = i
                        highlighted = nil
                        while(highlighted == nil and j >= 2) do
                            highlighted = hand[j - 1]
                            j = j - 1
                        end
                    end
                end

                Graphics.initBlend()
                drawRound()
                drawHand()
                Graphics.termBlend()--ended drawing and sended to the buffer
                Screen.flip()--displaying graphics
                --releaseHand()
            end
        end
        if Controls.check(pad, SCE_CTRL_RIGHT) or (joystick_x > 148) then
            if (hand[handsize] == highlighted) then

            elseif (handsize > 1) then

                for i = handsize, 1, -1 do
                    if (highlighted == hand[i]) then
                        local j = i
                        highlighted = nil
                        while(highlighted == nil and j <= handsize) do
                            highlighted = hand[j + 1]
                            j = j + 1
                        end
                    end
                end

                Graphics.initBlend()
                drawRound()
                drawHand()
                Graphics.termBlend()--ended drawing and sended to the buffer
                Screen.flip()--displaying graphics
                --releaseHand()

            end

        end
        if Controls.check(pad, SCE_CTRL_TRIANGLE) then
            
            discard()

            Graphics.initBlend()
            drawRound()
            getHand()
            for i = 1, handsize do
                if (hand[i] ~= nil) then
                    highlighted = hand[i]
                end
            end
            drawHand()
            Graphics.termBlend()--ended drawing and sended to the buffer
            Screen.flip()--displaying graphics
        end
        if Controls.check(pad, SCE_CTRL_SQUARE) then
            
            playCards()
            discard()

            Graphics.initBlend()
            drawRound()
            getHand()
            for i = 1, handsize do
                if (hand[i] ~= nil) then
                    highlighted = hand[i]
                end
            end
            drawHand()
            Graphics.termBlend()--ended drawing and sended to the buffer
            Screen.flip()--displaying graphics
        end
    end



end


function drawGame()
    Graphics.initBlend()
    Screen.clear()
    Graphics.drawImage(0,0,background)
    Graphics.drawImage(x,y,imageFile)
    Graphics.termBlend()--ended drawing and sended to the buffer
    Screen.flip()--displaying graphics

end

function get_blind_amount(ante)
    local k = 0.75
    local amounts = {
        300,  800, 2800,  6000,  11000,  20000,   35000,  50000
    }
    if ante < 1 then return 100 end
    if ante <= 8 then return amounts[ante] end
    local a, b, c, d = amounts[8],1.6,ante-8, 1 + 0.2*(ante-8)
    local amount = math.floor(a*(b+(k*c)^d)^c)
    amount = amount - amount%(10^math.floor(math.log10(amount)-1))
    return amount
end


function playAnte (ante)
    playRound()
    if (score < get_blind_amount(ante)) then
        return false
    end
    score = 0

    --playShop()

    while (nhands > 0 and score < (get_blind_amount(ante) + (0.5 * get_blind_amount(ante)))) do
        startRound() 
        --updateGame()
        drawGame()


        deck, discard_deck = shuffleDecksToFirst(deck, discard_deck)
    end
    if (score < get_blind_amount(ante)) then
        return false
    end
end

function playGame()
    startGame()
    while (playAnte(ante)) do
        ante = ante + 1
    end
end
