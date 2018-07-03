class AddFoolowerIdToFollowers < ActiveRecord::Migration
  def change
    add_column :followers, :follower_id, :integer
    add_column :followers, :following_id, :integer
  end
end
