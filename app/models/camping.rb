class Camping < ApplicationRecord
  belongs_to :country
  belongs_to :city
  belongs_to :region
end
