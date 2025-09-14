class CreatePedidos < ActiveRecord::Migration[8.0]
  def change
    create_table :pedidos do |t|
      t.string :observacao
      t.datetime :data_marcacao
      t.integer :estado, default: 0
      t.integer :tipo_consulta
      t.references :paciente, null: false, foreign_key: true
      t.references :profissional, null: false, foreign_key: true
      t.references :unidade_medica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
