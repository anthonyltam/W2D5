require 'json'


class Fixnum
  
  
  
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    # [1,2,3] .join('123' + '142352345').to_i
    
    map do |el|
      el * 256
    end
    join.to_i
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a
    result = []
    
    self.chars.each do |ch|
      result << alpha.index(ch)
    end
    
    result.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    string = to_json
    p string
    string.hash
  end
end
