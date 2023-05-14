class Region < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy
  has_many :campings, through: :citiess, dependent: :destroy
end
