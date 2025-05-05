class Account < ApplicationRecord
  has_many :account_workspaces
  has_many :workspaces, through: :account_workspaces
end
