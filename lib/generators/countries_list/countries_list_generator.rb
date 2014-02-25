require 'rails/generators/active_record'

class CountriesListGenerator < ActiveRecord::Generators::Base
=begin
  def create_migration_file
    migrations_directory_path = "#{RAILS_ROOT}/db/migrate"
    Dir.mkdir(migrations_directory_path) unless File.directory?(migrations_directory_path)

    # copy countries migration
    record do |m|
      m.file 'migrations/migration.rb', "db/migrate/#{Time.now.strftime('%Y%m%d%H%M%S')}_create_countries.rb"
    end
  end
=end

  def copy_countries_migration
    if (behavior == :invoke && model_exists?) || (behavior == :revoke && migration_exists?(table_name))
      migration_template 'migration.rb', "db/migrate/create_#{table_name}"
    end
  end


  def generate_model
    invoke 'active_record:model', [name], :migration => false unless model_exists? && behavior == :invoke
  end

  private

  def model_exists?
    File.exists?(File.join(destination_root, model_path))
  end

  def model_path
    @model_path ||= File.join('app', 'models', "#{file_path}.rb")
  end
end
