

require "csv"

class MyCsv
  #require "csv"

  def initialize(fn)   
    reader = CSV.open(fn, "r")
    reader
  end

  def headings
        
  end



end

zip_db = MyCsv.new("zip-small.csv")
p zip_db
zip_db.headings
