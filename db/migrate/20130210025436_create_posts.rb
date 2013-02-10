class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :comments_count
      t.integer :likes_count
      t.text :message
      t.text :picture_url
      t.datetime :created_time
      t.text :name
      t.text :link_url
      t.text :caption
      t.text :source
      t.string :post_type
      t.string :fb_post_id
      t.text :description
      t.integer :facebook_infos_id
      t.datetime :fb_updated_time

      t.timestamps
    end
  end
end
