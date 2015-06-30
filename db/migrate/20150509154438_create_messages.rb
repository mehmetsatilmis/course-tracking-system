class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :dislike_count

      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
