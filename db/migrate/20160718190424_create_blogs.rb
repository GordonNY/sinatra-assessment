class CreateBlogs < ActiveRecord::Migration
  def change
  	create_table :blogs do |t|
  		t.string :title, null: false
  		t.text :content, null:false
  	end
  end
end
