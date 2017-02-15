class Cat < ActiveRecord::Base
  validates :birth_date, :name, presence: true
  validates :color, presence: true, inclusion: { in: %w(black brown white orange purple) }
  validates :sex, presence: true, inclusion: { in: %w(M F) }

  has_many :cat_rental_requests, dependent: :destroy

  def age
    ((Date.today - self.birth_date) / 365).to_i
  end
end
