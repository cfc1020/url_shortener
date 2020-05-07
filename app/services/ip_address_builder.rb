class IPAddressBuilder
  attr_reader :ip_addr

  # Move this to callable module? :)
  def self.call(ip_addr)
    new(ip_addr).call
  end

  def initialize(ip_addr)
    @ip_addr = ip_addr
  end

  def call
    transaction do
      import_ip_address

      if ip_address_already_exists?
        self.ip_address = fetch_ip_address
      else
        new_record_created_event
      end
    end

    ip_address
  end

  private

  def transaction
    IPAddress.transaction do
      yield
    end
  end

  def import_ip_address
    IPAddress.import([ip_address], on_duplicate_key_ignore: true)
  end

  def ip_address
    @ip_address ||= IPAddress.new(ip_addr: ip_addr)
  end

  def ip_address_already_exists?
    # This is how import work
    ip_address.id.blank?
  end

  def fetch_ip_address
    find_by(ip_addr: ip_addr)
  end

  def new_record_created_event
    FetchIPAddressInfoJob.perform_later(ip_address)
  end
end
