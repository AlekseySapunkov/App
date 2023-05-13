class Region < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :campings, dependent: :destroy
end
