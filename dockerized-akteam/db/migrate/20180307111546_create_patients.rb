# frozen_string_literal: true

class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.string :pesel
      t.date :date_of_birth

      t.timestamps
    end
  end
end
