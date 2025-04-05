class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :channel, foreign_key: true, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
