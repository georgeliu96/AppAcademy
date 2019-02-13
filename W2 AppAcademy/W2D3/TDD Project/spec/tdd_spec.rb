require 'rspec'
require 'tdd'

describe Array do 

    describe '#my_uniq' do 

        subject(:arr_instance){[1,2,1,3,3]} #sets a default array, that we're using to test uniq 
        
        it "doesn't modify the original array" do 
            arr_instance.my_uniq #calling the method, and then seeing if it's modified
            expect(arr_instance).to eq([1,2,1,3,3]) #checks for modification
        end
    
        it "removes all duplicated elements from a given array" do 
            expect(arr_instance.uniq).to eq(arr_instance.my_uniq) #tests by comparing the result with built in uniq method
        end 

    end

    describe '#two_sum' do 

        subject(:arr_instance) {[1,0,-1]} #defining a test case because there is no existing two_sum method that we can use to check

        it "doesn't modify the original array" do 
            arr_instance.two_sum #calling the method, and then seeing if it's modified
            expect(arr_instance).to eq([1,0,-1]) #checks for modification
        end

        it "should return all subarrays of length 2 that sum to 0" do 
            expect(arr_instance.two_sum).to eq([[0,2]]) #this is expected return value for calling two_sum on arr_instance([1,0,-1,2])
        end 

        it "all subarrays should have the smaller element first" do
            arr_instance = [1,-1,-1,1]  #making another test case to test indicies
            expect(arr_instance.two_sum).to eq([[0,1],[0,2],[1,3],[2,3]])
        end 

    end

    describe '#my_transpose' do 

         subject(:arr_instance){[[0, 1, 2],[3, 4, 5],[6, 7, 8]]} #2D array 

        it "doesn't modify the original array" do 
            arr_instance.my_transpose #calling the method, and then seeing if it's modified
            expect(arr_instance).to eq([[0, 1, 2],[3, 4, 5],[6, 7, 8]]) #checks for modification
        end

        it "converts all rows to columns" do 
            expect(arr_instance.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]]) #makes sure the rows and colums are flipped 
        end 

    end

    describe '#stock_pick' do 

        subject(:arr_instance){[3,12,2,5,11,10]}

        it "returns the most profitable pair(s) of days to buy and sell" do 
            expect(arr_instance.stock_pick).to eq([[0,1],[2,4]])
        end 

        it "returns a 2D array representing the pair(s) of days" do 
            expect(arr_instance.stock_pick[0]).to be_a(Array)
        end
        
    end


end 