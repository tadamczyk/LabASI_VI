# frozen_string_literal: true

class Visit < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validate :date_of_visit_in_future?
  validates :date_of_visit, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: { greater_than_or_equal_to: 0, less_than: 1000 }

  private def date_of_visit_in_future?
    if date_of_visit > DateTime.current
      errors.add('Date of visit', 'cannot be in the future')
    end
  end
end
