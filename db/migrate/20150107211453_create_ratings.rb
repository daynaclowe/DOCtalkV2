class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :provider_id
      t.integer :knowledge
      t.integer :support
      t.integer :comfort
      t.integer :accessibility
      t.integer :recommendation

      t.timestamps
    end
  end
end
