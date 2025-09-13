class CreateProfissionalUnidadeMedicas < ActiveRecord::Migration[8.0]
  def change
    create_table :profissional_unidade_medicas do |t|
      t.references :profissional, null: false, foreign_key: true
      t.references :unidade_medica, null: false, foreign_key: true

      t.timestamps
    end
  end
end
