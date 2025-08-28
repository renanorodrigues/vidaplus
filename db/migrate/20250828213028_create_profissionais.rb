class CreateProfissionais < ActiveRecord::Migration[8.0]
  def change
    create_table :profissionais do |t|
      t.string :contato
      t.string :email_profissional
      t.boolean :estado
      t.text :biografia
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
