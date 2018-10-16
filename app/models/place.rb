class Place < ApplicationRecord
  before_validation :set_slug

  has_many :place_images, class_name: 'PlaceImage'
  validates :ja_name, uniqueness: true, presence: true
  validates :en_name, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true

  def set_slug
    self.slug = self.en_name.downcase.gsub(/&/, "and").gsub(/ /, "-").gsub(/'/, "")
  end

  def image?
  end

  def image
    image = PlaceImage.find_by(id: image_id)
    image.present? ? image = image.image.url : '/no-image.png'
  end
end