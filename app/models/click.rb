class Click < ApplicationRecord
  belongs_to :link
  belongs_to :ip_address, required: false, class_name: 'IPAddress'

  delegate :url, to: :link
end
