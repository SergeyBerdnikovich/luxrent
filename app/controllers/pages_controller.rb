class PagesController < ApplicationController
  def welcome
    @categories = Category.all
    @phrases = Phrase.all
    @services = Service.all
    @galleries = Gallery.all(:order => "RANDOM()")
    @slider_galleries = Gallery.where(:for_small_slider => true)
    @separately_categories = Category.where(:separately => true)
  end
end
