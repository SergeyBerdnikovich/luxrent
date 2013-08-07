class PagesController < ApplicationController
  def welcome
    @all_galleries = Gallery.all(:include => [:category])
    @prices = Price.all
    @categories = Category.all(:include => [:services])
    @services = Service.all(:include => [:categories])
    @phrases = Phrase.all
    @settings = Setting.all

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

# class Exits
#   extend Garb::Model
#   metrics :exits, :pageviews, :exit_rate, :new_visits
#   dimensions :page_path, :continent
# end