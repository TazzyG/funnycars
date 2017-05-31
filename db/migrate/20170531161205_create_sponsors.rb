class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.references :user, foreign_key: true
      t.string :picture
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :sponsored_with
      t.integer :amount
      t.string :web_site

      t.timestamps
    end
  end
end
