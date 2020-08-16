class Give < ApplicationRecord
  belongs_to :user
  validates :title, length: { minimum: 2 }
end
