require_relative './Board.rb'
require_relative './Card.rb'

class Game

  def initialize
    @board = Board.new
    @first_guess = nil
    @second_guess = nil
    @card_1 = nil
    @card_2 = nil
  end

  def play
    @board.render
    sleep(2)
    @board.set

    while !@board.won?
      @board.render           # draw board
      
      @first_guess = prompt
      @card_1 = @board.reveal(@first_guess)   # get a position, and flips card
      @board.render           # draws again
      @second_guess = prompt
      @card_2 = @board.reveal(@second_guess)   # get 2 position, flips card
      make_guess

        @first_guess = nil
        @second_guess = nil
        @card_1 = nil
        @card_2 = nil
    end
    puts 'your parents are proud of you'
  end

  def make_guess
    #check if @guesses are nil
    #check if they are the same values at position
    #if they are nothing
    #else flip back to facedown
    @card_1.reveal
    @card_2.reveal
    if !(@card_1 == @card_2)
      @board.render
      sleep(1)
        @card_1.hide
        @card_2.hide
        puts "Cards did not match"
    end

  end

  def prompt # returns array [row,col]
    begin
      puts 'enter coordinates as integers separated by space'
      guess = gets.chomp.split(' ')
      coordinates = guess.map {|ele| ele.to_i}
      raise RuntimeError.new ('must enter valid position') if !@board.valid_position?(coordinates)
      raise RuntimeError.new ('must enter unrevealed card') if @board.already_revealed?(coordinates)
      return guess.map {|ele| ele.to_i}
    rescue RuntimeError => e
      puts "#{e.message}"
      retry
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end