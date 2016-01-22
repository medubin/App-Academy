def childs_money_at_retirement(parents_age)
      childs_age = parents_age / 2
      childs_current_money = childs_age ** 2
      childs_years_to_retirement = (65 - childs_age)
      childs_current_money * childs_years_to_retirement
    end
