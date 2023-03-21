class Card

    def initialize(value, faceup=false)
        @value = value
        @faceup = faceup
    end

    def card
        return @value if @faceup
        nil
    end

    def hide
        @faceup = false
    end

    def reveal
        @faceup = true
    end

    def to_s
        @value.to_s
    end

    def ==(card)

    end
end

card_1 = Card.new(1)
card_2 = Card.new(2)

card_1 == card_2
