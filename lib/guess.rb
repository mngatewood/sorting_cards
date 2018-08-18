require './lib/card'

class Guess

  attr_reader :response,
              :card

  def initialize(response, card)
    @response   = response
    @card       = card
  end

  def correct?
    @response == "#{card.value} of #{card.suit}"
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end