class AiPlayer

    attr_accessor :ai_dictionary, :ai_fragment
    attr_reader :name

    def initialize
        @ai_fragment
        @ai_dictionary
        @num_left 
        @name = "Skynet"
    end 

    def guess
        shrink(@ai_fragment)
    end 

    def shrink(fragment)
        @ai_dictionary.select!{|k,v| v.start_with?(fragment)}
    end 
end 