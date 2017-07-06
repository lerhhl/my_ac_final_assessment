class Like < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :user_id, :note_id, presence: true

end
