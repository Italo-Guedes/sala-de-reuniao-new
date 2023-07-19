class CreateEspacos < ActiveRecord::Migration[6.1]
  def change
    create_table :espacos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
