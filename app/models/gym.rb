class Gym < ApplicationRecord
    has_many :memberships
    has_many :clients, through: :memberships, dependent: :destroy
    validates :name, presence: true
    validates :address, presence: true
end
