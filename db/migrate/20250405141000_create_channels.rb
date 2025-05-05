class CreateChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :channels, id: :uuid do |t|
      t.references :workspace, type: :uuid, foreign_key: true, null: false
      t.timestamps
    end
  end
end
