require 'pry'
class Hand
  # Your code here
  attr_reader :cards, :name, :value

  def initialize(name)
    @name = name
    @cards = []
  end

  def hand_value
    hand_value = 0
    @cards.sort! { |a,b| a.value <=> b.value }
    aces = 0
    @cards.each do |card|
      if (card.is_ace == true)
        hand_value += 11
        aces += 1
      else
        hand_value += card.value
      end
    end
    if (aces != 0) && (hand_value > 21)
      aces.times do
        if hand_value > 21
          hand_value -= (aces * 10)
        end
      end
    end
    return hand_value
  end

end
