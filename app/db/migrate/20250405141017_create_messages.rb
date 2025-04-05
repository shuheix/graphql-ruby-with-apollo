class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.references :channel, type: :uuid, foreign_key: true, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
