# app/services/recent_posts.rb
class Restaurant
  KEY = "restaurant"
  STORE_LIMIT = 15

  # Get list of recent posts from redis
  # Since redis stores data in binary text format
  # we need to parse each list item as JSON
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_restaurant|
      JSON.parse(raw_restaurant)
    end
  end

  # Push new post to list and trim it's size
  # to limit required storage space
  # `raw_post` is already a JSON string
  # so there is no need to encode it as JSON
  def self.push(raw_restaurant)
    $redis.lpush(KEY, raw_restaurant)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end
end
