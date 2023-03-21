require_relative "./Card.rb"



class Board
    # attr_accessor :grid     #temporary for build


    @@all_card = [2,3,4,5,6,7,8,9,10,:J, :Q, :K, :A]
    def initialize(row=4,col=4)

        @grid = Array.new(row) {Array.new(col)}

        populate
    end

    # def []=(position, value)  #temporary for build
    #     row, col = position
    #     @grid[row][col] = value
    # end

    def populate
        # maybe make card pairs unique?
        while @grid.any? {|row| row.any? {|ele| ele == nil}}
            value = @@all_card.sample
            2.times do
                done = false


                while done == false

                    i = rand(0...@grid.length)
                    j = rand(0...@grid[0].length)
                    if @grid[i][j] == nil
                        @grid[i][j] = Card.new(value)
                        done = true
                    else
                        i = rand(0...@grid.length)
                        j = rand(0...@grid[0].length)
                    end
                end
            end
        end
    end

    def render
        @grid.each do |row|
            new_array = []
            row.each do |ele|
                if ele.card
                    new_array << ele.card
                else
                    new_array << "-"
                end
            end
            puts new_array.join(" ")
        end
    end

    def reveal(guessed_pos)
        row, col = guessed_pos
        @grid[row][col].reveal
        return @grid[row][col]
    end

    def won?
        @grid.each do |row|
            row.each do |ele|
                if ele.card == nil
                    return false
                end
            end
        end
        true
    end

end
