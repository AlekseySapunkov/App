class Country < ApplicationRecord
    has_many :regions, dependent: :destroy
    has_many :cities,  through: :regions, dependent: :destroy
    has_many :campings, through: :cities, dependent: :destroy
end
