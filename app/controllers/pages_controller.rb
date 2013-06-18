class PagesController < ApplicationController
  def welcome
    @caregories = Category.all
  end
end
