module PagesHelper
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
