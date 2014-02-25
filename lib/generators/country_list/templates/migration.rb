class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.column :short_name, :string, size: 120
      t.column :alpha2, :string, size: 2
      t.column :alpha3, :string, size: 3
      t.column :numeric, :integer
    end

    Country.create_translation_table! short_name: :string
  end

  def self.down
    drop_table :countries
    Country.drop_translation_table!
  end
end
