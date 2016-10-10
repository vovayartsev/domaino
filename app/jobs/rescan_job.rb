class RescanJob < ApplicationJob
  queue_as :default

  def perform(*args)
    portal = Portal.first
    unless portal.progress # TODO: TTL for progress flag
      portal.domains = []

      10.times do |i|
        portal.progress = 10 * (i+1)
        portal.save
        sleep 1
      end

      portal.domains = [{"dns" => {"class" => "positive", "message" => "Valid till 01/01/2016"}, "name" => "google.com", "ssl" => {"class" => "positive", "message" => "Valid till 01/01/2016"}}, {"dns" => {"class" => "negative", "message" => "Expired"}, "name" => "microsoft.com", "ssl" => {"class" => "disabled", "message" => "Not Available"}}, {"dns" => {"class" => "warning", "message" => "Expires in 1 week"}, "name" => "apple.com", "ssl" => {"class" => "disabled", "message" => "Not Available"}}]
      portal.progress = nil
      portal.save
    end
  end
end
