# frozen_string_literal: true

class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :pesel
      t.string :occupation

      t.timestamps
    end
  end
end
