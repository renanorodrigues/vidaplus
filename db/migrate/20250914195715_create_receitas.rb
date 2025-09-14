class CreateReceitas < ActiveRecord::Migration[8.0]
  def change
    create_table :receitas do |t|
      t.json :prescricao
      t.text :observacao
      t.references :profissional, null: false, foreign_key: true
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
