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

end
