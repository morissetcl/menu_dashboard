$redis = Redis::Namespace.new("menu_dashboard:#{Hanami.env}", redis: Redis.new)
