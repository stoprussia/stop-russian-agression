# frozen_string_literal: true

require File.expand_path("../rconfig", __FILE__)
require File.expand_path("../performer", __FILE__)

class Ripper
  THREADS_COUNT = 4

  def self.call
    proxies = [] # RConfig.load_proxies
    referrers = RConfig.referrers
    user_agents = RConfig.user_agents

    RConfig.targets.each_slice(THREADS_COUNT) do |batch|
      threads = []
      batch.each do |target|
        begin
          threads << Thread.new do
            Performer.call(target: target, proxies: proxies, referrers: referrers, user_agents: user_agents)
          end
        rescue
          # just skip
        end
      end

      threads.each { |t| t&.join }
    end
  end
end

start_time = Time.now.utc

loop do
  Ripper.call

  # break if Time.now.utc > (start_time + 300)
end

