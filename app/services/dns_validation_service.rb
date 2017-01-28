class DnsValidationService
  include Retriable
  Result = Struct.new(:available, :paid_till, :error)

  def call(tld)
    record = retriable { Whois.whois(tld).parser }

    if record.registered?
      Result.new(true, record.expires_on.to_date - 230, nil)
    else
      Result.new(false, nil, RuntimeError.new("Domain not found"))
    end
  end
end
