class CreateProntuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :prontuarios do |t|
      t.json :historico_clinico
      t.text :observacao
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
