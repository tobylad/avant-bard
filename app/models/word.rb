class Word < ApplicationRecord
  include HTTParty

  def self.find_similar(word)
    word_searched = word
    found_words   = []
    resp          = HTTParty.get("https://api.datamuse.com/words?ml=#{word}")
    word_objects  = resp.parsed_response

    word_objects.each { |obj| found_words << obj["word"] }
    found_words
  end

  def self.find_rhymes(word)
    word_searched = word
    found_words   = []
    resp          = HTTParty.get("https://api.datamuse.com/words?rel_rhy=#{word}")
    word_objects  = resp.parsed_response

    word_objects.each { |obj| found_words << obj["word"] }
    found_words
  end

  def self.suggest_scrabble(letters, intersecting_letters)
    root           = RubyAnagrams::Root.new("all_words.txt")
    anagram_groups = []


    if intersecting_letters.length == 1
      anagrams = root.anagrams(letters + intersecting_letters, partial: true)
      word_max = anagrams.max_by(&:length).length

      word_max.times do |i|
        arr = anagrams.select { |word| word.length == i+1 }
        if arr.length > 1
          sorted_arr = arr.sort_by { |word| self.base_word_score(word) }
          anagram_groups << sorted_arr.reverse
        end
      end

    elsif intersecting_letters.length > 1
      letter_array = intersecting_letters.chars

      letter_array.each do |letter|
        anagrams = root.anagrams(letters + letter, partial: true)
        word_max = anagrams.max_by(&:length).length

        word_max.times do |i|
          arr = anagrams.select { |word| word.length == i+1 }
          if arr.length > 1
            sorted_arr = arr.sort_by { |word| self.base_word_score(word) }
            anagram_groups << sorted_arr.reverse
          end
        end

      end

    elsif intersecting_letters.length == 0
      anagrams       = root.anagrams(letters + intersecting_letters, partial: true)
      word_max       = anagrams.max_by(&:length).length

      word_max.times do |i|
        arr = anagrams.select { |word| word.length === i+1 }
        if arr.length > 1
          sorted_arr = arr.sort_by { |word| self.base_word_score(word) }
          anagram_groups << sorted_arr.reverse
        end
      end
    end

    anagram_groups.each { |group| group.uniq! }

    anagram_groups
  end

  def self.base_word_score(word)
    point_chart = {
      "a" => 1,
      "b" => 4,
      "c" => 4,
      "d" => 2,
      "e" => 1,
      "f" => 4,
      "g" => 3,
      "h" => 3,
      "i" => 1,
      "j" => 10,
      "k" => 5,
      "l" => 2,
      "m" => 4,
      "n" => 2,
      "o" => 1,
      "p" => 4,
      "q" => 10,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "u" => 2,
      "v" => 5,
      "w" => 4,
      "x" => 8,
      "y" => 3,
      "z" => 10
    }

    score = 0

    word.chars.each do |letter|
      score += point_chart[letter]
    end

    score
  end
  
end
