require 'faraday'
require 'faraday/net_http'

require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Faraday.default_adapter = :net_http
Faraday.ignore_env_proxy = true

class Performer
  def self.call(target:, proxies:, referrers:, user_agents:)
    self.new(target: target, proxies: proxies, referrers: referrers, user_agents: user_agents).perform
  end

  def initialize(target:, proxies:, referrers:, user_agents:)
    @target = target
    @proxies = proxies
    @referrers = referrers
    @user_agents = user_agents
  end

  attr_reader :target, :proxies, :referrers, :user_agents

  def perform
    proxy_config = if proxies&.length > 0
                     index = Random.rand(proxies.length)
                     proxies[index]
                   end

    conn_options = {
      ssl: {
        verify: false
      },
      headers: {
        "Cache-Control": "no-cache",
        "Keep-Alive": (60 + Random.rand(60)).to_s,
        "Connection": "keep-alive",
        "User-Agent": user_agents[Random.rand(user_agents.length)],
        "Referer": referrers[Random.rand(referrers.length)],
      },
      request: {
        timeout: 15,
        open_timeout: 15,
      }
    }


    if proxy_config
      # conn_options[:proxy] = "#{proxy_config[:protocols].first}://#{proxy_config[:ip]}:#{proxy_config[:port]}"
    end

    connection = Faraday.new(target, conn_options)

    begin
      response = connection.get("")
      status = response&.status
    rescue Faraday::ConnectionFailed => e
      puts e.message
      status = :connection_failed
    rescue Faraday::TimeoutError => e
      puts e.message
      status = :proxy_error
    rescue StandardError => e
      puts e.message
      status = :connection_error
    end

    puts "Target: #{target} | status: #{status}"
  end
end
