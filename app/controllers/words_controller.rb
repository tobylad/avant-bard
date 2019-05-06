class WordsController < ApplicationController

  def index
  end

  def similar
    @word_searched = params["q"]
    @found_words   = Word.find_similar(@word_searched)
    render "similar"
  end

  def rhyme
    @word_searched = params["q"]
    @found_words   = Word.find_rhymes(@word_searched)
    render "rhymes"
  end


end