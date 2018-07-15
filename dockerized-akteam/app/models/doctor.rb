# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :firstname, length: { in: 3..20 }, format: {
    with: /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/,
    message: ' contains number(s)'
  }, presence: true
  validates :lastname, length: { in: 3..32 }, format: {
    with: /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/,
    message: ' contains number(s)'
  }, presence: true
  validates :occupation, length: { in: 3..50 }, format: {
    with: /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/,
    message: ' contains number(s)'
  }, presence: true
  validates :pesel, length: { is: 11, message: ' has wrong length' }, numericality: { only_integer: true }, uniqueness: true, presence: true
  validate :pesel_is_valid?

  def name
    "#{lastname} #{firstname}"
  end

  def self.search(doctor)
    if doctor
      where('firstname LIKE ? OR lastname LIKE ?', "%#{doctor}%", "%#{doctor}%")
    else
      all
    end
  end

  private def pesel_is_valid?
    new_pesel = Activepesel::Pesel.new(pesel)
    errors.add('PESEL', 'is incorrect') unless new_pesel.valid?
  end
end
