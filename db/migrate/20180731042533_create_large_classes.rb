class CreateLargeClasses < ActiveRecord::Migration
  def change
    create_table :large_classes do |t|

      t.timestamps null: false
    end
  end
end
