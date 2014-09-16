class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
