class PagesController < ApplicationController
  def welcome
    @caregories = Category.all
    @phrases = Phrase.all
  end
end
