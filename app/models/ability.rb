class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #Guest user

    if user.admin?
      can :manage, :all


    elsif user.teacher?
      can :read, Course
      can :create, Course
      can :update, Course do |course|
        course.try(:user) == user
      end
      can :destroy, Course do |course|
        course.try(:user) == user
      end

      can :read, Lesson
      can :create, Lesson
      can :update, Lesson do |lesson|
        lesson.try(:user) == user
      end
      can :destroy, Lesson do |lesson|
        lesson.try(:user) == user
      end

      can :read, User


    elsif user.student?
      can :read, Course
      can :read, Lesson
      can :read, User
    end

  end
end
