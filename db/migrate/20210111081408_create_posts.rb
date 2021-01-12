class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :price
      t.integer :gender
      t.string :hobby
      t.text :foods, array: true, default: []
      t.date :sus_date
      t.timestamps
    end
  end
end
