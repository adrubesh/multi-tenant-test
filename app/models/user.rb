class User < ApplicationRecord
  has_many :posts, foreign_key: :tenant_id
end
