class Link < ApplicationRecord
  URL_REGEXP = /\A(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+\z/

  validates :url, presence: true
  validates :url, format: { with: URL_REGEXP }

  has_many :clicks, dependent: :destroy

  attr_writer :short_url

  before_validation :assign_id, if: -> { @short_url.present? }

  delegate :click!, to: :clicker

  def self.find_by_short_url!(short_url)
    find(Bijective.decode(short_url))
  end

  def short_url
    Bijective.encode(id) if id
  end

  def clicker
    @clicker ||= Clicker.new(self)
  end

  def statistic
    @statistic ||= LinkStatistic.new(self)
  end

  private

  def assign_id
    self.id = Bijective.decode(@short_url)
  end
end
