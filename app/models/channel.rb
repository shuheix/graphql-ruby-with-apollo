class Channel < ApplicationRecord
  belongs_to :workspace
  has_many :messages
end
