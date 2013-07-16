class PagesController < ApplicationController
  def welcome
    @categories = Category.all
    @phrases = Phrase.all
    @services = Service.all
    # @galleries = Gallery.limit(8).all(:order => "RANDOM()")
    @galleries = Gallery.where("category_id IS NOT NULL").order("RANDOM()")
    @slider_galleries = Gallery.where(:for_small_slider => true)
    @separately_categories = Category.where(:separately => true)
  end

  def send_message
    Mailer.send_message(params).deliver if params[:full_name].present? && params[:email].present? && params[:subject].present? && params[:message].present?

    redirect_to root_path
  end
end
