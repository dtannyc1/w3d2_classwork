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

    def ==(card_2)  #if card 2 is facedown returns false
        @value == card_2.card
    end
end