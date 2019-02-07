def all_words_capitalized? (arr)
    arr.all? {|word| word == word.capitalize}
end 

def no_valid_url? (arr)
    last = [".com",".net",".org"]
    arr.none? do |word|
        last.include?(word[-4..-1]) || word[-3..-1] == ".io"
    end
end

def any_passing_students? (arr)
    arr.any? {|student| (student[:grades].sum) / student[:grades].length >= 75}
end 