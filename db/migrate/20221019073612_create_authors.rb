class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :DOB

      t.timestamps
    end
  end
end
