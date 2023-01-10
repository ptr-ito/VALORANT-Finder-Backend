# == Schema Information
#
# Table name: match_post_comments
#
#  id            :bigint           not null, primary key
#  content       :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  match_post_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_match_post_comments_on_match_post_id  (match_post_id)
#  index_match_post_comments_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_post_id => match_posts.id)
#  fk_rails_...  (user_id => users.id)
#
class MatchPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :match_post

  validates :content, presence: true, length: { maximum: 65_535 }
end
