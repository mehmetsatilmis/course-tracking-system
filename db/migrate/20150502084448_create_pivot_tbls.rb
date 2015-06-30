class CreatePivotTbls < ActiveRecord::Migration
  def change
    create_table :pivot_tbls do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.timestamps null: false
    end
  end

end
