require_relative "./Card.rb"

class Board

    @@all_card = [2,3,4,5,6,7,8,9,10,:J, :Q, :K, :A]
    def initialize(row=4,col=4)
        
        @grid = Array.new(row) {Array.new(col)}
        
        populate
    end

    def populate
        while @grid.any? {|row| row.any? {|ele| ele == nil}}
            value = @@all_card.sample
            2.times do
                done = false


                while done == false
                
                    i = rand(0...@grid.length)
                    j = rand(0...@grid[0].length)
                    if @grid[i][j] == nil
                        @grid[i][j] = value
                        done = true
                    else
                        i = rand(0...@grid.length)
                        j = rand(0...@grid[0].length)
                    end
                end
            end
        end
    end

end
