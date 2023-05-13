class Country < ApplicationRecord
    has_many :regions, dependent: :destroy
    has_many :cities, dependent: :destroy
    has_many :campings, dependent: :destroy
end
