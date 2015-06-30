class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :role, index: true, foreign_key: true
      t.belongs_to :pivot_tbls, index: true, foreign_key: true
      t.timestamps null: false
    end
  end

end
