module ApplicationHelper

  def large_classes
    LargeClass.pluck(:id, :name)
  end

  def middle_classes
    MiddleClass.pluck(:id, :name, :large_class_id)
  end

  def small_classes
    SmallClass.pluck(:id, :name, :middle_class_id)
  end

  def price_delimiter(price)
    number_with_delimiter(price)
  end

  def define_order_status(product)
    order_status_list = ["on_sale", "before_shipping", "before_receive-and-review", "before_sellers-review", "complete" ]
    order_status = order_status_list[product.status]
    return order_status
  end

  def buyer_or_seller(product, user)
    if product.user_id == user.id
      this_person = "seller"
    elsif product.buyer_id == user.id
      this_person = "buyer"
    end
  end

end
