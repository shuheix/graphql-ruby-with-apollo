class CreateChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :channels do |t|
      t.references :workspace, foreign_key: true, null: false
      t.timestamps
    end
  end
end
