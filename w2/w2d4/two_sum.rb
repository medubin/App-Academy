def bad_two_sum?(arr, target_sum)

  for i in (0..arr.length-2)
    for j in (i+1..arr.length-1)
      if arr[i] + arr[j] == target_sum
        return true
      end
    end
  end
  false
end


def okay_two_sum?(arr, target_sum)

  sorted = arr.sort

  arr.each do |el|
    front = sorted.shift
    results = bsearch(sorted, target_sum - front)
    return true if results
  end
  false
end


def bsearch(array, target)

  return nil if array.empty?

  mid = array.length/2

  if array[mid] == target
    mid
  elsif array[mid] > target
    bsearch(array[0...mid], target)
  else
    sub_result = bsearch(array[mid+1..-1], target)
    unless sub_result.nil?
      (mid+1) + sub_result
    end
  end
end


def great_pair_sum?(array, target_sum)

  hash = Hash.new{|k,v| k[v] = 0}

  array.each do |el|
    hash[el] += 1
  end

  hash.each do |k,v|
    matching_num = target_sum - k
    if k == matching_num
      return true if v > 1
    else
      return true if hash.has_key? matching_num
    end
  end

  false

end
