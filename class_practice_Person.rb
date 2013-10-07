#m2f = {"Bob" => "Roberta", "John" => "Jane", "Mark" => "Mary"}

class Person
  # why do we need attr_accessor here?
  #attr_accessor :name, :sex, :age
  @@m2f = {"Bob" => "Roberta", "John" => "Jane", "Mark" => "Mary"} # class variable
  @@f2m = @@m2f.invert

  def age_in_2000
    @age - 13
  end

  def initialize(name, sex, age)
    @name, @sex, @age = name, sex, age
  end

  def sex_change_operation(name_change=false)
    #@sex == "M" ? @sex = "F" : @sex = "M" # toggle sex
    if @sex == "M"
      @sex = "F"
      if (name_change)
        # make female name
        @name = @@m2f[@name]
      end
    else
      @sex = "M"
      @name = @@f2m[@name] if name_change
    end
  end
end

class Hash
  def flip
    # reverses k, v pairs
    #ans = {}
    self
  end
end

bob = Person.new("Bob", "M", 47)
#p bob.age_in_2000
p bob
bob.sex_change_operation(true)
p bob
bob.sex_change_operation(true)
p bob

#p {a: 2, b: 8, c: 12}.flip
