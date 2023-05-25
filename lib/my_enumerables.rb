module Enumerable
  # Your code goes here

  def my_all?
    self.each do |value|
      return false unless yield (value)
    end
    true
  end

  def my_any?
    self.each do |value|
      return true if yield (value)
    end
    false
  end
end


# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
    end
  end
end
