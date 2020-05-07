class IPAddress < ApplicationRecord
  def fetch_info
    IPAddressInforFetcher.(self)
  end
end
