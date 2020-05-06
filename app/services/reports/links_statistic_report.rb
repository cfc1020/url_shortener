module Reports
  # Report for links to show their clicks statistic
  class LinksStatisticReport < BaseReport
    # Perhaps need to split out the builder from the report itself
    # This class should create a report which should be another class

    private

    def scope
      items.includes(clicks: :ip_address)
    end

    def build_item(link)
      Entities::LinkStatisticReportItem.new(
        url:          link.url,
        short_url:    link.short_url,
        clicks_count: link.statistic.clicks_count
      )
    end
  end
end
