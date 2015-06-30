class Course < ActiveRecord::Base
  has_many :pivot_tbls, class_name: 'PivotTbl'
  belongs_to :user
  has_many :users, :through => :pivot_tbls
  has_many :lessons


  def get_owner
    @owner = User.find(user_id)
  end

  def get_user
    puts("**********************")
    pivot_tbls << PivotTbl.where(course_id: self.id)
    if(defined?(pivot_tbls.first.course_id))
      puts(pivot_tbls.first.course_id)
      puts(pivot_tbls.first.user_id)
      @user = User.find(pivot_tbls.first.user_id)
    end
    #@user = PivotTbl.where(course_id: self.id)
  end

end
