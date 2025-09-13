class CreateAgendas < ActiveRecord::Migration[8.0]
  def change
    create_table :agendas do |t|
      t.datetime :data_inicio
      t.datetime :data_termino
      t.string :observacao
      t.json :horarios
      t.boolean :estado
      t.references :profissional, null: false, foreign_key: true
      t.references :unidade_medica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
