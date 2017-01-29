class DnsValidationService
  include Retriable
  Result = Struct.new(:available, :paid_till, :error)

  def call(tld)
    tld = tld.split('.')[-2..-1].join('.')

    record = Rails.cache.fetch(tld, expires_in: 5.minutes) do
      retriable { Whois.whois(tld).parser }
    end

    if record.registered?
      Result.new(true, record.expires_on.to_date, nil)
    else
      Result.new(false, nil, RuntimeError.new("Domain not found"))
    end
  end
end
