class Lead < ApplicationRecord
  validates :email, presence: true, uniqueness: false
  validates :name, presence: true
end
