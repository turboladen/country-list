require 'rails/generators/base'

class CountriesListGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(_)
    Time.now.strftime('%Y%m%d%H%M%S')
  end

  def copy_countries_migration
    migration_template 'migration.rb', 'db/migrate/create_countries_list'
  end

  def generate_model
    invoke 'active_record:model', ['country'], migration: false unless model_exists? && behavior == :invoke
  end

  def copy_countries_seeds
    copy_file 'seeds.rb', 'db/seed_countries.rb'
  end

  def create_rake_task
    rakefile 'seed_countries.rake' do
      %q{
desc 'Create the countries table and seed it with data'
task seed_countries: :environment do
  load 'db/seed_countries.rb'
end
      }
    end
  end

  private

  def model_exists?
    File.exists?(File.join(destination_root, model_path))
  end

  def model_path
    @model_path ||= File.join("app", "models", "country.rb")
  end
end
