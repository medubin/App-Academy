
#time complexity = n2
# [0,1,2,3,4]
# 0 0,1,2,3,4
# 1 0,1,2,3,4
# 2 0,1,2,3,4
# 3 0,1,2,3,4
# 4 0,1,2,3,4

def my_min_n2(arr)
  smallest_number = true
  arr.each do |first_el|
    smallest_number = true
    arr.each do |second_el|
      smallest_number = false if second_el < first_el
    end
    return first_el if smallest_number
  end
end


def my_min_n(arr)
  smallest_number = arr.first
  arr.each do |el|
    smallest_number = el if el < smallest_number
  end
  smallest_number
end

def largest_contiguous_subsum_n2(list)

  sub_array = []

  list.each_index do |first_index|
    list[first_index..-1].each_index do |second_index|
      sub_array << list[first_index..second_index + first_index]
    end
  end

  largest_sum = 0

  sub_array.each do |array|
    current_sum = array.inject(0,:+)
    largest_sum = current_sum if current_sum > largest_sum
  end

  largest_sum

end

def largest_contiguous_subsum_n(list)
  best_sum = 0
  current_sum = 0
  temp_sum = 0
  list.each do |el|
    if el >= 0
      current_sum = temp_sum if  temp_sum > 0
      current_sum += el
      temp_sum = 0
    elsif el < 0
      best_sum = current_sum if current_sum > best_sum
      temp_sum = temp_sum + el if temp_sum
      temp_sum = current_sum + el if temp_sum < 0
    end

    #
    #
    # if el < 0
    #   temp_sum =
    #
    # if el > #?
    #   current_sum += el
    # else
    #   best_sum = current_sum if current_sum > best_sum
    #   current_sum = 0
    # end
  end
  [best_sum, current_sum].max
end

# def largest_contiguous_subsum_n(list)
#   best_sum = 0
#   current_sum = 0
#   list.each do |el|
#     if el > 0
#       current_sum += el
#     else
#       best_sum = current_sum if current_sum > best_sum
#       current_sum = 0
#     end
#   end
#   [best_sum, current_sum].max
# end
