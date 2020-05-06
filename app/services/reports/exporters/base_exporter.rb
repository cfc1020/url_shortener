module Reports::Exporters
  # A strategy of exporting/formatting reports into chosen type
  class BaseExporter
    attr_reader :formatter, :report
    attr_reader :data

    def initialize(report:, formatter:)
      @report    = report
      @formatter = formatter
    end

    def export_data
      @data ||= begin
        add_header

        add_body

        add_footer

        formatted_data
      end
    end

    def filename
      "#{name}_#{timestamp}"
    end

    private

    def add_header
      formatter.add_entry(exportable_fields.values) if formatter.headers?
    end

    def add_body
      report.items.each do |item|
        formatter.add_entry(item.values_for(*exportable_fields.keys))
      end
    end

    def add_footer
      totals = report.totals_for(*exportable_fields.keys)

      formatter.add_entry(totals) if totals.any?
    end

    def exportable_fields
      raise NotImplementedError, "You must implement #{self.class}##{name}."
    end

    def formatted_data
      formatter.format_data
    end

    def name
      raise NotImplementedError, "You must implement #{self.class}##{name}."
    end

    def timestamp
      DateTime.current
    end
  end
end
