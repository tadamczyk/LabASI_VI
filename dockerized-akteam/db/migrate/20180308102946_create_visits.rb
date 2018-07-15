# frozen_string_literal: true

class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.datetime :date_of_visit
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
