class FetchIPAddressInfoJob < ApplicationJob
  queue_as :default

  def perform(ip_address)
    ip_address.fetch_info
  end
end
