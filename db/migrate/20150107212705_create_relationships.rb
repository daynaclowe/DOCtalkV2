class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :provider_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
