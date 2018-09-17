class Place < ApplicationRecord
  before_validation :set_slug


  validates :ja_name, uniqueness: true, presence: true
  validates :en_name, uniqueness: true, presence: true
  validates :slug, uniqueness: true, presence: true

  def set_slug
    self.slug = self.en_name.downcase.gsub(/&/, "and").gsub(/ /, "-").gsub(/'/, "")
  end

end
