class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :category
      t.boolean :available
      t.boolean :public
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
