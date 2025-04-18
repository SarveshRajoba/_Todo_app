class Task < ApplicationRecord
  belongs_to :user
  validates :priority, inclusion: { in: [1, 2, 3], message: "%{value} is not a valid priority" }
  before_validation :due_date_today

  private

  def due_date_today
    if due_date.present? && due_date < Date.today
      self.due_date = Date.today
    end
  end
end
