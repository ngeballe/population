=begin
    
Your program should be able to find how many zip codes exist in the United States. 
It should be able to find which zip code is the smallest or largest, return how many
 zip codes are in a given state, and let you search for zip codes.
    
=end

class CSVReader
    attr_accessor :fname, :headers

    def initialize(filename)
        @fname = filename
    end

    def headers=(header_str)
        @headers = header_str.split(',')
        @headers.map! do |h|
            # remove quotes
            h.gsub!('"', '')
            # remove newline
            h.strip!
            # convert to symbol - WHY?
            h.underscore.to_sym
        end
    end

    def create_hash(values)
        h = {}
        @headers.each_with_index do |header, i|
            # remove new lines from the value
            value = values[i].strip.gsub('"', '')
            h[header] = value unless value.empty?
        end
        h
    end
end

class String
    # convert strings to_snake_case
    def underscore
        self.gsub(/::/, '/')
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase    
    end
end


peeps = CSVReader.new("test-database.csv")
#p peeps
#peeps.headers = peeps.headers=('"Name","Age","Gender"') ## Why doesn't this work?
peeps.headers = '"Name","Age","Gender"'

#p peeps.fname
#p peeps.headers

p peeps
