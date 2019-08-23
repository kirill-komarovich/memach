# frozen_string_literal: true

require 'active_record'

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)

    load @seed_file
  end
end

seed_loader = Seeder.new(File.join(Application.root, 'db/seeds.rb'))

ActiveRecord::Tasks::DatabaseTasks.env = Application.env.to_s
ActiveRecord::Tasks::DatabaseTasks.database_configuration = Application.database_config
ActiveRecord::Tasks::DatabaseTasks.db_dir = File.join(Application.root, 'db')
ActiveRecord::Tasks::DatabaseTasks.fixtures_path = File.join(Application.root, 'test/fixtures')
ActiveRecord::Tasks::DatabaseTasks.migrations_paths = [File.join(Application.root, 'db/migrate')]
ActiveRecord::Tasks::DatabaseTasks.seed_loader = seed_loader
ActiveRecord::Tasks::DatabaseTasks.root = Application.root

task :environment do
  ActiveRecord::Base.configurations = ActiveRecord::Tasks::DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection(ActiveRecord::Tasks::DatabaseTasks.env.to_sym)
end

load 'active_record/railties/databases.rake'
