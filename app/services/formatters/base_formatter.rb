require 'csv'

module Formatters
  # Defines document(store) and then serializes/formats it in subclass' data type
  class BaseFormatter
    attr_reader :options
    attr_reader :data

    def initialize(options = { headers: true })
      @options = options
      @entries = []
    end

    def add_entry(entry)
      entries << entry
    end

    def format_data
      raise NotImplementedError, "You must implement #{self.class}##{name}."
    end

    def headers?
      !!options[:headers]
    end

    private

    attr_reader :entries
  end
end
