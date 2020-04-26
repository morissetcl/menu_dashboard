require_relative '../../services/restaurant'

module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :restaurants, :dishes, :dish_count, :restaurant_count

        def call(params)
          store = PStore.new("accounting.pstore")
          store.transaction(true) do  # begin read-only transaction, no changes allowed
            @dish_count = store.fetch(:dish_count)
            @restaurant_count = store.fetch(:restaurant_count)
          end

          @restaurants = Restaurant.list
          @dishes = Dish.list
        end
      end
    end
  end
end
