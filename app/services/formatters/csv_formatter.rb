require 'csv'

module Formatters
  # Serializes/Formats the document into CSV data
  class CSVFormatter < BaseFormatter
    def format_data
      @data = CSV.generate(options) do |csv|
        entries.each { |entry| csv << entry }
      end
    end
  end
end
