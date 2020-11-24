class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                            null: false
      t.text :text,                              null: false
      t.integer :category_id,                    null: false
      t.integer :item_status_id,                 null: false
      t.integer :item_fee_status_id,             null: false
      t.integer :item_prefecture_id,             null: false
      t.integer :item_scheduled_delivery_id,     null: false
      t.integer :price,                          null: false
      t.references :user,                        null: false, foreign_key: true

  end
  end
end
