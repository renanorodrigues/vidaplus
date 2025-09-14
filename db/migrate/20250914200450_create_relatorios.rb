class CreateRelatorios < ActiveRecord::Migration[8.0]
  def change
    create_table :relatorios do |t|
      t.integer :tipo
      t.string :assunto
      t.text :conteudo

      t.timestamps
    end
  end
end
