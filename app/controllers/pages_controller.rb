class PagesController < ApplicationController
  def welcome
    @categories = Category.all
    @phrases = Phrase.all
    @services = Service.all
    @all_galleries = Gallery.all
    @settings = Setting.all
    @prices = Price.all

    @galleries = @all_galleries.select(&:category_id).sort_by { rand }
    @slider_galleries = @all_galleries.select(&:for_small_slider)
    @bg_galleries = @all_galleries.select(&:for_big_slider)

    @separately_categories = @categories.select(&:separately)

    # @galleries = Gallery.where("category_id IS NOT NULL").order("RANDOM()")
    # @slider_galleries = Gallery.for_slider
    # @bg_galleries = Gallery.for_background
    # @separately_categories = Category.includes(:galleries).where(:separately => true)
  end

  def send_message
    Mailer.send_message(params).deliver if params[:full_name].present? && params[:email].present? && params[:subject].present? && params[:message].present?

    redirect_to root_path
  end
end
