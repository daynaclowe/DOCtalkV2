class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :organization_name
      t.string :kind
      t.string :address_line1
      t.string :address_line2
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :phone
      t.integer :waiting_period
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
