require_relative '../services/accounting'
require 'pstore'

class AccountingWorker
  include Sneakers::Worker
  # This worker will connect to "menu_dashboard.accounting" queue
  # env is set to nil since by default the actuall queue name would be
  # "menu_dashboard.accounting_development"
  from_queue "menu_dashboard.accounting", env: nil

  # work method receives message payload in raw format
  def work(raw_accounting)
    store = PStore.new("accounting.pstore")
    store.transaction do
      datas = JSON.parse(raw_accounting)
      store[:dish_count] = datas["dish_count"]
      store[:restaurant_count] = datas["restaurant_count"]
      store.commit
    end

    Accounting.push(raw_accounting)
    ack! # we need to let queue know that message was received
  end
end
