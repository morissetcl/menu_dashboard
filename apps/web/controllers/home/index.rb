require_relative '../../services/restaurant'

module Web
  module Controllers
    module Home
      class Index
        include Web::Action
        expose :restaurants

        def call(params)
          @restaurants = Restaurant.list
        end
      end
    end
  end
end
