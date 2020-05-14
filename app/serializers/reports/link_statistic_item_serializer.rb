module Reports
  class LinkStatisticItemSerializer < ActiveModel::Serializer
    attributes :url, :short_url, :clicks
  end
end
