class WordsController < ApplicationController
  require 'rake'

  def index
    Rails.application.load_tasks
    Rake::Task['scrape:get_words'].execute
    Rake::Task['scrape:get_words'].clear
    @words = Word.all
  end
end
