require_relative "Player.rb"
require_relative "AiPlayer.rb"

class Game 

    words = File.readlines("dictionary.txt")
    DICTIONARY = Hash.new{|h,k| h[k] = []}
    words.each do |word|
        DICTIONARY[word.chars.first] << word.chomp
    end  
    ALPHA = ("a".."z").to_a 

    attr_reader :players, :fragment 

    def initialize 
        @fragment = "" 
        puts "How many players do you want?"
        input = gets.chomp.to_i
        @players = []
        input.times do |i|
            puts "Enter your name: "
            @players << Player.new(gets.chomp)
        end 
        @dictionary = DICTIONARY
        @ai_player = AiPlayer.new
        @players << @ai_player
        @losses = Hash.new(0)
    end 

    def current_player 
        return @players.first
    end

    def previous_player 
        return @players.last 
    end 
  
    def next_player! 
        @players.rotate!
    end 

    def take_turn(player)
        input = player.guess
        if valid_play?(input)
            @fragment << input
            self.update_ai
            puts "Current fragment is #{@fragment}"
        else 
            puts "No words can be spelled with this guess, try again."
            take_turn(player)
        end 
        if loss_round? 
            puts "You lose the round!"
            increment(player)
            @fragment = ""
            self.update_ai
        end
    end 

    def valid_play?(input)
        new_str = @fragment + input 
        return @dictionary[new_str[0]].any?{|el| el.start_with?(new_str)}
    end 

    def increment(player)
        @losses[player] += 1 
        record(player)
    end 

    def record(player)
        puts player.name + " has currently spelled out " + "GHOST"[0..@losses[player] - 1]
    end

    def play_round
        take_turn(current_player)
        self.next_player!
    end 

    def loss_round?
        @dictionary[@fragment[0]].include?(@fragment)
    end 

    def update_ai
        @ai_player.ai_fragment = @fragment
        @ai_player.num_left = @players.length
    end 

    def run
        @ai_player.ai_dictionary = @dictionary
        while !win?
            self.play_round
            limit = @losses.values.any? {|el| el >= 5}
            if loss? 
                puts "#{previous_player.name} has GHOSTed" 
                @losses[@players.pop] = 0 
                self.update_ai
            end 
            if win? 
                puts "#{current_player.name} has won!"
            end
        end
    end 

    def loss? 
        @losses.values.any?{|el| el >= 5}
    end 

    def win? 
        @players.length == 1
    end

end 
a = Game.new 
a.run