def range(start, end_pos)
  return [] if start == end_pos
  [start] + range(start+1, end_pos)
end

def sum_of_array_iterative(arr)
  arr.inject(:+)
end

def sum_of_array_recursive(arr)
  return 0 if arr.empty?
  arr[-1] + sum_of_array_recursive(arr[0..-2])
end

def exponent1(base, exponent)
  return 1 if exponent == 0
  base * exponent1(base, exponent - 1)
end

def exponent2(base, exponent)
  return 1 if exponent == 0
  return base if exponent == 1
  if exponent.even?
    calc1 = exponent2(base, exponent / 2)
    return calc1 * calc1
  else
    calc1 = exponent2(base, ((exponent - 1) / 2))
    return base * calc1 * calc1
  end

end

def deep_dup(arr)
  return arr unless arr.is_a?(Array)
  arr.map{|x| deep_dup(x)}
end

def fibonacci_iter(n)
  startingfib = [0,1]
  if n < 3
    return startingfib.take(n)
  end
  (n-2).times do
    startingfib << (startingfib[-1] + startingfib[-2])
  end

  startingfib
end

def fibonacci_rec(n)
  if n < 3
    return [0,1].take(n)
  end
  precedingnums = fibonacci_rec(n - 1)
  return precedingnums << precedingnums[-1] + precedingnums[-2]
end

def binary_search(array, target)
  return nil if array.empty?
  value = array[array.length/2]
  return array.length/2 if value == target
  return binary_search(array[0...(array.length/2)], target) if value > target
  check = binary_search(array[(array.length/2)..array.length - 1], target)
  check ? (return (array.length/2) + binary_search(array[(array.length/2)..array.length - 1], target)) : (return check)
end


def quick_sort(array)
  return array if array.length <= 1
  pivot = array[-1]
  left_side, right_side = [], []
  array[0..-2].each do |el|
    (el < pivot) ? (left_side << el) : (right_side << el)
  end
  return quick_sort(left_side) + [pivot] + quick_sort(right_side)
end


def merge_sort(arr)
  return arr if arr.length <= 1


end


def merge(left, right)

end

class Array
  def subsets
    return [[]] if self.empty?
    previous_subset = self[0..-2].subsets
    current_subset = deep_dup(previous_subset)
    return previous_subset + current_subset.map{|el| el + [self[-1]] }
  end

end

def make_change1(change, coins)
  return [] if change == 0
  cointouse = coins.select {|el| el <= change}.max
  return [cointouse] * (change / cointouse) + make_change1(change - (cointouse * (change / cointouse)), coins)
end

def make_change2(change, coins)
  return [] if change == 0
  cointouse = coins.select {|el| el <= change}.max
  if cointouse == coins.max
    return [cointouse] + make_change2(change - cointouse, coins)
  else
    next_coins = coins.reject {|el| el == coins.max}
    return [cointouse] + make_change2(change - cointouse, next_coins )
  end
end

def make_change3(change, coins)
  return [] if change == 0
  best_coins = []
  current_coins = []
  coins.each do |coin|
    if change >= coin
      current_coins = [coin] + make_change3(change - coin, coins)
      p current_coins
      if change == current_coins.inject(:+)
        puts 'hi'
        if best_coins.empty? && current_coins.length > best_coins.length
          current_coins = best_coins
        end
      end
    end
  end
  current_coins
end



def make_change4(change, coins)
  return [] if change == 0
  best_coins = [0] * 100
  coins.each do |coin|
    if change >= coin
      current_coins = [coin] + make_change4(change - coin, coins)
      if ((current_coins.length <= best_coins.length) && current_coins.inject(:+) == change) #|| best_coins.empty?
        p current_coins
        best_coins = current_coins
      end
    end
  end
   return best_coins
end


def make_change5(change, coins)
  return [] if change == 0
  best_coins = nil
  coins.each do |coin|
    if change >= coin
      current_coins = make_change5(change - coin, coins)
      if current_coins
        current_coins = [coin] + current_coins
        best_coins ||= current_coins
        if ((current_coins.length <= best_coins.length) && current_coins.inject(:+) == change) #|| best_coins.empty?
          best_coins = current_coins
        end
      else
        current_coins = nil
      end
    end
  end
   return best_coins
end
