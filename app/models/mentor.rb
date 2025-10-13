class Mentor < ApplicationRecord
  has_many :courses
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
