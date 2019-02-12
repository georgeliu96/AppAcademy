class NotaIntegerError < StandardError; end
class NotaFruitError < StandardError; end
class NotaBestFriendError < StandardError; end
class NotaGoodName < StandardError; end
class NotaRealPastime < StandardError; end


# PHASE 2
def convert_to_int(str)
  if str =~ /\d/
    return Integer(str)
  else
    
    raise NotaIntegerError
    begin
    rescue NotaIntegerError
    return nil
    end
  end

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
	raise NotaFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin 
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue NotaFruitError 
	if maybe_fruit == "coffee"
		puts "Thanks for the coffee, try again!"
		retry 
	else 
		puts "This is not fruit or coffee!"
		return nil  
	end 
	end 
end  

# PHASE 4
class BestFriend

	attr_writer :yrs_known

  def initialize(name, yrs_known, fav_pastime)
	begin 
	@name = name
	raise NotaGoodName if name == ""
	
	@yrs_known = yrs_known
	
	@fav_pastime = fav_pastime
	raise NotaRealPastime if fav_pastime == ""
	end
  end

  def talk_about_friendship
	begin 
		raise NotaBestFriendError if @yrs_known < 5
	rescue NotaBestFriendError 
		puts "We haven't known each other for long enough"
		puts "Hi, my new best friend, Bob!"
		self.yrs_known = 5
		retry 
	else 
		puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}." unless @yrs_known < 5 
	end 

end


  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


