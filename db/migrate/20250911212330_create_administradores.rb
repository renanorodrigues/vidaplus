class CreateAdministradores < ActiveRecord::Migration[8.0]
  def change
    create_table :administradores do |t|
      t.string :nome_completo
      t.string :contato
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
