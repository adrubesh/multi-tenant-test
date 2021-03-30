class Post < ApplicationRecord
  acts_as_tenant(:user, foreign_key: 'tenant_id')
  belongs_to :user, foreign_key: :tenant_id
  has_many :comments

  def title
    begin
      super
    rescue ActiveModel::MissingAttributeError
      nil
    end
  end
end
