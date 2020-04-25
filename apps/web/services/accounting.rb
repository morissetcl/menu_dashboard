require 'hanami/logger'

class Accounting
  KEY = "accounting"
  STORE_LIMIT = 1

  # Get list of recent posts from redis
  # Since redis stores data in binary text format
  # we need to parse each list item as JSON
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_accounting|
      JSON.parse(raw_accounting)
    end
  end

  # Push new post to list and trim it's size
  # to limit required storage space
  # `raw_post` is already a JSON string
  # so there is no need to encode it as JSON
  def self.push(raw_accounting)
    $redis.lpush(KEY, raw_accounting)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end
end
