require './lib/deck'

class Round

  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck     = deck
    @guesses  = []
  end

  def current_card
    @deck.cards.first
  end

end