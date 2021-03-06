module Reports::Exporters
  class LinksStatisticExporter < BaseExporter
    private

    def exportable_fields
      {
        url:          'FULL URL',
        short_url:    'Short URL',
        clicks_count: 'Number of clicks'
      }.freeze
    end

    def name
      'LinkStatisticReport'.freeze # report itself should tell us this? Let's talk... :)
    end
  end
end
