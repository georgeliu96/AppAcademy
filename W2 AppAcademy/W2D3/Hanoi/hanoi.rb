class NotAStackError < StandardError; end
class EmptyStackError < StandardError; end

class Hanoi 

    attr_reader :stack1, :stack2, :stack3 

    def initialize 
        @stack1 = [3, 2, 1] 
        @stack2 = [] 
        @stack3 = []
    end

    def self.method 

    def push(val,stack) 
        stack.push(val)
    end 

    def pop(stack) #stack stands for any stack instance, doesn't need @
        stack.pop 
    end 

    def valid_pop(stack_input)
        case stack_input 
        when 1 
            if stack1.empty? 
                raise EmptyStackError 
            else 
                return pop(stack1) #looks for the method stack1, which is the attr_reader
                                    #when looking for @stack1, it's looking for the 
            end
        when 2 
            if stack2.empty? 
                raise EmptyStackError 
            else 
                return pop(stack2)
            end
        when 3 
            if stack3.empty? 
               
                raise EmptyStackError 
            else 
                return pop(stack3)
            end
        else 
            raise NotAStackError
        end 
    end

    end

    def game 

        loop do #while true/until false 
            if stack2.length == 3 || stack3.length == 3 
                break 
            end 
            begin 
            puts "Please pick a stack to take from:"
            stack_input = gets.chomp.to_i 
            valid_pop(stack_input)
            rescue NotAStackError #starts over from begin if this error ir raised
                puts 'Invalid stack'
                retry 
            rescue EmptyStackError 
                puts 'This stack is empty, please pick another'
                retry 
            end 
            #need to add what to do with a valid stack and implement valid stack to add to 
        end 
    end
            
end

#can add 
#h = Hanoi.new 
#h.play 
#to play the game until it hits the end of  a stack