require_relative "card"
require_relative "deck"
require_relative "hand"

deck = Deck.new
player = Hand.new("Player")
dealer = Hand.new("Dealer")

puts "WELCOME TO BLACKJACK!"
puts "---------------------\n\n"
sleep(1.5)

2.times do
  player.hit(deck.deal)
  dealer.hit(deck.deal)
end

sleep(1.5)
puts player

until player.bust?
  sleep(1.5)
  print "Hit or Stand? H/S "
  input = "#{gets.chomp}"
  if input.upcase == "S"
    sleep(1.5)
    puts "\n#{player.name} stands.\n\n"
    break
  elsif input.upcase == "H"
    sleep(1.5)
    puts "\n#{player.name} hits.\n\n"
    player.hit(deck.deal)
  else
    puts "Unknown input, try again..."
  end
  sleep(1.5)
  puts player
end

if player.winner?
  sleep(1.5)
  puts "#{player.name} wins!"
  exit(0)
end

if player.bust?
  sleep(1.5)
  puts "#{player.name} busts! #{dealer.name} wins!"
  exit(0)
end

sleep(1.5)
puts dealer

until dealer.bust?
  if 17 <= dealer.score && dealer.score <= 21
    sleep(1.5)
    puts "#{dealer.name} stands.\n\n"
    break
  else
    sleep(1.5)
    puts "#{dealer.name} hits.\n\n"
    dealer.hit(deck.deal)
  end
  sleep(1.5)
  puts dealer
end

if dealer.bust?
  sleep(1.5)
  puts "#{dealer.name} busts! #{player.name} wins!"
elsif dealer.score > player.score
  sleep(1.5)
  puts "#{dealer.name} wins!"
elsif dealer.score == player.score
  sleep(1.5)
  puts "Score tied!"
else
  sleep(1.5)
  puts "#{player.name} wins!"
end
