class CreateMiddleClasses < ActiveRecord::Migration
  def change
    create_table :middle_classes do |t|

      t.timestamps null: false
    end
  end
end
