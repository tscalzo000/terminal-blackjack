require_relative "lib/card"
require_relative "lib/deck"
require_relative "lib/hand"
require 'pry'

player = Hand.new('Player')
computer = Hand.new('Dealer')
deck = Deck.new

player.cards << deck.deal(player)
player.cards << deck.deal(player)
puts "Player is at #{player.hand_value}."

puts "Hit or stand? (H/S):"
input = gets.chomp

while input != 'S' do
  player.cards << deck.deal(player)
  puts "Player is at #{player.hand_value}."
  if player.hand_value <= 21
    puts "Hit or stand? (H/S):"
    input = gets.chomp
  else
    puts "Over 21. Bust. \nYou lose!"
    break
  end
end

if player.hand_value <= 21
  puts "Player stands at #{player.hand_value}."

  computer.cards << deck.deal(computer)
  computer.cards << deck.deal(computer)
  puts "Dealer is at #{computer.hand_value}."

  while computer.hand_value < 17
    computer.cards << deck.deal(computer)
    puts "Dealer is at #{computer.hand_value}."
    if computer.hand_value > 21
      puts "Over 21. Bust. \nYou win!."
      break
    end
  end

  if computer.hand_value <= 21
    if computer.hand_value < player.hand_value
      puts "You win!"
    elsif computer.hand_value == player.hand_value
      puts "Tie. Dealer wins, you lose!"
    else
      puts "You lose!"
    end
  end
end
