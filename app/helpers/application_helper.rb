module ApplicationHelper
  def localiztion_for(object, method)
    method = "en_#{method}".to_sym if session[:locale] == :en
    object.send(method)
  end

  def show_(name)
    content = @settings.select { |setting| setting.title == name }.first
    #content = Setting.find_by_title(name)
    content ? text = localiztion_for(content, :content) : content = Setting.create!(:title => name)
    text.present? ? text : "#{ link_to 'edit me', edit_admin_setting_path(content) }"
  end

  def set_categories_for_(image)
    cat = ""
    if image.service
      image.service.categories.each do |category|
        cat << " cat_#{category.id}"
      end
    end
    cat
  end

  def set_categories2_for_(image)
    cat = ""
    if image.category
      cat = " cat_#{image.category.id}"
    end
    cat
  end

  def settings_for(gallery)
    if session[:locale] == :en
      gallery.en_title.present? && gallery.en_description.present? ? 'top:-80px' : 'top:0px'
    else
      gallery.title.present? && gallery.description.present? ? 'top:-80px' : 'top:0px'
    end
  end

  def settings2_for(gallery)
    if session[:locale] == :en
      gallery.en_title.present? && gallery.en_description.present? ? 'top:55%' : 'top:40%'
    else
      gallery.title.present? && gallery.description.present? ? 'top:55%' : 'top:40%'
    end
  end

  def show_description_for(gallery)
    if session[:locale] == :en
      gallery.en_title.present? && gallery.en_description.present?
    else
      gallery.title.present? && gallery.description.present?
    end
  end

  def photo_for(object, size)
    object ? object.photo.url(size) : '/assets/no_image.png'
  end

  def alt_for(gallery)
    gallery.present? ? localiztion_for(gallery, :title) : ""
  end

  def image(galleries, i, size = :original)
    if galleries[i]
      size == :original ? galleries[i].photo.url : galleries[i].photo.url(size)
    else
     '/assets/no_image.png'
    end
  end
end
