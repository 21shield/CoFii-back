class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :user_name
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :coffee_shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
