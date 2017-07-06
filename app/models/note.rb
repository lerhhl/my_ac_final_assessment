class Note < ApplicationRecord
  belongs_to :user

  validates :body, :user_id, presence: true

  has_many :likes, dependent: :destroy

end
