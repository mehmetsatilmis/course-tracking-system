class Lesson < ActiveRecord::Base
  belongs_to :course
  has_one :video
  has_many :messages

  def code
    returnValue = self.url.split('/').last if self.url
    return returnValue
  end
end
