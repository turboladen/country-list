require 'rails/generators/base'

class CountryListGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(_)
    Time.now.strftime('%Y%m%d%H%M%S')
  end

  def copy_countries_migration
    migration_template 'migration.rb', 'db/migrate/create_countries'
  end

  def generate_model
    invoke 'active_record:model', ['country'], migration: false unless model_exists? && behavior == :invoke
  end

  def add_translatable_to_model
    if File.exist?('app/models/country.rb')
      inject_into_file 'app/models/country.rb', after: 'class Country < ActiveRecord::Base' do
        "\n  translates :short_name, fallbacks_for_empty_translations: true"
      end
    end
  end

  def copy_yaml_files
    copy_file 'codes.yml', 'db/countries/codes.yml'
    copy_file 'en.yml', 'db/countries/en.yml'
    copy_file 'fr.yml', 'db/countries/fr.yml'
  end

  def copy_countries_seeds
    copy_file 'seeds.rb', 'db/seed_countries.rb'
  end

  def create_rake_task
    rakefile 'seed_countries.rake' do
      %q{
desc 'Create the countries table and seed it with data'
task seed_countries: :environment do
  require Rails.root + 'db/seed_countries'
  CountryList.make_en
  CountryList.make_fr
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
