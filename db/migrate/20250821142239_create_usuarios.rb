class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :primeiro_nome
      t.string :ultimo_nome
      t.string :sexo
      t.string :idade
      t.json :endereco
      t.integer :papel
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
