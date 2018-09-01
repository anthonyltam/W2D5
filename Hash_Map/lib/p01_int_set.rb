class MaxIntSet
  
  attr_reader :store
  
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    raise 'Out of bounds' if num > store.length || num < 0
    # unless @store[num]
    @store[num] = true
    # end
    # true
  end

  def remove(num)
    # if @store[num]
      @store[num] = false
    # end
  end

  def include?(num)
    return @store[num] 
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % @store.length
    @store[bucket]<< num
    @store
  end

  def remove(num)
    bucket = num % @store.length
  
    @store[bucket].delete(num)
  end

  def include?(num)
    @store.each do |bucket|
      return true if bucket.include?(num)
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == @store.length
      resize!
    end
    bucket = num % @store.length
    unless self.include?(num)
      @store[bucket] << num
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      bucket = num % @store.length
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store.flatten.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup.flatten
    
    @store = Array.new(num_buckets * 2) { Array.new }
  
    @count = 0
    old_store.each do |el|
      insert(el)
    end
  end
  
end
