class Host < ApplicationRecord
  validates :hostname, presence: true, uniqueness: true
  validates :hostIP, presence: true, uniqueness: true
end
