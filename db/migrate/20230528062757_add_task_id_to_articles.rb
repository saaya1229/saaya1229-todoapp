class AddTaskIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :task
  end
end
