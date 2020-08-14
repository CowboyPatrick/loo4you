class AddRatingToToilets < ActiveRecord::Migration[6.0]
  def change
    add_column :toilets, :rating, :integer
    Toilet.find_each do |t|
      t.rating = rand(1..5)
      t.save
    end
  end
end
