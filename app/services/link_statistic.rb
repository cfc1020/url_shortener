# Statistic of links clicks
class LinkStatistic
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def clicks_count
    link.clicks.count
  end

  # Some other metrics you need will be here
end
