def make_change(change, coins)
  return [] if change == 0
  best_purse_array = nil
  coins.each do |coin|
    next if coin > change
    next unless current_purse = make_change(change - coin, coins)
    current_purse = [coin] + current_purse
    best_purse_array = current_purse if best_purse_array.nil? || current_purse.length < best_purse_array.length
    p current_purse
  end
return best_purse_array
end

p make_change(14, [10,7,1])
