redis_url = 'redis://h:p7e8e5f102b98f722e67b281e2534257f1461299415aad45cb12b11e62e32b7dd@ec2-34-206-56-227.compute-1.amazonaws.com:47919'

Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379', :size => 27 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379', :size => 27}
end
