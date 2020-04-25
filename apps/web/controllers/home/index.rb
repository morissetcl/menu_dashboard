require_relative '../../services/restaurant'

module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :restaurants, :dishes, :accounting

        def call(params)
          @restaurants = Restaurant.list
          @dishes = Dish.list
          @accounting = Accounting.list
        end
      end
    end
  end
end
