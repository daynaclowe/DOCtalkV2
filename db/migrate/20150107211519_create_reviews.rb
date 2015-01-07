class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :user_id
      t.integer :provider_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
