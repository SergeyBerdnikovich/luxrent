class PagesController < ApplicationController
  def welcome
    @categories = Category.all
    @phrases = Phrase.all
    @services = Service.all
    @galleries = Gallery.all(:order => "RANDOM()")
  end
end
