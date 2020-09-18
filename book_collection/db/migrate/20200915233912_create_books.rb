class CreateBooks < ActiveRecord::Migration[5.1]
  def up
    create_table :books do |t|
      t.string "title"
      t.string "author"
      t.string "genre"
      t.float "price"
      t.date "publisheddate"
      t.timestamps
    end
  end

  def down
    drop_table :books
  end

end
