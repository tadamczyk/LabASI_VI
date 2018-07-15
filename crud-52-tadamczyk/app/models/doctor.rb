class Doctor < ApplicationRecord
    validates :firstname, :length => { :in => 3..20 }, :format => { :with => /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/, :message => " contains number(s)" }
    validates :lastname, :length => { :in => 3..32 }, :format => { :with => /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/, :message => " contains number(s)" }
    validates :occupation, :length => { :in => 3..50 }, :format => { :with => /\A[a-ząćęłńóśźżA-ZĄĆĘŁŃÓŚŹŻ]+\z/, :message => " contains number(s)" }
    validates :pesel, :length => { :is => 11, :message => " has wrong length" }, :numericality => { :only_integer => true }
end
