class RemoveOrganizationConcersFromProviders < ActiveRecord::Migration
  def change
    remove_column :providers, :organization_name
    add_column :providers, :organization_id, :integer
    add_column :users,     :organization_id, :integer
    add_column :ratings,   :organization_id, :integer
    add_column :reviews,   :organization_id, :integer
  end
end
