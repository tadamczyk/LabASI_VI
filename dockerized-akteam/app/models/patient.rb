# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :firstname, length: { in: 3..20 }, format: {
    with: /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/,
    message: ' contains number(s)'
  }, presence: true
  validates :lastname, length: { in: 3..32 }, format: {
    with: /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/,
    message: ' contains number(s)'
  }, presence: true
  validate :date_of_birth_in_future?
  validates :pesel, length: { is: 11, message: ' has wrong length' }, numericality: { only_integer: true }, uniqueness: true, presence: true
  validate :pesel_is_valid?

  def name
    "#{lastname} #{firstname}"
  end

  def self.search(patient)
    if patient
      where('firstname LIKE ? OR lastname LIKE ?', "%#{patient}%", "%#{patient}%")
    else
      all
    end
  end

  private def date_of_birth_in_future?
    if date_of_birth > Date.today
      errors.add('Date of birth', 'cannot be in the future')
    end
  end

  private def pesel_is_valid?
    new_pesel = Activepesel::Pesel.new(pesel)
    errors.add('PESEL', 'is incorrect') unless new_pesel.valid?
  end
end
