class CreateProfissionais < ActiveRecord::Migration[8.0]
  def change
    create_table :profissionais do |t|
      t.string :nome_completo
      t.string :contato
      t.string :email_profissional
      t.text :biografia
      t.integer :ocupacao
      t.json :especialidades_medicas
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
