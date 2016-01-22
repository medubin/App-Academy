require 'set'

class Wordchainer
  attr_accessor :dictionary
  def initialize(dictionary_filename)
    @dictionary = populated_dictionary(dictionary_filename)
  end

  def populated_dictionary(dictionary_filename)
    dictionary_set = Set.new
    File.open(dictionary_filename).each_line do |line|
      dictionary_set << line.chomp
    end
    dictionary_set
  end

  def adjacent_words(word)
    adj_words = @dictionary.select do |el|
      bool = true
      bool = false unless el.length == word.length
      differences = 0
      word.chars.each_index {|i| differences += 1 if word[i] != el[i]}
      bool = false if differences != 1
      bool
    end
    adj_words
  end

  def adjacent_words(word)
    adj_words = []
    alphabet = ('a'..'z').to_a
    word.chars.each_index do |char_index|
      alphabet.each do |replacement_char|
        new_word = word.dup
        new_word[char_index] = replacement_char
        adj_words << new_word if (@dictionary.include?(new_word)) && (word != new_word)
      end
    end
    adj_words
  end



  def run(source, target)
    @current_words = [source]
    @all_seen_words = [source]

    until @current_words.empty?
      new_current_words = []
      @current_words.each do |word|
        adjacent_words(word).each do|adj_word|
          unless @all_seen_words.include?(adj_word)
            new_current_words << adj_word
            @all_seen_words << adj_word
          end
        end

      end
      puts new_current_words
      @current_words = new_current_words
    end
  end





  def dictionary
    @dictionary.each {|el| puts el}
  end


end

 word_chainz = Wordchainer.new(ARGV[0])
 puts word_chainz.run("duck", "ruby")


 # def run(source, target)
 #   @current_words = [source]
 #   @all_seen_words = [source]
 #
 #   until @current_words.empty?
 #     new_current_words = []
 #     @current_words.each do |word|
 #       adjacent_words(word).each do|adj_word|
 #         unless @all_seen_words.include?(adj_word)
 #           new_current_words << adj_word
 #           @all_seen_words << adj_word
 #         end
 #       end
 #
 #     end
 #     puts new_current_words
 #     @current_words = new_current_words
 #   end
 # end
