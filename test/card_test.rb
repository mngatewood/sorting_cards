require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    assert_instance_of Card, card
  end
  
  def test_it_has_a_value
    card = Card.new("10", "Hearts")
    assert_equal card.value, "10"
  end
  
  def test_it_has_a_suit
    card = Card.new("10", "Hearts")
    assert_equal card.suit, "Hearts"
  end
  
end
