class CreateUnidadeMedicas < ActiveRecord::Migration[8.0]
  def change
    create_table :unidade_medicas do |t|
      t.string :nome_fantasia
      t.string :cnpj
      t.json :endereco

      t.timestamps
    end
  end
end
