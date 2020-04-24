Sneakers.configure({})
Sneakers.logger.level = Logger::INFO # the default DEBUG is too noisy

require_relative '../../apps/web/workers/restaurants_worker'
require_relative '../../apps/web/workers/dishes_worker'
