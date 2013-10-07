=begin

Your program should be able to find how many zip codes exist in the United States. 
It should be able to find which zip code is the smallest or largest, return how many
 zip codes are in a given state, and let you search for zip codes.
   
=end

# get info from CSV reader
require "csv"

# get headings

class Array
    def headings
        # gets headings from array of arrays
        # assumes 2-dimensional array
        # assumes headings are in top row
        self[0]
    end

    def contents
        # gets all but 0th row of array
        self[1..-1]
    end

    def column(heading)
        # gets all data from a given column, specified by heading
        # get column index
        headings = self.headings # I want to use @ variable--or do I?
        column_index = headings.index(heading)
        # get items of that index
        ans = []
        self.contents.each do |row|
            #p row
            # put item from that column in the ans array
            ans << row[column_index]
        end
        ans
    end

    # def largest(field)
    #     column(field).max
    # end
end

#db = CSV.read("test-database.csv")

db = CSV.read("test-database.csv")

#p db.column("Name").length # => 7
#p db.column("Gender").uniq # => ["Male", "Female"]
#p db.column("Age").sort # => ["21", "22", "25", "27", "28", "46", "53"]
#p db.headings # => ["Name", "Age", "Gender"]
#p db.contents # => [["Bob", "25", "Male"], ["Dorothy", "53", "Female"], ["Fred", "28", "Male"], ["Jess", "21", "Female"], ["Caleb", "22", "Male"], ["Jill", "27", "Female"], ["Patty", "46", "Female"]]




#p db.largest("Age")