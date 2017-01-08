class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank,suit)
      end
    end
    cards.shuffle!
  end

  def deal(player)
    card = @cards.pop
    puts "#{player.name} dealt #{card.name}"
    return card
  end
end
