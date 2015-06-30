class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role

 # has_many :pivot_tbls, ->{ order 'position' }
  has_many :courses, :through => :pivot_tbls

  validates_presence_of :name
  before_save :assign_role

  def get_courses
    @course = Course.find(PivotTbl.find(pivot_tbls_id).course_id)
  end

  def assign_role
    self.role = Role.find_by name: "Student" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def teacher?
    self.role.name == "Teacher"
  end
  def student?
    self.role.name == "Student"
  end

end
