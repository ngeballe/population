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

    def column_index(column_name)
        self.headings.index(column_name)
    end

    def column(heading)
        # gets all data from a given column, specified by heading
        # get column index
        #headings = self.headings # I want to use @ variable--or do I?
        #column_index = headings.index(heading)
        column_index = self.column_index(heading)
        # get items of that index
        ans = []
        self.contents.each do |row|
            #p row
            # put item from that column in the ans array
            ans << row[column_index]
        end
        ans
    end

    def num_zips_in_state(state_of_interest)
        num_xs_where_y_is_z("Zipcode", "State", state_of_interest)
    end

    def num_xs_where_y_is_z(field_to_count, field_to_match, what_it_should_match)
        # like SQL query
        # get array of column...
        col_index_of_field_to_match = self.column_index(field_to_match)
        col_index_of_field_to_count = self.column_index(field_to_count)
        a = []
        self.contents.each do |row|
            field_value = row[col_index_of_field_to_match]
            if field_value == what_it_should_match
                a << row[col_index_of_field_to_count]
            end
        end
        # num unique x's
        a.uniq.length
    end

    # def largest(field)
    #     column(field).max
    # end
end

#db = CSV.read("test-database.csv")

#db = CSV.read("test-database.csv")

#p db.column("Name").length # => 7
#p db.column("Gender").uniq # => ["Male", "Female"]
#p db.column("Age").sort # => ["21", "22", "25", "27", "28", "46", "53"]
#p db.headings # => ["Name", "Age", "Gender"]
#p db.contents # => [["Bob", "25", "Male"], ["Dorothy", "53", "Female"], ["Fred", "28", "Male"], ["Jess", "21", "Female"], ["Caleb", "22", "Male"], ["Jill", "27", "Female"], ["Patty", "46", "Female"]]

#zip_db = CSV.read("free-zipcode-database.csv") # [Finished in 39.1s]
zip_db = CSV.read("zip-small.csv")

#p zip_db.headings

# Your program should be able to find how many zip codes exist in the United States. 
unique_zips = zip_db.column("Zipcode").uniq
#p unique_zips
num_zips = unique_zips.length
#p "There are #{num_zips} ZIP Codes in the United States." 
    # full file => "There are 42522 ZIP Codes in the United States."

# It should be able to find which zip code is the smallest or largest, 
smallest_zip = unique_zips.min # don't need to convert to FixNum, do I?
#p unique_zips.sort
largest_zip = unique_zips.max
#p "The smallest ZIP is #{smallest_zip}. The largest is #{largest_zip}."

# return how many zip codes are in a given state, 

## get # ZIPs in each state
states = zip_db.column("State").uniq
states.sort.each do |state|
    p "#{state}: #{zip_db.num_zips_in_state(state)}"
end

# and let you search for zip codes.
   



#p db.largest("Age")