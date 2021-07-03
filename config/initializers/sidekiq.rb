common_redis_config = { url: ENV['SIDEKIQ_REDIS_URL'] , namespace: "activejob_#{Rails.env}", db: 5 }

common_redis_config[:password] = ENV['REDIS_PASSWORD'] if Rails.env.production?

Sidekiq.configure_server do |config|
  config.redis = common_redis_config
end

Sidekiq.configure_client do |config|
  config.redis = common_redis_config
end

Sidekiq.default_worker_options = { retry: 0 }
