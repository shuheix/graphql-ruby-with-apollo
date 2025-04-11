class AccountWorkspace < ApplicationRecord
  belongs_to :account
  belongs_to :workspace
end
