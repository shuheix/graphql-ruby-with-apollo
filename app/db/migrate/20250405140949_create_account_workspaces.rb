class CreateAccountWorkspaces < ActiveRecord::Migration[8.0]
  def change
    create_table :account_workspaces do |t|
      t.references :account, foreign_key: true, null: false
      t.references :workspace, foreign_key: true, null: false
      t.timestamps
    end
  end
end
