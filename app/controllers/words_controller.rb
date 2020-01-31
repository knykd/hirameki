class WordsController < ApplicationController
  def index
    word_count = 10
    random_word_ids = (1...Word.count).to_a.sample(word_count)
    @words = Word.where(id: random_word_ids)
  end
end
