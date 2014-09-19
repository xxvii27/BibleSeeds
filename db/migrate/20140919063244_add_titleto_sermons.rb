class AddTitletoSermons < ActiveRecord::Migration
  def change
  	add_column :sermons, :title, :string
  end
end
