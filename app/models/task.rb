# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint
#
# Indexes
#
#  index_tasks_on_article_id  (article_id)
#  index_tasks_on_user_id     (user_id)
#
class Task < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
end
