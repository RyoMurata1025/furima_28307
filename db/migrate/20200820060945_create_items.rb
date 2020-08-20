class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.string :information, null: false, default: ""
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :delivery_fee, null: false
      t.integer :delivery_area, null: false
      t.integer :delivery_days, null: false
      t.integer :price, index: true, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
