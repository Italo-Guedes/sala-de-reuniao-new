class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :space, null: false, foreign_key: true
      t.datetime :date_start
      t.text :description

      t.timestamps
    end
  end
end
