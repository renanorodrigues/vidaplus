class CreateEspecialidadeMedicaProfissionais < ActiveRecord::Migration[8.0]
  def change
    create_table :especialidade_medica_profissionais do |t|
      t.references :especialidade_medica, null: false, foreign_key: true
      t.references :profissional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
