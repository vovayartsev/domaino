require "socket"
require "openssl"

class SslValidationService
  Result = Struct.new(:available, :paid_till, :error)

  def call(host)
    Socket.tcp(host, 443, connect_timeout: 5) do |tcp_client|
      ssl_client = OpenSSL::SSL::SSLSocket.new(tcp_client)
      ssl_client.hostname = host
      ssl_client.connect
      cert = OpenSSL::X509::Certificate.new(ssl_client.peer_cert)
      ssl_client.sysclose
      tcp_client.close

      certprops = OpenSSL::X509::Name.new(cert.issuer).to_a
      issuer = certprops.select { |name, data, type| name == "O" }.first[1]
      Result.new(true, cert.not_after.to_date, nil)
    end
  rescue Errno::ECONNREFUSED, SocketError
    Result.new(false, nil, $!)
  end
end
