

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

  def all_data_for_zip(zip_to_match)
    # get all data where zip = zip_to_match
    ans = []
    index_of_zip = column_index("Zipcode")
    self.each { |row| ans << row if row[index_of_zip] == zip_to_match }
    ans
  end

  def show_all_data_for_zip(zip)
    data = all_data_for_zip(zip)
    data.each { |row| puts row.join(" "*4) }
  end
end



#zip_db = CSV.read("zip-small.csv")
#filename = "zip-small.csv"
filename = "free-zipcode-database.csv"
zip_db = CSV.read(filename)
#p zip_db

p zip_db.headings

# Your program should be able to find how many zip codes exist in the United States. 
unique_zips = zip_db.column("Zipcode").uniq
num_zips = unique_zips.length
p "There are #{num_zips} ZIP Codes in the United States." 
    # full file => "There are 42522 ZIP Codes in the United States."

# It should be able to find which zip code is the smallest or largest, 
smallest_zip = unique_zips.min # don't need to convert to FixNum, do I?
largest_zip = unique_zips.max
p "The smallest ZIP is #{smallest_zip}. The largest is #{largest_zip}."

# return how many zip codes are in a given state, 

## get # ZIPs in each state
states = zip_db.column("State").uniq
states.sort.each do |state|
  p "#{state}: #{zip_db.num_zips_in_state(state)}"
end

# and let you search for zip codes.
zip_db.show_all_data_for_zip("00601")

=begin
  
OUTPUT:

["RecordNumber", "Zipcode", "ZipCodeType", "City", "State", "LocationType", "Lat", "Long", "Xaxis", "Yaxis", "Zaxis", "WorldRegion", "Country", "LocationText", "Location", "Decommisioned", "TaxReturnsFiled", "EstimatedPopulation", "TotalWages", "Notes"]
"There are 42522 ZIP Codes in the United States."
"The smallest ZIP is 00501. The largest is 99950."
"AA: 43"
"AE: 430"
"AK: 274"
"AL: 838"
"AP: 176"
"AR: 709"
"AS: 1"
"AZ: 567"
"CA: 2653"
"CO: 662"
"CT: 438"
"DC: 290"
"DE: 98"
"FL: 1490"
"FM: 4"
"GA: 973"
"GU: 13"
"HI: 139"
"IA: 1063"
"ID: 325"
"IL: 1588"
"IN: 987"
"KS: 756"
"KY: 962"
"LA: 725"
"MA: 703"
"MD: 622"
"ME: 488"
"MH: 2"
"MI: 1170"
"MN: 1031"
"MO: 1171"
"MP: 3"
"MS: 533"
"MT: 405"
"NC: 1090"
"ND: 407"
"NE: 620"
"NH: 284"
"NJ: 731"
"NM: 426"
"NV: 254"
"NY: 2208"
"OH: 1447"
"OK: 776"
"OR: 486"
"PA: 2213"
"PR: 176"
"PW: 2"
"RI: 91"
"SC: 539"
"SD: 394"
"TN: 796"
"TX: 2655"
"UT: 347"
"VA: 1241"
"VI: 16"
"VT: 309"
"WA: 733"
"WI: 898"
"WV: 856"
"WY: 195"
57    00601    STANDARD    ADJUNTAS    PR    PRIMARY    18.16    -66.72    0.37    -0.87    0.31    NA    US    Adjuntas, PR    NA-US-PR-ADJUNTAS    false                
58    00601    STANDARD    COLINAS DEL GIGANTE    PR    NOT ACCEPTABLE    18.16    -66.72    0.37    -0.87    0.31    NA    US    Colinas Del Gigante, PR    NA-US-PR-COLINAS DEL GIGANTE    false                
59    00601    STANDARD    JARD DE ADJUNTAS    PR    NOT ACCEPTABLE    18.16    -66.72    0.37    -0.87    0.31    NA    US    Jard De Adjuntas, PR    NA-US-PR-JARD DE ADJUNTAS    false                
60    00601    STANDARD    URB SAN JOAQUIN    PR    NOT ACCEPTABLE    18.16    -66.72    0.37    -0.87    0.31    NA    US    Urb San Joaquin, PR    NA-US-PR-URB SAN JOAQUIN    false                
[Finished in 46.8s]
  
=end