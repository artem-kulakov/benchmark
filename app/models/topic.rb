class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  default_scope -> {order(created_at: :desc) }
  validates :content, presence: true

  def with_posts?
    posts.any?
  end
end
