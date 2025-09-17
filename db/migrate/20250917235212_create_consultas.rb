class CreateConsultas < ActiveRecord::Migration[8.0]
  def change
    create_table :consultas do |t|
      t.references :pedido, null: false, foreign_key: true
      t.string :link
      t.integer :estado, default: 0
      t.time :duracao

      t.timestamps
    end
  end
end
