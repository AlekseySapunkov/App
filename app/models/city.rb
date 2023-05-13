class City < ApplicationRecord
  belongs_to :region
  belongs_to :country
  has_many :campings, dependent: :destroy
end
