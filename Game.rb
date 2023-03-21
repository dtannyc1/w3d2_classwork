require_relative './Board.rb'
require_relative './Card.rb'

class Game

  def initialize
    @board = Board.new
    @first_guess = nil
    @second_guess = nil
  end

  def play
    while !@board.won?
      @board.render
      @board.reveal(prompt)
      @board.render
      @board.reveal(prompt)
      make_guess(guess)
    end

  end

  def make_guess
    #check if @guesses are nil
    #check if they are the same values at position
    #if they are nothing
    #else flip back to facedown
  end

  def prompt
    puts 'enter coordinates as an array'
    guess = gets.chomp.split(', ')
    if @first_guess == nil
      @first_guess = guess.map {|ele| ele.to_i}
    else
      @second_guess = guess.map {|ele| ele.to_i}
    end
    return guess.map {|ele| ele.to_i}
  end

end