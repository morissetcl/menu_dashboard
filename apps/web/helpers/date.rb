require 'date'

module Web
  module Helpers
    module Date
      def clean_datetime(date)
        date ? ::Date.parse(date) : '-'
      end
    end
  end
end
