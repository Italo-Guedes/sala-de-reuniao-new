class CreateReservas < ActiveRecord::Migration[6.1]
  def change
    create_table :reservas do |t|
      t.references :sala, null: false, foreign_key: true
      t.datetime :data_hora_inicio
      t.text :descricao

      t.timestamps
    end
  end
end
