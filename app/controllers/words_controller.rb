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

  def scrabble
    @letters             = params["l"]
    @intersecting_letter = params["i"]
    @found_words         = Word.suggest_scrabble(@letters, @intersecting_letter)
    render "scrabble"
  end

end