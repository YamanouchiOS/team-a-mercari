class CreateMiddleClasses < ActiveRecord::Migration
  def change
    create_table :middle_classes do |t|
      t.name :string, null: false, unique: true
      t.large_class_id :references, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
