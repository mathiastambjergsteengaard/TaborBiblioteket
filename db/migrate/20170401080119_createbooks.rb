class Createbooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.integer :edition
      t.integer :year_of_release
      t.date :loaned_out_at
      t.string :owner
      t.string :loaner
    end
  end
end
