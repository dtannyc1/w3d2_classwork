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

  end

  def make_guess
    #check if @guesses are nil
    #check if they are the same values at position
    #if they are nothing
    #else flip back to facedown
    @card_1.reveal
    @card_2.reveal
    if !(@card_1 == @card_2)
        @card_1.hide
        @card_2.hide
        puts "Cards did not match"
    end

  end

  def prompt # returns array [row,col]
    puts 'enter coordinates as an array'
    guess = gets.chomp.split(', ')
    # if @first_guess == nil
    #   @first_guess = guess.map {|ele| ele.to_i}
    # else
    #   @second_guess = guess.map {|ele| ele.to_i}
    # end
    return guess.map {|ele| ele.to_i}
  end

end
