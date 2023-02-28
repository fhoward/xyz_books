class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.text :title
      t.text :isbn_13
      t.decimal :price, :decimal, :precision => 8, :scale => 2 
      t.integer :publication_year
      t.string :image_url
      t.string :edition
      t.references :publisher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
