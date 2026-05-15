class CreatePostImages < ActiveRecord::Migration[8.0]
  def change
    create_table :post_images do |t|
      # ↓ この行を消す！
      # t.integer :id 

      t.string :shop_name
      t.text :caption
      t.integer :user_id
      t.timestamps
    end
  end
end
