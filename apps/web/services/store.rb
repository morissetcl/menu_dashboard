require 'pstore'

class Store
  def self.initialize
    @store ||= PStore.new("accounting.pstore")
  end
end
