module Enumerable
  # Your code goes here

  def my_all?
    my_each do |value|
      return false unless yield value
    end
    true
  end

  def my_any?
    my_each do |value|
      return true if yield value
    end
    false
  end

  def my_count
    items = 0
    unless block_given?
      my_each { items += 1 }
    else
      my_each { |value| items += 1 if yield(value) }
    end
    items
  end

  def my_each_with_index
    index = 0
    my_each do |value|
      yield value, index
      index += 1
    end
  end

  def my_inject(*initial_value)
    acc = initial_value.empty? ? 0 : initial_value[0]
    each do |value|
      acc = yield acc, value
    end
    acc
  end

  def my_map
    yield split
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
