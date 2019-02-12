class Employee 
    attr_reader :name, :title, :salary, :employees

    def initialize(name,title,salary, employees = [])
        @name = name
        @title = title
        @salary = salary
        @employees = employees
    end

    def bonus(multiplier)
        bonus = salary * multiplier
    end



end

class Manager < Employee
    def initialize(name,title,salary,employees = [])
        super 
    end

    def bonus(multiplier)
        bonus = self.getemployeesalary * multiplier
    end

    def getemployeesalary
        sum = 0
        employees.each do |i|
            p i
            sum += i.salary
            i.employees.each do |j|
                sum += j.salary
            end
        end
        sum
    end


end    

shawna = Employee.new("Shawna", "TA", 10000, [])
david = Employee.new("David", "TA", 12000, [])
darren = Manager.new("Darren", "TA Manager", 78000, [shawna, david])
ned = Manager.new("Ned", "founder", 1000000,[darren])

