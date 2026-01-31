function getDeck ()

    --[[face_card = {
        "j", "q", "k"
    }]]

    local deck = {}
    --hearts
    for i = 1, 9 do
        deck[i] = {i+1, "h", "n"}
    end
    --[[for i = 10, 12 do
        deck[i] = {10, "h", face_card[i - 9]}
    end
    deck[13] = {11, "h", "a"}

    --diamonds
    for i = 14, 22 do
        deck[i] = {i+1 - 13, "d", "n"}
    end
    for i = 23, 25 do
        deck[i] = {10, "d", face_card[i - 22]}
    end
    deck[26] = {11, "d", "a"}


    --clubs
    for i = 27, 35 do
        deck[i] = {i+1 - 26, "c", "n"}
    end
    for i = 36, 38 do
        deck[i] = {10, "c", face_card[i - 35]}
    end
    deck[39] = {11, "c", "a"}

    --spade
    for i = 40, 48 do
        deck[i] = {i+1 - 26, "s", "n"}
    end
    for i = 49, 51 do
        deck[i] = {10, "s", face_card[i - 48]}
    end
    deck[52] = {11, "s", "a"}
]]

    loadDeck(deck)

    return deck
end

function loadDeck(deck)
    --hearts
    deck[1][4] = Graphics.loadImage("app0:/files/cards/2h.png")
    deck[2][4] = Graphics.loadImage("app0:/files/cards/3h.png")
    deck[3][4] = Graphics.loadImage("app0:/files/cards/4h.png")
    deck[4][4] = Graphics.loadImage("app0:/files/cards/5h.png")
    deck[5][4] = Graphics.loadImage("app0:/files/cards/6h.png")
    deck[6][4] = Graphics.loadImage("app0:/files/cards/7h.png")
    deck[7][4] = Graphics.loadImage("app0:/files/cards/8h.png")
    deck[8][4] = Graphics.loadImage("app0:/files/cards/9h.png")
    deck[9][4] = Graphics.loadImage("app0:/files/cards/10h.png")


    return deck
end

function card_to_value (card)
    return card[1]
end

function findInDeck (card)

    --hearts
    if (card[2] == "h") then
        if (card[1] == 2) then
            return 1
        elseif (card[1] == 3) then
            return 2
        elseif (card[1] == 4) then
            return 3
        elseif (card[1] == 5) then
            return 4
        elseif (card[1] == 6) then
            return 5
        elseif (card[1] == 7) then
            return 6
        elseif (card[1] == 8) then
            return 7
        elseif (card[1] == 9) then
            return 8
        elseif (card[1] == 10 and card[3] == "n") then
            return 9
        end
    end
            --[[       elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ah.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jh.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qh.png")
            else return Grapgics.loadImage("app0:/files/kh.png")
        end

        --diamonds
    elseif (card[2] = "d") then
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2d.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3d.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4d.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5d.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6d.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7d.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8d.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9d.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10d.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ad.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jd.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qd.png")
            else return Grapgics.loadImage("app0:/files/kd.png")
        end

        --clubs
    elseif (card[2] = "c") then
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2c.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3c.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4c.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5c.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6c.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7c.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8c.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9c.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10c.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ac.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jc.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qc.png")
            else return Grapgics.loadImage("app0:/files/kc.png")
        end


        --spades
    else
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2s.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3s.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4s.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5s.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6s.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7s.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8s.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9s.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10s.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/as.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/js.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qs.png")
            else return Grapgics.loadImage("app0:/files/ks.png")
        end
    end
    ]]
end

function card_to_image (card)
    --hearts
    if (card[2] == "h") then
        if (card[1] == 2) then
            return Graphics.loadImage("app0:/files/cards/2h.png")
        elseif (card[1] == 3) then
            return Graphics.loadImage("app0:/files/cards/3h.png")
        elseif (card[1] == 4) then
            return Graphics.loadImage("app0:/files/cards/4h.png")
        elseif (card[1] == 5) then
            return Graphics.loadImage("app0:/files/cards/5h.png")
        elseif (card[1] == 6) then
            return Graphics.loadImage("app0:/files/cards/6h.png")
        elseif (card[1] == 7) then
            return Graphics.loadImage("app0:/files/cards/7h.png")
        elseif (card[1] == 8) then
            return Graphics.loadImage("app0:/files/cards/8h.png")
        elseif (card[1] == 9) then
            return Graphics.loadImage("app0:/files/cards/9h.png")
        elseif (card[1] == 10 and card[3] == "n") then
            return Graphics.loadImage("app0:/files/cards/10h.png")
        end
    end
            --[[       elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ah.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jh.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qh.png")
            else return Grapgics.loadImage("app0:/files/kh.png")
        end

        --diamonds
    elseif (card[2] = "d") then
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2d.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3d.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4d.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5d.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6d.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7d.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8d.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9d.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10d.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ad.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jd.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qd.png")
            else return Grapgics.loadImage("app0:/files/kd.png")
        end

        --clubs
    elseif (card[2] = "c") then
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2c.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3c.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4c.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5c.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6c.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7c.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8c.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9c.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10c.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/ac.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/jc.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qc.png")
            else return Grapgics.loadImage("app0:/files/kc.png")
        end


        --spades
    else
        if (card[1] = 2) then
            return Grapgics.loadImage("app0:/files/cards/2s.png")
        elseif (card[1] = 3) then
            return Grapgics.loadImage("app0:/files/cards/3s.png")
        elseif (card[1] = 4) then
            return Grapgics.loadImage("app0:/files/cards/4s.png")
        elseif (card[1] = 5) then
            return Grapgics.loadImage("app0:/files/cards/5s.png")
        elseif (card[1] = 6) then
            return Grapgics.loadImage("app0:/files/cards/6s.png")
        elseif (card[1] = 7) then
            return Grapgics.loadImage("app0:/files/cards/7s.png")
        elseif (card[1] = 8) then
            return Grapgics.loadImage("app0:/files/cards/8s.png")
        elseif (card[1] = 9) then
            return Grapgics.loadImage("app0:/files/cards/9s.png")
        elseif (card[1] = 10 and card[3] = "n") then
            return Grapgics.loadImage("app0:/files/cards/10s.png")
        elseif (card[1] = 11) then
            return Grapgics.loadImage("app0:/files/cards/as.png")
        else
            if (card[3] = "j") then
                return Grapgics.loadImage("app0:/files/cards/js.png")
            elseif (card[3] = "q") then
                return Grapgics.loadImage("app0:/files/cards/qs.png")
            else return Grapgics.loadImage("app0:/files/ks.png")
        end
    end
    ]]
end

function removeFromDeck(deck, card)
    local card_to_remove = deck[findInDeck(card)]
    deck[findInDeck(card)] = nil
    return card_to_remove
end

function organizeDeck(deck)
    
    second_deck = {}
    deckSize = table.getn(deck)
    while(deckSize > 0) do
        local card = deck[deckSize]
        deckSize = deckSize - 1

        --hearts
        for i = 1, 8 do
            if (card[i] == i+1) then
                second_deck[i] = card
            end
        end
        
        if (card[1] ~= 10 and card[3] ~= "n") then
            --face cards
        end
    end

    return second_deck
end

function shuffleDecksToFirst(deck, ghost_deck)
    second_deck = organizeDeck(ghost_deck)

    --hearts
    for i = 1, 8 do
        if (second_deck[i][i] == i+1) then
            deck[i] = second_deck[i]
            second_deck[i] = nil
        end
    end
    if (card[1] == 10 and card[3] == "n") then
        --face cards
    end


    return deck, second_deck
end


function drawNumber (n)

end
