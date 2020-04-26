namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"
    
    conn = Bunny.new(username: RABBITMQ_USERNAME,
                     password: RABBITMQ_PASSWORD,
                     vhost: RABBITMQ_VHOST)
                .tap(&:start)

    ch = conn.create_channel
    x  = ch.headers("headers")

    queue_restaurants = ch.queue("menu_dashboard.restaurants", durable: true)
    queue_dishes = ch.queue("menu_dashboard.dishes", durable: true)
    queue_accounting = ch.queue("menu_dashboard.accounting", durable: true)

    # bind queue to exchange
    queue_restaurants.bind("crawler.restaurants")
    queue_dishes.bind("crawler.dishes")
    queue_accounting.bind("crawler.accounting")

    conn.close
  end
end
