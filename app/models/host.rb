class Host < ApplicationRecord
  has_many :user_host_associations, dependent: :delete_all
  has_many :users, through: :user_host_associations, dependent: :delete_all
  validates :hostname, presence: true, uniqueness: true
  validates :hostIP, presence: true
end
