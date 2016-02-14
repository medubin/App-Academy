# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
class Array
  def subsets
    return [[]] if self.empty?
    current_subs = self[0..-2].subsets
    return current_subs += current_subs.map do |subb|
      subb + [self[-1]]
    end
  end
end
