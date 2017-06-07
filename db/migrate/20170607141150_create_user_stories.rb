class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.string :number
      t.string :title
      t.text :description
      t.decimal :points

      t.timestamps
    end
  end
end
