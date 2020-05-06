module Reports
  module Entities
    class BaseItem < OpenStruct
      def to_hash
        marshal_dump.with_indifferent_access
      end

      def values_for(*args)
        to_hash.values_at(args)
      end
    end
  end
end
