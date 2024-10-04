Redis.new(
  url: 'rediss://your-redis-url',
  ssl_params: { verify_mode: OpenSSL::SSL::VERIFY_NONE }
)
