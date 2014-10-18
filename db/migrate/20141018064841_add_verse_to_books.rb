class AddVerseToBooks < ActiveRecord::Migration
  def change
    add_column :books, :verse, :int
  end
end
