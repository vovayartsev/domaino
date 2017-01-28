class Portal < ApplicationRecord
  has_many :domains, dependent: :destroy
  has_one :settings

  def set_domains_list!(domain_names)
    current_names = domains.map(&:name)
    remove_obsolete_domains(current_names - domain_names)
    create_new_domains(domain_names - current_names)
  end

  # orphaned domains are assigned to GC portal
  def self.gc_portal
    where(email: 'garbage_collector@domaino.herokuapps.com').first_or_create!
  end

  private

  def create_new_domains(domain_names)
    domain_names.each do |name|
      domains << Domain.new_with_default_checks(name: name)
    end
  end

  def remove_obsolete_domains(domain_names)
    domains.where(name: domain_names.to_ary).update_all(portal_id: Portal.gc_portal.id)
    domains.reload
  end
end
