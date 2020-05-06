class IPAddressBuilder
  attr_reader :ip_address

  # Move this to callable module? :)
  def self.call(ip_address)
    new(ip_address).call
  end

  def initialize(ip_address)
    @ip_address = ip_address
  end

  def call
    transaction do
      import_ip_address

      if ip_address_already_exists?
        self.ip_address = fetch_ip_address
      else
        notify_new_ip_address
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

  def ip_address_already_exists?
    # This is how import work
    ip_address.id.blank?
  end

  def fetch_ip_address
    find_by(ip_addr: ip_address.ip_addr)
  end

  def notify_new_ip_address
    # Better to move to a separate class oe use gems like wisper
    ip_address.new_record_created_event
  end
end
