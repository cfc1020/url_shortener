module Reports::Exporters
  class LinksStatisticExporter < BaseExporter
    def exportable_fields
      {
        url:          'FULL URL',
        short_url:    'Short URL',
        clicks_count: 'Number of clicks'
      }.freeze
    end

    def name
      'LinkStatisticReport'
    end
  end
end
