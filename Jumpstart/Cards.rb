Deck = []
Players = []
Face = "JQK"

#Current goals: (? = maybe)
  #Add a pool to each player that's not dealer
    #kick out the player if they run out of money
    #Add a bet amount
    #Cash out method?
  #Add a split method
  #Shows dealer hand before the round starts?
#Current issues:

def new_deck(num_decks)
  reset_deck()
  num_decks.times do
    (1..13).each do |num|
      Deck << num.to_s + " of Hearts"
      Deck << num.to_s + " of Diamonds"
      Deck << num.to_s + " of Spades"
      Deck << num.to_s + " of Clubs"
    end

    Deck.each do |ele|
      if ele[0..1] == "1 "
        ele[0..1] = "A "
      elsif ele[0..1] == "11"
        ele[0..1] = "J"
      elsif ele[0..1] == "12"
        ele[0..1] = "Q"
      elsif ele[0..1] == "13"
        ele[0..1] = "K"
      end
    end
  end
  shuffle(num_decks)
end

def shuffle(num_decks)
  ((1000 * num_decks).times do
    num = rand(52 * num_decks)
    temp = Deck[num]
    new_num = rand(52 * num_decks)
    Deck[num] = Deck[new_num]
    Deck[new_num] = temp
  end
end

def reset_deck()
  while (Deck.length != 0)
    Deck.pop
  end
end

def new_player(name)
  player = Hash.new(0)
  player["name"] = name
  player["hand"] = [[]]
  player["score"] = 0
  Players << player
end

def deal_cards ()
  Players.each do |player|
    player["hand"][0] << Deck.pop + ", " + Deck.pop
  end
end

def hit (player, i)
  player["hand"][i] << ", " + Deck.pop
  cards = player["hand"][i].split(", ")
  return cards[-1]
end

def game(player_turn)
  current_player = Players[player_turn]
  puts current_player["name"] + "\'s turn! \nHand is currently " + current_player["hand"] + ". \nYour current hand value is " + hand_value(current_player).to_s + "."
  sleep(1)
  puts "Would you like to hit? (Y/N)"
  continue = gets.strip
  if continue.upcase == "Y"
    puts current_player["name"] + " was dealt a(n) " + hit(current_player) + "."
    sleep(1)
    if (check_bust(current_player))
      puts "You busted!"
      puts "Hand over."
      sleep(1)
      puts "------------------------------------------------"
      puts
      player_turn += 1
      if Players[player_turn]["name"] == "DEALER"
        dealer_game(Players[player_turn])
        puts "Round is over."
        sleep(1)
        puts "----------------------------------------------------------"
        puts
        resolve_round()
      else
        game(player_turn)
      end
    else
      game(player_turn)
    end
  elsif continue.upcase == "N"
    player_turn += 1
    if (Players[player_turn]["name"] == "DEALER")
      puts "Hand over. Your hand value is " + hand_value(current_player).to_s + "!"
      sleep(1)
      puts "----------------------------------------------------------"
      puts
      dealer_game(Players[player_turn])
      puts "Round is over."
      sleep(1)
      puts "----------------------------------------------------------"
      puts
      resolve_round()
    else
      puts "Hand over. Your hand value is " + hand_value(current_player).to_s + "!"
      sleep(1)
      puts "----------------------------------------------------------"
      puts
      game(player_turn)
    end
  else
    puts "Command not recognized."
    game(player_turn)
  end
end

def dealer_game(player)
  if (check_all_bust())
    puts "All players have busted"
    return
  end
  sleep(1)
  puts  "Dealer\'s turn! Hand is currently " + Players[Players.length - 1]["hand"] + "."
  sleep(1)
  while hand_value(player) < 17
    hit(player)
    puts  "Dealer\'s turn! Hand is currently " + Players[Players.length - 1]["hand"] + "."
    sleep(1)
  end
  if (check_bust(player))
    puts "Dealer has busted."
    sleep(1)
  else
    puts "Dealer's FINAL hand value is " + hand_value(player).to_s + "!"
  end
end

def check_all_bust()
  ans = true
  Players.each do |player|
    if player["name"] != "DEALER" && !check_bust(player)
      ans = false
    end
  end
  return ans
end

def hand_value(player)
  sum = 0
  a_count = 0
  cards = player["hand"].split(", ")
  cards.each do |ele|
    if Face.include?(ele[0]) || ele[0] == "1"
      sum += 10
    elsif ele[0] == "A"
        sum += 11
        a_count += 1
    else
      sum += ele[0].to_i
    end
  end
  a_count.times do
    if (sum > 21)
      sum -= 10
    end
  end
  return sum
end

def check_bust(player)
  return hand_value(player) > 21
end

def resolve_round()
  Players.each do |player|
    if player["name"] == "DEALER"
      sleep(1)
      puts "Would you like to continue playing? (Y/N)"
      continue = gets.strip
      if continue.upcase == "Y"
        puts
        puts
        puts
        system("cls")
        new_deck(Num_decks)
        deal_cards()
        game(0)
      elsif continue.upcase == "N"
        puts "Thanks for playing!"
        break
        break
        break
      else
        puts "Command not recognized"
        puts
        resolve_round()
      end
    end
    if (check_win(player))
      puts player["name"] + " had a better hand then the dealer. Score goes up!"
      player["score"] += 1
    else
      puts player["name"] + " did not beat the dealer this round."
    end
    sleep(0.5)
    puts player["name"] + "\'s current score is " + player["score"].to_s + "."
    puts
    sleep(0.5)
  end
  Players.each do |player|
    if player["name"] == "DEALER"
      break
      break
    end
    puts player["name"] + "\'s FINAL score is " + player["score"].to_s + "."
    sleep(1)
  end
end

def check_win(player)
  if check_bust(player)
    return false
  elsif (!check_bust(player) && check_bust(Players[Players.length - 1]))
    return true
  elsif hand_value(player) > hand_value(Players[Players.length - 1])
    return true
  else
    return false
  end
end

def is_numeric?(obj)
  obj.to_s == obj.to_i.to_s
end

system("cls")
puts "Welcome to Blackjack! How many players?"
num_Players = gets.strip.to_i
while (num_Players == 0)
  puts "Please put an integer value."
  sleep(1)
  puts "How many players?"
  num_Players = gets.strip.to_i
end
num_Players = num_Players.to_i

num_Players.times do |num|
  puts
  puts "What is Player " + (num + 1).to_s + "\'s name?"
  new_name = gets.strip
  Players.each do |player|
    if player["name"].downcase == new_name.downcase
      puts "Name is not unique. Please choose a new name."
      puts "What is Player " + (num + 1).to_s + "\'s name?"
      new_name = gets.strip
    end
  end
  new_player(new_name)
end

puts
puts "How many decks?"
num_decks = gets.strip.to_i
while (num_decks == 0)
  puts "Please put an integer value."
  sleep(1)
  puts "How many decks?"
  num_decks = gets.strip.to_i
end
puts
Num_decks = num_decks
new_deck(num_decks)
puts "There is a total of " + Deck.length.to_s + " shuffled cards in the deck!"
sleep(1)
puts
puts Players.length.to_s + " player(s)! " + num_decks.to_s + " Deck(s)! Good luck."
sleep(0.5)
puts

new_player("DEALER")

deal_cards()
game(0)
