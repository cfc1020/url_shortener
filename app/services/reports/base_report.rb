module Reports
  # Generates reports which consists report_items and totals
  class BaseReport
    attr_reader :items
    attr_reader :report_items

    def initialize(items)
      @items = items
    end

    def generate_report
      @report_items = []

      scope.find_each do |link|
        report_items << build_item(link)
      end
    end

    def totals_for(*_fields)
      [] # for now, because totals seem to be a separate class calculator
    end

    private

    def scope
      raise NotImplementedError, "You must implement #{self.class}##{name}."
    end

    def build_item
      raise NotImplementedError, "You must implement #{self.class}##{name}."
    end
  end
end
