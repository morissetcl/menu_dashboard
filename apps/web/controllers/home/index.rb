require_relative '../../services/restaurant'
require_relative '../../services/store'
require 'hanami/logger'

module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :restaurants, :dishes, :dish_count, :restaurant_count, :accounting

        def call(params)
          store = PStore.new("lib/accounting.pstore")
          Hanami::Logger.new.info(store)
          Hanami::Logger.new.info('***************************************************')

          store.transaction(true) do  # begin read-only transaction, no changes allowed
            @dish_count = store.fetch(:dish_count)
            @restaurant_count = store.fetch(:restaurant_count)
          end

          @restaurants = Restaurant.list
          @dishes = Dish.list
          @accounting = Accounting.list
        end
      end
    end
  end
end
