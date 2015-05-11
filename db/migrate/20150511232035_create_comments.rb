class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :message
    	t.string :rating
    	# add so that we can comment to place and users
    	t.integer :user_id
    	t.integer :place_id
      	t.timestamps
    end

    # make lookups between the different database tables are fast
    #indexes tell db to provide all records with the given fields
    add_index :comments, [:user_id, :place_id]
    add_index :comments, :place_id
  end
end
