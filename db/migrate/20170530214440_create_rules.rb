class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :picture
      t.string :title
      t.string :description
      t.string :number
      t.references :user

      t.timestamps
    end
  end
end
