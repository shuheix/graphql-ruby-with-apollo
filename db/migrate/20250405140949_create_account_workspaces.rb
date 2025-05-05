class CreateAccountWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :account_workspaces, id: :uuid do |t|
      t.references :account, type: :uuid, foreign_key: true, null: false
      t.references :workspace, type: :uuid, foreign_key: true, null: false
      t.timestamps
    end
  end
end
