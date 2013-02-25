class CreateFacebookLikes < ActiveRecord::Migration
  def change
    create_table :facebook_likes do |t|
      t.integer :uid
      t.integer :id
      t.integer :time
      t.string :changed_fields

      t.timestamps
    end
  end
end
