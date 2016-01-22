
def first_anagram?(first_string, second_string)
  anagrams = all_anagrams(first_string)
  anagrams = anagrams.map(&:join).select {|el| el.length == first_string.length}.uniq
  anagrams.include?(second_string)
end


def all_anagrams(string)
  return [[]] if string.length == 0
  anagrams = []
  string.chars.each do |chr|
    new_string = string.sub(chr, "")
    new_anagrams = all_anagrams(new_string)
    anagrams += new_anagrams.map {|el| el + [chr] }
  end
  anagrams
end


def second_anagram?(first_string, second_string)
  first_dup = first_string.dup
  second_dup = second_string.dup

  return false if first_string.length != second_string.length

  first_string.each_char do |first_chr|
    second_string.each_char do |second_chr|

      if first_chr == second_chr
        first_dup = first_dup.sub(first_chr, "")
        second_dup = second_dup.sub(second_chr, "")
      end

    end
  end

  first_dup.length == 0 && second_dup.length == 0

end


def third_anagram?(first_string, second_string)
  first_string.chars.sort == second_string.chars.sort
end


def fourth_anagram?(first_string, second_string)
  letter_count = Hash.new { |k,v| k[v] = 0 }
  return false if first_string.length != second_string.length
  first_string.chars.each_with_index do |first_chr, idx|
    letter_count[first_chr] += 1
    letter_count[second_string[idx]] -= 1
  end
  letter_count.each do |k,v|
    return false unless v == 0
  end
  true
end
