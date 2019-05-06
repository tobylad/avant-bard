class WordsController < ApplicationController
  include HTTParty

  def index
    # resp         = HTTParty.get('https://api.datamuse.com/words?ml=ringing+in+the+ears')
    # word_objects = resp.parsed_response 
    # parsed_words = []

    # word_objects.each do |word_object|
    #   parsed_words << word_object["word"]
    # end

    # @words = parsed_words
    @words = ["poo", "fart"]
  end



end