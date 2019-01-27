class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :description
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
