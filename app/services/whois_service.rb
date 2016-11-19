class WhoisService
  Result = Struct.new(:valid, :paid_till, :error)

  def initialize
    @api_key = ENV.fetch('WHOIS_API_KEY')
  end

  def call(tld)
    response = Unirest.get "https://whois-v0.p.mashape.com/check?domain=#{tld}",
      headers:{
        "X-Mashape-Key" => @api_key,
        "Accept" => "application/json"
      }

    parts = response.body['whoisResponse'].each_line.
      map{|l| l.strip}.
      select{|l| l.present? && !l.start_with?('%')}.
      map{|l| l.split(/:\s+/)}

    hash = Hash[parts]
    if hash.has_key? "paid-till"
      Result.new(true, Date.parse(hash['paid-till']), nil)
    else
      Result.new(false, nil, RuntimeError.new("Domain not found"))
    end
  end
end
