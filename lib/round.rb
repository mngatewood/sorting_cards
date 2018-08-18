require './lib/deck'

class Round

  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck     = deck
    @guesses  = []
  end

end