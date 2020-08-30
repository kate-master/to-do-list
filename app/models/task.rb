class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project
  validates :text, presence: true,
                    length: { minimum: 2 }
end
