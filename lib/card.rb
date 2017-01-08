class Card

  attr_reader :value, :rank, :suit, :name, :is_ace

  def initialize(rank,suit)
    @name = rank.to_s + suit.to_s
    @rank = rank
    @suit = suit
  end

  def value
    if @rank == 'J' || @rank == 'Q' || @rank == 'K'
      @is_ace = false
      @value = 10
    elsif @rank == 'A'
      @is_ace = true
      @value = 11
    else
      @is_ace = false
      @value = @rank.to_i
    end
  end
end
