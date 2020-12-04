class Item < ApplicationRecord
  belongs_to :feed

  validates :link, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :feed_id, presence: true
end
