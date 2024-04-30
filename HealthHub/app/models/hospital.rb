# app/models/hospital.rb
class Hospital < ApplicationRecord
  validates :name, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :rank, presence: true

end
