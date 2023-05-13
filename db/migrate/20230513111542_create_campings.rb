class CreateCampings < ActiveRecord::Migration[7.0]
  def change
    create_table :campings do |t|
      t.string :name
      t.text :body
      t.references :country, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
