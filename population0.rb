=begin
    
Your program should be able to find how many zip codes exist in the United States. 
It should be able to find which zip code is the smallest or largest, return how many
 zip codes are in a given state, and let you search for zip codes.
    
=end

# get info from CSV reader
require "csv"

# get headings
headings = []
zips = []

class Database < Array
    #attr_accessor :headings

    # initialze already exists for array

    def headings
        self[0]
    end

    def get_field(field_name)
        # look up field_name in headings
        headings.index(field_name)
        # get all in that column
    end
end

db = CSV.read("test-database.csv")
p db
p db.headings
#db.shift # remove first row
#p headings
#p db

#get_field("Gender")



# get total # zips
#p headings
# headings = ["RecordNumber", "Zipcode", "ZipCodeType", "City", "State", "LocationType", 
# "Lat", "Long", "Xaxis", "Yaxis", "Zaxis", "WorldRegion", "Country", "LocationText", "Location", "Decommisioned", "TaxReturnsFiled", 
# "EstimatedPopulation", "TotalWages", "Notes"]
#total_num_zips = 45000
#p "There are #{total_num_zips} ZIP Codes in the United States."

# method to get zip codes for a given state


# search for zip codes
