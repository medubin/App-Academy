def make_change(change, coins)
  return [] if change == 0
  best_coins = nil
  coins.each do |coin|
    next if change < coin
    if current_coins = make_change(change - coin, coins)
      current_coins = [coin] + current_coins
      best_coins ||= current_coins
      if ((current_coins.length <= best_coins.length) && current_coins.inject(:+) == change)
        best_coins = current_coins
      end
    end
  end
   return best_coins
end
