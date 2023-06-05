# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  end_date   :date             not null
#  start_date :date             not null
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
  has_one_attached :eyecatch

  belongs_to :article
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, 'cannot be registered before the Start date:(') unless self.start_date < self.end_date
  end

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end
end
