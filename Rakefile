# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

def query_domain_names_with_alerts
  domain_ids = Check.active_alerts.select(:domain_id)
  Domain.where(id: domain_ids).order(:name).pluck(:name)
end

def slack(message)
  notifier = Slack::Notifier.new ENV.fetch('SLACK_WEBHOOK')
  notifier.ping message
end

namespace :alerts do
  desc "List of all domains with alerts"
  task :show => :environment do
    domain_names = query_domain_names_with_alerts
    if domain_names.any?
      puts domain_names
    else
      puts "Congratulations. No alerts found"
    end
  end

  desc "Sends alerts to Slack"
  task :slack => :environment do
    domain_names = query_domain_names_with_alerts
    if domain_names.any?
      slack "DOMAINS WITH ALERTS:\n" + domain_names.join("\n")
    else
      slack "Congratulations. No alerts found"
    end
  end
end

desc "Scan all domains"
task :rescan => :environment do
  Portal.active_portal_ids.each do |portal_id|
    RescanJob.perform_later(portal_id)
  end
end
