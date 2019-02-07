class Dog

    def initialize (name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed 
        @age = age 
        @bark = bark 
        @favorite_foods = favorite_foods 
    end 

    def name 
        @name 
    end 

    def breed 
        @breed 
    end 

    def age
        @age 
    end 

    def age= (n)
        @age = n
    end 

    def bark 
        return @bark.upcase if @age > 3
        return @bark.downcase 
    end 

    def favorite_foods 
        @favorite_foods 
    end 

    def favorite_food? (str)
        @favorite_foods.include?(str[0].upcase + str[1..-1].downcase)
    end

end
