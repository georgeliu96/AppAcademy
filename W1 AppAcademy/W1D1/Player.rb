class Player

    ALPHA = ("a".."z").to_a

    attr_reader :name

    def initialize(name)
        @name = name 
    end 

    def guess
        puts "It's #{name}'s turn!"
        puts "Please guess a letter: "
        letter = gets.chomp.downcase
        if alert_invalid_guess(letter)
            guess
        end 
        letter 
    end 

    def alert_invalid_guess(letter)
        !ALPHA.include?(letter)
    end 

end 