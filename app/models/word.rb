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
  
end
