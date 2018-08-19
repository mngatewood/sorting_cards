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

  def sorting_the_deck
    sorted_deck = []
    @cards.each_with_index do |card, i|
      sorted_deck << card if i == 0
      y = i
      while y >= 0
        sorted_deck << card if y == 0
        if card.card_value < sorted_deck[y - 1].card_value
          sorted_deck[y - 2] = card
        end
         i -= 1
        end
      end
  end

  def sort
    sort_by_value
  end

  def sort_by_value
    sorted_deck = []
    @cards.each do | card |
      sorted_deck << card
      if sorted_deck.length > 1
        j = sorted_deck.length - 1
        while j > 0
          if sorted_deck[j].value < sorted_deck[j-1].value
            sorted_deck[j-1], sorted_deck[j] = sorted_deck[j], sorted_deck[j-1]
          end
          j -= 1
        end
      end
    end
    return sorted_deck
  end

end