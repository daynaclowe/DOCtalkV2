class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address_line1
      t.string :address_line2
      t.string :postal_code
      t.string :city
      t.string :province
      t.string :phone
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
