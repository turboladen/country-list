require 'rails/generators/base'

class CountriesListGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(_)
    Time.now.strftime('%Y%m%d%H%M%S')
  end

  def copy_countries_migration
    migration_template 'migration.rb', 'db/migrate/create_countries'
  end
end
