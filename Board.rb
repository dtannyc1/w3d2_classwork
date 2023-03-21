require_relative "./Card.rb"

class Board
    def initialize(row=4,col=4)
        @grid = Array.new(row) {Array.new(col)}
        populate
    end

    def populate
        @grid.each do |row|
            row.each do |ele|
                ele = Card.new(:A) # doesnt mutate @grid
            end
        end
    end

end
