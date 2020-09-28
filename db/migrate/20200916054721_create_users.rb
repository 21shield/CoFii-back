class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :bio, :default => ""
      t.string :avatar , :default => "https://d25tv1xepz39hi.cloudfront.net/thumbnails/Coffee_Photography_10-thumb-small.jpg"

      t.timestamps
    end
  end
end
