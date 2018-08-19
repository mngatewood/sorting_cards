require './lib/card'

class Guess

  attr_reader :response,
              :card

  def initialize(response, card)
    @response   = response
    @card       = card
  end

  def correct?
    return @response == "#{card.value} of #{card.suit}"
  end

  def feedback
    if correct?
      return "Correct!"
    else
      return "Incorrect."
    end
  end

end