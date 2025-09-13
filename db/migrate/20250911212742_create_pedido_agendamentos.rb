class CreatePedidoAgendamentos < ActiveRecord::Migration[8.0]
  def change
    create_table :pedido_agendamentos do |t|
      t.string :observacao
      t.datetime :data_marcacao
      t.boolean :estado
      t.references :usuario, null: false, foreign_key: true
      t.references :profissional, null: false, foreign_key: true
      t.references :unidade_medica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
