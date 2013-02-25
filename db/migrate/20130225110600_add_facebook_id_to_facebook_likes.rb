class AddFacebookIdToFacebookLikes < ActiveRecord::Migration
  def change
    add_column :facebook_likes, :facebook_id, :integer
  end
end
