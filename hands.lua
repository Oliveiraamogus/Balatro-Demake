--scaling
HIGHCARD = {1, 5},

PAIR = {1, 15},

THREOFAKIND = {2, 20},

FOUROFAKIND = {3, 30},
TWOPAIR = {1, 20},
FULLHOUSE = {2, 25},
FLUSH = {2, 15},
STRAIGHT = {3, 30},
STRAIGHTFLUSH = {4, 40},
FIVEOFAKIND = {3, 35},
FLUSHHOUSE = {4, 40},
FLUSHFIVE = {3, 50}



function getHands ()
    local hands = {
    high_card = {1, 5},

    pair = {2, 10},

    tree_of_a_kind = {2, 30},

    four_of_a_kind = {7, 60},
    two_pair = {2, 20},
    full_house = {4, 40},
    flush = {4, 35},
    straight = {4, 30},
    straight_flush = {8, 100},
    five_of_a_kind = {12, 120},
    flush_house = {14, 140},
    flush_five = {16, 160}
    }
    return hands
end

function levelUpHand (hand)

end
