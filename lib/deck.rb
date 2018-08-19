require './lib/card'
require 'pry'

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards  = cards
  end

  def count
    @cards.length
  end

  def value_to_integer(card)
    if card.value == "Jack"
      return 11
    elsif card.value == "Queen"
      return 12
    elsif card.value == "King"
      return 13
    elsif card.value == "Ace"
      return 14
    else
      return card.value.to_i
    end
  end

  def suit_to_integer(card)
    if card.suit == "Clubs"
      return 0
    elsif card.suit == "Diamonds"
      return 0.1
    elsif card.suit == "Hearts"
      return 0.2
    elsif card.suit == "Spades"
      return 0.3
    else
      return "error"
    end
  end

  def convert_card_to_integer(card)
    value = value_to_integer(card)
    suit = suit_to_integer(card)
    return value + suit
  end

  def sort
    sorted_deck = []
    @cards.each do | card |
      sorted_deck << card
      if sorted_deck.length > 1
        j = sorted_deck.length - 1
        while j > 0
          right_value = convert_card_to_integer(sorted_deck[j])
          left_value = convert_card_to_integer(sorted_deck[j-1])
          if right_value < left_value
            sorted_deck[j-1], sorted_deck[j] = sorted_deck[j], sorted_deck[j-1]
          end
          j -= 1
        end
      end
    end
    return sorted_deck
  end

  def merge_sort
    merge_divide(@cards)
  end

  def merge_divide(array)
    if array.length == 1
      return array
    else
      array_middle = array.length / 2
      left_array = array[0..(array_middle - 1)]
      right_array = array[(array_middle)..-1]
      return merge_conquer(merge_divide(left_array), merge_divide(right_array))
    end
  end

  def merge_conquer(left_array, right_array)
    result = []
    right_index = 0
    left_index = 0

    while right_index < right_array.length && left_index < left_array.length
      right_integer = convert_card_to_integer(right_array[right_index])
      left_integer = convert_card_to_integer(left_array[left_index])
      if right_integer < left_integer
        result << right_array[right_index]
        right_index += 1
      else
        result << left_array[left_index]
        left_index += 1
      end
    end

    left = left_array[left_index..-1]
    right = right_array[right_index..-1]
    result << left
    result << right
    return result.flatten
  end

end