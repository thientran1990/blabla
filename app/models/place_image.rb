class PlaceImage < ApplicationRecord
  dragonfly_accessor :image

  belongs_to :place, class_name: 'Place'

  validates :image, presence: true

  validates :image, presence: true
  validates_size_of :image, maximum: 700.kilobytes, message: "It is too big, kya!!"

  validates_property :format, of: :image, in: [:jpeg, :jpg, :png, :bmp],
                     message: "It's not my type", case_sensitive: false

end
