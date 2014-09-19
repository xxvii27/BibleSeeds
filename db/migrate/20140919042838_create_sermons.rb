class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :church
      t.string :preacher
      t.string :link
      t.timestamps
    end
  end
end
