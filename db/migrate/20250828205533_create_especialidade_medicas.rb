class CreateEspecialidadeMedicas < ActiveRecord::Migration[8.0]
  def change
    create_table :especialidade_medicas do |t|
      t.string :titulo
      t.text :descricao

      t.timestamps
    end
  end
end
