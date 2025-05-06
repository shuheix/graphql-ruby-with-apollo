class AddNameColumnToChannels < ActiveRecord::Migration[8.0]
  def change
    add_column :channels, :name, :string, null: false
  end
end
