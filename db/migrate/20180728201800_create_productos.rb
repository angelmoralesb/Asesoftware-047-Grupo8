class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre, limit: 100
      t.string :descripcion, limit: 200
      t.string :estado, limit: 1
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
