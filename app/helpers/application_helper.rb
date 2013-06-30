module ApplicationHelper
  def localiztion_for(object, method)
    method = "en_#{method}".to_sym if session[:locale] == :en
    object.send(method)
  end

  def show_(name)
    content = Setting.find_by_title(name)
    content ? text = localiztion_for(content, :content) : content = Setting.create!(:title => name)
    text ? text : "#{ link_to 'edit me', edit_admin_setting_path(content) }"
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
end
