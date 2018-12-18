Sidekiq.configure_server do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS_URL'] , namespace: "activejob_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS_URL'] , namespace: "activejob_#{Rails.env}" }
end

Sidekiq.default_worker_options = { retry: 0 }