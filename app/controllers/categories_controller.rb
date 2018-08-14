class CategoriesController < ApplicationController

  def index
  end

  def show
    category_class = params[:id][0].to_i
    category_id = params[:id][1,10].to_i
    each_cat = [@large_classes = LargeClass.pluck(:id, :name), @middle_classes = MiddleClass.pluck(:id, :name, :large_class_id), @small_classes = SmallClass.pluck(:id, :name, :middle_class_id)]
    @category_info = each_cat[category_class-1][category_id-1]  <<  category_class

    @products = Product.fetch_products_of_category(category_class, category_id)

    render layouts: "category"
  end
end
