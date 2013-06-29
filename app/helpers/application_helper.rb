module ApplicationHelper
  def localiztion_for(object, method)
    method = "en_#{method}".to_sym if session[:locale] == 'en'
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
end
