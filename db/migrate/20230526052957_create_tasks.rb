class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :article, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.timestamps
    end
  end
end
