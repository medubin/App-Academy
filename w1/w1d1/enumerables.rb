class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    selected_array = []
    self.my_each {|el| selected_array << el if prc.call(el)}
    selected_array
  end

  def my_reject(&prc)
    selected_array = []
    self.my_each {|el| selected_array << el unless prc.call(el)}
    selected_array
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    false
  end

  def my_all?(&prc)
    self.my_each {|el| return false unless prc.call(el)}
    true
  end

  def my_flatten
    flattened_array = []
    self.my_each do |el|
      if !el.is_a?(Array)
        flattened_array << el
      else
        el.my_flatten.each { |sub_el| flattened_array << sub_el }
      end
    end

    flattened_array
  end
  def my_zip(*args)
    zipped_array = []
    element_of_array = []
    self.each_index do |idx|
      element_of_array = [self[idx]]
      args.each {|i|element_of_array << i[idx] }
      p element_of_array
      zipped_array <<  element_of_array
    end
    zipped_array
  end

  def my_rotate(num = 1)
    rotated_array = self.dup
    self.each_index { |idx| rotated_array[((idx-num) % (self.length))] = self[idx]}
    rotated_array

  end
  def my_join(sep = "")
    joined_string = ""
    self.each { |el| joined_string << (sep + el.to_s)}
    joined_string[sep.length..-1]
  end

  def my_reverse
    reversed_array = []
    self.each_index{|idx| reversed_array << self[self.length - 1 - idx] }
    reversed_array
  end

end
a = [1,2,'b',4]
b = [5,6,7]
p a.my_reverse
