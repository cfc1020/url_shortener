module Reports
  class LinkStatisticSerializer < ActiveModel::Serializer
    attributes :name

    has_many :items
  end
end
