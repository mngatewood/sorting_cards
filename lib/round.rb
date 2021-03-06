require './lib/deck'
require './lib/guess'
require 'pry'

class Round

  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck                 = deck
    @guesses              = []
    @current_card_index   = 0
    @number_correct       = 0
  end

  def current_card
    return @deck.cards[@current_card_index]
  end

  def record_guess(new_guess)
    guess = Guess.new("#{new_guess[:value]} of #{new_guess[:suit]}", current_card)
    @guesses << guess
    if guess.correct?
      @number_correct += 1
      @current_card_index += 1
    end
  end

  def count
    return @guesses.length
  end

  def percent_correct
    return (@number_correct / count.to_f * 100).to_i
  end

end
