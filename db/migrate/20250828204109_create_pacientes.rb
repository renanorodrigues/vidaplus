class CreatePacientes < ActiveRecord::Migration[8.0]
  def change
    create_table :pacientes do |t|
      t.string :nome_completo
      t.string :sexo
      t.string :idade
      t.json :endereco
      t.string :rg
      t.string :cpf
      t.string :contato
      t.string :contato_emergencia
      t.text :observacao
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
