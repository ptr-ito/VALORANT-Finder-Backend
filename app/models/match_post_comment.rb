# == Schema Information
#
# Table name: match_post_comments
#
#  id            :bigint           not null, primary key
#  content       :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  match_post_id :bigint           not null
#  parent_id     :bigint
#  user_id       :bigint           not null
#
# Indexes
#
#  index_match_post_comments_on_match_post_id  (match_post_id)
#  index_match_post_comments_on_parent_id      (parent_id)
#  index_match_post_comments_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_post_id => match_posts.id)
#  fk_rails_...  (parent_id => match_post_comments.id)
#  fk_rails_...  (user_id => users.id)
#
class MatchPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :match_post
  belongs_to :parent, class_name: 'MatchPostComment', optional: true
  has_many   :replies, class_name: 'MatchPostComment', foreign_key: :parent_id, dependent: :destroy,
                       inverse_of: 'match_post_comment'

  validates :content, presence: true, length: { maximum: 65_535 }
end
