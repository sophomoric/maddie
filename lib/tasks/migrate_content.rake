namespace :migrate_content do
  task :run => :environment do
    MigrateContent.run
  end
end
