require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal deck.cards, [card_1, card_2, card_3]
  end

  def test_it_counts_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal deck.count, 3
  end

  def test_it_converts_card_value_to_integer
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal 4, deck.value_to_integer(card_1)
    assert_equal 11, deck.value_to_integer(card_2)
    assert_equal 5, deck.value_to_integer(card_3)
    assert_equal 14, deck.value_to_integer(card_4)
    assert_equal 14, deck.value_to_integer(card_5)
  end

  def test_it_converts_card_suit_to_integer
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal 0.2, deck.suit_to_integer(card_1)
    assert_equal 0, deck.suit_to_integer(card_2)
    assert_equal 0.1, deck.suit_to_integer(card_3)
    assert_equal 0.3, deck.suit_to_integer(card_4)
    assert_equal 0.1, deck.suit_to_integer(card_5)
  end

  def test_it_converts_card_suit_and_value_to_integer
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    assert_equal 4.2, deck.convert_card_to_integer(card_1)
    assert_equal 11, deck.convert_card_to_integer(card_2)
    assert_equal 5.1, deck.convert_card_to_integer(card_3)
    assert_equal 14.3, deck.convert_card_to_integer(card_4)
    assert_equal 14.1, deck.convert_card_to_integer(card_5)
  end

  def test_it_sorts_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    assert_equal [card_1, card_3, card_2, card_5, card_4], deck.sort
  end

  def test_it_splits_an_array_of_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    expected = [card_1, card_3, card_2, card_5, card_4]
    assert_equal expected, deck.merge_divide(deck.cards)
  end

  def test_it_sorts_and_merges_two_arrays
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    left_array = [card_1, card_2]
    right_array = [card_3, card_4, card_5]
    expected = [card_1, card_3, card_2, card_4, card_5]
    assert_equal expected, deck.merge_conquer(left_array, right_array)
  end

  def test_it_sorts_cards_using_merge_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    expected = [card_1, card_3, card_2, card_5, card_4]
    assert_equal expected, deck.merge_sort
  end

end
