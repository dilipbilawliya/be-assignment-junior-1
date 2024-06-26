class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  has_many :expense_splits, dependent: :destroy

  accepts_nested_attributes_for :expense_splits, reject_if: :all_blank, allow_destroy: true

  validates :payer_id, presence: true
  validates :total_amount, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :date, presence: true

  def total_expense_splits
    expense_splits.count
  end
end
