class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :location
      t.string :issue
      t.string :comment

      t.timestamps null: false
    end
  end
end
