class Feed < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :link, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
