class CreateSmallClasses < ActiveRecord::Migration
  def change
    create_table :small_classes do |t|

      t.timestamps null: false
    end
  end
end
