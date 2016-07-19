class CreateChannelUsers < ActiveRecord::Migration
  def change
  	create_table :channel_users do |t|
  		t.integer :channel_id, null: false
  		t.integer :user_id, null: false
  		t.timestamps null: false
  	end
  end
end
