class CreateIntegrations < ActiveRecord::Migration
  def change
    create_table :integrations do |t|
      t.string :name, default: ''
      t.string :api_key, default: ''
      t.string :subdomain, default: ''
      t.integer :organisation_id

      t.timestamps
    end
  end
end
