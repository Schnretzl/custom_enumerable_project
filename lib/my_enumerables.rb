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
    my_each do |value|
      acc = yield acc, value
    end
    acc
  end

  def my_map(*modifier)
    return_array = []
    if !modifier.empty? && modifier.first != '&'
      puts 'Error: called with incorrect format.  Please use &:symbol'
    elsif !modifier.empty?
      modifier = modifier[2..-1]
      my_each do |value|
        item = yield value, modifier
        return_array << item
      end
    else
      my_each do |value|
        item = yield value
        return_array << item
      end
    end
    return_array
  end

  def my_none?
    my_each do |value|
      return false if yield value
    end
    true
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
