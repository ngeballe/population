=begin

Your program should be able to find how many zip codes exist in the United States. 
It should be able to find which zip code is the smallest or largest, return how many
 zip codes are in a given state, and let you search for zip codes.
   
=end

# get info from CSV reader
require "csv"

# get headings

class CsvArray < Array
    # STUCK HERE
    def initialize(filename)
        a = Csv.read(filename)
        a
    end

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
end

#db = CSV.read("test-database.csv")

db = CsvArray.new("test-database.csv")
p db
#p db.headings
#p db.contents
#db.shift # remove first row
#p headings
#p db

#get_field("Gender")



# get total # zips

#total_num_zips = 45000
#p "There are #{total_num_zips} ZIP Codes in the United States."

# method to get zip codes for a given state


# search for zip codes
