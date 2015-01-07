class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :kind
      t.string :phone
      t.string :image
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :address_line1
      t.string :address_line2
      t.text :full_address
      t.integer :waiting_period
      t.string :first_name
      t.string :last_name
      t.integer :organization_id
      t.integer :user_id

      t.timestamps
    end
  end
end
