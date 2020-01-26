class KeywordsController < ApplicationController
  before_action :set_word, only: %i[create destroy]

  def create; end

  def destrooy; end

  private

  def set_word
    @word = Word.find(word_id: word.id)
  end
end
