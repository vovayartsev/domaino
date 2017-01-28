# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "List of all domains with alerts"
task :alerts => :environment do
  domain_ids = Check.active_alerts.select(:domain_id)
  domain_names = Domain.where(id: domain_ids).order(:name).pluck(:name)
  if domain_names.any?
    puts domain_names
  else
    puts "Congratulations. No alerts found"
  end
end
