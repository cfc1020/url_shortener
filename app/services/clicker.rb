# Action to handle a click to a linkm
class Clicker
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def click!(ip_addr:, referer:)
    ip_address = create_or_find_ip_address(ip_addr)

    create_click(ip_address, referer)
  end

  private

  def create_or_find_ip_address(ip_addr)
    ip_address = IPAddress.new(ip_addr: ip_addr)

    IPAddressBuilder.(ip_address)
  end

  def create_click(ip_address, referer)
    link.clicks.create!(ip_address: ip_address, referer: referer)
  end
end
