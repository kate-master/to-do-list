class Project < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 2 }
  belongs_to :user
end
