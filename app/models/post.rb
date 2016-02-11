class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  def last?
    topic.posts.order(:created_at).last.id == id
  end
end
