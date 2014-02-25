class CreateCountriesList < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.column :short_name, :string, size: 120
      t.column :alpha2, :string, size: 2
      t.column :alpha3, :string, size: 3
      t.column :numeric, :integer
    end
  end

  def self.down
    drop_table :countries
  end
end
