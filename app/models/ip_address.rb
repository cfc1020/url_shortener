class IPAddress < ApplicationRecord
  # This class becomes manager. So definitely need to extract all these methods below out of this scope

  def self.create_or_find_by_ip_addr(ip_addr)
    ip_address = new(ip_addr: ip_addr)

    IPAddressBuilder.(ip_address)
  end

  def new_record_created_event
    FetchIPAddressInfoJob.perform_later(self)
  end

  def fetch_info
    IPAddressInforFetcher.(self)
  end
end
