namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"

    conn = Bunny.new
    conn.start

    ch = conn.create_channel

    # get the exchange created by the producter, namely crawler.
    x = ch.fanout("crawler.restaurants")
    # get the queue where we want to push the message from the producer
    queue = ch.queue("menu_dashboard.restaurants", durable: true)
    # bind queue to exchange
    queue.bind("crawler.restaurants")

    conn.close
  end
end
